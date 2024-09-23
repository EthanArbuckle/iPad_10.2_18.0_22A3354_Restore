@implementation FIUIUserHasExistingSampleOfTypesPassingFilter

uint64_t __FIUIUserHasExistingSampleOfTypesPassingFilter_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD3E98], "queryDescriptorWithSampleType:", a2);
}

void __FIUIUserHasExistingSampleOfTypesPassingFilter_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  objc_msgSend(a3, "hk_filter:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "count");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
