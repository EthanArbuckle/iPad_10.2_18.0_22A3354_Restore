@implementation ASTSendPropertiesErrorStatus

- (id)reasonForCode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = &unk_24F976010;
  v8[1] = &unk_24F976028;
  v9[0] = CFSTR("One or more of the properties requested were not valid. Other properties requested were processed.");
  v9[1] = CFSTR("One or more of the properties requested were not valid. Other properties requested were NOT processed.");
  v8[2] = &unk_24F976040;
  v9[2] = CFSTR("The client does not support the send properties query.");
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
