@implementation GKExtensionProtocolSecureCodedClasses

void __GKExtensionProtocolSecureCodedClasses_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 20);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v2);
  v1 = (void *)GKExtensionProtocolSecureCodedClasses__extractorClasses;
  GKExtensionProtocolSecureCodedClasses__extractorClasses = v0;

}

@end
