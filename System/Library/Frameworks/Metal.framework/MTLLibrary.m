@implementation MTLLibrary

uint64_t __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (**(_QWORD **)(*(_QWORD *)(a1 + 32) + 48) && (objc_msgSend(*(id *)(a1 + 40), "options") & 0x10) == 0)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(uint64_t **)(v5 + 48);
    if ((void *)v4 == a2)
      MTLPipelineCollection::addFunction(*v6, (uint64_t)a2, *(_QWORD *)(v5 + 32), objc_msgSend(*(id *)(a1 + 40), "options"));
    else
      MTLPipelineCollection::addSpecializedFunction(*v6, v4, (uint64_t)a2, v5, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(a2, "setOptions:", objc_msgSend(*(id *)(a1 + 40), "options"));
  if ((objc_msgSend(*(id *)(a1 + 40), "options") & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "device");
  v9 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke_2;
  v11[3] = &unk_1E0FE42B0;
  v10 = *(_QWORD *)(a1 + 56);
  v11[4] = a2;
  v11[5] = v10;
  return objc_msgSend(v8, "compileVisibleFunction:withDescriptor:completionHandler:", a2, v9, v11);
}

uint64_t __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
