@implementation MPPlaybackArchive

- (MPPlaybackArchive)initWithBlock:(id)a3
{
  void (**v4)(id, MPPlaybackArchive *);
  MPPlaybackArchive *v5;
  uint64_t v6;
  NSMutableDictionary *storage;
  objc_super v9;

  v4 = (void (**)(id, MPPlaybackArchive *))a3;
  v9.receiver = self;
  v9.super_class = (Class)MPPlaybackArchive;
  v5 = -[MPPlaybackArchive init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    storage = v5->_storage;
    v5->_storage = (NSMutableDictionary *)v6;

    v4[2](v4, v5);
    v5->_final = 1;
  }

  return v5;
}

- (MPPlaybackArchive)initWithType:(int64_t)a3 sessionIdentifier:(id)a4 data:(id)a5 dataType:(id)a6 bundleIdentifier:(id)a7 supportedOptions:(unint64_t)a8 displayProperties:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MPPlaybackArchive *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  unint64_t v34;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __118__MPPlaybackArchive_initWithType_sessionIdentifier_data_dataType_bundleIdentifier_supportedOptions_displayProperties___block_invoke;
  v27[3] = &unk_1E3154E38;
  v28 = v15;
  v29 = v17;
  v30 = v16;
  v31 = v18;
  v33 = a3;
  v34 = a8;
  v32 = v19;
  v20 = v19;
  v21 = v18;
  v22 = v16;
  v23 = v17;
  v24 = v15;
  v25 = -[MPPlaybackArchive initWithBlock:](self, "initWithBlock:", v27);

  return v25;
}

- (void)setBOOLValue:(BOOL)a3 forOption:(int64_t)a4
{
  int v5;
  unint64_t v6;

  v5 = 1 << a4;
  if (a3)
    v6 = -[MPPlaybackArchive queueControlOptions](self, "queueControlOptions") | v5;
  else
    v6 = -[MPPlaybackArchive queueControlOptions](self, "queueControlOptions") & ~v5;
  -[MPPlaybackArchive setQueueControlOptions:](self, "setQueueControlOptions:", v6);
}

- (BOOL)BOOLValueForOption:(int64_t)a3
{
  return ((1 << a3) & ~-[MPPlaybackArchive queueControlOptions](self, "queueControlOptions")) == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPPlaybackArchive copyWithOptions:](self, "copyWithOptions:", 0);
}

- (id)copyWithOptions:(unint64_t)a3
{
  MPPlaybackArchive *v5;
  MPPlaybackArchive *v6;
  void *v7;
  _QWORD v9[6];

  v5 = [MPPlaybackArchive alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__MPPlaybackArchive_copyWithOptions___block_invoke;
  v9[3] = &unk_1E3154E60;
  v9[4] = self;
  v9[5] = a3;
  v6 = -[MPPlaybackArchive initWithBlock:](v5, "initWithBlock:", v9);
  -[MPPlaybackArchive setCopyOptions:](v6, "setCopyOptions:", a3);
  -[MPPlaybackArchive setQueueControlOptions:](v6, "setQueueControlOptions:", self->_queueControlOptions);
  v7 = (void *)-[NSMutableDictionary copy](self->_storage, "copy");
  -[MPPlaybackArchive setStorage:](v6, "setStorage:", v7);

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  v14 = -[MPPlaybackArchive type](self, "type");
  -[MPPlaybackArchive playbackSessionIdentifier](self, "playbackSessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchive playbackSessionData](self, "playbackSessionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchive playbackSessionType](self, "playbackSessionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchive bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPPlaybackArchive supportedOptions](self, "supportedOptions");
  v8 = -[MPPlaybackArchive queueControlOptions](self, "queueControlOptions");
  -[MPPlaybackArchive displayProperties](self, "displayProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPPlaybackArchive copyOptions](self, "copyOptions");
  -[MPPlaybackArchive storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p type=%ld playbackSessionIdentifier=%@ playbackSessionData=%@ playbackSessionType=%@ bundleIdentifier=%@ supportedOptions=%lu queueControlOptions=%lu displayProperties=%@ copyOptions=%lu> storage=%@"), v15, self, v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  MPPlaybackArchive *v4;
  MPPlaybackArchive *v5;
  int64_t type;
  NSString *playbackSessionIdentifier;
  NSString *v8;
  int v9;
  char v10;
  NSData *playbackSessionData;
  NSData *v12;
  int v13;
  NSString *playbackSessionType;
  NSString *v15;
  int v16;
  NSString *bundleIdentifier;
  NSString *v18;
  int v19;
  unint64_t supportedOptions;
  MPPlaybackArchiveDisplayProperties *displayProperties;
  MPPlaybackArchiveDisplayProperties *v22;
  _BOOL4 v23;
  unint64_t copyOptions;
  unint64_t queueControlOptions;
  NSMutableDictionary *storage;
  NSMutableDictionary *v27;

  v4 = (MPPlaybackArchive *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type != -[MPPlaybackArchive type](v5, "type"))
      {
        v10 = 0;
LABEL_39:

        goto LABEL_40;
      }
      playbackSessionIdentifier = self->_playbackSessionIdentifier;
      -[MPPlaybackArchive playbackSessionIdentifier](v5, "playbackSessionIdentifier");
      v8 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (playbackSessionIdentifier == v8)
      {

      }
      else
      {
        v9 = -[NSString isEqual:](playbackSessionIdentifier, "isEqual:", v8);

        if (!v9)
        {
          v10 = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      playbackSessionData = self->_playbackSessionData;
      -[MPPlaybackArchive playbackSessionData](v5, "playbackSessionData");
      v12 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
      if (playbackSessionData == v12)
      {

      }
      else
      {
        v13 = -[NSData isEqual:](playbackSessionData, "isEqual:", v12);

        if (!v13)
        {
          v10 = 0;
LABEL_37:

          goto LABEL_38;
        }
      }
      playbackSessionType = self->_playbackSessionType;
      -[MPPlaybackArchive playbackSessionType](v5, "playbackSessionType");
      v15 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (playbackSessionType == v15)
      {

      }
      else
      {
        v16 = -[NSString isEqual:](playbackSessionType, "isEqual:", v15);

        if (!v16)
        {
          v10 = 0;
LABEL_36:

          goto LABEL_37;
        }
      }
      bundleIdentifier = self->_bundleIdentifier;
      -[MPPlaybackArchive bundleIdentifier](v5, "bundleIdentifier");
      v18 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (bundleIdentifier == v18)
      {

      }
      else
      {
        v19 = -[NSString isEqual:](bundleIdentifier, "isEqual:", v18);

        if (!v19)
          goto LABEL_27;
      }
      supportedOptions = self->_supportedOptions;
      if (supportedOptions != -[MPPlaybackArchive supportedOptions](v5, "supportedOptions"))
      {
LABEL_27:
        v10 = 0;
LABEL_35:

        goto LABEL_36;
      }
      displayProperties = self->_displayProperties;
      -[MPPlaybackArchive displayProperties](v5, "displayProperties");
      v22 = (MPPlaybackArchiveDisplayProperties *)(id)objc_claimAutoreleasedReturnValue();
      if (displayProperties == v22)
      {

      }
      else
      {
        v23 = -[MPPlaybackArchiveDisplayProperties isEqual:](displayProperties, "isEqual:", v22);

        if (!v23)
          goto LABEL_33;
      }
      copyOptions = self->_copyOptions;
      if (copyOptions == -[MPPlaybackArchive copyOptions](v5, "copyOptions"))
      {
        queueControlOptions = self->_queueControlOptions;
        if (queueControlOptions == -[MPPlaybackArchive queueControlOptions](v5, "queueControlOptions"))
        {
          storage = self->_storage;
          -[MPPlaybackArchive storage](v5, "storage");
          v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          if (storage == v27)
            v10 = 1;
          else
            v10 = -[NSMutableDictionary isEqual:](storage, "isEqual:", v27);

          goto LABEL_34;
        }
      }
LABEL_33:
      v10 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v10 = 0;
  }
LABEL_40:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  int64_t type;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  NSData *v19;
  NSString *v20;
  NSString *v21;
  unint64_t supportedOptions;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  MPPlaybackArchiveDisplayProperties *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t copyOptions;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t queueControlOptions;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  NSMutableDictionary *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;

  v3 = MSVHasherSharedSeed();
  v4 = v3 ^ 0x736F6D6570736575;
  v6 = v5 ^ 0x646F72616E646F6DLL;
  v7 = v3 ^ 0x6C7967656E657261;
  v8 = v5 ^ 0x7465646279746573;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  objc_msgSend(v10, "length");

  type = self->_type;
  v12 = (v4 + v6) ^ __ROR8__(v6, 51);
  v13 = v7 + (v8 ^ type);
  v14 = __ROR8__(v8 ^ type, 48);
  v15 = (v13 ^ v14) + __ROR8__(v4 + v6, 32);
  v16 = v15 ^ __ROR8__(v13 ^ v14, 43);
  v17 = v13 + v12;
  v100 = __ROR8__(v17, 32);
  v105 = v16;
  v88 = v15 ^ type;
  v94 = v17 ^ __ROR8__(v12, 47);
  v18 = objc_retainAutorelease(self->_playbackSessionIdentifier);
  -[NSString UTF8String](v18, "UTF8String");
  -[NSString length](v18, "length");

  v19 = objc_retainAutorelease(self->_playbackSessionData);
  -[NSData bytes](v19, "bytes");
  -[NSData length](v19, "length");

  v20 = objc_retainAutorelease(self->_playbackSessionType);
  -[NSString UTF8String](v20, "UTF8String");
  -[NSString length](v20, "length");

  v21 = objc_retainAutorelease(self->_bundleIdentifier);
  -[NSString UTF8String](v21, "UTF8String");
  -[NSString length](v21, "length");

  supportedOptions = self->_supportedOptions;
  v23 = (v88 + v94) ^ __ROR8__(v94, 51);
  v24 = v100 + (v105 ^ supportedOptions);
  v25 = __ROR8__(v105 ^ supportedOptions, 48);
  v26 = (v24 ^ v25) + __ROR8__(v88 + v94, 32);
  v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
  v28 = v24 + v23;
  v101 = __ROR8__(v28, 32);
  v106 = v27;
  v89 = v26 ^ supportedOptions;
  v95 = v28 ^ __ROR8__(v23, 47);
  v29 = self->_displayProperties;
  v30 = -[MPPlaybackArchiveDisplayProperties hash](v29, "hash");
  v31 = (v89 + v95) ^ __ROR8__(v95, 51);
  v32 = v101 + (v106 ^ v30);
  v33 = __ROR8__(v106 ^ v30, 48);
  v34 = (v32 ^ v33) + __ROR8__(v89 + v95, 32);
  v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
  v36 = v32 + v31;
  v102 = __ROR8__(v36, 32);
  v107 = v35;
  v90 = v34 ^ v30;
  v96 = v36 ^ __ROR8__(v31, 47);

  copyOptions = self->_copyOptions;
  v38 = (v90 + v96) ^ __ROR8__(v96, 51);
  v39 = v102 + (v107 ^ copyOptions);
  v40 = __ROR8__(v107 ^ copyOptions, 48);
  v41 = (v39 ^ v40) + __ROR8__(v90 + v96, 32);
  v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
  v43 = v39 + v38;
  v91 = v41 ^ copyOptions;
  v97 = v43 ^ __ROR8__(v38, 47);
  queueControlOptions = self->_queueControlOptions;
  v45 = (v91 + v97) ^ __ROR8__(v97, 51);
  v46 = __ROR8__(v43, 32) + (v42 ^ queueControlOptions);
  v47 = __ROR8__(v42 ^ queueControlOptions, 48);
  v48 = (v46 ^ v47) + __ROR8__(v91 + v97, 32);
  v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
  v50 = v46 + v45;
  v103 = __ROR8__(v50, 32);
  v108 = v49;
  v92 = v48 ^ queueControlOptions;
  v98 = v50 ^ __ROR8__(v45, 47);
  v51 = self->_storage;
  v52 = -[NSMutableDictionary hash](v51, "hash");
  v53 = (v92 + v98) ^ __ROR8__(v98, 51);
  v54 = v103 + (v108 ^ v52);
  v55 = __ROR8__(v108 ^ v52, 48);
  v56 = (v54 ^ v55) + __ROR8__(v92 + v98, 32);
  v57 = v56 ^ __ROR8__(v54 ^ v55, 43);
  v58 = v54 + v53;
  v104 = __ROR8__(v58, 32);
  v109 = v57;
  v93 = v56 ^ v52;
  v99 = v58 ^ __ROR8__(v53, 47);

  v59 = (v93 + v99) ^ __ROR8__(v99, 51);
  v60 = v104 + (v109 ^ 0x3000000000000000);
  v61 = __ROR8__(v109 ^ 0x3000000000000000, 48);
  v62 = (v60 ^ v61) + __ROR8__(v93 + v99, 32);
  v63 = v62 ^ __ROR8__(v60 ^ v61, 43);
  v64 = v60 + v59;
  v65 = v64 ^ __ROR8__(v59, 47);
  v66 = (v62 ^ 0x3000000000000000) + v65;
  v67 = v66 ^ __ROR8__(v65, 51);
  v68 = (__ROR8__(v64, 32) ^ 0xFFLL) + v63;
  v69 = __ROR8__(v63, 48);
  v70 = __ROR8__(v66, 32) + (v68 ^ v69);
  v71 = v70 ^ __ROR8__(v68 ^ v69, 43);
  v72 = v67 + v68;
  v73 = v72 ^ __ROR8__(v67, 47);
  v74 = v73 + v70;
  v75 = v74 ^ __ROR8__(v73, 51);
  v76 = __ROR8__(v72, 32) + v71;
  v77 = __ROR8__(v71, 48);
  v78 = __ROR8__(v74, 32) + (v76 ^ v77);
  v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  v80 = v75 + v76;
  v81 = v80 ^ __ROR8__(v75, 47);
  v82 = v81 + v78;
  v83 = v82 ^ __ROR8__(v81, 51);
  v84 = __ROR8__(v80, 32) + v79;
  v85 = __ROR8__(v79, 48);
  v86 = __ROR8__(v82, 32) + (v84 ^ v85);
  return (v83 + v84) ^ __ROR8__(v83, 47) ^ v86 ^ __ROR8__(v83 + v84, 32) ^ v86 ^ __ROR8__(v84 ^ v85, 43);
}

- (MPPlaybackArchive)initWithCoder:(id)a3
{
  id v4;
  id v5;
  MPPlaybackArchive *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *storage;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__MPPlaybackArchive_initWithCoder___block_invoke;
  v11[3] = &unk_1E3154E88;
  v12 = v4;
  v5 = v4;
  v6 = -[MPPlaybackArchive initWithBlock:](self, "initWithBlock:", v11);
  v6->_copyOptions = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("copyOptions"));
  v6->_queueControlOptions = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("queueControlOptions"));
  objc_msgSend(v5, "decodePropertyListForKey:", CFSTR("storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");
  storage = v6->_storage;
  v6->_storage = (NSMutableDictionary *)v8;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("archiveType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackSessionIdentifier, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackSessionData, CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackSessionType, CFSTR("sessionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedOptions, CFSTR("supportedOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayProperties, CFSTR("displayProperties"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_copyOptions, CFSTR("copyOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_queueControlOptions, CFSTR("queueControlOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storage, CFSTR("storage"));

}

- (void)setType:(int64_t)a3
{
  void *v6;

  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchive.m"), 226, CFSTR("Attempt to mutate after finalization."));

  }
  self->_type = a3;
}

- (void)setSessionIdentifier:(id)a3 type:(id)a4 data:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  NSString *playbackSessionIdentifier;
  NSString *v13;
  NSString *playbackSessionType;
  NSData *v15;
  NSData *playbackSessionData;
  void *v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchive.m"), 231, CFSTR("Attempt to mutate after finalization."));

  }
  v11 = (NSString *)objc_msgSend(v18, "copy");
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  self->_playbackSessionIdentifier = v11;

  v13 = (NSString *)objc_msgSend(v9, "copy");
  playbackSessionType = self->_playbackSessionType;
  self->_playbackSessionType = v13;

  v15 = (NSData *)objc_msgSend(v10, "copy");
  playbackSessionData = self->_playbackSessionData;
  self->_playbackSessionData = v15;

}

- (void)setBundleIdentifier:(id)a3
{
  id v5;
  NSString *v6;
  NSString *bundleIdentifier;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchive.m"), 238, CFSTR("Attempt to mutate after finalization."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v6;

}

- (void)setSupportedOptions:(unint64_t)a3
{
  void *v6;

  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchive.m"), 243, CFSTR("Attempt to mutate after finalization."));

  }
  self->_supportedOptions = a3;
}

- (void)setDisplayProperties:(id)a3
{
  id v5;
  MPPlaybackArchiveDisplayProperties *v6;
  MPPlaybackArchiveDisplayProperties *displayProperties;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchive.m"), 248, CFSTR("Attempt to mutate after finalization."));

    v5 = v9;
  }
  v6 = (MPPlaybackArchiveDisplayProperties *)objc_msgSend(v5, "copy");
  displayProperties = self->_displayProperties;
  self->_displayProperties = v6;

}

- (void)setFallbackStoreIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchive.m"), 253, CFSTR("Attempt to mutate after finalization."));

    v5 = v8;
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v6, CFSTR("fsi"));

}

- (NSString)fallbackStoreIdentifier
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("fsi"));
}

- (MPPlaybackArchiveDisplayProperties)displayProperties
{
  return self->_displayProperties;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (unint64_t)copyOptions
{
  return self->_copyOptions;
}

- (void)setCopyOptions:(unint64_t)a3
{
  self->_copyOptions = a3;
}

- (unint64_t)queueControlOptions
{
  return self->_queueControlOptions;
}

- (void)setQueueControlOptions:(unint64_t)a3
{
  self->_queueControlOptions = a3;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (NSString)playbackSessionType
{
  return self->_playbackSessionType;
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_playbackSessionType, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayProperties, 0);
}

void __35__MPPlaybackArchive_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "setType:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("archiveType")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBundleIdentifier:", v3);

  objc_msgSend(v8, "setSupportedOptions:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("supportedOptions")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v8, "setSessionIdentifier:type:data:", v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayProperties:", v7);

}

void __37__MPPlaybackArchive_copyWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "setType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleIdentifier:", v3);

  objc_msgSend(v9, "setSupportedOptions:", objc_msgSend(*(id *)(a1 + 32), "supportedOptions"));
  if ((*(_BYTE *)(a1 + 40) & 2) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackSessionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "playbackSessionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "playbackSessionData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionIdentifier:type:data:", v4, v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "displayProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "setDisplayProperties:", v8);

}

void __118__MPPlaybackArchive_initWithType_sessionIdentifier_data_dataType_bundleIdentifier_supportedOptions_displayProperties___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[9];
  v4 = a2;
  objc_msgSend(v4, "setType:", v3);
  objc_msgSend(v4, "setSessionIdentifier:type:data:", a1[4], a1[5], a1[6]);
  objc_msgSend(v4, "setBundleIdentifier:", a1[7]);
  objc_msgSend(v4, "setSupportedOptions:", a1[10]);
  objc_msgSend(v4, "setDisplayProperties:", a1[8]);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
