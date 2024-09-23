@implementation MPPlaybackArchiveDisplayProperties

- (NSURL)artworkImageURL
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_storage, "objectForKey:", CFSTR("artworkImageURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (MPPlaybackArchiveDisplayProperties)initWithBlock:(id)a3
{
  void (**v4)(id, MPPlaybackArchiveDisplayProperties *);
  MPPlaybackArchiveDisplayProperties *v5;
  uint64_t v6;
  NSMutableDictionary *storage;
  objc_super v9;

  v4 = (void (**)(id, MPPlaybackArchiveDisplayProperties *))a3;
  v9.receiver = self;
  v9.super_class = (Class)MPPlaybackArchiveDisplayProperties;
  v5 = -[MPPlaybackArchiveDisplayProperties init](&v9, sel_init);
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

- (MPPlaybackArchiveDisplayProperties)initWithTitle:(id)a3 subtitle:(id)a4 artworkImageData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  MPPlaybackArchiveDisplayProperties *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__MPPlaybackArchiveDisplayProperties_initWithTitle_subtitle_artworkImageData___block_invoke;
  v16[3] = &unk_1E31620F8;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = -[MPPlaybackArchiveDisplayProperties initWithBlock:](self, "initWithBlock:", v16);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPPlaybackArchiveDisplayProperties copyWithOptions:](self, "copyWithOptions:", 0);
}

- (id)copyWithOptions:(unint64_t)a3
{
  MPPlaybackArchiveDisplayProperties *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[6];

  v5 = [MPPlaybackArchiveDisplayProperties alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__MPPlaybackArchiveDisplayProperties_copyWithOptions___block_invoke;
  v11[3] = &unk_1E3162120;
  v11[4] = self;
  v11[5] = a3;
  v6 = -[MPPlaybackArchiveDisplayProperties initWithBlock:](v5, "initWithBlock:", v11);
  -[MPPlaybackArchiveDisplayProperties storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = v6[5];
  v6[5] = (id)v8;

  if ((a3 & 0x10) != 0)
    objc_msgSend(v6[5], "removeObjectForKey:", CFSTR("artworkImageURL"));
  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPPlaybackArchiveDisplayProperties title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchiveDisplayProperties subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchiveDisplayProperties artworkImageData](self, "artworkImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchiveDisplayProperties artworkImageURL](self, "artworkImageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaybackArchiveDisplayProperties storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title=%@ subtitle=%@ artworkImageData=%@ artworkImageURL=%@ storage=%@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  MPPlaybackArchiveDisplayProperties *v4;
  MPPlaybackArchiveDisplayProperties *v5;
  NSString *title;
  NSString *v7;
  int v8;
  char v9;
  NSString *subtitle;
  NSString *v11;
  int v12;
  NSData *artworkImageData;
  NSData *v14;
  int v15;
  NSMutableDictionary *storage;
  NSMutableDictionary *v17;

  v4 = (MPPlaybackArchiveDisplayProperties *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      -[MPPlaybackArchiveDisplayProperties title](v5, "title");
      v7 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (title == v7)
      {

      }
      else
      {
        v8 = -[NSString isEqual:](title, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      subtitle = self->_subtitle;
      -[MPPlaybackArchiveDisplayProperties subtitle](v5, "subtitle");
      v11 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (subtitle == v11)
      {

      }
      else
      {
        v12 = -[NSString isEqual:](subtitle, "isEqual:", v11);

        if (!v12)
        {
          v9 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      artworkImageData = self->_artworkImageData;
      -[MPPlaybackArchiveDisplayProperties artworkImageData](v5, "artworkImageData");
      v14 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
      if (artworkImageData == v14)
      {

      }
      else
      {
        v15 = -[NSData isEqual:](artworkImageData, "isEqual:", v14);

        if (!v15)
        {
          v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      storage = self->_storage;
      -[MPPlaybackArchiveDisplayProperties storage](v5, "storage");
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (storage == v17)
        v9 = 1;
      else
        v9 = -[NSMutableDictionary isEqual:](storage, "isEqual:", v17);

      goto LABEL_21;
    }
    v9 = 0;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  NSData *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v3 = MSVHasherSharedSeed();
  v47 = v3 ^ 0x736F6D6570736575;
  v49 = v4 ^ 0x646F72616E646F6DLL;
  v51 = v3 ^ 0x6C7967656E657261;
  v53 = v4 ^ 0x7465646279746573;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  objc_msgSend(v6, "length");

  v7 = objc_retainAutorelease(self->_title);
  -[NSString UTF8String](v7, "UTF8String");
  -[NSString length](v7, "length");

  v8 = objc_retainAutorelease(self->_subtitle);
  -[NSString UTF8String](v8, "UTF8String");
  -[NSString length](v8, "length");

  v9 = objc_retainAutorelease(self->_artworkImageData);
  -[NSData bytes](v9, "bytes");
  -[NSData length](v9, "length");

  v10 = self->_storage;
  v11 = -[NSMutableDictionary hash](v10, "hash");
  v12 = (v47 + v49) ^ __ROR8__(v49, 51);
  v13 = v51 + (v53 ^ v11);
  v14 = __ROR8__(v53 ^ v11, 48);
  v15 = (v13 ^ v14) + __ROR8__(v47 + v49, 32);
  v16 = v15 ^ __ROR8__(v13 ^ v14, 43);
  v17 = v13 + v12;
  v52 = __ROR8__(v17, 32);
  v54 = v16;
  v48 = v15 ^ v11;
  v50 = v17 ^ __ROR8__(v12, 47);

  v18 = (v48 + v50) ^ __ROR8__(v50, 51);
  v19 = v52 + (v54 ^ 0x800000000000000);
  v20 = __ROR8__(v54 ^ 0x800000000000000, 48);
  v21 = (v19 ^ v20) + __ROR8__(v48 + v50, 32);
  v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  v23 = v19 + v18;
  v24 = v23 ^ __ROR8__(v18, 47);
  v25 = (v21 ^ 0x800000000000000) + v24;
  v26 = v25 ^ __ROR8__(v24, 51);
  v27 = (__ROR8__(v23, 32) ^ 0xFFLL) + v22;
  v28 = __ROR8__(v22, 48);
  v29 = __ROR8__(v25, 32) + (v27 ^ v28);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v26 + v27;
  v32 = v31 ^ __ROR8__(v26, 47);
  v33 = v32 + v29;
  v34 = v33 ^ __ROR8__(v32, 51);
  v35 = __ROR8__(v31, 32) + v30;
  v36 = __ROR8__(v30, 48);
  v37 = __ROR8__(v33, 32) + (v35 ^ v36);
  v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  v39 = v34 + v35;
  v40 = v39 ^ __ROR8__(v34, 47);
  v41 = v40 + v37;
  v42 = v41 ^ __ROR8__(v40, 51);
  v43 = __ROR8__(v39, 32) + v38;
  v44 = __ROR8__(v38, 48);
  v45 = __ROR8__(v41, 32) + (v43 ^ v44);
  return (v42 + v43) ^ __ROR8__(v42, 47) ^ v45 ^ __ROR8__(v42 + v43, 32) ^ v45 ^ __ROR8__(v43 ^ v44, 43);
}

- (MPPlaybackArchiveDisplayProperties)initWithCoder:(id)a3
{
  id v4;
  MPPlaybackArchiveDisplayProperties *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSData *artworkImageData;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *storage;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPPlaybackArchiveDisplayProperties;
  v5 = -[MPPlaybackArchiveDisplayProperties init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkImageData"));
    v10 = objc_claimAutoreleasedReturnValue();
    artworkImageData = v5->_artworkImageData;
    v5->_artworkImageData = (NSData *)v10;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("storage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    storage = v5->_storage;
    v5->_storage = v15;

    v5->_final = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkImageData, CFSTR("artworkImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storage, CFSTR("storage"));

}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *title;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchiveDisplayProperties.m"), 140, CFSTR("Attempt to mutate after finalization."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  title = self->_title;
  self->_title = v6;

}

- (void)setSubtitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *subtitle;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchiveDisplayProperties.m"), 145, CFSTR("Attempt to mutate after finalization."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v6;

}

- (void)setArtworkImageData:(id)a3
{
  id v5;
  NSData *v6;
  NSData *artworkImageData;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchiveDisplayProperties.m"), 150, CFSTR("Attempt to mutate after finalization."));

    v5 = v9;
  }
  v6 = (NSData *)objc_msgSend(v5, "copy");
  artworkImageData = self->_artworkImageData;
  self->_artworkImageData = v6;

}

- (void)setArtworkImageURL:(id)a3
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackArchiveDisplayProperties.m"), 155, CFSTR("Attempt to mutate after finalization."));

    v5 = v8;
  }
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v6, CFSTR("artworkImageURL"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSData)artworkImageData
{
  return self->_artworkImageData;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_artworkImageData, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __54__MPPlaybackArchiveDisplayProperties_copyWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 4) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v4);

    objc_msgSend(*(id *)(a1 + 32), "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v5);

    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 8) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "artworkImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setArtworkImageData:", v6);

  }
}

void __78__MPPlaybackArchiveDisplayProperties_initWithTitle_subtitle_artworkImageData___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle:", a1[5]);
  objc_msgSend(v4, "setArtworkImageData:", a1[6]);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
