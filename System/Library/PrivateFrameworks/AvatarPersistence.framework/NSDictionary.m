@implementation NSDictionary

void __41__NSDictionary_AvatarUI___avtui_deepCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copyWithZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

@end
