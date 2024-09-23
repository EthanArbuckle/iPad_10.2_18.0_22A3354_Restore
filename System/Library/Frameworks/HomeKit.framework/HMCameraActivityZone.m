@implementation HMCameraActivityZone

- (HMCameraActivityZone)initWithPoints:(id)a3
{
  id v4;
  void *v5;
  HMCameraActivityZone *v6;
  uint64_t v7;
  NSArray *points;
  HMCameraActivityZone *v10;
  SEL v11;
  objc_super v12;

  v4 = a3;
  if (v4 && (v5 = v4, (unint64_t)objc_msgSend(v4, "count") > 2))
  {
    v12.receiver = self;
    v12.super_class = (Class)HMCameraActivityZone;
    v6 = -[HMCameraActivityZone init](&v12, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      points = v6->_points;
      v6->_points = (NSArray *)v7;

    }
    return v6;
  }
  else
  {
    v10 = (HMCameraActivityZone *)_HMFPreconditionFailure();
    return (HMCameraActivityZone *)-[HMCameraActivityZone description](v10, v11);
  }
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMCameraActivityZone points](self, "points");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCameraActivityZone points](self, "points");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "points");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCameraActivityZone points](self, "points");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMCameraActivityZone points](self, "points");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMC.az.ck.p"));

}

- (HMCameraActivityZone)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HMCameraActivityZone *v10;
  NSObject *v11;
  void *v12;
  HMCameraActivityZone *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("HMC.az.ck.p"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (unint64_t)objc_msgSend(v8, "count") > 2)
  {
    v10 = -[HMCameraActivityZone initWithPoints:](self, "initWithPoints:", v8);
    v13 = v10;
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded points:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }

  return v13;
}

- (NSArray)points
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
