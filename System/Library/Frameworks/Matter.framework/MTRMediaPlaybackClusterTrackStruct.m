@implementation MTRMediaPlaybackClusterTrackStruct

- (MTRMediaPlaybackClusterTrackStruct)init
{
  MTRMediaPlaybackClusterTrackStruct *v2;
  MTRMediaPlaybackClusterTrackStruct *v3;
  NSString *id;
  MTRMediaPlaybackClusterTrackAttributesStruct *trackAttributes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRMediaPlaybackClusterTrackStruct;
  v2 = -[MTRMediaPlaybackClusterTrackStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSString *)&stru_2505249E8;

    trackAttributes = v3->_trackAttributes;
    v3->_trackAttributes = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMediaPlaybackClusterTrackStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRMediaPlaybackClusterTrackStruct);
  objc_msgSend_id(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  objc_msgSend_trackAttributes(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrackAttributes_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: id:%@; trackAttributes:%@; >"),
    v5,
    self->_id,
    self->_trackAttributes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTRMediaPlaybackClusterTrackAttributesStruct)trackAttributes
{
  return self->_trackAttributes;
}

- (void)setTrackAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackAttributes, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
