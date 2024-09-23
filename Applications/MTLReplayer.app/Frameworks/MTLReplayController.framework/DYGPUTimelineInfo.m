@implementation DYGPUTimelineInfo

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setNumPeriodicSamples:", -[DYGPUTimelineInfo numPeriodicSamples](self, "numPeriodicSamples"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo timestamps](self, "timestamps"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTimestamps:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo derivedCounters](self, "derivedCounters"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDerivedCounters:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo derivedCounterNames](self, "derivedCounterNames"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDerivedCounterNames:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo activeShadersPerPeriodicSample](self, "activeShadersPerPeriodicSample"));
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setActiveShadersPerPeriodicSample:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo numActiveShadersPerPeriodicSample](self, "numActiveShadersPerPeriodicSample"));
  v14 = objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setNumActiveShadersPerPeriodicSample:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo encoderTimelineInfos](self, "encoderTimelineInfos"));
  v16 = objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setEncoderTimelineInfos:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self, "metalFXTimelineInfo"));
  v18 = objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setMetalFXTimelineInfo:", v18);

  return v4;
}

- (DYGPUTimelineInfo)initWithCoder:(id)a3
{
  id v4;
  DYGPUTimelineInfo *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSData *timestamps;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSData *derivedCounters;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  NSArray *derivedCounterNames;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  uint64_t v34;
  NSData *activeShadersPerPeriodicSample;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSSet *v39;
  void *v40;
  uint64_t v41;
  NSData *activeCoreInfoMasksPerPeriodicSample;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSSet *v46;
  void *v47;
  uint64_t v48;
  NSData *numActiveShadersPerPeriodicSample;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSSet *v53;
  void *v54;
  uint64_t v55;
  NSData *encoderTimelineInfos;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSSet *v60;
  void *v61;
  uint64_t v62;
  NSData *metalFXTimelineInfo;
  DYGPUTimelineInfo *v64;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)DYGPUTimelineInfo;
  v5 = -[DYGPUTimelineInfo init](&v66, "init");
  if (v5)
  {
    v5->_numPeriodicSamples = objc_msgSend(v4, "decodeIntForKey:", CFSTR("numPeriodicSamples"));
    v7 = objc_opt_class(NSData, v6);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(NSMutableData, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("timestamps")));
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSData *)v11;

    v14 = objc_opt_class(NSData, v13);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(NSMutableData, v15), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("derivedCounters")));
    derivedCounters = v5->_derivedCounters;
    v5->_derivedCounters = (NSData *)v18;

    v21 = objc_opt_class(NSArray, v20);
    v23 = objc_opt_class(NSMutableArray, v22);
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v23, objc_opt_class(NSString, v24), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("derivedCounterNames")));
    derivedCounterNames = v5->_derivedCounterNames;
    v5->_derivedCounterNames = (NSArray *)v27;

    v30 = objc_opt_class(NSData, v29);
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(NSMutableData, v31), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("activeShadersPerPeriodicSample")));
    activeShadersPerPeriodicSample = v5->_activeShadersPerPeriodicSample;
    v5->_activeShadersPerPeriodicSample = (NSData *)v34;

    v37 = objc_opt_class(NSData, v36);
    v39 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v37, objc_opt_class(NSMutableData, v38), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("activeCoreInfoMasksPerPeriodicSample")));
    activeCoreInfoMasksPerPeriodicSample = v5->_activeCoreInfoMasksPerPeriodicSample;
    v5->_activeCoreInfoMasksPerPeriodicSample = (NSData *)v41;

    v44 = objc_opt_class(NSData, v43);
    v46 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, objc_opt_class(NSMutableData, v45), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("numActiveShadersPerPeriodicSample")));
    numActiveShadersPerPeriodicSample = v5->_numActiveShadersPerPeriodicSample;
    v5->_numActiveShadersPerPeriodicSample = (NSData *)v48;

    v51 = objc_opt_class(NSData, v50);
    v53 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v51, objc_opt_class(NSMutableData, v52), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("encoderTimelineInfos")));
    encoderTimelineInfos = v5->_encoderTimelineInfos;
    v5->_encoderTimelineInfos = (NSData *)v55;

    v58 = objc_opt_class(NSData, v57);
    v60 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v58, objc_opt_class(NSMutableData, v59), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("metalFXTimelineInfo")));
    metalFXTimelineInfo = v5->_metalFXTimelineInfo;
    v5->_metalFXTimelineInfo = (NSData *)v62;

    v64 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_numPeriodicSamples, CFSTR("numPeriodicSamples"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamps, CFSTR("timestamps"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_derivedCounters, CFSTR("derivedCounters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_derivedCounterNames, CFSTR("derivedCounterNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activeShadersPerPeriodicSample, CFSTR("activeShadersPerPeriodicSample"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activeCoreInfoMasksPerPeriodicSample, CFSTR("activeCoreInfoMasksPerPeriodicSample"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_numActiveShadersPerPeriodicSample, CFSTR("numActiveShadersPerPeriodicSample"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_encoderTimelineInfos, CFSTR("encoderTimelineInfos"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metalFXTimelineInfo, CFSTR("metalFXTimelineInfo"));

}

- (DYGPUTimelineInfo)init
{
  DYGPUTimelineInfo *v2;
  DYGPUTimelineInfo *v3;
  DYGPUTimelineInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYGPUTimelineInfo;
  v2 = -[DYGPUTimelineInfo init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)enumerateActiveShadersForAllSamples:(id)a3
{
  void (**v4)(id, NSUInteger, char *, uint64_t, uint64_t, char *);
  const void *v5;
  NSUInteger v6;
  char *v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  NSUInteger v15;
  _BOOL4 v17;
  char *v19;
  NSUInteger v20;
  char *v21;
  char v22;

  v4 = (void (**)(id, NSUInteger, char *, uint64_t, uint64_t, char *))a3;
  v5 = -[NSData bytes](self->_activeShadersPerPeriodicSample, "bytes");
  v6 = -[NSData length](self->_activeShadersPerPeriodicSample, "length");
  v7 = -[NSData bytes](self->_activeCoreInfoMasksPerPeriodicSample, "bytes");
  v8 = -[NSData length](self->_activeCoreInfoMasksPerPeriodicSample, "length");
  v21 = -[NSData bytes](self->_numActiveShadersPerPeriodicSample, "bytes");
  v9 = -[NSData length](self->_numActiveShadersPerPeriodicSample, "length");
  v22 = 0;
  if (v9 >= 8)
  {
    v10 = 0;
    v11 = v6 >> 3;
    v20 = v9 >> 3;
    do
    {
      v12 = (unsigned int *)&v21[8 * v10];
      v13 = *v12;
      if (*v12)
      {
        v14 = 0;
        do
        {
          v15 = v14 + v12[1];
          v17 = v8 < 8 || v8 >> 3 > v15;
          if (v11 > v15 && v17)
          {
            if (v8 >= 8)
              v19 = &v7[8 * v15];
            else
              v19 = 0;
            v4[2](v4, (NSUInteger)v5 + 8 * v15, v19, v10, v14, &v22);
            if (v22)
              goto LABEL_2;
            v13 = *v12;
          }
          v14 = (v14 + 1);
        }
        while (v14 < v13);
      }
      ++v10;
    }
    while (v10 != v20);
  }
LABEL_2:

}

- (void)enumerateActiveShadersForSampleAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  void (**v6)(id, NSUInteger, char *, uint64_t, char *);
  const void *v7;
  NSUInteger v8;
  char *v9;
  NSUInteger v10;
  char *v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  _BOOL4 v18;
  char *v20;
  char v21;

  v6 = (void (**)(id, NSUInteger, char *, uint64_t, char *))a4;
  v7 = -[NSData bytes](self->_activeShadersPerPeriodicSample, "bytes");
  v8 = -[NSData length](self->_activeShadersPerPeriodicSample, "length");
  v9 = -[NSData bytes](self->_activeCoreInfoMasksPerPeriodicSample, "bytes");
  v10 = -[NSData length](self->_activeCoreInfoMasksPerPeriodicSample, "length");
  v11 = -[NSData bytes](self->_numActiveShadersPerPeriodicSample, "bytes");
  if (a3 < -[NSData length](self->_numActiveShadersPerPeriodicSample, "length") >> 3)
  {
    v21 = 0;
    v12 = (unsigned int *)&v11[8 * a3];
    v13 = *v12;
    if (*v12)
    {
      v14 = 0;
      v15 = v8 >> 3;
      do
      {
        v16 = v14 + v12[1];
        v18 = v10 < 8 || v10 >> 3 > v16;
        if (v15 > v16 && v18)
        {
          if (v10 >= 8)
            v20 = &v9[8 * v16];
          else
            v20 = 0;
          v6[2](v6, (NSUInteger)v7 + 8 * v16, v20, v14, &v21);
          if (v21)
            break;
          v13 = *v12;
        }
        v14 = (v14 + 1);
      }
      while (v14 < v13);
    }
  }

}

- (unsigned)numPeriodicSamples
{
  return self->_numPeriodicSamples;
}

- (void)setNumPeriodicSamples:(unsigned int)a3
{
  self->_numPeriodicSamples = a3;
}

- (NSData)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (NSData)derivedCounters
{
  return self->_derivedCounters;
}

- (void)setDerivedCounters:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounters, a3);
}

- (NSArray)derivedCounterNames
{
  return self->_derivedCounterNames;
}

- (void)setDerivedCounterNames:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounterNames, a3);
}

- (NSData)activeShadersPerPeriodicSample
{
  return self->_activeShadersPerPeriodicSample;
}

- (void)setActiveShadersPerPeriodicSample:(id)a3
{
  objc_storeStrong((id *)&self->_activeShadersPerPeriodicSample, a3);
}

- (NSData)activeCoreInfoMasksPerPeriodicSample
{
  return self->_activeCoreInfoMasksPerPeriodicSample;
}

- (void)setActiveCoreInfoMasksPerPeriodicSample:(id)a3
{
  objc_storeStrong((id *)&self->_activeCoreInfoMasksPerPeriodicSample, a3);
}

- (NSData)numActiveShadersPerPeriodicSample
{
  return self->_numActiveShadersPerPeriodicSample;
}

- (void)setNumActiveShadersPerPeriodicSample:(id)a3
{
  objc_storeStrong((id *)&self->_numActiveShadersPerPeriodicSample, a3);
}

- (NSData)encoderTimelineInfos
{
  return self->_encoderTimelineInfos;
}

- (void)setEncoderTimelineInfos:(id)a3
{
  objc_storeStrong((id *)&self->_encoderTimelineInfos, a3);
}

- (NSData)metalFXTimelineInfo
{
  return self->_metalFXTimelineInfo;
}

- (void)setMetalFXTimelineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_metalFXTimelineInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalFXTimelineInfo, 0);
  objc_storeStrong((id *)&self->_encoderTimelineInfos, 0);
  objc_storeStrong((id *)&self->_numActiveShadersPerPeriodicSample, 0);
  objc_storeStrong((id *)&self->_activeCoreInfoMasksPerPeriodicSample, 0);
  objc_storeStrong((id *)&self->_activeShadersPerPeriodicSample, 0);
  objc_storeStrong((id *)&self->_derivedCounterNames, 0);
  objc_storeStrong((id *)&self->_derivedCounters, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
