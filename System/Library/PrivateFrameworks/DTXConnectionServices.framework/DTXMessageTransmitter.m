@implementation DTXMessageTransmitter

- (unsigned)fragmentsForLength:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  unint64_t v8;

  if (objc_msgSend_suggestedFragmentSize(self, a2, a3) < 0x21)
    return 1;
  v8 = (a3 - 1) / (objc_msgSend_suggestedFragmentSize(self, v5, v6) - 32);
  if ((v8 + 1) <= 1)
    return v8 + 1;
  else
    return v8 + 2;
}

- (void)transmitMessage:(id)a3 routingInfo:(DTXMessageRoutingInfo)a4 fragment:(unsigned int)a5 transmitter:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  const char *v13;
  uint64_t v14;
  void (**v15)(id, uint64_t *, uint64_t);
  uint64_t v16;
  const char *v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  unint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  _QWORD v26[4];
  void (**v27)(id, uint64_t *, uint64_t);
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[3];
  int v31;
  _QWORD v32[3];
  uint64_t v33;
  _QWORD v34[4];
  void (**v35)(id, uint64_t *, uint64_t);
  uint64_t v36;
  __int16 v37;
  __int16 v38;
  int v39;
  uint64_t v40;
  uint64_t v41;

  v8 = *(_QWORD *)&a4.var2;
  v9 = *(_QWORD *)&a4.var0;
  v12 = a3;
  v15 = (void (**)(id, uint64_t *, uint64_t))a6;
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v13, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, CFSTR("DTXMessageProtocols.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v16 = objc_msgSend_serializedLength(v12, v13, v14);
  v18 = objc_msgSend_fragmentsForLength_(self, v17, v16);
  if (v18 <= a5)
    sub_21DCA0418();
  v36 = 0x201F3D5B79;
  v37 = a5;
  v38 = v18;
  v39 = v16;
  v40 = v9;
  v41 = v8;
  if (v18 == 1)
  {
    v15[2](v15, &v36, 32);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = sub_21DC98170;
    v34[3] = &unk_24E1AB3D8;
    v35 = v15;
    objc_msgSend_serializedFormApply_(v12, v21, (uint64_t)v34);

  }
  else if (a5)
  {
    v22 = objc_msgSend_suggestedFragmentSize(self, v19, v20) - 32;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = v22 * (a5 - 1);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    if (v16 - v33 < v22)
      LODWORD(v22) = v16 - v33;
    v31 = v22;
    v39 = v22;
    v15[2](v15, &v36, 32);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_21DC9817C;
    v26[3] = &unk_24E1AB400;
    v28 = v30;
    v29 = v32;
    v27 = v15;
    objc_msgSend_serializedFormApply_(v12, v23, (uint64_t)v26);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    v15[2](v15, &v36, 32);
  }

}

- (unsigned)suggestedFragmentSize
{
  return self->_suggestedFragmentSize;
}

- (void)setSuggestedFragmentSize:(unsigned int)a3
{
  self->_suggestedFragmentSize = a3;
}

@end
