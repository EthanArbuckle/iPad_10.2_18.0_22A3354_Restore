@implementation DOCVolumeThumbnailRequest

- (DOCVolumeThumbnailRequest)initWithDescriptor:(id)a3
{
  id v6;
  DOCVolumeThumbnailRequest *v7;
  DOCVolumeThumbnailRequest *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

  }
  v11.receiver = self;
  v11.super_class = (Class)DOCVolumeThumbnailRequest;
  v7 = -[DOCVolumeThumbnailRequest init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_descriptor, a3);

  return v8;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  objc_class *v4;
  void (**v5)(id, void *, _QWORD);
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x24BE51A90];
  v5 = (void (**)(id, void *, _QWORD))a3;
  v17 = (id)objc_msgSend([v4 alloc], "initWithType:", CFSTR("com.apple.storage-removable"));
  v6 = objc_alloc(MEMORY[0x24BE51AB0]);
  -[DOCThumbnailDescriptor size](self->_descriptor, "size");
  v8 = v7;
  v10 = v9;
  -[DOCThumbnailDescriptor scale](self->_descriptor, "scale");
  v12 = (void *)objc_msgSend(v6, "initWithSize:scale:", v8, v10, v11);
  objc_msgSend(v17, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDF6AC8];
  v15 = objc_msgSend(v13, "CGImage");
  -[DOCThumbnailDescriptor scale](self->_descriptor, "scale");
  objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v16, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
