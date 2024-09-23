@implementation ASDTControlFactory

+ (id)controlForConfig:(id)a3 withDevice:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_msgSend(v5, "asdtSubclass");
  if (-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class())
    && (-[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_256456160) & 1) != 0)
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initWithConfig:withDevice:", v5, v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ASDTControlFactory controlForConfig:withDevice:].cold.1((uint64_t)v7);
    v8 = 0;
  }

  return v8;
}

+ (void)controlForConfig:(uint64_t)a1 withDevice:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid subclass of ASDControl: %@", (uint8_t *)&v1, 0xCu);
}

@end
