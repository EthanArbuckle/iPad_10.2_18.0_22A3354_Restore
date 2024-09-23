@implementation _IMNotificationObservationHelper

- (_IMNotificationObservationHelper)initWithObserver:(id)a3 name:(id)a4 object:(id)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _IMNotificationObservationHelper *v15;
  _IMNotificationObservationHelper *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id block;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *name;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)_IMNotificationObservationHelper;
  v15 = -[_IMNotificationObservationHelper init](&v33, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_observer, a3);
    v20 = objc_msgSend_copy(v14, v17, v18, v19);
    block = v16->_block;
    v16->_block = (id)v20;

    v25 = objc_msgSend_copy(v12, v22, v23, v24);
    name = v16->_name;
    v16->_name = (NSString *)v25;

    objc_storeStrong(&v16->_object, a5);
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v30, v31, (uint64_t)v16, (uint64_t)sel__notification_, v12, v13);

  }
  return v16;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  objc_super v7;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, (uint64_t)self->_name, self->_object);

  v7.receiver = self;
  v7.super_class = (Class)_IMNotificationObservationHelper;
  -[_IMNotificationObservationHelper dealloc](&v7, sel_dealloc);
}

- (void)_notification:(id)a3
{
  (*((void (**)(id, id, id))self->_block + 2))(self->_block, self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_observer, 0);
}

@end
