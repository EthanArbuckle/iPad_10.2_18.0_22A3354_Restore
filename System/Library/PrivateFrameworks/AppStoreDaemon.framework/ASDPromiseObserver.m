@implementation ASDPromiseObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_valueBlock, 0);
}

- (ASDPromiseObserver)initWithValueBlock:(id)a3 errorBlock:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDPromiseObserver *v11;
  uint64_t v12;
  id valueBlock;
  uint64_t v14;
  id errorBlock;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASDPromiseObserver;
  v11 = -[ASDPromiseObserver init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    valueBlock = v11->_valueBlock;
    v11->_valueBlock = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    errorBlock = v11->_errorBlock;
    v11->_errorBlock = (id)v14;

    objc_storeStrong((id *)&v11->_scheduler, a5);
  }

  return v11;
}

- (void)notifyResolvedWithValue:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__ASDPromiseObserver_notifyResolvedWithValue___block_invoke;
  v8[3] = &unk_1E37BDC98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(Property, "scheduleBlock:", v8);

}

uint64_t __46__ASDPromiseObserver_notifyResolvedWithValue___block_invoke(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  return (*((uint64_t (**)(id, _QWORD))Property + 2))(Property, *(_QWORD *)(a1 + 40));
}

- (void)notifyRejectedWithError:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__ASDPromiseObserver_notifyRejectedWithError___block_invoke;
  v8[3] = &unk_1E37BDC98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(Property, "scheduleBlock:", v8);

}

uint64_t __46__ASDPromiseObserver_notifyRejectedWithError___block_invoke(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 16, 1);
  return (*((uint64_t (**)(id, _QWORD))Property + 2))(Property, *(_QWORD *)(a1 + 40));
}

@end
