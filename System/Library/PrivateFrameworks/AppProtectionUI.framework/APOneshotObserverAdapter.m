@implementation APOneshotObserverAdapter

- (APOneshotObserverAdapter)initWithController:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  APOneshotObserverAdapter *v9;
  APOneshotObserverAdapter *v10;
  APOneshotObserverAdapter *v11;
  uint64_t v12;
  id completion;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  APOneshotObserverAdapter *v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APOneshotObserverAdapter;
  v9 = -[APOneshotObserverAdapter init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    v21[4] = __Block_byref_object_dispose_;
    v11 = v10;
    v22 = v11;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __65__APOneshotObserverAdapter_initWithController_completionHandler___block_invoke;
    v18 = &unk_25079FDD0;
    v19 = v8;
    v20 = v21;
    v12 = objc_msgSend(&v15, "copy");
    completion = v11->_completion;
    v11->_completion = (id)v12;

    objc_msgSend(v7, "registerObserver:", v11, v15, v16, v17, v18);
    _Block_object_dispose(v21, 8);

  }
  return v10;
}

void __65__APOneshotObserverAdapter_initWithController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)kickoff
{
  -[APEnablementController beginFlow](self->_controller, "beginFlow");
}

- (void)enablementController:(id)a3 didCompleteWithError:(id)a4
{
  (*((void (**)(id, BOOL, id))self->_completion + 2))(self->_completion, a4 == 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
