@implementation NSSet

uint64_t __46__NSSet_ITK__itk_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
}

uint64_t __33__NSSet_ITK__itk_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __29__NSSet_ITK__itk_compactMap___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itk_addNonNilObject:", v2);

}

void __22__NSSet_ITK__itk_map___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

@end
