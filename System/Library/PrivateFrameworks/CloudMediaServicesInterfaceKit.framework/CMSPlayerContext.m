@implementation CMSPlayerContext

- (id)initForActivity:(id)a3 queue:(id)a4 content:(id)a5 speed:(float)a6
{
  return -[CMSPlayerContext initForActivity:queue:content:speed:offset:](self, "initForActivity:queue:content:speed:offset:", a3, a4, a5, 0x8000000000000000);
}

- (id)initForActivity:(id)a3 queue:(id)a4 content:(id)a5 speed:(float)a6 offset:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  CMSPlayerContext *v16;
  CMSPlayerContext *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CMSPlayerContext;
  v16 = -[CMSPlayerContext init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_activityIdentifier, a3);
    objc_storeStrong((id *)&v17->_queueIdentifier, a4);
    objc_storeStrong((id *)&v17->_contentIdentifier, a5);
    v17->_playbackSpeed = a6;
    v17->_offsetInMillis = a7;
  }

  return v17;
}

- (BOOL)offsetIsValid
{
  return self->_offsetInMillis != 0x8000000000000000;
}

- (CMSPlayerContext)playerContextWithUpdatedSpeed:(float)a3
{
  CMSPlayerContext *v5;
  double v6;

  v5 = [CMSPlayerContext alloc];
  *(float *)&v6 = a3;
  return (CMSPlayerContext *)-[CMSPlayerContext initForActivity:queue:content:speed:offset:](v5, "initForActivity:queue:content:speed:offset:", self->_activityIdentifier, self->_queueIdentifier, self->_contentIdentifier, self->_offsetInMillis, v6);
}

- (CMSPlayerContext)playerContextWithUpdatedSpeed:(float)a3 offset:(int64_t)a4
{
  CMSPlayerContext *v7;
  double v8;

  v7 = [CMSPlayerContext alloc];
  *(float *)&v8 = a3;
  return (CMSPlayerContext *)-[CMSPlayerContext initForActivity:queue:content:speed:offset:](v7, "initForActivity:queue:content:speed:offset:", self->_activityIdentifier, self->_queueIdentifier, self->_contentIdentifier, a4, v8);
}

- (CMSPlayerContext)playerContextWithUpdatedOffset:(int64_t)a3
{
  CMSPlayerContext *v5;
  double v6;

  v5 = [CMSPlayerContext alloc];
  *(float *)&v6 = self->_playbackSpeed;
  return (CMSPlayerContext *)-[CMSPlayerContext initForActivity:queue:content:speed:offset:](v5, "initForActivity:queue:content:speed:offset:", self->_activityIdentifier, self->_queueIdentifier, self->_contentIdentifier, a3, v6);
}

- (BOOL)isEqualContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *contentIdentifier;
  void *v10;
  void *v11;
  const __CFString *queueIdentifier;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "activityIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 | (uint64_t)self->_activityIdentifier && !objc_msgSend((id)v5, "isEqualToString:"))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "contentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_contentIdentifier)
      contentIdentifier = (const __CFString *)self->_contentIdentifier;
    else
      contentIdentifier = &stru_24E1CDD40;
    if (objc_msgSend(v7, "isEqualToString:", contentIdentifier))
    {
      objc_msgSend(v4, "queueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (self->_queueIdentifier)
        queueIdentifier = (const __CFString *)self->_queueIdentifier;
      else
        queueIdentifier = &stru_24E1CDD40;
      v13 = objc_msgSend(v10, "isEqualToString:", queueIdentifier);

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *contentIdentifier;
  void *v10;
  void *v11;
  const __CFString *queueIdentifier;
  float v13;
  BOOL v14;

  v4 = a3;
  objc_msgSend(v4, "activityIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 | (uint64_t)self->_activityIdentifier && !objc_msgSend((id)v5, "isEqualToString:"))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "contentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_contentIdentifier)
      contentIdentifier = (const __CFString *)self->_contentIdentifier;
    else
      contentIdentifier = &stru_24E1CDD40;
    if (objc_msgSend(v7, "isEqualToString:", contentIdentifier))
    {
      objc_msgSend(v4, "queueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (self->_queueIdentifier)
        queueIdentifier = (const __CFString *)self->_queueIdentifier;
      else
        queueIdentifier = &stru_24E1CDD40;
      v14 = objc_msgSend(v10, "isEqualToString:", queueIdentifier)
         && (objc_msgSend(v4, "playbackSpeed"), vabds_f32(v13, self->_playbackSpeed) < 0.000001)
         && objc_msgSend(v4, "offsetInMillis") == self->_offsetInMillis;

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_activityIdentifier, "hash");
  v4 = -[NSString hash](self->_queueIdentifier, "hash") + v3;
  return v4
       + -[NSString hash](self->_contentIdentifier, "hash")
       + self->_offsetInMillis
       + (unint64_t)(fabsf(self->_playbackSpeed) * 1000000.0);
}

- (id)cmsCoded
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_activityIdentifier, CFSTR("activityIdentifier"));
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_queueIdentifier, CFSTR("queueIdentifier"));
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_contentIdentifier, CFSTR("contentIdentifier"));
  if (self->_playbackSpeed != 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("playbackSpeed"));

  }
  if (-[CMSPlayerContext offsetIsValid](self, "offsetIsValid"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_offsetInMillis);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("offsetInMillis"));

  }
  return v3;
}

+ (id)instanceFromCMSCoded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  double v10;
  float v11;
  uint64_t v12;
  id v13;
  double v14;
  void *v15;

  cmsSafeDictionary(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("contentIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "cmsOptionalStringForKey:", CFSTR("queueIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = (__CFString *)v7;
      else
        v8 = &stru_24E1CDD40;
      objc_msgSend(v5, "cmsOptionalStringForKey:", CFSTR("activityIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cmsDoubleForKey:withDefault:", CFSTR("playbackSpeed"), 1.0);
      v11 = v10;
      v12 = objc_msgSend(v5, "cmsUnsignedForKey:withDefault:", CFSTR("offsetInMillis"), 0x8000000000000000);
      v13 = objc_alloc((Class)a1);
      *(float *)&v14 = v11;
      v15 = (void *)objc_msgSend(v13, "initForActivity:queue:content:speed:offset:", v9, v8, v6, v12, v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMSPlayerContext *v4;
  double v5;

  v4 = +[CMSPlayerContext allocWithZone:](CMSPlayerContext, "allocWithZone:", a3);
  *(float *)&v5 = self->_playbackSpeed;
  return -[CMSPlayerContext initForActivity:queue:content:speed:offset:](v4, "initForActivity:queue:content:speed:offset:", self->_activityIdentifier, self->_queueIdentifier, self->_contentIdentifier, self->_offsetInMillis, v5);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CMSPlayerContext cmsCoded](self, "cmsCoded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CMSPlayerContext @%p:%@"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (int64_t)offsetInMillis
{
  return self->_offsetInMillis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end
