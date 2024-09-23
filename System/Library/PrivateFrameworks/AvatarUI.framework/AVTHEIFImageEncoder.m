@implementation AVTHEIFImageEncoder

+ (id)HEICSSequenceEncoder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initUsingHeicsSequence:", 1);
}

+ (id)defaultHEICEncoder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initUsingHeicsSequence:", 0);
}

- (id)initUsingHeicsSequence:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTHEIFImageEncoder;
  result = -[AVTHEIFImageEncoder init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfURL:options:error:", v7, 1, a4);

  if (v8)
  {
    -[AVTHEIFImageEncoder imageFromData:error:](self, "imageFromData:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[AVTHEIFImageEncoder useHEICSSequence](self, "useHEICSSequence"))
    objc_msgSend(MEMORY[0x1E0CEA638], "animatedImageWithHEICSRepresentation:", v6);
  else
    objc_msgSend(MEMORY[0x1E0CEA638], "animatedImageWithHEICRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v7)
  {
    objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 604, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)dataFromImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[AVTHEIFImageEncoder useHEICSSequence](self, "useHEICSSequence"))
    objc_msgSend(v4, "HEICSRepresentation");
  else
    objc_msgSend(v4, "HEICRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fileExtension
{
  if (-[AVTHEIFImageEncoder useHEICSSequence](self, "useHEICSSequence"))
    return CFSTR("heics");
  else
    return CFSTR("heic");
}

- (BOOL)useHEICSSequence
{
  return self->_useHEICSSequence;
}

@end
