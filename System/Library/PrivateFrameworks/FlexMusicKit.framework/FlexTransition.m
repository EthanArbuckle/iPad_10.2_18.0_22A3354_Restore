@implementation FlexTransition

- (FlexTransition)init
{
  FlexTransition *v2;
  FlexTransition *v3;
  NSString *transitionSegmentName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FlexTransition;
  v2 = -[FlexTransition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_prevented = 0;
    transitionSegmentName = v2->_transitionSegmentName;
    v2->_transitionSegmentName = 0;

    v3->_useNextSegmentForFadeOut = 0;
    v3->_fadeOut = 0;
    v3->_fadeIn = 0;
  }
  return v3;
}

- (FlexTransition)initWithTransitionSegmentNamed:(id)a3 prevented:(BOOL)a4 fadeOut:(int64_t)a5 fadeIn:(int64_t)a6 useNextSegmentForFadeOut:(BOOL)a7
{
  id v13;
  FlexTransition *v14;
  FlexTransition *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v13 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FlexTransition;
  v14 = -[FlexTransition init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_prevented = a4;
    objc_storeStrong((id *)&v14->_transitionSegmentName, a3);
    v15->_fadeOut = objc_msgSend_validFadeLengthForLength_(FlexTransition, v16, a5, v17, v18);
    v15->_fadeIn = objc_msgSend_validFadeLengthForLength_(FlexTransition, v19, a6, v20, v21);
    v15->_useNextSegmentForFadeOut = a7;
  }

  return v15;
}

- (FlexTransition)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  FlexTransition *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSString *transitionSegmentName;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)FlexTransition;
  v8 = -[FlexTransition init](&v52, sel_init);
  if (v8)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("prevented"), v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_prevented = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

    objc_msgSend_objectForKey_(v4, v14, (uint64_t)CFSTR("fadeOut"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_integerValue(v17, v18, v19, v20, v21);

    v8->_fadeOut = objc_msgSend_validFadeLengthForLength_(FlexTransition, v23, v22, v24, v25);
    objc_msgSend_objectForKey_(v4, v26, (uint64_t)CFSTR("fadeIn"), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_integerValue(v29, v30, v31, v32, v33);

    v8->_fadeIn = objc_msgSend_validFadeLengthForLength_(FlexTransition, v35, v34, v36, v37);
    objc_msgSend_objectForKey_(v4, v38, (uint64_t)CFSTR("transitionSegmentName"), v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    transitionSegmentName = v8->_transitionSegmentName;
    v8->_transitionSegmentName = (NSString *)v41;

    objc_msgSend_objectForKey_(v4, v43, (uint64_t)CFSTR("useNextSegmentForFadeOut"), v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_useNextSegmentForFadeOut = objc_msgSend_BOOLValue(v46, v47, v48, v49, v50);

  }
  return v8;
}

- (id)encodeAsDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t SegmentForFadeOut;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend_prevented(self, v8, v9, v10, v11);
  objc_msgSend_numberWithBool_(v7, v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("prevented"), v18);

  v19 = (void *)MEMORY[0x24BDD16E0];
  v24 = objc_msgSend_fadeOut(self, v20, v21, v22, v23);
  objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v29, (uint64_t)v28, (uint64_t)CFSTR("fadeOut"), v30);

  v31 = (void *)MEMORY[0x24BDD16E0];
  v36 = objc_msgSend_fadeIn(self, v32, v33, v34, v35);
  objc_msgSend_numberWithInteger_(v31, v37, v36, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v41, (uint64_t)v40, (uint64_t)CFSTR("fadeIn"), v42);

  objc_msgSend_transitionSegmentName(self, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_transitionSegmentName(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v6, v53, (uint64_t)v52, (uint64_t)CFSTR("transitionSegmentName"), v54);

  }
  if (objc_msgSend_useNextSegmentForFadeOut(self, v48, v49, v50, v51))
  {
    v59 = (void *)MEMORY[0x24BDD16E0];
    SegmentForFadeOut = objc_msgSend_useNextSegmentForFadeOut(self, v55, v56, v57, v58);
    objc_msgSend_numberWithBool_(v59, v61, SegmentForFadeOut, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v6, v65, (uint64_t)v64, (uint64_t)CFSTR("useNextSegmentForFadeOut"), v66);

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v9 = objc_alloc_init((Class)objc_opt_class());
  if (v9)
  {
    v9[8] = objc_msgSend_prevented(self, v5, v6, v7, v8);
    *((_QWORD *)v9 + 2) = objc_msgSend_fadeOut(self, v10, v11, v12, v13);
    *((_QWORD *)v9 + 3) = objc_msgSend_fadeIn(self, v14, v15, v16, v17);
    objc_msgSend_transitionSegmentName(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_copyWithZone_(v22, v23, (uint64_t)a3, v24, v25);
    v27 = (void *)*((_QWORD *)v9 + 4);
    *((_QWORD *)v9 + 4) = v26;

    v9[9] = objc_msgSend_useNextSegmentForFadeOut(self, v28, v29, v30, v31);
  }
  return v9;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_transitionSegmentName(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_prevented(self, v8, v9, v10, v11))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  v17 = objc_msgSend_fadeOut(self, v12, v13, v14, v15);
  v22 = objc_msgSend_fadeIn(self, v18, v19, v20, v21);
  if (objc_msgSend_useNextSegmentForFadeOut(self, v23, v24, v25, v26))
    objc_msgSend_stringWithFormat_(v6, v27, (uint64_t)CFSTR("transitionSegmentName: %@ prevented:%@ fadeOut: %ld, fadeIn: %ld useNext:%@"), v28, v29, v7, v16, v17, v22, CFSTR("Y"));
  else
    objc_msgSend_stringWithFormat_(v6, v27, (uint64_t)CFSTR("transitionSegmentName: %@ prevented:%@ fadeOut: %ld, fadeIn: %ld useNext:%@"), v28, v29, v7, v16, v17, v22, CFSTR("N"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)isDefaultTransition
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  objc_msgSend_transitionSegmentName(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend_prevented(self, v6, v7, v8, v9) & 1) != 0
    || objc_msgSend_fadeOut(self, v11, v12, v13, v14)
    || objc_msgSend_fadeIn(self, v15, v16, v17, v18))
  {
    LOBYTE(v23) = 0;
  }
  else
  {
    v23 = objc_msgSend_useNextSegmentForFadeOut(self, v19, v20, v21, v22) ^ 1;
  }

  return v23;
}

+ (int64_t)validFadeLengthForLength:(int64_t)a3
{
  uint64_t v3;

  v3 = 25;
  if (a3 > 25)
    v3 = a3;
  if (v3 >= 2000)
    v3 = 2000;
  if (a3 <= 0)
    return 0;
  else
    return v3;
}

- (BOOL)prevented
{
  return self->_prevented;
}

- (int64_t)fadeOut
{
  return self->_fadeOut;
}

- (int64_t)fadeIn
{
  return self->_fadeIn;
}

- (NSString)transitionSegmentName
{
  return self->_transitionSegmentName;
}

- (BOOL)useNextSegmentForFadeOut
{
  return self->_useNextSegmentForFadeOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionSegmentName, 0);
}

@end
