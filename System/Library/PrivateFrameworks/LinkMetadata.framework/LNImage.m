@implementation LNImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inImage, 0);
}

- (LNImage)initWithSystemImageNamed:(id)a3
{
  void *v4;
  LNImage *v5;

  objc_msgSend(MEMORY[0x1E0CBD958], "systemImageNamed:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", v4, 0);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (LNImage)initWithINImage:(id)a3 displayStyle:(unint64_t)a4
{
  id v8;
  LNImage *v9;
  LNImage *v10;
  LNImage *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNImage.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inImage"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNImage;
  v9 = -[LNImage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inImage, a3);
    v10->_displayStyle = a4;
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNImage inImage](self, "inImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("inImage"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNImage displayStyle](self, "displayStyle"), CFSTR("displayStyle"));
}

- (INImage)inImage
{
  return self->_inImage;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (LNImage)initWithImageNamed:(id)a3
{
  return -[LNImage initWithImageNamed:renderingMode:](self, "initWithImageNamed:renderingMode:", a3, 0);
}

- (LNImage)initWithImageNamed:(id)a3 renderingMode:(unint64_t)a4
{
  return -[LNImage initWithImageNamed:renderingMode:displayStyle:](self, "initWithImageNamed:renderingMode:displayStyle:", a3, a4, 0);
}

- (LNImage)initWithImageNamed:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  LNImage *v11;

  objc_msgSend(MEMORY[0x1E0CBD958], "imageNamed:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (a4 == 1)
      v10 = 1;
    else
      v10 = 2 * (a4 == 2);
    objc_msgSend(v8, "_setRenderingMode:", v10);
    self = -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", v9, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNImage)initWithData:(id)a3 renderingMode:(unint64_t)a4
{
  return -[LNImage initWithData:renderingMode:displayStyle:](self, "initWithData:renderingMode:displayStyle:", a3, a4, 0);
}

- (LNImage)initWithData:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  LNImage *v11;

  objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (a4 == 1)
      v10 = 1;
    else
      v10 = 2 * (a4 == 2);
    objc_msgSend(v8, "_setRenderingMode:", v10);
    self = -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", v9, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNImage)initWithURL:(id)a3 renderingMode:(unint64_t)a4
{
  return -[LNImage initWithURL:renderingMode:displayStyle:](self, "initWithURL:renderingMode:displayStyle:", a3, a4, self->_displayStyle);
}

- (LNImage)initWithURL:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  LNImage *v11;

  objc_msgSend(MEMORY[0x1E0CBD958], "imageWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (a4 == 1)
      v10 = 1;
    else
      v10 = 2 * (a4 == 2);
    objc_msgSend(v8, "_setRenderingMode:", v10);
    self = -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", v9, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNImage)initWithURL:(id)a3 width:(double)a4 height:(double)a5 renderingMode:(unint64_t)a6
{
  return -[LNImage initWithURL:width:height:renderingMode:displayStyle:](self, "initWithURL:width:height:renderingMode:displayStyle:", a3, a6, 0, a4, a5);
}

- (LNImage)initWithURL:(id)a3 width:(double)a4 height:(double)a5 renderingMode:(unint64_t)a6 displayStyle:(unint64_t)a7
{
  void *v10;
  void *v11;
  uint64_t v12;
  LNImage *v13;

  objc_msgSend(MEMORY[0x1E0CBD958], "imageWithURL:width:height:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (a6 == 1)
      v12 = 1;
    else
      v12 = 2 * (a6 == 2);
    objc_msgSend(v10, "_setRenderingMode:", v12);
    self = -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", v11, a7);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (LNImage)initWithINImage:(id)a3
{
  return -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", a3, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNImage inImage](self, "inImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, inImage: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  LNImage *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStyle"));
    if (v6 <= 1)
      v7 = v6;
    else
      v7 = 0;
    self = -[LNImage initWithINImage:displayStyle:](self, "initWithINImage:displayStyle:", v5, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNImage)proxiedImageCopy
{
  dispatch_semaphore_t v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  -[LNImage inImage](self, "inImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler();

  v5 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v8, v5);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (LNImage *)v6;
}

- (BOOL)isEqual:(id)a3
{
  LNImage *v4;
  LNImage *v5;
  LNImage *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  unint64_t v14;

  v4 = (LNImage *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[LNImage inImage](self, "inImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNImage inImage](v6, "inImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        v13 = 0;
        goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_14;
    }
    v14 = -[LNImage displayStyle](self, "displayStyle");
    v13 = v14 == -[LNImage displayStyle](v6, "displayStyle");
LABEL_15:

    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[LNImage inImage](self, "inImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNImage displayStyle](self, "displayStyle") ^ v4;

  return v5;
}

intptr_t __27__LNImage_proxiedImageCopy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  LNImage *v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    v3 = a2;
    v4 = -[LNImage initWithINImage:displayStyle:]([LNImage alloc], "initWithINImage:displayStyle:", v3, objc_msgSend(*(id *)(a1 + 32), "displayStyle"));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __27__LNImage_proxiedImageCopy__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  v3 = a2;
  objc_msgSend(v2, "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBundleIdentifier:", v5);

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
