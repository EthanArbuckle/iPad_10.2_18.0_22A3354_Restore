@implementation MRRemoteArtwork

- (MRRemoteArtwork)initWithArtworkURLString:(id)a3 templateData:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  MRRemoteArtwork *v9;
  uint64_t v10;
  NSString *artworkURLString;
  uint64_t v12;
  NSData *artworkURLTemplateData;
  void *v15;
  objc_super v16;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (!(v7 | v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRRemoteArtwork.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artworkURLString != nil || templateData != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)MRRemoteArtwork;
  v9 = -[MRRemoteArtwork init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend((id)v7, "copy");
    artworkURLString = v9->_artworkURLString;
    v9->_artworkURLString = (NSString *)v10;

    v12 = objc_msgSend((id)v8, "copy");
    artworkURLTemplateData = v9->_artworkURLTemplateData;
    v9->_artworkURLTemplateData = (NSData *)v12;

  }
  return v9;
}

- (MRRemoteArtwork)initWithCoder:(id)a3
{
  id v4;
  MRRemoteArtwork *v5;
  uint64_t v6;
  NSString *artworkURLString;
  uint64_t v8;
  NSData *artworkURLTemplateData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRRemoteArtwork;
  v5 = -[MRRemoteArtwork init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkURLString"));
    v6 = objc_claimAutoreleasedReturnValue();
    artworkURLString = v5->_artworkURLString;
    v5->_artworkURLString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkURLTemplateData"));
    v8 = objc_claimAutoreleasedReturnValue();
    artworkURLTemplateData = v5->_artworkURLTemplateData;
    v5->_artworkURLTemplateData = (NSData *)v8;

  }
  return v5;
}

- (MRRemoteArtwork)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  MRRemoteArtwork *v6;
  void *v7;
  void *v8;
  MRRemoteArtwork *v9;

  v4 = a3;
  objc_msgSend(v4, "artworkURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    objc_msgSend(v4, "artworkURLString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworkURLTemplateData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MRRemoteArtwork initWithArtworkURLString:templateData:](self, "initWithArtworkURLString:templateData:", v7, v8);

    self = v9;
    v6 = self;
    goto LABEL_5;
  }
  objc_msgSend(v4, "artworkURLTemplateData");
  v6 = (MRRemoteArtwork *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
LABEL_5:

  return v6;
}

- (MRRemoteArtwork)initWithProtobufData:(id)a3
{
  id v4;
  _MRRemoteArtworkProtobuf *v5;
  MRRemoteArtwork *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRRemoteArtworkProtobuf initWithData:]([_MRRemoteArtworkProtobuf alloc], "initWithData:", v4);

    self = -[MRRemoteArtwork initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)protobufData
{
  _MRRemoteArtworkProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(_MRRemoteArtworkProtobuf);
  -[MRRemoteArtwork artworkURLString](self, "artworkURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRemoteArtworkProtobuf setArtworkURLString:](v3, "setArtworkURLString:", v4);

  -[MRRemoteArtwork artworkURLTemplateData](self, "artworkURLTemplateData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRemoteArtworkProtobuf setArtworkURLTemplateData:](v3, "setArtworkURLTemplateData:", v5);

  -[_MRRemoteArtworkProtobuf data](v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MRRemoteArtwork artworkURLString](self, "artworkURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("artworkURLString"));

  -[MRRemoteArtwork artworkURLTemplateData](self, "artworkURLTemplateData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("artworkURLTemplateData"));

}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRRemoteArtwork artworkURLString](self, "artworkURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRemoteArtwork artworkURLTemplateData](self, "artworkURLTemplateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: url=%@, templates=%@"), v4, v5, v6);

  return v7;
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (NSData)artworkURLTemplateData
{
  return self->_artworkURLTemplateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURLTemplateData, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
}

@end
