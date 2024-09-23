@implementation AGXA10FamilyIndirectCommandBuffer

- (AGXA10FamilyIndirectCommandBuffer)initWithBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5
{
  -[AGXA10FamilyIndirectCommandBuffer initWithBuffer:descriptor:maxCommandCount:]::$_4::operator()[abi:[AGX] Crashed.]();
}

- (AGXA10FamilyIndirectCommandBuffer)initWithDevice:(id)a3 descriptor:(id)a4 count:(unint64_t)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7
{
  char v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  AGXA10FamilyBuffer *v65;
  uint64_t v66;
  malloc_type_id_t v67;
  _QWORD *v68;
  AGXA10FamilyBuffer *buffer;
  AGXA10FamilyIndirectCommandBuffer *v70;
  AGXA10FamilyIndirectCommandBuffer *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  __int128 v75;
  int type;
  Impl v77;
  AGXA10FamilyBuffer *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  unsigned int v85;
  uint64_t v86;
  int v87;
  unsigned int v89;
  __int128 *v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unsigned int *render;
  AGXA10FamilyBuffer *v102;
  char *v103;
  uint64_t v104;
  size_t v105;
  char *v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  objc_super v116;
  _QWORD v117[2];
  int v118;
  int v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  int __pattern4[3];

  v12 = objc_msgSend(a4, "commandTypes");
  v114 = a6;
  v115 = a6 & 0x800000;
  self->_impl.render = 0;
  self->_encoder.render = 0;
  v113 = v12 & 0x60;
  if ((v12 & 0x60) != 0)
  {
    self->_type = 0;
    v13 = malloc_type_calloc(0x128uLL, 1uLL, 0x75E1C8BBuLL);
    self->_impl.render = (IndirectCommandBuffer *)v13;
    if (v13)
    {
      v14 = v13;
      *(_DWORD *)v13 = a5;
      v13[19] = v115 == 0;
      v15 = objc_msgSend(a3, "deviceRef");
      *((_QWORD *)v14 + 30) = 0;
      *((_QWORD *)v14 + 29) = a3;
      *((_QWORD *)v14 + 31) = v15;
      v14[16] = 0;
      *((_OWORD *)v14 + 16) = 0u;
      *((_OWORD *)v14 + 17) = 0u;
      if (objc_msgSend(a4, "inheritPipelineState"))
        v14[16] = 1;
      v14[17] = 0;
      if (objc_msgSend(a4, "inheritBuffers"))
        v14[17] = 1;
      v14[18] = 0;
      objc_msgSend(a4, "supportRayTracing");
      v16 = objc_msgSend(a4, "commandTypes");
      v17 = v14[16];
      v18 = v14[17];
      if (v14[17])
      {
        v19 = 0;
        v20 = 48;
      }
      else
      {
        v19 = objc_msgSend(a4, "maxKernelBufferBindCount");
        v20 = 8 * v19 + 48;
      }
      v47 = 240 * a5 + 324;
      if (v47 <= 0x40)
        v47 = 64;
      v48 = (v47 + 63) & 0xFFFFFFC0;
      v49 = v48 + 320 * a5;
      v50 = v49 + v20 * a5;
      v51 = v50 + 272 * a5;
      v52 = v51 + 24 * a5;
      LODWORD(v53) = v52 + 140 * a5;
      v54 = v14[16] == 0;
      v55 = (v53 + 7) & 0xFFFFFFF8;
      if (v14[16])
        v53 = v53;
      else
        v53 = v55 + 8 * (_DWORD)a5;
      *((_QWORD *)v14 + 1) = v53;
      *((_DWORD *)v14 + 5) = (2 * v17) | (4 * v18) | 1;
      *((_DWORD *)v14 + 6) = a5;
      *((_DWORD *)v14 + 7) = v19;
      *((_DWORD *)v14 + 8) = v16;
      *(_OWORD *)(v14 + 36) = xmmword_232D73770;
      *((_DWORD *)v14 + 13) = 240;
      *((_DWORD *)v14 + 14) = v48;
      *((_DWORD *)v14 + 15) = 320;
      *((_DWORD *)v14 + 16) = v49;
      *((_DWORD *)v14 + 17) = v20;
      *((_DWORD *)v14 + 18) = v50;
      *((_DWORD *)v14 + 19) = 272;
      *((_DWORD *)v14 + 20) = v51;
      *((_DWORD *)v14 + 21) = 24;
      *((_DWORD *)v14 + 22) = v52;
      *((_DWORD *)v14 + 23) = 140;
      *((int8x8_t *)v14 + 12) = vand_s8((int8x8_t)(v55 | 0x800000000), (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v54), 0x1FuLL)));
      v56 = *(_QWORD *)(*((_QWORD *)a3 + 101) + 5384);
      v57 = *(_OWORD *)(v56 + 52);
      *(_OWORD *)(v14 + 104) = *(_OWORD *)(v56 + 36);
      *(_OWORD *)(v14 + 120) = v57;
      v58 = *(_QWORD *)(*((_QWORD *)a3 + 101) + 5376);
      v59 = *(_OWORD *)(v58 + 28);
      *(_OWORD *)(v14 + 152) = *(_OWORD *)(v58 + 44);
      *(_OWORD *)(v14 + 136) = v59;
      v60 = *(_QWORD *)(*((_QWORD *)a3 + 101) + 5368);
      v61 = *(_OWORD *)(v60 + 8);
      *(_OWORD *)(v14 + 184) = *(_OWORD *)(v60 + 24);
      *(_OWORD *)(v14 + 168) = v61;
      v62 = *(_QWORD *)(*((_QWORD *)a3 + 101) + 5400);
      v63 = *(_OWORD *)(v62 + 24);
      *(_OWORD *)(v14 + 200) = *(_OWORD *)(v62 + 8);
      *(_OWORD *)(v14 + 216) = v63;
      goto LABEL_39;
    }
LABEL_52:

    return 0;
  }
  self->_type = 1;
  v21 = (char *)malloc_type_calloc(0x208uLL, 1uLL, 0xC7845CE9uLL);
  self->_impl.render = (IndirectCommandBuffer *)v21;
  if (!v21)
    goto LABEL_52;
  v22 = v21;
  *(_DWORD *)v21 = a5;
  v21[399] = v115 == 0;
  v23 = v21 + 400;
  v24 = objc_msgSend(a3, "deviceRef");
  *((_QWORD *)v22 + 50) = a3;
  *((_QWORD *)v22 + 51) = 0;
  *((_QWORD *)v22 + 52) = v24;
  *(_OWORD *)(v23 + 24) = 0u;
  *(_OWORD *)(v23 + 40) = 0u;
  v25 = objc_msgSend(a3, "deviceRef");
  *((_QWORD *)v22 + 57) = a3;
  *((_QWORD *)v22 + 58) = 0;
  *((_QWORD *)v22 + 59) = v25;
  v22[397] = 0;
  *((_OWORD *)v22 + 30) = 0u;
  *((_OWORD *)v22 + 31) = 0u;
  if (objc_msgSend(a4, "inheritPipelineState"))
    v22[397] = 1;
  v22[396] = 0;
  if (objc_msgSend(a4, "inheritBuffers"))
    v22[396] = 1;
  v22[398] = 0;
  objc_msgSend(a4, "supportRayTracing");
  v26 = objc_msgSend(a4, "commandTypes");
  if (v22[397])
    v27 = 44;
  else
    v27 = 84;
  if ((v26 & 1) != 0)
    v28 = 20;
  else
    v28 = 0;
  v29 = v26 & 2;
  if ((v26 & 2) != 0)
    v30 = 24;
  else
    v30 = v28;
  if ((v26 & 2) != 0)
    v31 = v27 + 8;
  else
    v31 = v27;
  v32 = objc_msgSend(a4, "maxVertexBufferBindCount");
  v33 = objc_msgSend(a4, "maxFragmentBufferBindCount");
  v34 = v31 + v30;
  v35 = v31 + v30 + 8;
  v36 = v35 + v35 * a5 + 380;
  v37 = v36 + 52 * a5 + 63;
  v38 = (v37 + 320 * a5) & 0xFFFFFFC0;
  v39 = v38 + 640 * a5;
  v40 = 8 * v32 + 56;
  v41 = v39 + v40 * a5;
  v42 = 8 * v33 + 56;
  v43 = v41 + v42 * a5;
  v44 = v43 + 24 * a5;
  v45 = v44 + 8 * a5;
  if ((v45 + a5) <= 0x80)
    v46 = 128;
  else
    v46 = (v45 + a5);
  *((_DWORD *)v22 + 4) = 0;
  *((_QWORD *)v22 + 1) = v46;
  *((_DWORD *)v22 + 5) = a5;
  *((_DWORD *)v22 + 6) = v32;
  *((_DWORD *)v22 + 7) = v33;
  *((_OWORD *)v22 + 2) = 0u;
  *((_OWORD *)v22 + 3) = 0u;
  *((_OWORD *)v22 + 4) = 0u;
  *((_QWORD *)v22 + 10) = 0;
  *((_DWORD *)v22 + 22) = 2 * v29;
  *(_OWORD *)(v22 + 92) = 0u;
  *(_OWORD *)(v22 + 108) = 0u;
  *(_QWORD *)(v22 + 124) = 0;
  *((_DWORD *)v22 + 33) = v31;
  *((_DWORD *)v22 + 34) = v34;
  *((_DWORD *)v22 + 35) = 380;
  *((_DWORD *)v22 + 36) = v35;
  *((_DWORD *)v22 + 37) = v36;
  *((_DWORD *)v22 + 38) = 52;
  *((_DWORD *)v22 + 39) = v37 & 0xFFFFFFC0;
  *((_DWORD *)v22 + 40) = 320;
  *((_DWORD *)v22 + 41) = v41;
  *((_DWORD *)v22 + 42) = v42;
  *((_DWORD *)v22 + 43) = v38;
  *((_DWORD *)v22 + 44) = 640;
  *((_DWORD *)v22 + 45) = v39;
  *((_DWORD *)v22 + 46) = v40;
  *(_OWORD *)(v22 + 204) = 0u;
  *(_OWORD *)(v22 + 188) = 0u;
  *((_DWORD *)v22 + 55) = v43;
  *((_QWORD *)v22 + 28) = 0;
  *((_QWORD *)v22 + 29) = 0;
  *((_DWORD *)v22 + 60) = 0;
  *((_DWORD *)v22 + 61) = v43;
  *(_OWORD *)(v22 + 248) = 0u;
  *(_OWORD *)(v22 + 264) = 0u;
  *((_DWORD *)v22 + 70) = 0;
  *((_DWORD *)v22 + 71) = v43;
  *((_DWORD *)v22 + 72) = 24;
  *(_OWORD *)(v22 + 292) = 0u;
  *(_OWORD *)(v22 + 308) = 0u;
  *(_OWORD *)(v22 + 324) = 0u;
  *(_OWORD *)(v22 + 340) = 0u;
  *((_DWORD *)v22 + 89) = v45;
  *((_DWORD *)v22 + 90) = 1;
  *(_QWORD *)(v22 + 364) = 0;
  *((_DWORD *)v22 + 93) = v44;
  *((_DWORD *)v22 + 94) = 8;
  *(_QWORD *)(v22 + 380) = 0;
  *(_QWORD *)(v22 + 388) = 0;
  if (v22[397])
    *((_DWORD *)v22 + 22) = (2 * v29) | 1;
LABEL_39:
  v64 = (*((_QWORD *)self->_impl.render + 1) + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
  v117[1] = 0x100010001;
  v119 = (v115 >> 8) ^ 0x8000;
  v117[0] = 0;
  v118 = 16777473;
  v122 = 0u;
  v120 = 0u;
  v121 = 0u;
  v123 = (unint64_t)v64;
  v124 = (144 * v115) ^ 0x48000000;
  v125 = 0;
  v65 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:]([AGXA10FamilyBuffer alloc], "initWithDevice:options:args:argsSize:", a3, v114 | 0x20000, v117, 104);
  self->_buffer = v65;
  if (!v65)
    goto LABEL_52;
  v66 = (int)*MEMORY[0x24BE51650];
  *(_QWORD *)((char *)&v65->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque + v66) = *(_QWORD *)((_BYTE *)&v65->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque + v66) & 0x1FFFFFFFFFFFFFFFLL | 0x2000000000000000;
  v67 = v113 ? 1926918315 : 1372316310;
  v68 = malloc_type_calloc(0x10uLL, 1uLL, v67);
  self->_encoder.render = (IndirectRenderCommandEncoder *)v68;
  if (!v68)
    goto LABEL_52;
  *v68 = self->_buffer;
  v68[1] = self->_impl.render;
  self->_encoder.render = (IndirectRenderCommandEncoder *)v68;
  buffer = self->_buffer;
  v116.receiver = self;
  v116.super_class = (Class)AGXA10FamilyIndirectCommandBuffer;
  v70 = -[IOGPUMetalIndirectCommandBuffer initWithBuffer:descriptor:maxCommandCount:](&v116, sel_initWithBuffer_descriptor_maxCommandCount_, buffer, a4, a5);
  v71 = v70;
  if (v70)
  {
    v72 = 0x300000000;
    if (v115)
      v72 = 0;
    *(NSString **)((char *)&v70->_buffer->super.super.super.super.super.super._label + v66) = (NSString *)(*(_QWORD *)((char *)&v70->_buffer->super.super.super._res.var0 + v66) + v72);
    *(unint64_t *)((char *)&v70->_buffer->super.super.super.super.super._allocationType + v66) = *(_QWORD *)&v70->_buffer->super.super.super._anon_50[v66 + 48];
    v73 = (char *)v70 + v66;
    *(_QWORD *)v73 = 0;
    *((_QWORD *)v73 + 1) = *(NSString **)((char *)&v70->_buffer->super.super.super.super.super.super._label + v66);
    *((_QWORD *)v73 + 3) = *(unint64_t *)((char *)&v70->_buffer->super.super.super.super.super._allocationType
                                               + v66);
    *((_QWORD *)v73 + 2) = -[IOGPUMetalBuffer length](v70->_buffer, "length") & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v73[23] << 56);
    v74 = (char *)v71->_buffer + v66;
    v75 = *((_OWORD *)v74 + 2);
    *((_QWORD *)v73 + 6) = *((_QWORD *)v74 + 6);
    *((_OWORD *)v73 + 2) = v75;
    type = v71->_type;
    if (!type)
    {
      v77.render = (IndirectCommandBuffer *)v71->_impl;
      v78 = v71->_buffer;
      v79 = -[IOGPUMetalBuffer contents](v78, "contents");
      v80 = *(uint64_t *)((char *)&v78->super.super.super.super.super.super._label + v66);
      v81 = *(_OWORD *)((char *)v77.render + 36);
      *(_OWORD *)v79 = *(_OWORD *)((char *)v77.render + 20);
      *(_OWORD *)(v79 + 16) = v81;
      v82 = *(_OWORD *)((char *)v77.render + 52);
      v83 = *(_OWORD *)((char *)v77.render + 68);
      v84 = *(_OWORD *)((char *)v77.render + 84);
      *(_DWORD *)(v79 + 80) = *((_DWORD *)v77.render + 25);
      *(_OWORD *)(v79 + 48) = v83;
      *(_OWORD *)(v79 + 64) = v84;
      *(_OWORD *)(v79 + 32) = v82;
      if (*(_DWORD *)v77.render)
      {
        v85 = 0;
        do
        {
          v86 = *((_DWORD *)v77.render + 12) + *((_DWORD *)v77.render + 13) * v85;
          *(_QWORD *)(*(unint64_t *)((char *)&v78->super.super.super.super.super._allocationType + v66) + v86) = __ROR8__(*(char **)((char *)&v78->super.super.super.super.super.super._label + v66) + *((unsigned int *)v77.render + 9) + v86, 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
          ++v85;
          v87 = *(_DWORD *)v77.render;
        }
        while (v85 < *(_DWORD *)v77.render);
      }
      else
      {
        v87 = 0;
      }
      *(_QWORD *)(v79 + (*((_DWORD *)v77.render + 12) + *((_DWORD *)v77.render + 13) * v87)) = 0xDEADBEEC40000000;
      if (*(_DWORD *)v77.render)
      {
        v89 = 0;
        v90 = (__int128 *)((char *)v77.render + 168);
        do
        {
          v91 = *((_DWORD *)v77.render + 16) + *((_DWORD *)v77.render + 17) * v89;
          v92 = (_QWORD *)(v79 + v91);
          v92[5] = v80 + 48 + v91;
          v93 = v80 + *((_DWORD *)v77.render + 18) + *((_DWORD *)v77.render + 19) * v89;
          v92[4] = v93;
          *v92 = v80 + *((_DWORD *)v77.render + 20) + *((_DWORD *)v77.render + 21) * v89;
          v92[1] = v93 + 40;
          v94 = *((_DWORD *)v77.render + 12) + *((_DWORD *)v77.render + 13) * v89;
          v95 = v79 + v94;
          *(_QWORD *)v95 = __ROR8__(v80 + *((unsigned int *)v77.render + 9) + v94, 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
          v96 = *(_OWORD *)((char *)v77.render + 104);
          *(_OWORD *)(v95 + 24) = *(_OWORD *)((char *)v77.render + 120);
          *(_OWORD *)(v95 + 8) = v96;
          v97 = *(_OWORD *)((char *)v77.render + 136);
          *(_OWORD *)(v95 + 56) = *(_OWORD *)((char *)v77.render + 152);
          *(_OWORD *)(v95 + 40) = v97;
          v98 = *v90;
          *(_OWORD *)(v95 + 88) = *(_OWORD *)((char *)v77.render + 184);
          *(_OWORD *)(v95 + 72) = v98;
          v99 = *(_OWORD *)((char *)v77.render + 200);
          *(_OWORD *)(v95 + 120) = *(_OWORD *)((char *)v77.render + 216);
          *(_OWORD *)(v95 + 104) = v99;
          v100 = *v90;
          *(_OWORD *)(v95 + 152) = *(_OWORD *)((char *)v77.render + 184);
          *(_OWORD *)(v95 + 136) = v100;
          ++v89;
        }
        while (v89 < *(_DWORD *)v77.render);
      }
      objc_msgSend(a4, "resourceIndex");
      type = v71->_type;
    }
    if (type == 1)
    {
      render = (unsigned int *)v71->_impl.render;
      v102 = v71->_buffer;
      v103 = -[IOGPUMetalBuffer contents](v102, "contents");
      v104 = *(uint64_t *)((char *)&v102->super.super.super.super.super.super._label + v66);
      memcpy(v103, render + 4, 0x17CuLL);
      v105 = *render * (unint64_t)render[36];
      v106 = &v103[render[35]];
      __pattern4[0] = -536870912;
      memset_pattern4(v106, __pattern4, v105);
      *(_DWORD *)&v106[v105] = -1610612736;
      if (*render)
      {
        v107 = 0;
        v108 = v104 + 56;
        do
        {
          v109 = render[45] + render[46] * v107;
          v110 = &v103[v109];
          v111 = v104 + render[71] + render[72] * v107;
          *((_QWORD *)v110 + 6) = v108 + v109;
          *(_QWORD *)v110 = v111;
          *((_QWORD *)v110 + 1) = v111 + 8;
          v112 = render[41] + render[42] * v107;
          *(_QWORD *)&v103[v112 + 48] = v108 + v112;
          v103[render[89] + render[90] * v107++] = 31;
        }
        while (v107 < *render);
      }
      objc_msgSend(a4, "resourceIndex");
    }
  }
  return v71;
}

- (void)dealloc
{
  int type;
  Impl v4;
  Impl v5;
  void *render;
  AGXA10FamilyBuffer *buffer;
  objc_super v8;

  type = self->_type;
  if (!type)
  {
    v5.render = (IndirectCommandBuffer *)self->_impl;
    if (!v5.render)
      goto LABEL_8;

    *((_QWORD *)v5.render + 30) = 0;
    goto LABEL_7;
  }
  if (type != 1)
    goto LABEL_10;
  v4.render = (IndirectCommandBuffer *)self->_impl;
  if (v4.render)
  {

    *((_QWORD *)v4.render + 58) = 0;
    *((_QWORD *)v4.render + 51) = 0;
LABEL_7:
    free(self->_impl.render);
    self->_impl.render = 0;
  }
LABEL_8:
  render = self->_encoder.render;
  if (render)
  {
    free(render);
    self->_encoder.render = 0;
  }
LABEL_10:
  buffer = self->_buffer;
  if (buffer)
  {

    self->_buffer = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)AGXA10FamilyIndirectCommandBuffer;
  -[IOGPUMetalIndirectCommandBuffer dealloc](&v8, sel_dealloc);
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  return -[AGXA10FamilyIndirectRenderCommand initWithEncoder:withIndex:]([AGXA10FamilyIndirectRenderCommand alloc], "initWithEncoder:withIndex:", self->_encoder.render, a3);
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  return -[AGXA10FamilyIndirectComputeCommand initWithEncoder:withIndex:]([AGXA10FamilyIndirectComputeCommand alloc], "initWithEncoder:withIndex:", self->_encoder.render, a3);
}

- (unint64_t)uniqueIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super._label + (int)*MEMORY[0x24BE51650]);
}

- (unint64_t)resourceIndex
{
  return 0;
}

- (void)resetWithRange:(_NSRange)a3
{
  int length;
  unsigned int location;
  int type;
  _DWORD *render;
  void *v7;
  AGXA10FamilyBuffer *buffer;
  unsigned int *v9;
  int *v10;
  uint64_t v11;
  _QWORD v12[5];

  length = a3.length;
  location = a3.location;
  type = self->_type;
  if (type)
  {
    if (type == 1)
    {
      render = self->_impl.render;
      v7 = -[IOGPUMetalBuffer contents](self->_buffer, "contents");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = ___ZN3AGX25IndirectCommandBufferGen1INS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE13resetCommandsEP18AGXA10FamilyBufferjj_block_invoke;
      v12[3] = &__block_descriptor_40_e27_v32__0_PatchLocation_IIIQ_8l;
      v12[4] = v7;
      AGX::IndirectCommandBufferGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupResetPatchTable(render, location, length, (uint64_t)v12);
    }
  }
  else if ((LODWORD(a3.length) + LODWORD(a3.location)) > LODWORD(a3.location))
  {
    buffer = self->_buffer;
    v9 = (unsigned int *)self->_impl.render;
    v10 = (int *)MEMORY[0x24BE51650];
    do
    {
      v11 = v9[12] + v9[13] * location;
      *(_QWORD *)(*(unint64_t *)((char *)&buffer->super.super.super.super.super._allocationType + *v10) + v11) = __ROR8__(*(char **)((char *)&buffer->super.super.super.super.super.super._label + *v10) + v11 + v9[9], 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)initWithBuffer:descriptor:maxCommandCount:
{
  _os_crash();
  __break(1u);
}

@end
