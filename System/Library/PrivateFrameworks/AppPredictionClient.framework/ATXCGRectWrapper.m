@implementation ATXCGRectWrapper

- (ATXCGRectWrapper)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  ATXCGRectWrapper *v10;
  NSObject *v11;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXCGRectWrapper initWithProto:].cold.1((uint64_t)self, v11);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = -[ATXPBCGRectWrapper x]((uint64_t)v5);
  v7 = -[ATXPBCGRectWrapper y]((uint64_t)v5);
  v8 = -[ATXPBCGRectWrapper width]((uint64_t)v5);
  v9 = -[ATXPBCGRectWrapper height]((uint64_t)v5);

  self = -[ATXCGRectWrapper initWithCGRect:](self, "initWithCGRect:", v6, v7, v8, v9);
  v10 = self;
LABEL_8:

  return v10;
}

- (ATXCGRectWrapper)initWithCGRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  ATXCGRectWrapper *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)ATXCGRectWrapper;
  result = -[ATXCGRectWrapper init](&v8, sel_init);
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
  }
  return result;
}

- (ATXCGRectWrapper)initWithProtoData:(id)a3
{
  id v4;
  ATXPBCGRectWrapper *v5;
  ATXCGRectWrapper *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBCGRectWrapper initWithData:]([ATXPBCGRectWrapper alloc], "initWithData:", v4);

    self = -[ATXCGRectWrapper initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_new();
  -[ATXCGRectWrapper rect](self, "rect");
  -[ATXPBCGRectWrapper setX:]((uint64_t)v3, v4);
  -[ATXCGRectWrapper rect](self, "rect");
  -[ATXPBCGRectWrapper setY:]((uint64_t)v3, v5);
  -[ATXCGRectWrapper rect](self, "rect");
  -[ATXPBCGRectWrapper setWidth:]((uint64_t)v3, v6);
  -[ATXCGRectWrapper rect](self, "rect");
  -[ATXPBCGRectWrapper setHeight:]((uint64_t)v3, v7);
  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXCGRectWrapper proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXCGRectWrapper encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXCGRectWrapper)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ATXCGRectWrapper *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("protobufData"), v5, 0, CFSTR("com.apple.ATXCGRectWrapper"), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXCGRectWrapper initWithProtoData:](self, "initWithProtoData:", v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXCGRectWrapper *v4;
  ATXCGRectWrapper *v5;
  BOOL v6;

  v4 = (ATXCGRectWrapper *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCGRectWrapper isEqualToATXCGRectWrapper:](self, "isEqualToATXCGRectWrapper:", v5);

  return v6;
}

- (BOOL)isEqualToATXCGRectWrapper:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v9;

  objc_msgSend(a3, "rect");
  v9.origin.x = v4;
  v9.origin.y = v5;
  v9.size.width = v6;
  v9.size.height = v7;
  return CGRectEqualToRect(self->_rect, v9);
}

- (unint64_t)hash
{
  double x;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double y;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double width;
  double v22;
  long double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double height;
  double v31;
  long double v32;
  double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  x = self->_rect.origin.x;
  v4 = -x;
  if (x >= 0.0)
    v4 = self->_rect.origin.x;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  y = self->_rect.origin.y;
  v13 = -y;
  if (y >= 0.0)
    v13 = self->_rect.origin.y;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = fmod(v14, 1.84467441e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  width = self->_rect.size.width;
  v22 = -width;
  if (width >= 0.0)
    v22 = self->_rect.size.width;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = fmod(v23, 1.84467441e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabs(v24);
  if (v24 < 0.0)
    v29 = v28;
  else
    v29 = v27;
  height = self->_rect.size.height;
  v31 = -height;
  if (height >= 0.0)
    v31 = self->_rect.size.height;
  v32 = floor(v31 + 0.5);
  v33 = (v31 - v32) * 1.84467441e19;
  v34 = fmod(v32, 1.84467441e19);
  v35 = 2654435761u * (unint64_t)v34;
  v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0)
    v36 = 2654435761u * (unint64_t)v34;
  v37 = v35 - (unint64_t)fabs(v33);
  if (v33 >= 0.0)
    v37 = v36;
  return v37
       - (v29
        - (v20
         - v11
         + 32 * v11)
        + 32 * (v20 - v11 + 32 * v11))
       + 32 * (v29 - (v20 - v11 + 32 * v11) + 32 * (v20 - v11 + 32 * v11));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x: %f, y: %f, width: %f, height: %f"), *(_QWORD *)&self->_rect.origin.x, *(_QWORD *)&self->_rect.origin.y, *(_QWORD *)&self->_rect.size.width, *(_QWORD *)&self->_rect.size.height);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBCGRectWrapper proto", (uint8_t *)&v5, 0xCu);

}

@end
