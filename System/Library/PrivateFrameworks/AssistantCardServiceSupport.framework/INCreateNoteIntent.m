@implementation INCreateNoteIntent

void __69__INCreateNoteIntent_ACSCardRequesting___buildCardFromRequest_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD9EF8];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("createdNote.contents[%zd]"), a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterForClass:keyPath:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v6);

}

@end
