@implementation CPSLabelColorForAlertAction

id __CPSLabelColorForAlertAction_block_invoke(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  objc_storeStrong(location, 0);
  return v3;
}

id __CPSLabelColorForAlertAction_block_invoke_2(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  objc_storeStrong(location, 0);
  return v3;
}

@end
