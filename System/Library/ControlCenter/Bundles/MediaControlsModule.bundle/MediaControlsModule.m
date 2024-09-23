void sub_23100F4A4(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend_dismissModule(*(void **)(a1 + 32), v3, v4);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

uint64_t sub_23100F4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_requestExpandModule, a3);
}

uint64_t sub_23100F4F8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setHomeGestureDismissalAllowed_, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}


  id v30;
  _QWORD v31[4];
  id v32;

  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    objc_msgSend_contentModuleContext(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isNewControlsEnabled(MEMORY[0x24BE64300], v6, v7))
    {
      v8 = objc_alloc(MEMORY[0x24BE64308]);
      objc_msgSend_sharedManager(MEMORY[0x24BE64318], v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (MRUMediaControlsModuleRootViewController *)objc_msgSend_initWithManager_(v8, v12, (uint64_t)v11);
      v14 = self->_contentViewController;
      self->_contentViewController = v13;

    }
    else
    {
      v15 = (MRUMediaControlsModuleRootViewController *)objc_alloc_init(MEMORY[0x24BE642F8]);
      v11 = self->_contentViewController;
      self->_contentViewController = v15;
    }

    v16 = self->_contentViewController;
    v17 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_23100F4A4;
    v31[3] = &unk_24FFDFC30;
    v18 = v5;
    v32 = v18;
    objc_msgSend_setDismissalBlock_(v16, v19, (uint64_t)v31);
    v20 = self->_contentViewController;
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = sub_23100F4F0;
    v29[3] = &unk_24FFDFC58;
    v21 = v18;
    v30 = v21;
    objc_msgSend_setRoutingCornerViewTappedBlock_(v20, v22, (uint64_t)v29);
    v23 = self->_contentViewController;
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = sub_23100F4F8;
    v27[3] = &unk_24FFDFC80;
    v28 = v21;
    v24 = v21;
    objc_msgSend_setHomeGestureDismissalAllowedBlock_(v23, v25, (uint64_t)v27);

    contentViewController = self->_contentViewController;
  }
  return contentViewController;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
