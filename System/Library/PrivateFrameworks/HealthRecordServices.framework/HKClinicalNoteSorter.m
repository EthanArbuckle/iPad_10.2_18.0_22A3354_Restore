@implementation HKClinicalNoteSorter

+ (int)sortOrderForType:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if ((id)*MEMORY[0x24BDF84E0] == v3)
  {
    v5 = 0;
  }
  else if ((id)*MEMORY[0x24BDF83F8] == v3)
  {
    v5 = 1;
  }
  else if ((id)*MEMORY[0x24BDF8558] == v3)
  {
    v5 = 2;
  }
  else if ((id)*MEMORY[0x24BDF8510] == v3)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF8410]))
  {
    v5 = 4;
  }
  else
  {
    v5 = 5;
  }

  return v5;
}

@end
