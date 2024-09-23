@implementation MPPlaybackSessionCommandInfo

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSString *v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t priority;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
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

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = -[NSString hash](self->_identifier, "hash");
  v10 = v5 ^ 0x7465646279746573 ^ v9;
  v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  v12 = v8 + v10;
  v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  v14 = v13 + __ROR8__(v6 + v7, 32);
  v64 = __ROR8__(v12 + v11, 32);
  v67 = v14 ^ __ROR8__(v13, 43);
  v15 = v14 ^ v9;
  v61 = (v12 + v11) ^ __ROR8__(v11, 47);
  v16 = self->_revision;
  v17 = -[NSString hash](v16, "hash");
  v18 = (v15 + v61) ^ __ROR8__(v61, 51);
  v19 = v64 + (v67 ^ v17);
  v20 = __ROR8__(v67 ^ v17, 48);
  v21 = (v19 ^ v20) + __ROR8__(v15 + v61, 32);
  v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  v23 = v19 + v18;
  v65 = __ROR8__(v23, 32);
  v68 = v22;
  v60 = v21 ^ v17;
  v62 = v23 ^ __ROR8__(v18, 47);

  priority = self->_priority;
  v25 = (v60 + v62) ^ __ROR8__(v62, 51);
  v26 = v65 + (v68 ^ priority);
  v27 = __ROR8__(v68 ^ priority, 48);
  v28 = (v26 ^ v27) + __ROR8__(v60 + v62, 32);
  v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  v30 = v26 + v25;
  v66 = __ROR8__(v30, 32);
  v69 = v29;
  v63 = v30 ^ __ROR8__(v25, 47);
  v31 = ((v28 ^ priority) + v63) ^ __ROR8__(v63, 51);
  v32 = v66 + (v29 ^ 0x1800000000000000);
  v33 = __ROR8__(v69 ^ 0x1800000000000000, 48);
  v34 = (v32 ^ v33) + __ROR8__((v28 ^ priority) + v63, 32);
  v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
  v36 = v32 + v31;
  v37 = v36 ^ __ROR8__(v31, 47);
  v38 = (v34 ^ 0x1800000000000000) + v37;
  v39 = v38 ^ __ROR8__(v37, 51);
  v40 = (__ROR8__(v36, 32) ^ 0xFFLL) + v35;
  v41 = __ROR8__(v35, 48);
  v42 = __ROR8__(v38, 32) + (v40 ^ v41);
  v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
  v44 = v39 + v40;
  v45 = v44 ^ __ROR8__(v39, 47);
  v46 = v45 + v42;
  v47 = v46 ^ __ROR8__(v45, 51);
  v48 = __ROR8__(v44, 32) + v43;
  v49 = __ROR8__(v43, 48);
  v50 = __ROR8__(v46, 32) + (v48 ^ v49);
  v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
  v52 = v47 + v48;
  v53 = v52 ^ __ROR8__(v47, 47);
  v54 = v53 + v50;
  v55 = v54 ^ __ROR8__(v53, 51);
  v56 = __ROR8__(v52, 32) + v51;
  v57 = __ROR8__(v51, 48);
  v58 = __ROR8__(v54, 32) + (v56 ^ v57);
  return (v55 + v56) ^ __ROR8__(v55, 47) ^ v58 ^ __ROR8__(v55 + v56, 32) ^ v58 ^ __ROR8__(v56 ^ v57, 43);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int v9;
  BOOL v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (NSString *)v5[1];
    v7 = self->_identifier;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[NSString isEqual:](v7, "isEqual:", v6);

    v11 = (NSString *)v5[2];
    v12 = self->_revision;
    v13 = v12;
    if (v12 == v11)
      v14 = 1;
    else
      v14 = -[NSString isEqual:](v12, "isEqual:", v11);

    if (v9)
    {
      if (self->_priority == v5[3])
        v10 = v14;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)revision
{
  return self->_revision;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)commandInfoWithIdentifier:(id)a3 revision:(id)a4 priority:(int64_t)a5
{
  id v7;
  id v8;
  MPPlaybackSessionCommandInfo *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *revision;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MPPlaybackSessionCommandInfo);
  v10 = objc_msgSend(v8, "copy");

  identifier = v9->_identifier;
  v9->_identifier = (NSString *)v10;

  v12 = objc_msgSend(v7, "copy");
  revision = v9->_revision;
  v9->_revision = (NSString *)v12;

  v9->_priority = a5;
  return v9;
}

@end
