@implementation CCValidateRepeatedEnumField

void __CCValidateRepeatedEnumField_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && !(*(unsigned int (**)(uint64_t))(a1 + 56))(a2))
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided value %u for enum field %@ is not a valid enum value"), a2, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end
