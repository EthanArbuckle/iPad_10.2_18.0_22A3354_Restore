@implementation _MXExtensionVendorContext

- (void)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[_MXExtensionVendorContext _principalObject](self, "_principalObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MXExtensionVendorContext _errorForVendor:requestDispatcher:](self, "_errorForVendor:requestDispatcher:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v9[2](v9, 0, v11);
  else
    objc_msgSend(v8, "dispatchRequest:vendor:completion:", v12, v10, v9);

}

- (void)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[_MXExtensionVendorContext _principalObject](self, "_principalObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MXExtensionVendorContext _errorForVendor:requestDispatcher:](self, "_errorForVendor:requestDispatcher:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "receiveUpdatedResponse:error:", 0, v11);
  }
  else
  {
    objc_storeStrong((id *)&self->_observer, a5);
    objc_msgSend(v8, "startSendingUpdatesForRequest:vendor:toObserver:", v12, v10, v9);
  }

}

- (void)stopSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _MXExtensionResponseObserver *observer;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_observer)
  {
    -[_MXExtensionVendorContext _principalObject](self, "_principalObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MXExtensionVendorContext _errorForVendor:requestDispatcher:](self, "_errorForVendor:requestDispatcher:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    observer = self->_observer;
    if (v8)
    {
      -[_MXExtensionResponseObserver receiveUpdatedResponse:error:](observer, "receiveUpdatedResponse:error:", 0, v8);
    }
    else
    {
      self->_observer = 0;

      objc_msgSend(v6, "stopSendingUpdatesForRequest:vendor:", v10, v7);
    }

  }
}

- (id)_errorForVendor:(id)a3 requestDispatcher:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 11;
LABEL_12:
    objc_msgSend(v10, "_errorWithExtensionServiceError:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 12;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 13;
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "serviceProtocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend(v5, "conformsToProtocol:", v8) & 1) != 0)
      {

        goto LABEL_8;
      }
      v13 = 7;
    }
    else
    {
      v13 = 14;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_8:
  v9 = 0;
LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
