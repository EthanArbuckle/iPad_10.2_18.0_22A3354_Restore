@implementation HMDCameraRecordingMediaContainer

- (HMDCameraRecordingMediaContainer)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingMediaContainer *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraRecordingMediaContainer;
  v5 = -[HMDCameraRecordingMediaContainer init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "HMDCameraRecordingMediaContainer", "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = (int)objc_msgSend(v4, "decodeInt32ForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v4 = a3;
  v5 = -[HMDCameraRecordingMediaContainer type](self, "type");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "HMDCameraRecordingMediaContainer", "type");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v5, v6);

}

- (BOOL)isEqual:(id)a3
{
  HMDCameraRecordingMediaContainer *v4;
  int64_t v5;
  BOOL v6;

  v4 = (HMDCameraRecordingMediaContainer *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[HMDCameraRecordingMediaContainer type](self, "type");
      v6 = v5 == -[HMDCameraRecordingMediaContainer type](v4, "type");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  HMDCameraRecordingMediaContainerTypeAsString(-[HMDCameraRecordingMediaContainer type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  HMDCameraRecordingMediaContainerTypeAsString(-[HMDCameraRecordingMediaContainer type](self, "type"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@ type = %@"), v6, v8);

}

- (HMDCameraRecordingMediaContainer)initWithContainer:(int64_t)a3
{
  HMDCameraRecordingMediaContainer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCameraRecordingMediaContainer;
  result = -[HMDCameraRecordingMediaContainer init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDCameraRecordingMediaContainer initWithContainer:](+[HMDCameraRecordingMediaContainer allocWithZone:](HMDCameraRecordingMediaContainer, "allocWithZone:", a3), "initWithContainer:", -[HMDCameraRecordingMediaContainer type](self, "type"));
}

- (int64_t)type
{
  return self->_type;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)arrayWithContainerTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDCameraRecordingMediaContainer *v11;
  HMDCameraRecordingMediaContainer *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [HMDCameraRecordingMediaContainer alloc];
        v12 = -[HMDCameraRecordingMediaContainer initWithContainer:](v11, "initWithContainer:", objc_msgSend(v10, "integerValue", (_QWORD)v14));
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
