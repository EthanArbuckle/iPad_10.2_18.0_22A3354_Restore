@implementation HMFActivity

void __49__HMFActivity_HMMTaggedLogging__tagProcessorList__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  HMMTagSessionProcessorList *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_associatedObjectForKey:", CFSTR("HMMTagSessionProcessors"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = [HMMTagSessionProcessorList alloc];
    +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMMTagSessionProcessorList initWithWorkQueue:](v5, "initWithWorkQueue:", v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 32), "_setAssociatedObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("HMMTagSessionProcessors"));
  }
}

@end
