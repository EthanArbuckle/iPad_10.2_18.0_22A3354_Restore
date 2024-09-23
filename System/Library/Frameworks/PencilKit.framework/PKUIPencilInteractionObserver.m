@implementation PKUIPencilInteractionObserver

- (_QWORD)initWithPrefersPencilOnlyDrawsDidChangeHandler:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKUIPencilInteractionObserver;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

      objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", a1, CFSTR("prefersPencilOnlyDrawing"), 0, &kKVOContext_0);
    }
  }

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:context:", self, CFSTR("prefersPencilOnlyDrawing"), &kKVOContext_0);
  v3.receiver = self;
  v3.super_class = (Class)PKUIPencilInteractionObserver;
  -[PKUIPencilInteractionObserver dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if ((void *)kKVOContext_0 == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("prefersPencilOnlyDrawing")))
    {
      (*((void (**)(void))self->_prefersPencilOnlyDrawsDidChangeHandler + 2))();
    }
    else
    {
      v12 = os_log_create("com.apple.pencilkit", "PKUIPencilInteractionObserver");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v15 = v11;
        _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Received unknown keyPath: %{private}@", buf, 0xCu);
      }

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PKUIPencilInteractionObserver;
    -[PKUIPencilInteractionObserver observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prefersPencilOnlyDrawsDidChangeHandler, 0);
}

@end
