@implementation WKAirPlayRoutePicker

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_actionSheet.m_ptr, "dismissViewControllerAnimated:completion:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)WKAirPlayRoutePicker;
  -[WKAirPlayRoutePicker dealloc](&v3, sel_dealloc);
}

- (void)showFromView:(id)a3 routeSharingPolicy:(unsigned __int8)a4 routingContextUID:(id)a5 hasVideo:(BOOL)a6
{
  _BOOL8 v6;
  unsigned int v8;
  void *v11;
  void *v12;
  void *m_ptr;
  CFTypeRef v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  void *v21;
  CFTypeRef cf;

  if (!self->_actionSheet.m_ptr)
  {
    v6 = a6;
    v8 = a4;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3812000000;
    v19 = __Block_byref_object_copy__7;
    v20 = __Block_byref_object_dispose__7;
    v21 = &unk_197A0BBD2;
    cf = (CFTypeRef)objc_msgSend(objc_alloc((Class)off_1EE33FC18()), "initWithName:", CFSTR("WebKit - HTML media element showing AirPlay route picker"));
    objc_msgSend((id)v17[6], "setDiscoveryMode:", 3);
    if (objc_msgSend((id)_MergedGlobals_247(), "instancesRespondToSelector:", sel_setSortByIsVideoRoute_))
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)_MergedGlobals_247()), "init");
      objc_msgSend(v11, "setSortByIsVideoRoute:", v6);
    }
    else
    {
      v11 = 0;
    }
    v12 = (void *)objc_msgSend(objc_alloc((Class)off_1EE33FC20()), "initWithConfiguration:", v11);
    m_ptr = self->_actionSheet.m_ptr;
    self->_actionSheet.m_ptr = v12;
    if (m_ptr)
      CFRelease(m_ptr);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_actionSheet.m_ptr, "setOverrideRouteSharingPolicy:routingContextUID:", v8, a5);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__WKAirPlayRoutePicker_showFromView_routeSharingPolicy_routingContextUID_hasVideo___block_invoke;
    v15[3] = &unk_1E34CE478;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(self->_actionSheet.m_ptr, "setDidDismissHandler:", v15);
    objc_msgSend((id)objc_msgSend(a3, "_wk_viewControllerForFullScreenPresentation"), "presentViewController:animated:completion:", self->_actionSheet.m_ptr, 1, 0);
    if (v11)
      CFRelease(v11);
    _Block_object_dispose(&v16, 8);
    v14 = cf;
    cf = 0;
    if (v14)
      CFRelease(v14);
  }
}

void __83__WKAirPlayRoutePicker_showFromView_routeSharingPolicy_routingContextUID_hasVideo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  const void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), "setDiscoveryMode:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(const void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(const void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;
  if (v5)
    CFRelease(v5);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_actionSheet.m_ptr;
  self->_actionSheet.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
