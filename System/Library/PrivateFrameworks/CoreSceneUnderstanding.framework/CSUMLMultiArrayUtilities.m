@implementation CSUMLMultiArrayUtilities

+ (id)shallowCopyFromTensor:(const void *)a3
{
  _QWORD *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  uint64_t v110;
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[4];
  _QWORD v114[4];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[3];

  v119[1] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)*((_QWORD *)a3 + 5);
  switch(espresso_buffer_get_rank())
  {
    case 1:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v4, v3[11], v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v119[0] = v7;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, (uint64_t)v119, 1, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = &unk_250B1CD08;
      goto LABEL_9;
    case 2:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v4, v3[12], v5, v6);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v48;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v49, v3[11], v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v52;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v53, (uint64_t)v118, 2, v54);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v55, v3[11], v56, v57);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = v7;
      v117[1] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v58, (uint64_t)v117, 2, v59);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v4, v3[13], v5, v6);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v60;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v61, v3[12], v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v64;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v65, v3[11], v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v68;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v69, (uint64_t)v116, 3, v70);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v71, v3[11] * v3[12], v72, v73);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v7;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v74, v3[11], v75, v76);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v37;
      v115[2] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v77, (uint64_t)v115, 3, v78);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v4, v3[14], v5, v6);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v79;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v80, v3[13], v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = v83;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v84, v3[12], v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v114[2] = v87;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v88, v3[11], v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v114[3] = v91;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v92, (uint64_t)v114, 4, v93);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v94, v3[12] * v3[13] * v3[11], v95, v96);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v7;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v97, v3[11] * v3[12], v98, v99);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v37;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v100, v3[11], v101, v102);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v113[2] = v41;
      v113[3] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v103, (uint64_t)v113, 4, v104);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    default:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v4, v3[15], v5, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v12;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v13, v3[14], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v112[1] = v16;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v17, v3[13], v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v112[2] = v20;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v21, v3[12], v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v112[3] = v24;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v25, v3[11], v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v112[4] = v28;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, (uint64_t)v112, 5, v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v31, v3[13] * v3[14] * v3[12] * v3[11], v32, v33);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = v7;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v34, v3[12] * v3[13] * v3[11], v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v111[1] = v37;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v38, v3[11] * v3[12], v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v111[2] = v41;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v42, v3[11], v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v111[3] = v45;
      v111[4] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v46, (uint64_t)v111, 5, v47);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_8:

LABEL_9:
      v105 = objc_alloc(MEMORY[0x24BDBFFF0]);
      v106 = v3[1];
      v110 = 0;
      v108 = (void *)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v105, v107, v106, (uint64_t)v10, 65568, v11, 0, &v110);

      return v108;
  }
}

+ (id)deepCopyFromTensor:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  id v56;
  const char *v57;
  void *v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  _QWORD v67[4];
  _QWORD v68[3];
  _QWORD v69[2];
  _QWORD v70[2];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)*((_QWORD *)a3 + 5);
  v4 = v3 + 1;
  switch(espresso_buffer_get_rank())
  {
    case 1:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, v3[11], v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v70, 1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, v3[12], v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v69[0] = v12;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v32, v3[11], v33, v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v16;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v35, (uint64_t)v69, 2, v36);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, v3[13], v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v68[0] = v12;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v37, v3[12], v38, v39);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v16;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v40, v3[11], v41, v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v20;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)v68, 3, v44);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, v3[14], v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v67[0] = v12;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v45, v3[13], v46, v47);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v16;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v48, v3[12], v49, v50);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v20;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v51, v3[11], v52, v53);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67[3] = v24;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v54, (uint64_t)v67, 4, v55);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    default:
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, v3[15], v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v66[0] = v12;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v13, v3[14], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v16;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v17, v3[13], v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v20;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v21, v3[12], v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v66[3] = v24;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v25, v3[11], v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v66[4] = v28;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, (uint64_t)v66, 5, v30);
      v31 = objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_8:

LABEL_9:
      v8 = (void *)v12;
      v11 = (void *)v31;
LABEL_10:

      v56 = objc_alloc(MEMORY[0x24BDBFFF0]);
      v65 = 0;
      v58 = (void *)objc_msgSend_initWithShape_dataType_error_(v56, v57, (uint64_t)v11, 65568, (uint64_t)&v65);
      v59 = v65;
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = sub_23A017938;
      v64[3] = &unk_250B0E470;
      v64[4] = v4;
      objc_msgSend_getMutableBytesWithHandler_(v58, v60, (uint64_t)v64, v61, v62);

      return v58;
  }
}

+ (id)castToFP16WithDeepCopyFromTensor:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  int32x4_t *v5;
  int32x4_t *v6;
  unint64_t v7;
  int v8;
  int32x4_t *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int32x4_t *v36;
  int32x4_t v37;
  uint64_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int8x16_t v44;
  int v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  id v74;
  const char *v75;
  void *v76;
  id v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v82[6];
  id v83;
  _QWORD v84[5];
  _QWORD v85[4];
  _QWORD v86[3];
  _QWORD v87[2];
  _QWORD v88[2];

  v88[1] = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)*((_QWORD *)a3 + 5);
  v4 = v3 + 1;
  v6 = (int32x4_t *)*((_QWORD *)a3 + 2);
  v5 = (int32x4_t *)*((_QWORD *)a3 + 3);
  if (v6 != v5)
  {
    v7 = (char *)v5 - (char *)v6 - 8;
    if (v7 >= 0x38)
    {
      v35 = (v7 >> 3) + 1;
      v9 = (int32x4_t *)((char *)v6 + 8 * (v35 & 0x3FFFFFFFFFFFFFF8));
      v36 = v6 + 2;
      v37.i64[0] = 0x100000001;
      v37.i64[1] = 0x100000001;
      v38 = v35 & 0x3FFFFFFFFFFFFFF8;
      v39.i64[0] = 0x100000001;
      v39.i64[1] = 0x100000001;
      do
      {
        v41 = v36[-2];
        v40 = v36[-1];
        v43 = *v36;
        v42 = v36[1];
        v36 += 4;
        v37 = vmulq_s32(v37, vuzp1q_s32(v41, v40));
        v39 = vmulq_s32(v39, vuzp1q_s32(v43, v42));
        v38 -= 8;
      }
      while (v38);
      v44 = (int8x16_t)vmulq_s32(v39, v37);
      *(int32x2_t *)v44.i8 = vmul_s32(*(int32x2_t *)v44.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
      v8 = v44.i32[0] * v44.i32[1];
      if (v35 == (v35 & 0x3FFFFFFFFFFFFFF8))
        goto LABEL_10;
    }
    else
    {
      v8 = 1;
      v9 = (int32x4_t *)*((_QWORD *)a3 + 2);
    }
    do
    {
      v45 = v9->i32[0];
      v9 = (int32x4_t *)((char *)v9 + 8);
      v8 *= v45;
    }
    while (v9 != v5);
LABEL_10:
    v10 = v8;
    v14 = espresso_buffer_get_rank() - 1;
LABEL_11:
    switch(v14)
    {
      case 0uLL:
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, v3[11], v12, v13);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = v46;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v47, (uint64_t)v88, 1, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1uLL:
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, v3[12], v12, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        v87[0] = v15;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v50, v3[11], v51, v52);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = v19;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v53, (uint64_t)v87, 2, v54);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 2uLL:
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, v3[13], v12, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        v86[0] = v15;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v55, v3[12], v56, v57);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v19;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v58, v3[11], v59, v60);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v86[2] = v23;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v61, (uint64_t)v86, 3, v62);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3uLL:
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, v3[14], v12, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        v85[0] = v15;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v63, v3[13], v64, v65);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v85[1] = v19;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v66, v3[12], v67, v68);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v85[2] = v23;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v69, v3[11], v70, v71);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v85[3] = v27;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v72, (uint64_t)v85, 4, v73);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      default:
        goto LABEL_5;
    }
    goto LABEL_19;
  }
  v10 = 0;
  v14 = espresso_buffer_get_rank() - 1;
  if (v14 <= 3)
    goto LABEL_11;
LABEL_5:
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, v3[15], v12, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v84[0] = v15;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v16, v3[14], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v19;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v20, v3[13], v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v23;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v24, v3[12], v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v27;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v28, v3[11], v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v31;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v32, (uint64_t)v84, 5, v33);
  v34 = objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_17:

LABEL_18:
  v46 = (void *)v15;
  v49 = (void *)v34;
LABEL_19:

  v74 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v83 = 0;
  v76 = (void *)objc_msgSend_initWithShape_dataType_error_(v74, v75, (uint64_t)v49, 65552, (uint64_t)&v83);
  v77 = v83;
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = sub_23A017E0C;
  v82[3] = &unk_250B0E490;
  v82[4] = v4;
  v82[5] = v10;
  objc_msgSend_getMutableBytesWithHandler_(v76, v78, (uint64_t)v82, v79, v80);

  return v76;
}

+ (void)printMLMultiArray:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = objc_msgSend_dataType(v11, v3, v4, v5, v6);
  NSLog(CFSTR("arr datatype = %ld"), v7);
  objc_msgSend_getMutableBytesWithHandler_(v11, v8, (uint64_t)&unk_250B0DF20, v9, v10);

}

+ (id)copyFromNSDataAndReshape:(id)a3 shape:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  id v200;
  const char *v201;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  _QWORD v213[5];
  _QWORD v214[4];
  _QWORD v215[3];
  _QWORD v216[4];

  v216[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v11 = objc_msgSend_length(v5, v7, v8, v9, v10);
  v12 = objc_retainAutorelease(v5);
  v17 = objc_msgSend_bytes(v12, v13, v14, v15, v16);
  v25 = objc_msgSend_count(v6, v18, v19, v20, v21);
  if (!v25)
  {
    if (v11 >> 2 == 1)
      goto LABEL_5;
LABEL_8:
    v36 = 0;
    goto LABEL_16;
  }
  v26 = 0;
  v27 = 1;
  do
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v22, v26, v23, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 *= objc_msgSend_unsignedIntValue(v28, v29, v30, v31, v32);

    ++v26;
  }
  while (v25 != v26);
  if (v27 != v11 >> 2)
    goto LABEL_8;
LABEL_5:
  v33 = &unk_250B1CD20;
  switch(v25)
  {
    case 1:
      goto LABEL_15;
    case 2:
      objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v216[0] = v210;
      v216[1] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v34, (uint64_t)v216, 2, v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 3:
      v128 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend_unsignedLongValue(v211, v129, v130, v131, v132);
      objc_msgSend_objectAtIndex_(v6, v134, 2, v135, v136);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend_unsignedLongValue(v209, v137, v138, v139, v140);
      objc_msgSend_numberWithUnsignedLong_(v128, v142, v141 * v133, v143, v144);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v215[0] = v208;
      objc_msgSend_objectAtIndex_(v6, v145, 2, v146, v147);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v215[1] = v207;
      v215[2] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v148, (uint64_t)v215, 3, v149);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      v150 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend_unsignedLongValue(v211, v151, v152, v153, v154);
      objc_msgSend_objectAtIndex_(v6, v156, 2, v157, v158);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend_unsignedLongValue(v209, v159, v160, v161, v162);
      objc_msgSend_objectAtIndex_(v6, v164, 3, v165, v166);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = objc_msgSend_unsignedLongValue(v208, v167, v168, v169, v170);
      objc_msgSend_numberWithUnsignedLong_(v150, v172, v163 * v155 * v171, v173, v174);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v214[0] = v207;
      v175 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_objectAtIndex_(v6, v176, 2, v177, v178);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = objc_msgSend_unsignedLongValue(v206, v179, v180, v181, v182);
      objc_msgSend_objectAtIndex_(v6, v184, 3, v185, v186);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = objc_msgSend_unsignedLongValue(v205, v187, v188, v189, v190);
      objc_msgSend_numberWithUnsignedLong_(v175, v192, v191 * v183, v193, v194);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v214[1] = v204;
      objc_msgSend_objectAtIndex_(v6, v195, 3, v196, v197);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v214[2] = v90;
      v214[3] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v198, (uint64_t)v214, 4, v199);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    default:
      v37 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_unsignedLongValue(v211, v38, v39, v40, v41);
      objc_msgSend_objectAtIndex_(v6, v43, 2, v44, v45);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_unsignedLongValue(v209, v46, v47, v48, v49);
      objc_msgSend_objectAtIndex_(v6, v51, 3, v52, v53);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend_unsignedLongValue(v208, v54, v55, v56, v57);
      objc_msgSend_objectAtIndex_(v6, v59, 4, v60, v61);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_unsignedLongValue(v207, v62, v63, v64, v65);
      objc_msgSend_numberWithUnsignedLong_(v37, v67, v50 * v42 * v58 * v66, v68, v69);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v213[0] = v206;
      v70 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_objectAtIndex_(v6, v71, 2, v72, v73);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend_unsignedLongValue(v205, v74, v75, v76, v77);
      objc_msgSend_objectAtIndex_(v6, v79, 3, v80, v81);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_unsignedLongValue(v204, v82, v83, v84, v85);
      objc_msgSend_objectAtIndex_(v6, v87, 4, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend_unsignedLongValue(v90, v91, v92, v93, v94);
      objc_msgSend_numberWithUnsignedLong_(v70, v96, v86 * v78 * v95, v97, v98);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v213[1] = v203;
      v99 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_objectAtIndex_(v6, v100, 3, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend_unsignedLongValue(v103, v104, v105, v106, v107);
      objc_msgSend_objectAtIndex_(v6, v109, 4, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend_unsignedLongValue(v112, v113, v114, v115, v116);
      objc_msgSend_numberWithUnsignedLong_(v99, v118, v117 * v108, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v213[2] = v121;
      objc_msgSend_objectAtIndex_(v6, v122, 4, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v213[3] = v125;
      v213[4] = &unk_250B1C7F8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v126, (uint64_t)v213, 5, v127);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_13:

LABEL_15:
      v200 = objc_alloc(MEMORY[0x24BDBFFF0]);
      v212 = 0;
      v36 = (void *)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v200, v201, v17, (uint64_t)v6, 65568, v33, 0, &v212);

      break;
  }
LABEL_16:

  return v36;
}

+ (id)reshapeMLMultiArray:(id)a3 toShape:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  char v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  id v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  _QWORD v217[4];
  id v218;
  id v219;
  uint64_t *v220;
  _QWORD *v221;
  uint64_t v222;
  uint64_t *v223;
  uint64_t v224;
  uint64_t (*v225)(uint64_t, uint64_t);
  void (*v226)(uint64_t);
  id v227;
  _QWORD v228[5];
  id v229;
  _QWORD v230[5];
  _QWORD v231[4];
  _QWORD v232[3];
  _QWORD v233[4];

  v233[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = objc_msgSend_count(v6, v8, v9, v10, v11);
  v21 = (char *)objc_msgSend_count(v7, v13, v14, v15, v16);
  if (v21)
  {
    objc_msgSend_shape(v6, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_compareMLMultiArrayShapesForShape1_Shape2_(a1, v23, (uint64_t)v22, (uint64_t)v7, v24);

    if ((v25 & 1) != 0)
    {
      v21 = (char *)v6;
    }
    else
    {
      v29 = 0;
      v30 = 1;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v7, v26, v29, v27, v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v30 *= objc_msgSend_unsignedIntValue(v31, v32, v33, v34, v35);

        ++v29;
      }
      while (v21 != (char *)v29);
      if (v30 == v12)
      {
        v36 = v21 - 1;
        v37 = &unk_250B1CD38;
        switch((unint64_t)v36)
        {
          case 0uLL:
            goto LABEL_16;
          case 1uLL:
            objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            v233[0] = v215;
            v233[1] = &unk_250B1C7F8;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v38, (uint64_t)v233, 2, v39);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          case 2uLL:
            v133 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = objc_msgSend_unsignedLongValue(v216, v134, v135, v136, v137);
            objc_msgSend_objectAtIndex_(v7, v139, 2, v140, v141);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = objc_msgSend_unsignedLongValue(v214, v142, v143, v144, v145);
            objc_msgSend_numberWithUnsignedLong_(v133, v147, v146 * v138, v148, v149);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            v232[0] = v213;
            objc_msgSend_objectAtIndex_(v7, v150, 2, v151, v152);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            v232[1] = v212;
            v232[2] = &unk_250B1C7F8;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v153, (uint64_t)v232, 3, v154);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 3uLL:
            v155 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            v160 = objc_msgSend_unsignedLongValue(v216, v156, v157, v158, v159);
            objc_msgSend_objectAtIndex_(v7, v161, 2, v162, v163);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = objc_msgSend_unsignedLongValue(v214, v164, v165, v166, v167);
            objc_msgSend_objectAtIndex_(v7, v169, 3, v170, v171);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            v176 = objc_msgSend_unsignedLongValue(v213, v172, v173, v174, v175);
            objc_msgSend_numberWithUnsignedLong_(v155, v177, v168 * v160 * v176, v178, v179);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            v231[0] = v212;
            v180 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectAtIndex_(v7, v181, 2, v182, v183);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v188 = objc_msgSend_unsignedLongValue(v211, v184, v185, v186, v187);
            objc_msgSend_objectAtIndex_(v7, v189, 3, v190, v191);
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            v196 = objc_msgSend_unsignedLongValue(v210, v192, v193, v194, v195);
            objc_msgSend_numberWithUnsignedLong_(v180, v197, v196 * v188, v198, v199);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v231[1] = v85;
            objc_msgSend_objectAtIndex_(v7, v200, 3, v201, v202);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v231[2] = v94;
            v231[3] = &unk_250B1C7F8;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v203, (uint64_t)v231, 4, v204);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          default:
            v40 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend_unsignedLongValue(v216, v41, v42, v43, v44);
            objc_msgSend_objectAtIndex_(v7, v46, 2, v47, v48);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend_unsignedLongValue(v214, v49, v50, v51, v52);
            objc_msgSend_objectAtIndex_(v7, v54, 3, v55, v56);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend_unsignedLongValue(v213, v57, v58, v59, v60);
            objc_msgSend_objectAtIndex_(v7, v62, 4, v63, v64);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend_unsignedLongValue(v212, v65, v66, v67, v68);
            objc_msgSend_numberWithUnsignedLong_(v40, v70, v53 * v45 * v61 * v69, v71, v72);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v230[0] = v211;
            v73 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectAtIndex_(v7, v74, 2, v75, v76);
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend_unsignedLongValue(v210, v77, v78, v79, v80);
            objc_msgSend_objectAtIndex_(v7, v82, 3, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend_unsignedLongValue(v85, v86, v87, v88, v89);
            objc_msgSend_objectAtIndex_(v7, v91, 4, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend_unsignedLongValue(v94, v95, v96, v97, v98);
            objc_msgSend_numberWithUnsignedLong_(v73, v100, v90 * v81 * v99, v101, v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v230[1] = v103;
            v104 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectAtIndex_(v7, v105, 3, v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend_unsignedLongValue(v108, v109, v110, v111, v112);
            objc_msgSend_objectAtIndex_(v7, v114, 4, v115, v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = objc_msgSend_unsignedLongValue(v117, v118, v119, v120, v121);
            objc_msgSend_numberWithUnsignedLong_(v104, v123, v122 * v113, v124, v125);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v230[2] = v126;
            objc_msgSend_objectAtIndex_(v7, v127, 4, v128, v129);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v230[3] = v130;
            v230[4] = &unk_250B1C7F8;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v131, (uint64_t)v230, 5, v132);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:

LABEL_16:
            v228[0] = 0;
            v228[1] = v228;
            v228[2] = 0x3032000000;
            v228[3] = sub_23A018E50;
            v228[4] = sub_23A018E60;
            v229 = 0;
            v222 = 0;
            v223 = &v222;
            v224 = 0x3032000000;
            v225 = sub_23A018E50;
            v226 = sub_23A018E60;
            v227 = 0;
            v217[0] = MEMORY[0x24BDAC760];
            v217[1] = 3221225472;
            v217[2] = sub_23A018E68;
            v217[3] = &unk_250B0E4D8;
            v220 = &v222;
            v218 = v7;
            v219 = v37;
            v221 = v228;
            v205 = v37;
            objc_msgSend_getBytesWithHandler_(v6, v206, (uint64_t)v217, v207, v208);
            v21 = (char *)(id)v223[5];

            _Block_object_dispose(&v222, 8);
            _Block_object_dispose(v228, 8);

            break;
        }
      }
      else
      {
        v21 = 0;
      }
    }
  }

  return v21;
}

+ (BOOL)compareMLMultiArrayShapesForShape1:(id)a3 Shape2:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char isEqualToNumber;
  char v36;

  v5 = a3;
  v6 = a4;
  v11 = objc_msgSend_count(v5, v7, v8, v9, v10);
  if (v11 == objc_msgSend_count(v6, v12, v13, v14, v15))
  {
    v20 = objc_msgSend_count(v5, v16, v17, v18, v19);
    if (v20)
    {
      v24 = 0;
      v25 = v20 - 1;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v5, v21, v24, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v27, v24, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToNumber_(v26, v31, (uint64_t)v30, v32, v33);

        if (v25 == v24++)
          v36 = 0;
        else
          v36 = isEqualToNumber;
      }
      while ((v36 & 1) != 0);
    }
    else
    {
      isEqualToNumber = 1;
    }
  }
  else
  {
    isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

@end
