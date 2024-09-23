@implementation BPSMerged

uint64_t __40___BPSMerged_receiveCompletion_atIndex___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "receiveCompletion:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
}

uint64_t __40___BPSMerged_receiveCompletion_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  +[BPSCompletion success](BPSCompletion, "success");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receiveCompletion:", v3);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
}

uint64_t __35___BPSMerged_receiveInput_atIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "receiveInput:", *(_QWORD *)(a1 + 32)));
}

uint64_t __35___BPSMerged_receiveInput_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "receiveInput:", *(_QWORD *)(a1 + 32)));
}

uint64_t __28___BPSMerged_requestDemand___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "receiveInput:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
}

uint64_t __28___BPSMerged_requestDemand___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  +[BPSCompletion success](BPSCompletion, "success");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receiveCompletion:", v3);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
}

uint64_t __28___BPSMerged_requestDemand___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "receiveInput:", *(_QWORD *)(a1 + 32)));
}

uint64_t __28___BPSMerged_requestDemand___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  +[BPSCompletion success](BPSCompletion, "success");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receiveCompletion:", v3);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
}

@end
