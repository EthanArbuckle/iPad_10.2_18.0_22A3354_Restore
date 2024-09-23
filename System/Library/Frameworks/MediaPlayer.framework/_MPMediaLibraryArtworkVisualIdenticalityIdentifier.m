@implementation _MPMediaLibraryArtworkVisualIdenticalityIdentifier

- (id)stringRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_MPMediaLibraryArtworkVisualIdenticalityIdentifier fetchableArtworkToken](self, "fetchableArtworkToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[_MPMediaLibraryArtworkVisualIdenticalityIdentifier availableArtworkToken](self, "availableArtworkToken");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (_MPMediaLibraryArtworkVisualIdenticalityIdentifier)initWithArtworkType:(int64_t)a3 availableArtworkToken:(id)a4 fetchableArtworkToken:(id)a5
{
  id v8;
  id v9;
  _MPMediaLibraryArtworkVisualIdenticalityIdentifier *v10;
  _MPMediaLibraryArtworkVisualIdenticalityIdentifier *v11;
  uint64_t v12;
  NSString *availableArtworkToken;
  uint64_t v14;
  NSString *fetchableArtworkToken;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MPMediaLibraryArtworkVisualIdenticalityIdentifier;
  v10 = -[_MPMediaLibraryArtworkVisualIdenticalityIdentifier init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_artworkType = a3;
    v12 = objc_msgSend(v8, "copy");
    availableArtworkToken = v11->_availableArtworkToken;
    v11->_availableArtworkToken = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    fetchableArtworkToken = v11->_fetchableArtworkToken;
    v11->_fetchableArtworkToken = (NSString *)v14;

  }
  return v11;
}

- (NSString)fetchableArtworkToken
{
  return self->_fetchableArtworkToken;
}

- (NSString)availableArtworkToken
{
  return self->_availableArtworkToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchableArtworkToken, 0);
  objc_storeStrong((id *)&self->_availableArtworkToken, 0);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *availableArtworkToken;
  int64_t artworkType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  NSUInteger v24;
  NSString *v25;
  uint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
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
  uint64_t v59;
  NSUInteger v60;
  NSUInteger v61;
  uint64_t v62;
  unint64_t v63;
  NSUInteger v65;
  NSUInteger v66;
  uint64_t v67;
  NSUInteger v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _QWORD v81[19];

  v81[18] = *MEMORY[0x1E0C80C00];
  v3 = MSVHasherSharedSeed();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0;
  v5 = v3 ^ 0x6C7967656E657261;
  v6 = ((v3 ^ 0x736F6D6570736575) + (v4 ^ 0x646F72616E646F6DLL)) ^ __ROR8__(v4 ^ 0x646F72616E646F6DLL, 51);
  v7 = __ROR8__((v3 ^ 0x736F6D6570736575) + (v4 ^ 0x646F72616E646F6DLL), 32);
  artworkType = self->_artworkType;
  availableArtworkToken = self->_availableArtworkToken;
  v10 = v4 ^ 0x7465646279746573 ^ artworkType;
  v11 = v5 + v10;
  v12 = __ROR8__(v10, 48);
  v13 = (v11 ^ v12) + v7;
  v14 = v13 ^ __ROR8__(v11 ^ v12, 43);
  v15 = v13 ^ artworkType;
  v16 = v11 + v6;
  v17 = v16 ^ __ROR8__(v6, 47);
  v18 = __ROR8__(v16, 32);
  v66 = v17;
  v67 = v18;
  v65 = v13 ^ artworkType;
  v68 = v14;
  v69 = 0x800000000000000;
  v19 = 0x1000000000000000;
  if (-[NSString length](availableArtworkToken, "length"))
  {
    v20 = -[NSString hash](self->_availableArtworkToken, "hash");
    v21 = (v15 + v17) ^ __ROR8__(v17, 51);
    v22 = v18 + (v14 ^ v20);
    v23 = __ROR8__(v14 ^ v20, 48);
    v24 = (v22 ^ v23) + __ROR8__(v15 + v17, 32);
    v14 = v24 ^ __ROR8__(v22 ^ v23, 43);
    v17 = (v22 + v21) ^ __ROR8__(v21, 47);
    v18 = __ROR8__(v22 + v21, 32);
    v67 = v18;
    v68 = v14;
    v15 = v24 ^ v20;
    v65 = v24 ^ v20;
    v66 = v17;
    v69 = 0x1000000000000000;
    v19 = 0x1800000000000000;
  }
  if (-[NSString length](self->_fetchableArtworkToken, "length"))
  {
    v25 = self->_fetchableArtworkToken;
    v26 = -[NSString hash](v25, "hash");
    v27 = (v15 + v17) ^ __ROR8__(v17, 51);
    v28 = v18 + (v14 ^ v26);
    v29 = __ROR8__(v14 ^ v26, 48);
    v30 = (v28 ^ v29) + __ROR8__(v15 + v17, 32);
    v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
    v32 = v28 + v27;
    v67 = __ROR8__(v32, 32);
    v68 = v31;
    v65 = v30 ^ v26;
    v66 = v32 ^ __ROR8__(v27, 47);
    v69 = v19;

  }
  memset(&v81[1], 0, 64);
  v81[0] = 1000;
  v33 = (v65 + v66) ^ __ROR8__(v66, 51);
  v34 = v67 + (v68 ^ v69);
  v35 = __ROR8__(v68 ^ v69, 48);
  v36 = (v34 ^ v35) + __ROR8__(v65 + v66, 32);
  v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  v38 = v34 + v33;
  v39 = v38 ^ __ROR8__(v33, 47);
  v40 = (v36 ^ v69) + v39;
  v41 = v40 ^ __ROR8__(v39, 51);
  v42 = (__ROR8__(v38, 32) ^ 0xFFLL) + v37;
  v43 = __ROR8__(v37, 48);
  v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  v46 = v41 + v42;
  v47 = v46 ^ __ROR8__(v41, 47);
  v48 = v47 + v44;
  v49 = v48 ^ __ROR8__(v47, 51);
  v50 = __ROR8__(v46, 32) + v45;
  v51 = __ROR8__(v45, 48);
  v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  v54 = v49 + v50;
  v55 = v54 ^ __ROR8__(v49, 47);
  v56 = v55 + v52;
  v57 = v56 ^ __ROR8__(v55, 51);
  v58 = __ROR8__(v54, 32) + v53;
  v59 = __ROR8__(v53, 48);
  v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
  v62 = v57 + v58;
  v65 = v60;
  v67 = __ROR8__(v62, 32);
  v68 = v61;
  v63 = v62 ^ __ROR8__(v57, 47) ^ v60 ^ v67 ^ v61;
  v81[1] = v63;
  *(_OWORD *)&v81[9] = *(_OWORD *)v81;
  *(_OWORD *)&v81[11] = *(_OWORD *)&v81[2];
  *(_OWORD *)&v81[13] = *(_OWORD *)&v81[4];
  *(_OWORD *)&v81[15] = *(_OWORD *)&v81[6];
  v81[17] = 0;
  return v63;
}

- (BOOL)isEqual:(id)a3
{
  _MPMediaLibraryArtworkVisualIdenticalityIdentifier *v4;
  id *v5;
  NSString *availableArtworkToken;
  char v7;
  NSString *v8;
  NSString *fetchableArtworkToken;
  NSString *v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  int v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  char v26;

  v4 = (_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString length](self->_availableArtworkToken, "length"))
        availableArtworkToken = self->_availableArtworkToken;
      else
        availableArtworkToken = 0;
      v8 = availableArtworkToken;
      if (-[NSString length](self->_fetchableArtworkToken, "length"))
        fetchableArtworkToken = self->_fetchableArtworkToken;
      else
        fetchableArtworkToken = 0;
      v10 = fetchableArtworkToken;
      if (objc_msgSend(v5[2], "length"))
        v11 = v5[2];
      else
        v11 = 0;
      v12 = v11;
      if (objc_msgSend(v5[3], "length"))
        v13 = v5[3];
      else
        v13 = 0;
      v14 = (NSString *)v13;
      v15 = (NSString *)v12;
      if (v8 == v15)
      {

      }
      else
      {
        v16 = v8;
        v17 = -[NSString isEqual:](v16, "isEqual:", v15);

        if (!v17)
        {
          v18 = v15;
          v19 = v18;
          if (v18 == v10)
            v20 = 1;
          else
            v20 = -[NSString isEqual:](v18, "isEqual:", v10);

          if (v14)
            v20 = 0;
          v23 = v16;
          v24 = v23;
          if (v23 == v14)
            v25 = 1;
          else
            v25 = -[NSString isEqual:](v23, "isEqual:", v14);

          if (v10)
            v26 = 0;
          else
            v26 = v25;
          v7 = v26 | v20;
          goto LABEL_36;
        }
      }
      v21 = v10;
      v22 = v21;
      if (v21 == v14)
        v7 = 1;
      else
        v7 = -[NSString isEqual:](v21, "isEqual:", v14);

LABEL_36:
      goto LABEL_37;
    }
    v7 = 0;
  }
LABEL_37:

  return v7;
}

- (_MPMediaLibraryArtworkVisualIdenticalityIdentifier)init
{
  return -[_MPMediaLibraryArtworkVisualIdenticalityIdentifier initWithArtworkType:availableArtworkToken:fetchableArtworkToken:](self, "initWithArtworkType:availableArtworkToken:fetchableArtworkToken:", 0, 0, 0);
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t artworkType;
  __CFString *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  artworkType = self->_artworkType;
  if (artworkType > 5)
    v8 = 0;
  else
    v8 = off_1E3161518[artworkType];
  objc_msgSend(v6, "appendFormat:", CFSTR("; artworkType = %@"), v8);
  if (self->_availableArtworkToken)
    objc_msgSend(v6, "appendFormat:", CFSTR("; availableArtworkToken = %@"), self->_availableArtworkToken);
  if (self->_fetchableArtworkToken)
    objc_msgSend(v6, "appendFormat:", CFSTR("; fetchableArtworkToken = %@"), self->_fetchableArtworkToken);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

@end
