@implementation MIBUSerializationUtil

+ (id)typeLengthMapping
{
  if (typeLengthMapping_onceToken != -1)
    dispatch_once(&typeLengthMapping_onceToken, &__block_literal_global_3);
  return (id)typeLengthMapping_typeLengthMapping;
}

void __42__MIBUSerializationUtil_typeLengthMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24EB5B988;
  v2[1] = &unk_24EB5B9B8;
  v3[0] = &unk_24EB5B9A0;
  v3[1] = &unk_24EB5B9A0;
  v2[2] = &unk_24EB5B9D0;
  v2[3] = &unk_24EB5B9E8;
  v3[2] = &unk_24EB5B9A0;
  v3[3] = &unk_24EB5BA00;
  v2[4] = &unk_24EB5BA00;
  v3[4] = &unk_24EB5B988;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)typeLengthMapping_typeLengthMapping;
  typeLengthMapping_typeLengthMapping = v0;

}

+ (id)tagTypeMapping
{
  if (tagTypeMapping_onceToken != -1)
    dispatch_once(&tagTypeMapping_onceToken, &__block_literal_global_7);
  return (id)tagTypeMapping_tagTypeMapping;
}

void __39__MIBUSerializationUtil_tagTypeMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[60];
  _QWORD v3[61];

  v3[60] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24EB5B988;
  v2[1] = &unk_24EB5B9B8;
  v3[0] = &unk_24EB5BA18;
  v3[1] = &unk_24EB5B988;
  v2[2] = &unk_24EB5B9E8;
  v2[3] = &unk_24EB5BA00;
  v3[2] = &unk_24EB5B988;
  v3[3] = &unk_24EB5B988;
  v2[4] = &unk_24EB5BA18;
  v2[5] = &unk_24EB5BA30;
  v3[4] = &unk_24EB5B988;
  v3[5] = &unk_24EB5BA30;
  v2[6] = &unk_24EB5B9D0;
  v2[7] = &unk_24EB5B9A0;
  v3[6] = &unk_24EB5BA00;
  v3[7] = &unk_24EB5BA00;
  v2[8] = &unk_24EB5BA48;
  v2[9] = &unk_24EB5BA60;
  v3[8] = &unk_24EB5BA30;
  v3[9] = &unk_24EB5B9B8;
  v2[10] = &unk_24EB5BA78;
  v2[11] = &unk_24EB5BA90;
  v3[10] = &unk_24EB5B988;
  v3[11] = &unk_24EB5BA18;
  v2[12] = &unk_24EB5BAA8;
  v2[13] = &unk_24EB5BAC0;
  v3[12] = &unk_24EB5BA18;
  v3[13] = &unk_24EB5B9E8;
  v2[14] = &unk_24EB5BAD8;
  v2[15] = &unk_24EB5BAF0;
  v3[14] = &unk_24EB5BA18;
  v3[15] = &unk_24EB5B9B8;
  v2[16] = &unk_24EB5BB08;
  v2[17] = &unk_24EB5BB20;
  v3[16] = &unk_24EB5B9B8;
  v3[17] = &unk_24EB5B9E8;
  v2[18] = &unk_24EB5BB38;
  v2[19] = &unk_24EB5BB50;
  v3[18] = &unk_24EB5B9B8;
  v3[19] = &unk_24EB5B9B8;
  v2[20] = &unk_24EB5BB68;
  v2[21] = &unk_24EB5BB80;
  v3[20] = &unk_24EB5BA30;
  v3[21] = &unk_24EB5B9E8;
  v2[22] = &unk_24EB5BB98;
  v2[23] = &unk_24EB5BBB0;
  v3[22] = &unk_24EB5B9B8;
  v3[23] = &unk_24EB5B9B8;
  v2[24] = &unk_24EB5BBC8;
  v2[25] = &unk_24EB5BBE0;
  v3[24] = &unk_24EB5BA18;
  v3[25] = &unk_24EB5BA18;
  v2[26] = &unk_24EB5BBF8;
  v2[27] = &unk_24EB5BC10;
  v3[26] = &unk_24EB5BA18;
  v3[27] = &unk_24EB5B9E8;
  v2[28] = &unk_24EB5BC28;
  v2[29] = &unk_24EB5BC40;
  v3[28] = &unk_24EB5B988;
  v3[29] = &unk_24EB5BA18;
  v2[30] = &unk_24EB5BC58;
  v2[31] = &unk_24EB5BC70;
  v3[30] = &unk_24EB5BA18;
  v3[31] = &unk_24EB5BA00;
  v2[32] = &unk_24EB5BC88;
  v2[33] = &unk_24EB5BCA0;
  v3[32] = &unk_24EB5BA30;
  v3[33] = &unk_24EB5BA30;
  v2[34] = &unk_24EB5BCB8;
  v2[35] = &unk_24EB5BCD0;
  v3[34] = &unk_24EB5BA30;
  v3[35] = &unk_24EB5BA30;
  v2[36] = &unk_24EB5BCE8;
  v2[37] = &unk_24EB5BD00;
  v3[36] = &unk_24EB5BA30;
  v3[37] = &unk_24EB5BA30;
  v2[38] = &unk_24EB5BD18;
  v2[39] = &unk_24EB5BD30;
  v3[38] = &unk_24EB5BA30;
  v3[39] = &unk_24EB5BA30;
  v2[40] = &unk_24EB5BD48;
  v2[41] = &unk_24EB5BD60;
  v3[40] = &unk_24EB5BA00;
  v3[41] = &unk_24EB5BA30;
  v2[42] = &unk_24EB5BD78;
  v2[43] = &unk_24EB5BD90;
  v3[42] = &unk_24EB5BA30;
  v3[43] = &unk_24EB5B9D0;
  v2[44] = &unk_24EB5BDA8;
  v2[45] = &unk_24EB5BDC0;
  v3[44] = &unk_24EB5BA18;
  v3[45] = &unk_24EB5B9D0;
  v2[46] = &unk_24EB5BDD8;
  v2[47] = &unk_24EB5BDF0;
  v3[46] = &unk_24EB5B9D0;
  v3[47] = &unk_24EB5B9D0;
  v2[48] = &unk_24EB5BE08;
  v2[49] = &unk_24EB5BE20;
  v3[48] = &unk_24EB5B988;
  v3[49] = &unk_24EB5B988;
  v2[50] = &unk_24EB5BE38;
  v2[51] = &unk_24EB5BE50;
  v3[50] = &unk_24EB5B988;
  v3[51] = &unk_24EB5B9D0;
  v2[52] = &unk_24EB5BE68;
  v2[53] = &unk_24EB5BE80;
  v3[52] = &unk_24EB5B9D0;
  v3[53] = &unk_24EB5BA18;
  v2[54] = &unk_24EB5BE98;
  v2[55] = &unk_24EB5BEB0;
  v3[54] = &unk_24EB5BA18;
  v3[55] = &unk_24EB5BA18;
  v2[56] = &unk_24EB5BEC8;
  v2[57] = &unk_24EB5BEE0;
  v3[56] = &unk_24EB5BA18;
  v3[57] = &unk_24EB5B988;
  v2[58] = &unk_24EB5BEF8;
  v2[59] = &unk_24EB5BF10;
  v3[58] = &unk_24EB5BA00;
  v3[59] = &unk_24EB5B9B8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 60);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tagTypeMapping_tagTypeMapping;
  tagTypeMapping_tagTypeMapping = v0;

}

+ (id)tagLengthMapping
{
  if (tagLengthMapping_onceToken != -1)
    dispatch_once(&tagLengthMapping_onceToken, &__block_literal_global_62);
  return (id)tagLengthMapping_tagLengthMapping;
}

void __41__MIBUSerializationUtil_tagLengthMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[27];
  _QWORD v3[28];

  v3[27] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24EB5B988;
  v2[1] = &unk_24EB5BA30;
  v3[0] = &unk_24EB5BA90;
  v3[1] = &unk_24EB5BBE0;
  v2[2] = &unk_24EB5BA48;
  v2[3] = &unk_24EB5BA90;
  v3[2] = &unk_24EB5BF28;
  v3[3] = &unk_24EB5BF40;
  v2[4] = &unk_24EB5BAA8;
  v2[5] = &unk_24EB5BAD8;
  v3[4] = &unk_24EB5BF58;
  v3[5] = &unk_24EB5BAF0;
  v2[6] = &unk_24EB5BB68;
  v2[7] = &unk_24EB5BBC8;
  v3[6] = &unk_24EB5BB50;
  v3[7] = &unk_24EB5BAF0;
  v2[8] = &unk_24EB5BBE0;
  v2[9] = &unk_24EB5BBF8;
  v3[8] = &unk_24EB5BAF0;
  v3[9] = &unk_24EB5BAF0;
  v2[10] = &unk_24EB5BC40;
  v2[11] = &unk_24EB5BC58;
  v3[10] = &unk_24EB5BF40;
  v3[11] = &unk_24EB5BF58;
  v2[12] = &unk_24EB5BC88;
  v2[13] = &unk_24EB5BCA0;
  v3[12] = &unk_24EB5B9A0;
  v3[13] = &unk_24EB5B9A0;
  v2[14] = &unk_24EB5BCB8;
  v2[15] = &unk_24EB5BCD0;
  v3[14] = &unk_24EB5B9A0;
  v3[15] = &unk_24EB5B9A0;
  v2[16] = &unk_24EB5BCE8;
  v2[17] = &unk_24EB5BD00;
  v3[16] = &unk_24EB5B9A0;
  v3[17] = &unk_24EB5B9A0;
  v2[18] = &unk_24EB5BD18;
  v2[19] = &unk_24EB5BD30;
  v3[18] = &unk_24EB5B9A0;
  v3[19] = &unk_24EB5B9A0;
  v2[20] = &unk_24EB5BD60;
  v2[21] = &unk_24EB5BD78;
  v3[20] = &unk_24EB5B9A0;
  v3[21] = &unk_24EB5B9A0;
  v2[22] = &unk_24EB5BDA8;
  v2[23] = &unk_24EB5BE80;
  v3[22] = &unk_24EB5BDA8;
  v3[23] = &unk_24EB5BDA8;
  v2[24] = &unk_24EB5BE98;
  v2[25] = &unk_24EB5BEB0;
  v3[24] = &unk_24EB5BBE0;
  v3[25] = &unk_24EB5BDA8;
  v2[26] = &unk_24EB5BEC8;
  v3[26] = &unk_24EB5BDA8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 27);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tagLengthMapping_tagLengthMapping;
  tagLengthMapping_tagLengthMapping = v0;

}

+ (id)typeForTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "tagTypeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)maxLengthForTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "tagTypeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "typeLengthMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(a1, "tagLengthMapping");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
