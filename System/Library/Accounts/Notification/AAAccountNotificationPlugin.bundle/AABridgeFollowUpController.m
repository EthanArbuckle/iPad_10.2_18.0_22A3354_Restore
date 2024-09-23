@implementation AABridgeFollowUpController

+ (void)dismissBridgeAppleIDFollowUp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v5 = (void *)qword_255EAA488;
  v25 = qword_255EAA488;
  if (!qword_255EAA488)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_230EAA3D8;
    v21[3] = &unk_24FF9D210;
    v21[4] = &v22;
    sub_230EAA3D8((uint64_t)v21, a2, v2, v3, v4);
    v5 = (void *)v23[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v22, 8);
  v7 = [v6 alloc];
  v11 = (void *)objc_msgSend_initWithClientIdentifier_(v7, v8, (uint64_t)CFSTR("com.apple.Bridge"), v9, v10);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("%@.%@"), v13, v14, CFSTR("com.apple.Bridge"), CFSTR("AppleID-FollowUp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v26, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearPendingFollowUpItemsWithUniqueIdentifiers_completion_(v11, v19, (uint64_t)v18, (uint64_t)&unk_24FF9D1E8, v20);

}

@end
