@implementation GCGenericPhysicalDevicePending

void __62___GCGenericPhysicalDevicePending_initWithHIDService_manager___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
}

void __76___GCGenericPhysicalDevicePending_setDriverConnection_invalidatingPrevious___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resultIfFinished");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = objc_opt_respondsToSelector();
    v3 = v6;
    if ((v2 & 1) != 0)
    {
      objc_msgSend(v6, "setDriverConnection:", *(_QWORD *)(a1 + 40));
LABEL_9:
      v3 = v6;
    }
  }
  else
  {
    v4 = *(void **)(a1 + 48);
    if (v4 && *(_BYTE *)(a1 + 56))
      objc_msgSend(v4, "invalidate");
    v5 = *(void **)(a1 + 40);
    v3 = 0;
    if (v5)
    {
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:](*(_QWORD *)(a1 + 32), v5);
      goto LABEL_9;
    }
  }

}

void __76___GCGenericPhysicalDevicePending_setFilterConnection_invalidatingPrevious___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resultIfFinished");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "setFilterConnection:", *(_QWORD *)(a1 + 40));
LABEL_7:
      v3 = v6;
    }
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    if (v5 && *(_BYTE *)(a1 + 56))
    {
      v6 = 0;
      objc_msgSend(v5, "invalidate");
      goto LABEL_7;
    }
  }

}

@end
