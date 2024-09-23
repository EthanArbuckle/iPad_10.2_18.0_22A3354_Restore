@implementation SUUIMediaSocialSaveProfilePhotoOperation

- (SUUIMediaSocialSaveProfilePhotoOperation)initWithClientContext:(id)a3
{
  id v5;
  SUUIMediaSocialSaveProfilePhotoOperation *v6;
  SUUIMediaSocialSaveProfilePhotoOperation *v7;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaSocialSaveProfilePhotoOperation;
  v6 = -[SSVOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v7->_lock;
    v7->_lock = v8;

    -[NSLock setName:](v7->_lock, "setName:", CFSTR("com.apple.MediaSocial.saveProfilePhoto"));
  }

  return v7;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setPhoto:(id)a3
{
  NSLock *lock;
  id v5;
  UIImage *v6;
  UIImage *photo;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  v6 = (UIImage *)objc_msgSend(v5, "copy");

  photo = self->_photo;
  self->_photo = v6;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id obj;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__46;
  v24 = __Block_byref_object_dispose__46;
  v25 = 0;
  obj = 0;
  -[SUUIMediaSocialSaveProfilePhotoOperation _requestWithError:](self, "_requestWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v25, obj);
  if (v3)
  {
    v4 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v3);
    objc_msgSend(MEMORY[0x24BEB20B8], "consumer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDataConsumer:", v5);

    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__46;
    v17 = __Block_byref_object_dispose__46;
    v18 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__SUUIMediaSocialSaveProfilePhotoOperation_main__block_invoke;
    v12[3] = &unk_2511F6F18;
    v12[4] = &v13;
    v12[5] = &v20;
    objc_msgSend(v4, "setOutputBlock:", v12);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v4);
    if (v21[5])
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "URLResponse");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "statusCode") < 200 || objc_msgSend(v7, "statusCode") > 299)
      {
        if (objc_msgSend(v7, "statusCode") == 403)
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 3, 0);
        else
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 0, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v21[5];
        v21[5] = v8;

        v6 = 0;
      }
      else
      {
        -[SUUIMediaSocialSaveProfilePhotoOperation _photoUploadWithResponseDictionary:](self, "_photoUploadWithResponseDictionary:", v14[5]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v6 = 0;
  }
  -[SUUIMediaSocialSaveProfilePhotoOperation outputBlock](self, "outputBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v6, v21[5]);

  _Block_object_dispose(&v20, 8);
}

void __48__SUUIMediaSocialSaveProfilePhotoOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
LABEL_5:
    v8 = v7;
    v9 = *v6;
    *v6 = v8;

    goto LABEL_6;
  }
  if (v5)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_photoUploadWithResponseDictionary:(id)a3
{
  id v3;
  SUUIMediaSocialPhotoUpload *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[SUUIMediaSocialPhotoUpload initWithUploadDictionary:]([SUUIMediaSocialPhotoUpload alloc], "initWithUploadDictionary:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_requestWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:error:", CFSTR("directUploaderRichPostImage"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      SSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = 0;
      *a3 = v13;
      goto LABEL_10;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!self->_photo)
  {
    if (a3)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 4, 0);
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v7);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("image/jpeg"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("jpg"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v11, CFSTR("X-Original-Filename"));
  UIImageJPEGRepresentation(self->_photo, 0.8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPBody:", v12);
  SSVAddMediaSocialHeadersToURLRequest();

LABEL_10:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
