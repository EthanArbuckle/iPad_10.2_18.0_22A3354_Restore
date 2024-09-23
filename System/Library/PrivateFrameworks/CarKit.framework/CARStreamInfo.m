@implementation CARStreamInfo

- (CARStreamInfo)initWithDictionary:(id)a3
{
  id v4;
  CARStreamInfo *v5;
  CARStreamInfo *v6;
  id v7;
  CARStreamInfo *v8;
  uint64_t v9;
  NSString *identifier;
  id v11;
  id v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CARStreamInfo;
  v5 = -[CARStreamInfo init](&v14, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  if (!CROriginFromAirPlayDictionary(v4, &v5->_origin.x))
    goto LABEL_16;
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = (CARStreamInfo *)v7;
  else
    v8 = 0;

  if (v8)
  {
    v9 = -[CARStreamInfo copy](v8, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v9;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("zIndex"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (v12)
    {
      v6->_zIndex = objc_msgSend(v12, "integerValue");

LABEL_14:
      v8 = v6;
      goto LABEL_17;
    }

LABEL_16:
    v8 = 0;
  }
LABEL_17:

  return v8;
}

- (CARStreamInfo)initWithStreamInfoDictionary:(id)a3
{
  id v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CARStreamInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CARStreamInfo;
  v5 = -[CARStreamInfo init](&v12, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("ScreenID"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v8 = objc_msgSend(v7, "copy");
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    *(_OWORD *)(v5 + 24) = *MEMORY[0x1E0C9D538];
    *((_QWORD *)v5 + 2) = 0;

  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CARStreamInfo;
  -[CARStreamInfo description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  BSStringFromCGPoint();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {identifier: %@, physicalSize: %@, pixelSize: %ld}"), v4, identifier, v6, self->_zIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
