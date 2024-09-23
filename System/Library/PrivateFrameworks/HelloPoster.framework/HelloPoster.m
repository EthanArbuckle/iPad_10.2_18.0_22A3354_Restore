float32x2_t sub_23DF57AC8()
{
  float32x2_t *v0;

  return vmul_f32(vadd_f32(v0[6], v0[8]), (float32x2_t)0x3F0000003F000000);
}

uint64_t sub_23DF57AFC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Geometry()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_23DF57B88(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23DF57BA8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for HelloVertexIn(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1A9D0);
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1A9D8);
}

__n128 __swift_memcpy80_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_23DF57C18(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23DF57C38(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 80) = v3;
  return result;
}

void type metadata accessor for HelloFragmentUniforms(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1A9E0);
}

__n128 __swift_memcpy160_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t sub_23DF57CB8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 160))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23DF57CD8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 160) = v3;
  return result;
}

void type metadata accessor for HelloVertexUniforms(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1A9E8);
}

uint64_t sub_23DF57D40(uint64_t a1)
{
  MEMORY[0x24264927C](&unk_23DF6A9D0, a1);
  return sub_23DF6A1D4();
}

uint64_t sub_23DF57D7C()
{
  MEMORY[0x24264927C](&unk_23DF6A9D0);
  return sub_23DF6A1C8();
}

uint64_t sub_23DF57DC4(uint64_t a1, uint64_t a2)
{
  sub_23DF6A36C();
  MEMORY[0x24264927C](&unk_23DF6A9D0, a2);
  sub_23DF6A1C8();
  return sub_23DF6A384();
}

_QWORD *sub_23DF57E1C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23DF57E2C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23DF57E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24264927C](&unk_23DF6A9D0, a3);
  return sub_23DF6A1BC();
}

__n128 *sub_23DF57E84(unint64_t a1, unint64_t a2, unint64_t a3, __n128 a4, __n128 a5)
{
  __n128 *v8;
  __n128 *v9;

  type metadata accessor for Geometry();
  v8 = (__n128 *)swift_allocObject();
  v9 = v8;
  if (a1 && a2)
  {
    v8[1].n128_u64[0] = a1;
    v8[1].n128_u64[1] = a2;
    v8[2].n128_u64[0] = a3;
    v8[3] = a4;
    v8[4] = a5;
  }
  else
  {
    swift_unknownObjectRelease();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v9;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1A9F0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23DF57F48(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23DF57F68(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for simd_float2x2(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1A9F8);
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for RotationMinimizingFrame(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RotationMinimizingFrame(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
  sub_23DF58028(a1, &qword_256D1AA00);
}

void sub_23DF58028(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_23DF5806C()
{
  return sub_23DF580B4(&qword_256D1AA08, (uint64_t)&unk_23DF6A9FC);
}

uint64_t sub_23DF58090()
{
  return sub_23DF580B4((unint64_t *)&unk_256D1AA10, (uint64_t)&unk_23DF6A9A4);
}

uint64_t sub_23DF580B4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    result = MEMORY[0x24264927C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23DF580F8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_23DF58158()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_23DF581A4(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_23DF581F4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MetalView.__allocating_init(frame:device:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(v5), sel_initWithFrame_device_, a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v6;
}

void MetalView.init(frame:device:)(void *a1, double a2, double a3, double a4, double a5)
{
  _BYTE *v5;
  char *v11;
  _OWORD *v12;
  _OWORD *v13;
  _OWORD *v14;
  id v15;
  uint64_t ObjCClassFromMetadata;
  void *v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  objc_super v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperZoom] = 0;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperAnimationPosition] = 1065353216;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngle] = 0;
  v11 = &v5[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngleOverride];
  *(_DWORD *)v11 = 0;
  v11[4] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor] = 0;
  swift_unknownObjectWeakInit();
  v12 = &v5[OBJC_IVAR____TtC11HelloPoster9MetalView_configuration];
  *v12 = 0u;
  v12[1] = 0u;
  v12[2] = 0u;
  v12[3] = 0u;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_library] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_commandQueue] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_depthStencilState] = 0;
  v13 = &v5[OBJC_IVAR____TtC11HelloPoster9MetalView_vertexUniforms];
  *v13 = 0u;
  v13[1] = 0u;
  v13[2] = 0u;
  v13[3] = 0u;
  v13[4] = 0u;
  v13[5] = 0u;
  v13[6] = 0u;
  v13[7] = 0u;
  v13[8] = 0u;
  *(_OWORD *)((char *)v13 + 140) = 0u;
  v14 = &v5[OBJC_IVAR____TtC11HelloPoster9MetalView_fragmentUniforms];
  *v14 = 0u;
  v14[1] = 0u;
  v14[2] = 0u;
  v14[3] = 0u;
  *(_OWORD *)((char *)v14 + 60) = 0u;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundPipelineState] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundVerticesBuffer] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_textPipelineState] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_textGeometry] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_penPipelineState] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_penGeometry] = 0;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraZNear] = 1065353216;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraZFar] = 1176256512;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraDefaultFieldOfView] = 1112014848;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraFieldOfView] = 1112014848;
  *(_DWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraDistance] = 0;
  v5[OBJC_IVAR____TtC11HelloPoster9MetalView_needsSnapshot] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC11HelloPoster9MetalView_snapshotTexture] = 0;
  v46.receiver = v5;
  v46.super_class = (Class)type metadata accessor for MetalView();
  v15 = objc_msgSendSuper2(&v46, sel_initWithFrame_device_, a1, a2, a3, a4, a5);
  if (!a1)
    return;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = (void *)objc_opt_self();
  v18 = (char *)v15;
  swift_unknownObjectRetain();
  v19 = objc_msgSend(v17, sel_bundleForClass_, ObjCClassFromMetadata);
  v45 = 0;
  v20 = objc_msgSend(a1, sel_newDefaultLibraryWithBundle_error_, v19, &v45);

  if (v20)
  {
    v21 = v45;
  }
  else
  {
    v22 = v45;
    v23 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  v24 = OBJC_IVAR____TtC11HelloPoster9MetalView_library;
  *(_QWORD *)&v18[OBJC_IVAR____TtC11HelloPoster9MetalView_library] = v20;
  swift_unknownObjectRelease();
  v25 = *(void **)&v18[v24];
  if (!v25)
  {

    swift_unknownObjectRelease_n();
    return;
  }
  swift_unknownObjectRetain();
  *(_QWORD *)&v18[OBJC_IVAR____TtC11HelloPoster9MetalView_commandQueue] = objc_msgSend(a1, sel_newCommandQueue);
  swift_unknownObjectRelease();
  objc_msgSend(v18, sel_setFramebufferOnly_, 0);
  objc_msgSend(v18, sel_setDepthStencilPixelFormat_, 252);
  objc_msgSend(v18, sel_setEnableSetNeedsDisplay_, 1);
  objc_msgSend(v18, sel_setPaused_, 1);
  objc_msgSend(v18, sel_setSampleCount_, 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AC10);
  v26 = (_OWORD *)swift_allocObject();
  v26[1] = xmmword_23DF6AA50;
  sub_23DF59FEC((uint64_t)&unk_250EBE8B0);
  v26[2] = v27;
  sub_23DF59FEC((uint64_t)&unk_250EBE8E0);
  v26[3] = v28;
  sub_23DF59FEC((uint64_t)&unk_250EBE910);
  v26[4] = v29;
  sub_23DF59FEC((uint64_t)&unk_250EBE940);
  v26[5] = v30;
  v31 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v26 + 2, 64, 0);
  swift_setDeallocating();
  swift_deallocClassInstance();
  *(_QWORD *)&v18[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundVerticesBuffer] = v31;
  swift_unknownObjectRelease();
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD590]), sel_init);
  objc_msgSend(v32, sel_setDepthCompareFunction_, 1);
  objc_msgSend(v32, sel_setDepthWriteEnabled_, 1);
  v33 = objc_msgSend(a1, sel_newDepthStencilStateWithDescriptor_, v32);
  if (!v33)
  {
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)&v18[OBJC_IVAR____TtC11HelloPoster9MetalView_depthStencilState] = v33;
  swift_unknownObjectRelease();
  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD6B8]), sel_init);
  v35 = (void *)sub_23DF6A1EC();
  v36 = objc_msgSend(v25, sel_newFunctionWithName_, v35);

  objc_msgSend(v34, sel_setVertexFunction_, v36);
  swift_unknownObjectRelease();
  v37 = (void *)sub_23DF6A1EC();
  v38 = objc_msgSend(v25, sel_newFunctionWithName_, v37);

  objc_msgSend(v34, sel_setFragmentFunction_, v38);
  swift_unknownObjectRelease();
  objc_msgSend(v34, sel_setDepthAttachmentPixelFormat_, objc_msgSend(v18, sel_depthStencilPixelFormat));
  objc_msgSend(v34, sel_setRasterSampleCount_, objc_msgSend(v18, sel_sampleCount));
  v39 = objc_msgSend(v34, sel_colorAttachments);
  v40 = objc_msgSend(v39, sel_objectAtIndexedSubscript_, 0);

  if (!v40)
  {
LABEL_15:
    __break(1u);
    return;
  }
  objc_msgSend(v40, sel_setPixelFormat_, objc_msgSend(v18, sel_colorPixelFormat));

  v45 = 0;
  v41 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v34, &v45);
  if (v41)
  {
    v42 = v45;
    swift_unknownObjectRelease();

  }
  else
  {
    v43 = v45;
    v44 = (void *)sub_23DF6A180();

    swift_willThrow();
    swift_unknownObjectRelease();

  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  *(_QWORD *)&v18[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundPipelineState] = v41;
  swift_unknownObjectRelease();
}

uint64_t type metadata accessor for MetalView()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242649264]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23DF58AAC(char a1)
{
  char *v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  _BYTE v46[9];
  id v47;
  void *v48;
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(v1, sel_device);
  if (!v3)
    return;
  v4 = v3;
  v5 = *(void **)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_library];
  if (!v5)
  {
    swift_unknownObjectRelease();
    return;
  }
  v6 = (void *)(a1 & 1);
  v49 = 1;
  v48 = v6;
  v7 = objc_allocWithZone(MEMORY[0x24BDDD5A0]);
  swift_unknownObjectRetain();
  v8 = objc_msgSend(v7, sel_init);
  objc_msgSend(v8, sel_setConstantValue_type_atIndex_, &v49, 53, 0);
  objc_msgSend(v8, sel_setConstantValue_type_atIndex_, &v48, 29, 1);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD6B8]), sel_init);
  v10 = (void *)sub_23DF6A1EC();
  v47 = 0;
  v44 = v8;
  v11 = objc_msgSend(v5, sel_newFunctionWithName_constantValues_error_, v10, v8, &v47);

  if (v11)
  {
    v12 = v47;
  }
  else
  {
    v13 = v47;
    v14 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  objc_msgSend(v9, sel_setVertexFunction_, v11);
  swift_unknownObjectRelease();
  v15 = (void *)sub_23DF6A1EC();
  v47 = 0;
  v16 = objc_msgSend(v5, sel_newFunctionWithName_constantValues_error_, v15, v44, &v47);

  if (v16)
  {
    v17 = v47;
  }
  else
  {
    v18 = v47;
    v19 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  objc_msgSend(v9, sel_setFragmentFunction_, v16);
  swift_unknownObjectRelease();
  objc_msgSend(v9, sel_setDepthAttachmentPixelFormat_, objc_msgSend(v1, sel_depthStencilPixelFormat));
  objc_msgSend(v9, sel_setRasterSampleCount_, objc_msgSend(v1, sel_sampleCount));
  v20 = objc_msgSend(v9, sel_colorAttachments);
  v21 = objc_msgSend(v20, sel_objectAtIndexedSubscript_, 0);

  if (!v21)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    return;
  }
  objc_msgSend(v21, sel_setPixelFormat_, objc_msgSend(v1, sel_colorPixelFormat));

  v47 = 0;
  v22 = objc_msgSend(v4, sel_newRenderPipelineStateWithDescriptor_error_, v9, &v47);
  if (v22)
  {
    v23 = v47;
  }
  else
  {
    v24 = v47;
    v25 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  *(_QWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_textPipelineState] = v22;
  swift_unknownObjectRelease();
  v46[0] = 0;
  v47 = v6;
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD5A0]), sel_init);
  objc_msgSend(v26, sel_setConstantValue_type_atIndex_, v46, 53, 0);
  objc_msgSend(v26, sel_setConstantValue_type_atIndex_, &v47, 29, 1);
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD6B8]), sel_init);
  v28 = (void *)sub_23DF6A1EC();
  v45 = 0;
  v29 = objc_msgSend(v5, sel_newFunctionWithName_constantValues_error_, v28, v26, &v45);

  if (v29)
  {
    v30 = v45;
  }
  else
  {
    v31 = v45;
    v32 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  objc_msgSend(v27, sel_setVertexFunction_, v29);
  swift_unknownObjectRelease();
  v33 = (void *)sub_23DF6A1EC();
  v45 = 0;
  v34 = objc_msgSend(v5, sel_newFunctionWithName_constantValues_error_, v33, v26, &v45);

  if (v34)
  {
    v35 = v45;
  }
  else
  {
    v36 = v45;
    v37 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  objc_msgSend(v27, sel_setFragmentFunction_, v34);
  swift_unknownObjectRelease();
  objc_msgSend(v27, sel_setDepthAttachmentPixelFormat_, objc_msgSend(v1, sel_depthStencilPixelFormat));
  objc_msgSend(v27, sel_setRasterSampleCount_, objc_msgSend(v1, sel_sampleCount));
  v38 = objc_msgSend(v27, sel_colorAttachments);
  v39 = objc_msgSend(v38, sel_objectAtIndexedSubscript_, 0);

  if (!v39)
    goto LABEL_27;
  objc_msgSend(v39, sel_setPixelFormat_, objc_msgSend(v1, sel_colorPixelFormat));

  v45 = 0;
  v40 = objc_msgSend(v4, sel_newRenderPipelineStateWithDescriptor_error_, v27, &v45);
  if (v40)
  {
    v41 = v45;
  }
  else
  {
    v42 = v45;
    v43 = (void *)sub_23DF6A180();

    swift_willThrow();
  }
  *(_QWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_penPipelineState] = v40;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

id sub_23DF5914C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id result;
  float32x4_t v14;
  uint64_t v15;
  float32x2_t *v16;
  float32x4_t v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  void *v26;
  char *v27;
  id v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256D1AC68);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23DF6A198();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = MEMORY[0x242649354](&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_shareGeometryWithView]);
  if (!v11)
  {
    result = objc_msgSend(v1, sel_device);
    if (!result)
      return result;
    v27 = v10;
    v28 = result;
    type metadata accessor for BundleClass();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v20 = (void *)sub_23DF6A1EC();
    v21 = (void *)sub_23DF6A1EC();
    v22 = (void *)sub_23DF6A1EC();
    v23 = objc_msgSend(v19, sel_URLForResource_withExtension_subdirectory_, v20, v21, v22);

    if (v23)
    {
      sub_23DF6A18C();

      v24 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v24(v3, v8, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
      {
        v25 = v27;
        v24(v27, v3, v4);
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v25, v4);
        type metadata accessor for CursiveText();
        swift_allocObject();
        v26 = v28;
        swift_unknownObjectRetain();
        *(_QWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText] = sub_23DF644AC((uint64_t)v8, v26);
        swift_unknownObjectRelease();
        swift_release();
        result = (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v25, v4);
        goto LABEL_3;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    }
    swift_unknownObjectRelease();
    return (id)sub_23DF5B130((uint64_t)v3);
  }
  v12 = (void *)v11;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText] = *(_QWORD *)(v11
                                                                                  + OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText);
  swift_retain();

  result = (id)swift_release();
LABEL_3:
  v15 = *(_QWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText];
  if (v15)
  {
    v16 = *(float32x2_t **)(v15 + 168);
    if (v16)
    {
      *(float32x2_t *)v14.f32 = vsub_f32(v16[8], v16[6]);
      v14.f32[2] = v16[9].f32[0] - v16[7].f32[0];
      v17 = vmulq_f32(v14, v14);
      *(float *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraDistance] = (float)((float)((float)(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]) * 0.5)
                                                                                            * 1.1)
                                                                                    / 0.42262)
                                                                            + 1.0;
    }
  }
  *(_DWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperAnimationPosition] = -1082130432;
  return result;
}

void sub_23DF594DC(uint64_t *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint32_t *p_align;
  _OWORD *v7;
  unint64_t v8;
  uint64_t v9;
  float v10;
  unint64_t v11;
  uint64_t *v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  id v23;
  void *v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  __int128 v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  id v36;
  void **v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  _OWORD *v46;
  uint64_t v47;
  uint32_t *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint32_t *v58;
  _OWORD *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;

  v3 = a1[1];
  if (v3)
  {
    v4 = *a1;
    v5 = a1[2];
    p_align = (uint32_t *)a1[3];
    v7 = (_OWORD *)a1[4];
    v52 = a1[5];
    v9 = a1[6];
    v8 = a1[7];
    v51 = *a2;
    v10 = *(float *)&v8;
    v11 = HIDWORD(v8);
    v12 = (uint64_t *)(v2 + OBJC_IVAR____TtC11HelloPoster9MetalView_configuration);
    v45 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11HelloPoster9MetalView_configuration + 8);
    v47 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11HelloPoster9MetalView_configuration);
    *v12 = *a1;
    v12[1] = v3;
    v12[2] = v5;
    v12[3] = (uint64_t)p_align;
    v12[4] = (uint64_t)v7;
    v12[5] = v52;
    v12[6] = v9;
    v12[7] = v8;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    v13 = v8;
    sub_23DF5B0E0(v47, v45);
    v14 = (v4 >> 8) & 1;
    sub_23DF58AAC(BYTE1(v4) & 1);
    v49 = v5;
    v50 = v2;
    *(float *)(v2 + OBJC_IVAR____TtC11HelloPoster9MetalView_vertexUniforms + 152) = 1.0 - v10;
    v43 = v4;
    v44 = v13;
    v54 = v4;
    v15 = v11;
    v55 = v14;
    v56 = v3;
    v57 = v5;
    v46 = v7;
    v48 = p_align;
    v58 = p_align;
    v59 = v7;
    v60 = v52;
    v61 = v9;
    v62 = v13;
    v63 = v11;
    v53 = v51;
    v16 = sub_23DF5B320(&v53);
    v17 = v16;
    v18 = v16 & 0xC000000000000001;
    if ((v16 & 0xC000000000000001) != 0)
    {
      v19 = (id)MEMORY[0x242648E2C](0, v16);
    }
    else
    {
      if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_20;
      }
      v19 = *(id *)(v16 + 32);
    }
    v20 = v19;
    p_align = &stru_250EC1FE8.align;
    v21 = objc_msgSend(v19, sel_CGColor);

    sub_23DF5E120();
    v39 = v22;

    v7 = (_OWORD *)(v50 + OBJC_IVAR____TtC11HelloPoster9MetalView_fragmentUniforms);
    *(_OWORD *)(v50 + OBJC_IVAR____TtC11HelloPoster9MetalView_fragmentUniforms) = v39;
    if (v18)
    {
      v23 = (id)MEMORY[0x242648E2C](1, v17);
    }
    else
    {
      if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
        goto LABEL_22;
      v23 = *(id *)(v17 + 40);
    }
    v24 = v23;
    swift_bridgeObjectRelease();
    v25 = objc_msgSend(v24, sel_CGColor);

    sub_23DF5E120();
    v40 = v26;

    v7[1] = v40;
    v54 = v43;
    v55 = v14;
    v56 = v3;
    v57 = v49;
    v58 = v48;
    v59 = v46;
    v60 = v52;
    v61 = v9;
    v62 = v44;
    v63 = v15;
    v53 = v51;
    v27 = sub_23DF5B4A0(&v53);
    v17 = v27;
    v18 = v27 & 0xC000000000000001;
    if ((v27 & 0xC000000000000001) == 0)
    {
      if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v28 = *(id *)(v27 + 32);
LABEL_12:
        v29 = v28;
        v30 = objc_msgSend(v28, *((SEL *)p_align + 176));

        sub_23DF5E120();
        v41 = v31;

        v7[2] = v41;
        if (v18)
        {
          v32 = (id)MEMORY[0x242648E2C](1, v17);
LABEL_16:
          v33 = v32;
          swift_bridgeObjectRelease();
          v34 = objc_msgSend(v33, *((SEL *)p_align + 176));

          sub_23DF5E120();
          v42 = v35;

          v7[3] = v42;
          v54 = v43;
          v55 = v14;
          v56 = v3;
          v57 = v49;
          v58 = v48;
          v59 = v46;
          v60 = v52;
          v61 = v9;
          v62 = v44;
          v63 = v15;
          v53 = v51;
          v36 = sub_23DF5B620(&v53);
          v37 = (void **)(v50 + OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor);
          swift_beginAccess();
          v38 = *v37;
          *v37 = v36;

          sub_23DF5B0E0(v43, v3);
          return;
        }
        if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
        {
          v32 = *(id *)(v17 + 40);
          goto LABEL_16;
        }
LABEL_23:
        __break(1u);
        return;
      }
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
LABEL_20:
    v28 = (id)MEMORY[0x242648E2C](0, v17);
    goto LABEL_12;
  }
}

uint64_t sub_23DF5992C(void *a1)
{
  char *v1;
  id v2;
  id v3;
  id v4;
  uint64_t inited;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const __CFDictionary *v15;
  IOSurfaceRef v16;
  id v17;
  id v18;
  id v19;

  v2 = objc_msgSend(a1, sel_texture);
  v3 = objc_msgSend(v2, sel_width);
  v4 = objc_msgSend(v2, sel_height);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D1AC40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DF6AA50;
  v6 = (void *)*MEMORY[0x24BDD8FD0];
  v7 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDD8FD0];
  *(_QWORD *)(inited + 40) = v3;
  v8 = (void *)*MEMORY[0x24BDD8EB0];
  *(_QWORD *)(inited + 64) = v7;
  *(_QWORD *)(inited + 72) = v8;
  *(_QWORD *)(inited + 80) = v4;
  v9 = (void *)*MEMORY[0x24BDD8E30];
  *(_QWORD *)(inited + 104) = v7;
  *(_QWORD *)(inited + 112) = v9;
  *(_QWORD *)(inited + 120) = 4;
  v10 = (void *)*MEMORY[0x24BDD8EF8];
  *(_QWORD *)(inited + 144) = v7;
  *(_QWORD *)(inited + 152) = v10;
  *(_QWORD *)(inited + 184) = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 160) = 1111970369;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  sub_23DF59BA4(inited);
  type metadata accessor for CFString(0);
  sub_23DF580B4(&qword_256D1AA08, (uint64_t)&unk_23DF6A9FC);
  v15 = (const __CFDictionary *)sub_23DF6A1E0();
  swift_bridgeObjectRelease();
  v16 = IOSurfaceCreate(v15);

  if (v16)
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, objc_msgSend(v2, sel_pixelFormat), v3, v4, 0);
    objc_msgSend(v17, sel_setStorageMode_, objc_msgSend(v2, sel_storageMode));
    objc_msgSend(v17, sel_setUsage_, 6);
    v18 = objc_msgSend(v1, sel_device);
    if (v18)
    {
      v19 = objc_msgSend(v18, sel_newTextureWithDescriptor_iosurface_plane_, v17, v16, 0);
      swift_unknownObjectRelease();
    }
    else
    {
      v19 = 0;
    }
    *(_QWORD *)&v1[OBJC_IVAR____TtC11HelloPoster9MetalView_snapshotTexture] = v19;

    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

unint64_t sub_23DF59BA4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AC50);
  v2 = sub_23DF6A2B8();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23DF5B088(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_23DF59E34(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_23DF5B0D0(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23DF59CBC()
{
  _BYTE *v0;
  uint64_t result;

  v0[OBJC_IVAR____TtC11HelloPoster9MetalView_needsSnapshot] = 1;
  objc_msgSend(v0, sel_draw);
  result = *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_snapshotTexture];
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_snapshotTexture] = 0;
  return result;
}

id MetalView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetalView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23DF59E34(uint64_t a1)
{
  uint64_t v2;

  sub_23DF6A36C();
  type metadata accessor for CFString(0);
  sub_23DF580B4(&qword_256D1AC60, (uint64_t)&unk_23DF6A9D0);
  sub_23DF6A1C8();
  v2 = sub_23DF6A384();
  return sub_23DF59EB4(a1, v2);
}

unint64_t sub_23DF59EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_23DF580B4(&qword_256D1AC60, (uint64_t)&unk_23DF6A9D0);
    v7 = v6;
    v8 = sub_23DF6A1BC();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_23DF6A1BC();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_23DF59FEC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  __int128 v4;
  int v5;
  __int128 v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = 0;
    v3 = 4;
    if ((unint64_t)(v1 - 1) < 4)
      v3 = v1 - 1;
    v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 3)
      {
        __break(1u);
        goto LABEL_10;
      }
      v5 = *(_DWORD *)(result + 32 + 4 * v2);
      v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 3)
      goto LABEL_10;
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

void sub_23DF5A05C()
{
  _BYTE *v0;
  char *v1;
  _OWORD *v2;
  _OWORD *v3;
  _OWORD *v4;

  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperZoom] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperAnimationPosition] = 1065353216;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngle] = 0;
  v1 = &v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngleOverride];
  *(_DWORD *)v1 = 0;
  v1[4] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor] = 0;
  swift_unknownObjectWeakInit();
  v2 = &v0[OBJC_IVAR____TtC11HelloPoster9MetalView_configuration];
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_library] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_commandQueue] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_depthStencilState] = 0;
  v3 = &v0[OBJC_IVAR____TtC11HelloPoster9MetalView_vertexUniforms];
  *v3 = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  v3[3] = 0u;
  v3[4] = 0u;
  v3[5] = 0u;
  v3[6] = 0u;
  v3[7] = 0u;
  v3[8] = 0u;
  *(_OWORD *)((char *)v3 + 140) = 0u;
  v4 = &v0[OBJC_IVAR____TtC11HelloPoster9MetalView_fragmentUniforms];
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  *(_OWORD *)((char *)v4 + 60) = 0u;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundPipelineState] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundVerticesBuffer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_textPipelineState] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_textGeometry] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_penPipelineState] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_penGeometry] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraZNear] = 1065353216;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraZFar] = 1176256512;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraDefaultFieldOfView] = 1112014848;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraFieldOfView] = 1112014848;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraDistance] = 0;
  v0[OBJC_IVAR____TtC11HelloPoster9MetalView_needsSnapshot] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_snapshotTexture] = 0;

  sub_23DF6A2A0();
  __break(1u);
}

void sub_23DF5A248()
{
  char *v0;
  uint64_t *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  double Height;
  CGFloat Width;
  float v20;
  double v21;
  float32x4_t v22;
  uint64_t v23;
  __float2 v24;
  float32x4_t v25;
  double v26;
  __int128 v27;
  float32x4_t v28;
  __int128 v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  uint64_t v34;
  float v35;
  float v36;
  float32x4_t v37;
  float32x4_t *v38;
  float32x4_t v39;
  id v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float32x4_t *v63;
  uint64_t v64;
  float v65;
  float v66;
  float *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  float *v71;
  float32x4_t *v72;
  int v73;
  float v74;
  float32x4_t v75;
  unint64_t v76;
  float v77;
  float *f32;
  int v79;
  uint64_t v80;
  __int128 *v81;
  __int128 v82;
  uint64_t v83;
  float32x4_t v84;
  float v85;
  float32x4_t v86;
  float32x2_t v87;
  float v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float *v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  int v121;
  id v122;
  float32x2_t *v123;
  double v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  __int128 v137;
  __int128 v138;
  float32x4_t v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  id v146[2];
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  id v151[2];
  float32x2_t *v152;
  id v153;
  uint64_t v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  CGRect v168;
  CGRect v169;

  v167 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_configuration];
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_configuration + 8];
  if (!v2)
    return;
  v3 = v0;
  v4 = *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_cursiveText];
  if (!v4)
    return;
  v5 = *v1;
  v6 = v1[6];
  v7 = v1[7];
  swift_retain();
  v154 = v6;
  sub_23DF5B170(v5, v2);
  v8 = objc_msgSend(v3, sel_currentDrawable);
  if (!v8)
  {
    swift_release();
LABEL_28:
    sub_23DF5B0E0(v5, v2);
    return;
  }
  v9 = v8;
  v10 = *(void **)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_commandQueue];
  if (!v10 || (v11 = objc_msgSend(v10, sel_commandBuffer)) == 0)
  {
    swift_unknownObjectRelease();
    sub_23DF5B0E0(v5, v2);
    swift_release();
    return;
  }
  v153 = v11;
  v12 = objc_msgSend(v3, sel_currentRenderPassDescriptor);
  if (!v12)
  {
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_28;
  }
  v13 = *(_QWORD *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_textPipelineState];
  if (!v13
    || (v14 = *(_QWORD *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_penPipelineState]) == 0
    || (v152 = *(float32x2_t **)(v4 + 168)) == 0)
  {
    v70 = v12;
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    goto LABEL_28;
  }
  v150 = v12;
  v15 = *(_QWORD *)(v4 + 176);
  if (!v15)
  {
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    goto LABEL_28;
  }
  v142 = v7;
  v16 = *((float *)&v7 + 1);
  v147 = v15;
  v17 = v14;
  v149 = v13;
  swift_retain();
  swift_retain();
  v148 = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  objc_msgSend(v3, sel_bounds);
  Height = CGRectGetHeight(v168);
  objc_msgSend(v3, sel_bounds);
  Width = CGRectGetWidth(v169);
  v20 = *(float *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngle];
  v21 = Height / Width;
  v24 = __sincosf_stret(v20);
  *(float *)&v23 = v24.__cosval;
  v22.f32[0] = v24.__sinval;
  *(float32x4_t *)v151 = v22;
  v135.i64[0] = v23;
  v22.f32[0] = -v24.__sinval;
  v139 = v22;
  *(float32x2_t *)v25.f32 = sub_23DF57AC8();
  *(float *)&v27 = 0.0 - v25.f32[0];
  v140 = v27;
  *(float *)&v27 = 0.0 - v25.f32[1];
  v141 = v27;
  v28.i64[0] = 0;
  v28.f32[2] = -*(float *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_cameraDistance];
  v28.i32[3] = 1.0;
  v138 = xmmword_23DF6AA60;
  v137 = xmmword_23DF6AA70;
  v29 = *(_OWORD *)v151;
  *(float32x4_t *)v146 = vmlaq_f32(vaddq_f32(vmlsq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_23DF6AA60, v135.f32[0]), (float32x4_t)xmmword_23DF6AA70, (float32x2_t)v151[0], 0), (float32x4_t)0), (float32x4_t)0, v28);
  v145 = vmlaq_f32(vaddq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_23DF6AA60, *(float *)v151), (float32x4_t)xmmword_23DF6AA70, v135.f32[0]), (float32x4_t)0), (float32x4_t)0, v28);
  v144 = vmlaq_f32((float32x4_t)xmmword_23DF6AA80, (float32x4_t)0, v28);
  v143 = vaddq_f32(v28, (float32x4_t)0);
  v31 = v135;
  v31.i32[1] = v139.i32[0];
  v136 = v31;
  DWORD1(v29) = v135.i32[0];
  *(_OWORD *)v151 = v29;
  v31.i32[0] = 0;
  v134 = v31;
  v25.f32[0] = 0.0 - v25.f32[2];
  v139 = v25;
  *(float32x2_t *)v25.f32 = vsub_f32(v152[8], v152[6]);
  v25.f32[2] = v152[9].f32[0] - v152[7].f32[0];
  v32 = vmulq_f32(v25, v25);
  v33 = vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1));
  v34 = OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperZoom;
  v35 = (float)((float)(*(float *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperZoom] * -0.91) + 1.22)
      * (float)(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), v33).f32[0]) * 0.5);
  if (v3[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngleOverride + 4])
    v36 = v20;
  else
    v36 = *(float *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngleOverride];
  LODWORD(v26) = 1176256512;
  v33.i32[0] = 1.0;
  v30 = v21;
  v37.f32[0] = sub_23DF5E1C0(v35, v30, *(double *)v33.i64, v26, v36);
  v38 = (float32x4_t *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_vertexUniforms];
  v39 = (float32x4_t)v137;
  v40 = v151[0];
  v38[8].i64[0] = v136.i64[0];
  v38[8].i64[1] = (uint64_t)v40;
  v41 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v138, v37.f32[0]), v39, *(float32x2_t *)v37.f32, 1), (float32x4_t)xmmword_23DF6AA90, v37, 2), (float32x4_t)xmmword_23DF6AAA0, v37, 3);
  v43 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v138, v42.f32[0]), v39, *(float32x2_t *)v42.f32, 1), (float32x4_t)xmmword_23DF6AA90, v42, 2), (float32x4_t)xmmword_23DF6AAA0, v42, 3);
  v45 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v138, v44.f32[0]), v39, *(float32x2_t *)v44.f32, 1), (float32x4_t)xmmword_23DF6AA90, v44, 2), (float32x4_t)xmmword_23DF6AAA0, v44, 3);
  v47 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v138, v46.f32[0]), v39, *(float32x2_t *)v46.f32, 1), (float32x4_t)xmmword_23DF6AA90, v46, 2), (float32x4_t)xmmword_23DF6AAA0, v46, 3);
  v48 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, *(float *)v146), v43, (float32x2_t)v146[0], 1), v45, *(float32x4_t *)v146, 2), v47, *(float32x4_t *)v146, 3);
  v49 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, v145.f32[0]), v43, *(float32x2_t *)v145.f32, 1), v45, v145, 2), v47, v145, 3);
  v50 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, v144.f32[0]), v43, *(float32x2_t *)v144.f32, 1), v45, v144, 2), v47, v144, 3);
  v51 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, v143.f32[0]), v43, *(float32x2_t *)v143.f32, 1), v45, v143, 2), v47, v143, 3);
  v52 = vmulq_f32(v48, (float32x4_t)0);
  v53 = vmulq_n_f32(v48, *(float *)&v140);
  v54 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v48, (float32x4_t)0, v49), (float32x4_t)0, v50), (float32x4_t)0, v51);
  v55 = vmlaq_f32(vmlaq_f32(vaddq_f32(v49, v52), (float32x4_t)0, v50), (float32x4_t)0, v51);
  v56 = vmlaq_f32(vaddq_f32(v50, vmlaq_f32(v52, (float32x4_t)0, v49)), (float32x4_t)0, v51);
  v57 = vaddq_f32(v51, vmlaq_n_f32(vmlaq_n_f32(v53, v49, *(float *)&v141), v50, v139.f32[0]));
  v58 = 1.0;
  *v38 = v54;
  v38[1] = v55;
  v38[2] = v56;
  v38[3] = v57;
  v59 = *(float *)(v4 + 84);
  v60 = v16 / (float)(v59 / 2000.0);
  v61 = *(float *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperAnimationPosition];
  v62 = v61 * (float)(v60 + 1.0);
  *(_QWORD *)&v141 = v38;
  v135.i64[0] = v34;
  if (v61 >= 0.0 && v61 < 1.0)
  {
    v63 = *(float32x4_t **)(v4 + 136);
    v64 = v63[1].i64[0];
    if (v64)
    {
      v65 = v59 * v62;
      v66 = v63[3].f32[0];
      if ((float)(v59 * v62) <= v66)
      {
        v71 = &v63[3].f32[1];
        v67 = &v63[3].f32[2];
        v72 = v63 + 2;
        goto LABEL_32;
      }
      if (v64 != 1)
      {
        v67 = &v63[5].f32[2];
        v68 = 1;
        while (1)
        {
          v69 = v68 + 1;
          if (__OFADD__(v68, 1))
          {
            __break(1u);
            goto LABEL_66;
          }
          v66 = *(v67 - 2);
          if (v65 <= v66)
            break;
          v67 += 8;
          ++v68;
          if (v69 == v64)
            goto LABEL_48;
        }
        v71 = v67 - 1;
        v72 = (float32x4_t *)(v67 - 6);
LABEL_32:
        v73 = *(unsigned __int8 *)v67;
        v74 = *v71;
        v75 = *v72;
        v76 = v64 - 1;
        v77 = v63[2 * v64 + 1].f32[0];
        v136 = v41;
        v132 = v45;
        v133 = v43;
        v138 = (__int128)v47;
        v139 = v75;
        LODWORD(v140) = v73;
        if (v77 > v65)
        {
          if (v64 != 1)
          {
            v76 = v64 - 2;
            f32 = v63[2 * v64 - 1].f32;
            while ((uint64_t)v76 < v64)
            {
              if (*f32 <= v65)
                goto LABEL_39;
              --v76;
              f32 -= 8;
              if (v76 == -1)
                goto LABEL_38;
            }
LABEL_66:
            __break(1u);
          }
LABEL_38:
          v151[0] = &v130;
          swift_bridgeObjectRetain();
          v130 = 0;
          v131 = 0;
          *(_QWORD *)&v137 = 0;
          v79 = 2;
          goto LABEL_42;
        }
LABEL_39:
        *(_QWORD *)&v137 = v63 + 2;
        v151[0] = &v130;
        v80 = swift_bridgeObjectRetain();
        if ((v76 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v76 < *(_QWORD *)(v80 + 16))
        {
          v81 = (__int128 *)(v137 + 32 * v76);
          v82 = *v81;
          v83 = *((_QWORD *)v81 + 2);
          v79 = *((unsigned __int8 *)v81 + 24);
          *(_QWORD *)&v137 = *((_QWORD *)v81 + 1);
          v130 = v82;
          v131 = v83;
LABEL_42:
          swift_bridgeObjectRelease();
          v58 = 1.0;
          v38 = (float32x4_t *)v141;
          if (v79 != 2)
          {
            v85 = (float)(v65 - *(float *)&v131) / (float)(v66 - *(float *)&v131);
            v86.i64[0] = v130;
            v86.i64[1] = v137;
            *(float32x4_t *)v151 = vmlaq_n_f32(v86, vsubq_f32(v139, v86), v85);
            v84.f32[0] = (float)(*((float *)&v131 + 1) + (float)(v85 * (float)(v74 - *((float *)&v131 + 1))))
                       * *(float *)&v142;
            if (!(_DWORD)v140)
              v84.f32[0] = 0.0;
            if (!v79)
              v84.f32[0] = 0.0;
            v134 = v84;
            v87 = sub_23DF57AC8();
            v38 = (float32x4_t *)v141;
            v89 = vmlaq_f32(vmlaq_f32(vmlaq_f32(*(float32x4_t *)v146, (float32x4_t)0, v145), (float32x4_t)0, v144), (float32x4_t)0, v143);
            v90 = vmulq_f32(*(float32x4_t *)v146, (float32x4_t)0);
            v91 = vmlaq_f32(vmlaq_f32(vaddq_f32(v145, v90), (float32x4_t)0, v144), (float32x4_t)0, v143);
            v92 = vmlaq_f32(vaddq_f32(v144, vmlaq_f32(v90, (float32x4_t)0, v145)), (float32x4_t)0, v143);
            v93 = vaddq_f32(v143, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v146, *(float *)v151 + (float)(0.0 - v87.f32[0])), v145, *((float *)v151 + 1) + (float)(0.0 - v87.f32[1])), v144, *(float *)&v151[1] + (float)(0.0 - v88)));
            v94 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v89, v134.f32[0]), (float32x4_t)0, v91), (float32x4_t)0, v92), (float32x4_t)0, v93);
            v95 = vmulq_f32(v89, (float32x4_t)0);
            v96 = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(v95, v91, v134.f32[0]), (float32x4_t)0, v92), (float32x4_t)0, v93);
            v97 = vmlaq_f32(v95, (float32x4_t)0, v91);
            v98 = vmlaq_f32(vmlaq_n_f32(v97, v92, v134.f32[0]), (float32x4_t)0, v93);
            v99 = vaddq_f32(v93, vmlaq_f32(v97, (float32x4_t)0, v92));
            v100 = (float32x4_t)v138;
            v101 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v136, v94.f32[0]), v133, *(float32x2_t *)v94.f32, 1), v132, v94, 2), (float32x4_t)v138, v94, 3);
            v102 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v136, v96.f32[0]), v133, *(float32x2_t *)v96.f32, 1), v132, v96, 2), (float32x4_t)v138, v96, 3);
            v103 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v136, v98.f32[0]), v133, *(float32x2_t *)v98.f32, 1), v132, v98, 2), (float32x4_t)v138, v98, 3);
            v104 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v136, v99.f32[0]), v133, *(float32x2_t *)v99.f32, 1), v132, v99, 2);
            *(float32x4_t *)(v141 + 64) = v101;
            v38[5] = v102;
            v38[6] = v103;
            v38[7] = vmlaq_laneq_f32(v104, v100, v99, 3);
            v58 = 1.0;
          }
          goto LABEL_48;
        }
        __break(1u);
        goto LABEL_69;
      }
    }
  }
LABEL_48:
  v38[9].f32[0] = v62;
  v38[9].f32[1] = v62 - v60;
  v105 = (float *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_fragmentUniforms];
  v105[16] = v62;
  v105[17] = v58 + (float)(*(float *)&v3[v135.i64[0]] * -0.7);
  v106 = *(_QWORD *)(v4 + 136);
  v107 = *(_QWORD *)(v106 + 16);
  if (v107 && *(float *)(v106 + 32 * v107) < *(float *)(v106 + 32))
    v58 = -1.0;
  v105[18] = v58;
  v151[0] = objc_msgSend(v153, sel_renderCommandEncoderWithDescriptor_, v150, v130, v131);
  if (!v151[0])
    goto LABEL_56;
  v108 = *(_OWORD *)(v141 + 16);
  v109 = *(_OWORD *)(v141 + 32);
  v110 = *(_OWORD *)(v141 + 48);
  v111 = *(_OWORD *)(v141 + 64);
  v112 = *(_OWORD *)(v141 + 80);
  v113 = *(_OWORD *)(v141 + 96);
  v114 = *(_OWORD *)(v141 + 112);
  v115 = *(_QWORD *)(v141 + 128);
  v116 = *(_QWORD *)(v141 + 136);
  v117 = *(_DWORD *)(v141 + 152);
  v155 = *(_OWORD *)v141;
  v156 = v108;
  v157 = v109;
  v158 = v110;
  v159 = v111;
  v160 = v112;
  v161 = v113;
  v162 = v114;
  v163 = v115;
  v164 = v116;
  v165 = *(_QWORD *)(v141 + 144);
  v166 = v117;
  objc_msgSend(v151[0], sel_setVertexBytes_length_atIndex_, &v155, 160, 0);
  v118 = *((_OWORD *)v105 + 1);
  v119 = *((_OWORD *)v105 + 2);
  v120 = *((_OWORD *)v105 + 3);
  v121 = *((_DWORD *)v105 + 18);
  v155 = *(_OWORD *)v105;
  v156 = v118;
  v157 = v119;
  v158 = v120;
  *(_QWORD *)&v159 = *((_QWORD *)v105 + 8);
  DWORD2(v159) = v121;
  objc_msgSend(v151[0], sel_setFragmentBytes_length_atIndex_, &v155, 80, 0);
  if (!*(_QWORD *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundPipelineState])
  {
LABEL_69:
    __break(1u);
    return;
  }
  v122 = v151[0];
  objc_msgSend(v151[0], sel_setRenderPipelineState_);
  objc_msgSend(v122, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_backgroundVerticesBuffer], 0, 1);
  objc_msgSend(v122, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
  objc_msgSend(v122, sel_setRenderPipelineState_, v149);
  objc_msgSend(v122, sel_setDepthStencilState_, *(_QWORD *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_depthStencilState]);
  v123 = v152;
  objc_msgSend(v151[0], sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)&v152[2], 0, 1);
  objc_msgSend(v151[0], sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, 3, *(_QWORD *)&v123[4], 1, *(_QWORD *)&v123[3], 0);
  v124 = *(double *)v134.i64;
  if (v134.f32[0] > 0.0)
  {
    objc_msgSend(v151[0], sel_setRenderPipelineState_, v148, *(double *)v134.i64);
    v125 = v147;
    objc_msgSend(v151[0], sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v147 + 16), 0, 1);
    objc_msgSend(v151[0], sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, 3, *(_QWORD *)(v125 + 32), 1, *(_QWORD *)(v125 + 24), 0);
  }
  objc_msgSend(v151[0], sel_endEncoding, v124);
  swift_unknownObjectRelease();
LABEL_56:
  v126 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v126, sel_setAllowsDisplayCompositing_, 0);

  v151[0] = (id)OBJC_IVAR____TtC11HelloPoster9MetalView_needsSnapshot;
  if (v3[OBJC_IVAR____TtC11HelloPoster9MetalView_needsSnapshot] == 1)
  {
    sub_23DF5992C(v9);
    v127 = *(_QWORD *)&v3[OBJC_IVAR____TtC11HelloPoster9MetalView_snapshotTexture];
    if (v127)
    {
      swift_unknownObjectRetain();
      v128 = objc_msgSend(v153, sel_blitCommandEncoder);
      if (v128)
      {
        v146[0] = v128;
        v145.i64[0] = (uint64_t)objc_msgSend(v9, sel_texture);
        objc_msgSend(v146[0], sel_copyFromTexture_toTexture_, v145.i64[0], v127);
        swift_unknownObjectRelease();
        objc_msgSend(v146[0], sel_endEncoding);
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
    }
  }
  v129 = v153;
  objc_msgSend(v153, sel_presentDrawable_, v9);
  objc_msgSend(v129, sel_commit);
  if (v3[(unint64_t)v151[0]] == 1)
  {
    objc_msgSend(v129, sel_waitUntilCompleted);
    swift_release();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_23DF5B0E0(v5, v2);
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    v3[(unint64_t)v151[0]] = 0;
  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_23DF5B0E0(v5, v2);
    swift_release();
    swift_release();
  }
}

id sub_23DF5AFB8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for MetalView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MetalView.preferredProminentColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MetalView.preferredProminentColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of MetalView.preferredProminentColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MetalView.snapshotAsTexture()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x368))();
}

uint64_t sub_23DF5B088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23DF5B0D0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23DF5B0E0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23DF5B130(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_256D1AC68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DF5B170(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_23DF5B1C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DF6A24C();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23DF5B258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  v2 = sub_23DF6A24C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23DF5B2C4()
{
  sub_23DF5B258();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Randomizer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Randomizer);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24264924C](a1, v6, a5);
}

uint64_t sub_23DF5B320(_BYTE *a1)
{
  int v1;
  char v2;
  char v3;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  if (*a1)
  {
    v2 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        v3 = sub_23DF6A354();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D1ACF8);
          v4 = swift_allocObject();
          *(_OWORD *)(v4 + 16) = xmmword_23DF6AB70;
          v5 = (void *)objc_opt_self();
          *(_QWORD *)(v4 + 32) = objc_msgSend(v5, sel_blackColor);
          *(_QWORD *)(v4 + 40) = objc_msgSend(v5, sel_blackColor);
          sub_23DF6A234();
          return v4;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF5B4A0(_BYTE *a1)
{
  int v1;
  char v2;
  char v3;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  if (*a1)
  {
    v2 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        v3 = sub_23DF6A354();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D1ACF8);
          v4 = swift_allocObject();
          *(_OWORD *)(v4 + 16) = xmmword_23DF6AB70;
          v5 = (void *)objc_opt_self();
          *(_QWORD *)(v4 + 32) = objc_msgSend(v5, sel_whiteColor);
          *(_QWORD *)(v4 + 40) = objc_msgSend(v5, sel_whiteColor);
          sub_23DF6A234();
          return v4;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRetain();
}

id sub_23DF5B620(_BYTE *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char v9;

  v2 = *a1;
  v3 = *(_QWORD *)(v1 + 40);
  if (!*a1)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v6 = BYTE1(v3);
    v7 = (double)BYTE2(v3);
    v8 = v3;
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v7 / 255.0, (double)v6 / 255.0, (double)v8 / 255.0, 1.0);
  }
  v4 = *(_QWORD *)(v1 + 48);
  v5 = sub_23DF6A354();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    goto LABEL_5;
  if (v2 == 2)
  {
    v9 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      return objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v6 = BYTE1(v4);
  v7 = (double)BYTE2(v4);
  v8 = v4;
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v7 / 255.0, (double)v6 / 255.0, (double)v8 / 255.0, 1.0);
}

BOOL sub_23DF5B7C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23DF5B7D8()
{
  sub_23DF6A36C();
  sub_23DF6A378();
  return sub_23DF6A384();
}

uint64_t sub_23DF5B81C()
{
  return sub_23DF6A378();
}

uint64_t sub_23DF5B844()
{
  sub_23DF6A36C();
  sub_23DF6A378();
  return sub_23DF6A384();
}

_QWORD *sub_23DF5B884@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_23DF5B8A4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void Configuration.name.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *Configuration.name.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*Configuration.name.modify())()
{
  return nullsub_1;
}

uint64_t static Configuration.allConfigurations()()
{
  if (qword_256D1A630 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF5B91C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  id v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  id v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  id v191;
  id v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  id v215;
  id v216;
  uint64_t v217;
  uint64_t v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  id v227;
  uint64_t v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  id v238;
  id v239;
  id v240;
  uint64_t v241;
  uint64_t v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  id v254;
  id v255;
  uint64_t v256;
  uint64_t v257;
  id v258;
  uint64_t v259;
  uint64_t v260;
  id v261;
  id v262;
  id v263;
  uint64_t v264;
  uint64_t result;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AD00);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23DF6AB80;
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 0.75, 1.0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1ACF8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v2 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v2 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  type metadata accessor for Gradient();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), (SEL)0x250EC2BC8, 0.33, 1.0);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_blackColor);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v7 + 40) = v6;
  v276 = v7;
  sub_23DF6A234();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v276;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), (SEL)0x250EC2BC8, 0.15, 1.0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v10 + 32) = v9;
  *(_QWORD *)(v10 + 40) = v9;
  v277 = v10;
  sub_23DF6A234();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v277;
  v12 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v13 = v9;
  v14 = objc_msgSend(v12, sel_initWithWhite_alpha_, 0.66, 1.0);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 0.42, 1.0);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v16 + 32) = v14;
  *(_QWORD *)(v16 + 40) = v15;
  v278 = v16;
  sub_23DF6A234();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v278;
  *(_WORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = v8;
  *(_QWORD *)(v0 + 56) = v11;
  *(_QWORD *)(v0 + 64) = v17;
  *(_OWORD *)(v0 + 72) = xmmword_23DF6AB90;
  *(_QWORD *)(v0 + 88) = 0x3F0000003F666666;
  v18 = objc_msgSend(v5, sel_systemRedColor);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v19 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v19 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v266 = swift_allocObject();
  *(_QWORD *)(v266 + 16) = v19;
  v20 = objc_msgSend(v5, sel_whiteColor);
  v21 = objc_msgSend(v5, sel_whiteColor);
  v22 = objc_msgSend(v5, sel_blackColor);
  v23 = sub_23DF5E380(v22, 0.200000003);

  if (v23)
  {

    v21 = v23;
  }
  v24 = objc_msgSend(v5, sel_systemRedColor);
  v25 = sub_23DF5E380(v24, 0.5);
  if (v25)
  {
    v26 = v25;

    v21 = v26;
  }
  else
  {

  }
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v27 + 32) = v20;
  *(_QWORD *)(v27 + 40) = v21;
  v279 = v27;
  sub_23DF6A234();
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = v279;
  v29 = objc_msgSend(v5, sel_systemRedColor);
  v30 = objc_msgSend(v5, sel_blackColor);
  v31 = sub_23DF5E380(v30, 0.75);

  if (v31)
  {

    v29 = v31;
  }
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v32 + 32) = v29;
  *(_QWORD *)(v32 + 40) = v29;
  v280 = v32;
  sub_23DF6A234();
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v280;
  v34 = v29;
  v35 = objc_msgSend(v5, sel_systemRedColor);
  v36 = objc_msgSend(v5, sel_systemRedColor);
  v37 = objc_msgSend(v5, sel_blackColor);
  v38 = sub_23DF5E380(v37, 0.5);

  if (v38)
  {

    v36 = v38;
  }
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v39 + 32) = v35;
  *(_QWORD *)(v39 + 40) = v36;
  v281 = v39;
  sub_23DF6A234();
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = v281;
  *(_WORD *)(v0 + 96) = 1;
  *(_QWORD *)(v0 + 104) = v266;
  *(_QWORD *)(v0 + 112) = v28;
  *(_QWORD *)(v0 + 120) = v33;
  *(_QWORD *)(v0 + 128) = v40;
  *(_OWORD *)(v0 + 136) = xmmword_23DF6ABA0;
  *(_QWORD *)(v0 + 152) = 0x3F0000003F666666;
  v41 = objc_msgSend(v5, sel_systemOrangeColor);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v42 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v42 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v267 = swift_allocObject();
  *(_QWORD *)(v267 + 16) = v42;
  v43 = objc_msgSend(v5, sel_whiteColor);
  v44 = objc_msgSend(v5, sel_whiteColor);
  v45 = objc_msgSend(v5, sel_blackColor);
  v46 = sub_23DF5E380(v45, 0.200000003);

  if (v46)
  {

    v44 = v46;
  }
  v47 = objc_msgSend(v5, sel_systemOrangeColor);
  v48 = sub_23DF5E380(v47, 0.5);
  if (v48)
  {
    v49 = v48;

    v44 = v49;
  }
  else
  {

  }
  v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v50 + 32) = v43;
  *(_QWORD *)(v50 + 40) = v44;
  v282 = v50;
  sub_23DF6A234();
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = v282;
  v52 = objc_msgSend(v5, sel_systemOrangeColor);
  v53 = objc_msgSend(v5, sel_blackColor);
  v54 = sub_23DF5E380(v53, 0.75);

  if (v54)
  {

    v52 = v54;
  }
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v55 + 32) = v52;
  *(_QWORD *)(v55 + 40) = v52;
  v283 = v55;
  sub_23DF6A234();
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = v283;
  v57 = v52;
  v58 = objc_msgSend(v5, sel_systemOrangeColor);
  v59 = objc_msgSend(v5, sel_systemOrangeColor);
  v60 = objc_msgSend(v5, sel_blackColor);
  v61 = sub_23DF5E380(v60, 0.5);

  if (v61)
  {

    v59 = v61;
  }
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v62 + 32) = v58;
  *(_QWORD *)(v62 + 40) = v59;
  v284 = v62;
  sub_23DF6A234();
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = v284;
  *(_WORD *)(v0 + 160) = 2;
  *(_QWORD *)(v0 + 168) = v267;
  *(_QWORD *)(v0 + 176) = v51;
  *(_QWORD *)(v0 + 184) = v56;
  *(_QWORD *)(v0 + 192) = v63;
  *(_OWORD *)(v0 + 200) = xmmword_23DF6ABB0;
  *(_QWORD *)(v0 + 216) = 0x3F0000003F666666;
  v64 = objc_msgSend(v5, sel_systemYellowColor);
  v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v65 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v65 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v268 = swift_allocObject();
  *(_QWORD *)(v268 + 16) = v65;
  v66 = objc_msgSend(v5, sel_whiteColor);
  v67 = objc_msgSend(v5, sel_whiteColor);
  v68 = objc_msgSend(v5, sel_blackColor);
  v69 = sub_23DF5E380(v68, 0.200000003);

  if (v69)
  {

    v67 = v69;
  }
  v70 = objc_msgSend(v5, sel_systemYellowColor);
  v71 = sub_23DF5E380(v70, 0.5);
  if (v71)
  {
    v72 = v71;

    v67 = v72;
  }
  else
  {

  }
  v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v73 + 32) = v66;
  *(_QWORD *)(v73 + 40) = v67;
  v285 = v73;
  sub_23DF6A234();
  v74 = swift_allocObject();
  *(_QWORD *)(v74 + 16) = v285;
  v75 = objc_msgSend(v5, sel_systemYellowColor);
  v76 = objc_msgSend(v5, sel_blackColor);
  v77 = sub_23DF5E380(v76, 0.75);

  if (v77)
  {

    v75 = v77;
  }
  v78 = swift_allocObject();
  *(_OWORD *)(v78 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v78 + 32) = v75;
  *(_QWORD *)(v78 + 40) = v75;
  v286 = v78;
  sub_23DF6A234();
  v79 = swift_allocObject();
  *(_QWORD *)(v79 + 16) = v286;
  v80 = v75;
  v81 = objc_msgSend(v5, sel_systemYellowColor);
  v82 = objc_msgSend(v5, sel_systemYellowColor);
  v83 = objc_msgSend(v5, sel_blackColor);
  v84 = sub_23DF5E380(v83, 0.5);

  if (v84)
  {

    v82 = v84;
  }
  v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v85 + 32) = v81;
  *(_QWORD *)(v85 + 40) = v82;
  v287 = v85;
  sub_23DF6A234();
  v86 = swift_allocObject();
  *(_QWORD *)(v86 + 16) = v287;
  *(_WORD *)(v0 + 224) = 3;
  *(_QWORD *)(v0 + 232) = v268;
  *(_QWORD *)(v0 + 240) = v74;
  *(_QWORD *)(v0 + 248) = v79;
  *(_QWORD *)(v0 + 256) = v86;
  *(_QWORD *)(v0 + 264) = 16306762;
  *(_QWORD *)(v0 + 272) = 12887867;
  *(_QWORD *)(v0 + 280) = 0x3F0000003F666666;
  v87 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.207843137, 0.756862745, 0.031372549, 1.0);
  v88 = swift_allocObject();
  *(_OWORD *)(v88 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v88 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v88 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v269 = swift_allocObject();
  *(_QWORD *)(v269 + 16) = v88;
  v89 = objc_msgSend(v5, sel_whiteColor);
  v90 = objc_msgSend(v5, sel_whiteColor);
  v91 = objc_msgSend(v5, sel_blackColor);
  v92 = sub_23DF5E380(v91, 0.200000003);

  if (v92)
  {

    v90 = v92;
  }
  v93 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.207843137, 0.756862745, 0.031372549, 1.0);
  v94 = sub_23DF5E380(v93, 0.5);
  if (v94)
  {
    v95 = v94;

    v90 = v95;
  }
  else
  {

  }
  v96 = swift_allocObject();
  *(_OWORD *)(v96 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v96 + 32) = v89;
  *(_QWORD *)(v96 + 40) = v90;
  v288 = v96;
  sub_23DF6A234();
  v97 = swift_allocObject();
  *(_QWORD *)(v97 + 16) = v288;
  v98 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.207843137, 0.756862745, 0.031372549, 1.0);
  v99 = objc_msgSend(v5, sel_blackColor);
  v100 = sub_23DF5E380(v99, 0.75);

  if (v100)
  {

    v98 = v100;
  }
  v101 = swift_allocObject();
  *(_OWORD *)(v101 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v101 + 32) = v98;
  *(_QWORD *)(v101 + 40) = v98;
  v289 = v101;
  sub_23DF6A234();
  v102 = swift_allocObject();
  *(_QWORD *)(v102 + 16) = v289;
  v103 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v104 = v98;
  v105 = objc_msgSend(v103, sel_initWithRed_green_blue_alpha_, 0.207843137, 0.756862745, 0.031372549, 1.0);
  v106 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.207843137, 0.756862745, 0.031372549, 1.0);
  v107 = objc_msgSend(v5, (SEL)0x250EC2EC8);
  v108 = sub_23DF5E380(v107, 0.5);

  if (v108)
  {

    v106 = v108;
  }
  v109 = swift_allocObject();
  *(_OWORD *)(v109 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v109 + 32) = v105;
  *(_QWORD *)(v109 + 40) = v106;
  v290 = v109;
  sub_23DF6A234();
  v110 = swift_allocObject();
  *(_QWORD *)(v110 + 16) = v290;
  *(_WORD *)(v0 + 288) = 4;
  *(_QWORD *)(v0 + 296) = v269;
  *(_QWORD *)(v0 + 304) = v97;
  *(_QWORD *)(v0 + 312) = v102;
  *(_QWORD *)(v0 + 320) = v110;
  *(_QWORD *)(v0 + 328) = 9626218;
  *(_QWORD *)(v0 + 336) = 7516243;
  *(_QWORD *)(v0 + 344) = 0x3F0000003F666666;
  v111 = objc_msgSend(v5, sel_systemTealColor);
  v112 = swift_allocObject();
  *(_OWORD *)(v112 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v112 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v112 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v270 = swift_allocObject();
  *(_QWORD *)(v270 + 16) = v112;
  v113 = objc_msgSend(v5, sel_whiteColor);
  v114 = objc_msgSend(v5, sel_whiteColor);
  v115 = objc_msgSend(v5, sel_blackColor);
  v116 = sub_23DF5E380(v115, 0.200000003);

  if (v116)
  {

    v114 = v116;
  }
  v117 = objc_msgSend(v5, sel_systemTealColor);
  v118 = sub_23DF5E380(v117, 0.5);
  if (v118)
  {
    v119 = v118;

    v114 = v119;
  }
  else
  {

  }
  v120 = swift_allocObject();
  *(_OWORD *)(v120 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v120 + 32) = v113;
  *(_QWORD *)(v120 + 40) = v114;
  v291 = v120;
  sub_23DF6A234();
  v121 = swift_allocObject();
  *(_QWORD *)(v121 + 16) = v291;
  v122 = objc_msgSend(v5, sel_systemTealColor);
  v123 = objc_msgSend(v5, sel_blackColor);
  v124 = sub_23DF5E380(v123, 0.75);

  if (v124)
  {

    v122 = v124;
  }
  v125 = swift_allocObject();
  *(_OWORD *)(v125 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v125 + 32) = v122;
  *(_QWORD *)(v125 + 40) = v122;
  v292 = v125;
  sub_23DF6A234();
  v126 = swift_allocObject();
  *(_QWORD *)(v126 + 16) = v292;
  v127 = v122;
  v128 = objc_msgSend(v5, sel_systemTealColor);
  v129 = objc_msgSend(v5, sel_systemTealColor);
  v130 = objc_msgSend(v5, sel_blackColor);
  v131 = sub_23DF5E380(v130, 0.5);

  if (v131)
  {

    v129 = v131;
  }
  v132 = swift_allocObject();
  *(_OWORD *)(v132 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v132 + 32) = v128;
  *(_QWORD *)(v132 + 40) = v129;
  v293 = v132;
  sub_23DF6A234();
  v133 = swift_allocObject();
  *(_QWORD *)(v133 + 16) = v293;
  *(_WORD *)(v0 + 352) = 5;
  *(_QWORD *)(v0 + 360) = v270;
  *(_QWORD *)(v0 + 368) = v121;
  *(_QWORD *)(v0 + 376) = v126;
  *(_QWORD *)(v0 + 384) = v133;
  *(_QWORD *)(v0 + 392) = 8116464;
  *(_QWORD *)(v0 + 400) = 6335165;
  *(_QWORD *)(v0 + 408) = 0x3F0000003F666666;
  v134 = objc_msgSend(v5, sel_systemBlueColor);
  v135 = swift_allocObject();
  *(_OWORD *)(v135 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v135 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v135 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v271 = swift_allocObject();
  *(_QWORD *)(v271 + 16) = v135;
  v136 = objc_msgSend(v5, sel_whiteColor);
  v137 = objc_msgSend(v5, sel_whiteColor);
  v138 = objc_msgSend(v5, sel_blackColor);
  v139 = sub_23DF5E380(v138, 0.200000003);

  if (v139)
  {

    v137 = v139;
  }
  v140 = objc_msgSend(v5, sel_systemBlueColor);
  v141 = sub_23DF5E380(v140, 0.5);
  if (v141)
  {
    v142 = v141;

    v137 = v142;
  }
  else
  {

  }
  v143 = swift_allocObject();
  *(_OWORD *)(v143 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v143 + 32) = v136;
  *(_QWORD *)(v143 + 40) = v137;
  v294 = v143;
  sub_23DF6A234();
  v144 = swift_allocObject();
  *(_QWORD *)(v144 + 16) = v294;
  v145 = objc_msgSend(v5, sel_systemBlueColor);
  v146 = objc_msgSend(v5, sel_blackColor);
  v147 = sub_23DF5E380(v146, 0.75);

  if (v147)
  {

    v145 = v147;
  }
  v148 = swift_allocObject();
  *(_OWORD *)(v148 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v148 + 32) = v145;
  *(_QWORD *)(v148 + 40) = v145;
  v295 = v148;
  sub_23DF6A234();
  v149 = swift_allocObject();
  *(_QWORD *)(v149 + 16) = v295;
  v150 = v145;
  v151 = objc_msgSend(v5, sel_systemBlueColor);
  v152 = objc_msgSend(v5, sel_systemBlueColor);
  v153 = objc_msgSend(v5, sel_blackColor);
  v154 = sub_23DF5E380(v153, 0.5);

  if (v154)
  {

    v152 = v154;
  }
  v155 = swift_allocObject();
  *(_OWORD *)(v155 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v155 + 32) = v151;
  *(_QWORD *)(v155 + 40) = v152;
  v296 = v155;
  sub_23DF6A234();
  v156 = swift_allocObject();
  *(_QWORD *)(v156 + 16) = v296;
  *(_WORD *)(v0 + 416) = 6;
  *(_QWORD *)(v0 + 424) = v271;
  *(_QWORD *)(v0 + 432) = v144;
  *(_QWORD *)(v0 + 440) = v149;
  *(_QWORD *)(v0 + 448) = v156;
  *(_QWORD *)(v0 + 456) = 4228857;
  *(_QWORD *)(v0 + 464) = 3502028;
  *(_QWORD *)(v0 + 472) = 0x3F0000003F666666;
  v157 = objc_msgSend(v5, sel_systemIndigoColor);
  v158 = swift_allocObject();
  *(_OWORD *)(v158 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v158 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v158 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v272 = swift_allocObject();
  *(_QWORD *)(v272 + 16) = v158;
  v159 = objc_msgSend(v5, sel_whiteColor);
  v160 = objc_msgSend(v5, sel_whiteColor);
  v161 = objc_msgSend(v5, sel_blackColor);
  v162 = sub_23DF5E380(v161, 0.200000003);

  if (v162)
  {

    v160 = v162;
  }
  v163 = objc_msgSend(v5, sel_systemIndigoColor);
  v164 = sub_23DF5E380(v163, 0.5);
  if (v164)
  {
    v165 = v164;

    v160 = v165;
  }
  else
  {

  }
  v166 = swift_allocObject();
  *(_OWORD *)(v166 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v166 + 32) = v159;
  *(_QWORD *)(v166 + 40) = v160;
  v297 = v166;
  sub_23DF6A234();
  v167 = swift_allocObject();
  *(_QWORD *)(v167 + 16) = v297;
  v168 = objc_msgSend(v5, sel_systemIndigoColor);
  v169 = objc_msgSend(v5, sel_blackColor);
  v170 = sub_23DF5E380(v169, 0.75);

  if (v170)
  {

    v168 = v170;
  }
  v171 = swift_allocObject();
  *(_OWORD *)(v171 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v171 + 32) = v168;
  *(_QWORD *)(v171 + 40) = v168;
  v298 = v171;
  sub_23DF6A234();
  v172 = swift_allocObject();
  *(_QWORD *)(v172 + 16) = v298;
  v173 = v168;
  v174 = objc_msgSend(v5, sel_systemIndigoColor);
  v175 = objc_msgSend(v5, sel_systemIndigoColor);
  v176 = objc_msgSend(v5, sel_blackColor);
  v177 = sub_23DF5E380(v176, 0.5);

  if (v177)
  {

    v175 = v177;
  }
  v178 = swift_allocObject();
  *(_OWORD *)(v178 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v178 + 32) = v174;
  *(_QWORD *)(v178 + 40) = v175;
  v299 = v178;
  sub_23DF6A234();
  v179 = swift_allocObject();
  *(_QWORD *)(v179 + 16) = v299;
  *(_WORD *)(v0 + 480) = 7;
  *(_QWORD *)(v0 + 488) = v272;
  *(_QWORD *)(v0 + 496) = v167;
  *(_QWORD *)(v0 + 504) = v172;
  *(_QWORD *)(v0 + 512) = v179;
  *(_QWORD *)(v0 + 520) = 8092153;
  *(_QWORD *)(v0 + 528) = 6710476;
  *(_QWORD *)(v0 + 536) = 0x3F0000003F666666;
  v180 = objc_msgSend(v5, sel_systemPurpleColor);
  v181 = swift_allocObject();
  *(_OWORD *)(v181 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v181 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v181 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v273 = swift_allocObject();
  *(_QWORD *)(v273 + 16) = v181;
  v182 = objc_msgSend(v5, sel_whiteColor);
  v183 = objc_msgSend(v5, sel_whiteColor);
  v184 = objc_msgSend(v5, sel_blackColor);
  v185 = sub_23DF5E380(v184, 0.200000003);

  if (v185)
  {

    v183 = v185;
  }
  v186 = objc_msgSend(v5, sel_systemPurpleColor);
  v187 = sub_23DF5E380(v186, 0.5);
  if (v187)
  {
    v188 = v187;

    v183 = v188;
  }
  else
  {

  }
  v189 = swift_allocObject();
  *(_OWORD *)(v189 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v189 + 32) = v182;
  *(_QWORD *)(v189 + 40) = v183;
  v300 = v189;
  sub_23DF6A234();
  v190 = swift_allocObject();
  *(_QWORD *)(v190 + 16) = v300;
  v191 = objc_msgSend(v5, sel_systemPurpleColor);
  v192 = objc_msgSend(v5, sel_blackColor);
  v193 = sub_23DF5E380(v192, 0.75);

  if (v193)
  {

    v191 = v193;
  }
  v194 = swift_allocObject();
  *(_OWORD *)(v194 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v194 + 32) = v191;
  *(_QWORD *)(v194 + 40) = v191;
  v301 = v194;
  sub_23DF6A234();
  v195 = swift_allocObject();
  *(_QWORD *)(v195 + 16) = v301;
  v196 = v191;
  v197 = objc_msgSend(v5, sel_systemPurpleColor);
  v198 = objc_msgSend(v5, sel_systemPurpleColor);
  v199 = objc_msgSend(v5, sel_blackColor);
  v200 = sub_23DF5E380(v199, 0.5);

  if (v200)
  {

    v198 = v200;
  }
  v201 = swift_allocObject();
  *(_OWORD *)(v201 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v201 + 32) = v197;
  *(_QWORD *)(v201 + 40) = v198;
  v302 = v201;
  sub_23DF6A234();
  v202 = swift_allocObject();
  *(_QWORD *)(v202 + 16) = v302;
  *(_WORD *)(v0 + 544) = 8;
  *(_QWORD *)(v0 + 552) = v273;
  *(_QWORD *)(v0 + 560) = v190;
  *(_QWORD *)(v0 + 568) = v195;
  *(_QWORD *)(v0 + 576) = v202;
  *(_QWORD *)(v0 + 584) = 12547059;
  *(_QWORD *)(v0 + 592) = 10050498;
  *(_QWORD *)(v0 + 600) = 0x3F0000003F666666;
  v203 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 1.0, 0.580392157, 0.580392157, 1.0);
  v204 = swift_allocObject();
  *(_OWORD *)(v204 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v204 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v204 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v274 = swift_allocObject();
  *(_QWORD *)(v274 + 16) = v204;
  v205 = objc_msgSend(v5, sel_whiteColor);
  v206 = objc_msgSend(v5, sel_whiteColor);
  v207 = objc_msgSend(v5, sel_blackColor);
  v208 = sub_23DF5E380(v207, 0.200000003);

  if (v208)
  {

    v206 = v208;
  }
  v209 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 1.0, 0.580392157, 0.580392157, 1.0);
  v210 = sub_23DF5E380(v209, 0.5);
  if (v210)
  {
    v211 = v210;

    v206 = v211;
  }
  else
  {

  }
  v212 = swift_allocObject();
  *(_OWORD *)(v212 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v212 + 32) = v205;
  *(_QWORD *)(v212 + 40) = v206;
  v303 = v212;
  sub_23DF6A234();
  v213 = swift_allocObject();
  *(_QWORD *)(v213 + 16) = v303;
  v214 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 1.0, 0.580392157, 0.580392157, 1.0);
  v215 = objc_msgSend(v5, sel_blackColor);
  v216 = sub_23DF5E380(v215, 0.75);

  if (v216)
  {

    v214 = v216;
  }
  v217 = swift_allocObject();
  *(_OWORD *)(v217 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v217 + 32) = v214;
  *(_QWORD *)(v217 + 40) = v214;
  v304 = v217;
  sub_23DF6A234();
  v218 = swift_allocObject();
  *(_QWORD *)(v218 + 16) = v304;
  v219 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v220 = v214;
  v221 = objc_msgSend(v219, sel_initWithRed_green_blue_alpha_, 1.0, 0.580392157, 0.580392157, 1.0);
  v222 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 1.0, 0.580392157, 0.580392157, 1.0);
  v223 = objc_msgSend(v5, sel_blackColor);
  v224 = sub_23DF5E380(v223, 0.5);

  if (v224)
  {

    v222 = v224;
  }
  v225 = swift_allocObject();
  *(_OWORD *)(v225 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v225 + 32) = v221;
  *(_QWORD *)(v225 + 40) = v222;
  v305 = v225;
  sub_23DF6A234();
  v226 = swift_allocObject();
  *(_QWORD *)(v226 + 16) = v305;
  *(_WORD *)(v0 + 608) = 9;
  *(_QWORD *)(v0 + 616) = v274;
  *(_QWORD *)(v0 + 624) = v213;
  *(_QWORD *)(v0 + 632) = v218;
  *(_QWORD *)(v0 + 640) = v226;
  *(_QWORD *)(v0 + 648) = 16098467;
  *(_QWORD *)(v0 + 656) = 12747650;
  *(_QWORD *)(v0 + 664) = 0x3F0000003F666666;
  v227 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.88627451, 0.203921569, 0.721568627, 1.0);
  v228 = swift_allocObject();
  *(_OWORD *)(v228 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v228 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v228 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v275 = swift_allocObject();
  *(_QWORD *)(v275 + 16) = v228;
  v229 = objc_msgSend(v5, sel_whiteColor);
  v230 = objc_msgSend(v5, sel_whiteColor);
  v231 = objc_msgSend(v5, sel_blackColor);
  v232 = sub_23DF5E380(v231, 0.200000003);

  if (v232)
  {

    v230 = v232;
  }
  v233 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.88627451, 0.203921569, 0.721568627, 1.0);
  v234 = sub_23DF5E380(v233, 0.5);
  if (v234)
  {
    v235 = v234;

    v230 = v235;
  }
  else
  {

  }
  v236 = swift_allocObject();
  *(_OWORD *)(v236 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v236 + 32) = v229;
  *(_QWORD *)(v236 + 40) = v230;
  v306 = v236;
  sub_23DF6A234();
  v237 = swift_allocObject();
  *(_QWORD *)(v237 + 16) = v306;
  v238 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.88627451, 0.203921569, 0.721568627, 1.0);
  v239 = objc_msgSend(v5, sel_blackColor);
  v240 = sub_23DF5E380(v239, 0.75);

  if (v240)
  {

    v238 = v240;
  }
  v241 = swift_allocObject();
  *(_OWORD *)(v241 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v241 + 32) = v238;
  *(_QWORD *)(v241 + 40) = v238;
  v307 = v241;
  sub_23DF6A234();
  v242 = swift_allocObject();
  *(_QWORD *)(v242 + 16) = v307;
  v243 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v244 = v238;
  v245 = objc_msgSend(v243, sel_initWithRed_green_blue_alpha_, 0.88627451, 0.203921569, 0.721568627, 1.0);
  v246 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.88627451, 0.203921569, 0.721568627, 1.0);
  v247 = objc_msgSend(v5, sel_blackColor);
  v248 = sub_23DF5E380(v247, 0.5);

  if (v248)
  {

    v246 = v248;
  }
  v249 = swift_allocObject();
  *(_OWORD *)(v249 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v249 + 32) = v245;
  *(_QWORD *)(v249 + 40) = v246;
  v308 = v249;
  sub_23DF6A234();
  v250 = swift_allocObject();
  *(_QWORD *)(v250 + 16) = v308;
  *(_WORD *)(v0 + 672) = 10;
  *(_QWORD *)(v0 + 680) = v275;
  *(_QWORD *)(v0 + 688) = v237;
  *(_QWORD *)(v0 + 696) = v242;
  *(_QWORD *)(v0 + 704) = v250;
  *(_QWORD *)(v0 + 712) = 16081367;
  *(_QWORD *)(v0 + 720) = 12734123;
  *(_QWORD *)(v0 + 728) = 0x3F0000003F666666;
  v251 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 0.15, 1.0);
  v252 = swift_allocObject();
  *(_OWORD *)(v252 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v252 + 32) = sub_23DF5E4A4(0.15);
  *(_QWORD *)(v252 + 40) = sub_23DF5E4A4(-0.15);
  sub_23DF6A234();

  v253 = swift_allocObject();
  *(_QWORD *)(v253 + 16) = v252;
  v254 = objc_msgSend(v5, sel_whiteColor);
  v255 = objc_msgSend(v5, sel_whiteColor);
  v256 = swift_allocObject();
  *(_OWORD *)(v256 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v256 + 32) = v254;
  *(_QWORD *)(v256 + 40) = v255;
  v309 = v256;
  sub_23DF6A234();
  v257 = swift_allocObject();
  *(_QWORD *)(v257 + 16) = v309;
  v258 = objc_msgSend(v5, sel_blackColor);
  v259 = swift_allocObject();
  *(_OWORD *)(v259 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v259 + 32) = v258;
  *(_QWORD *)(v259 + 40) = v258;
  v310 = v259;
  sub_23DF6A234();
  v260 = swift_allocObject();
  *(_QWORD *)(v260 + 16) = v310;
  v261 = v258;
  v262 = objc_msgSend(v5, sel_whiteColor);
  v263 = objc_msgSend(v5, sel_whiteColor);
  v264 = swift_allocObject();
  *(_OWORD *)(v264 + 16) = xmmword_23DF6AB70;
  *(_QWORD *)(v264 + 32) = v262;
  *(_QWORD *)(v264 + 40) = v263;
  v311 = v264;
  sub_23DF6A234();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v311;
  *(_WORD *)(v0 + 736) = 267;
  *(_QWORD *)(v0 + 744) = v253;
  *(_QWORD *)(v0 + 752) = v257;
  *(_QWORD *)(v0 + 760) = v260;
  *(_QWORD *)(v0 + 768) = result;
  *(_QWORD *)(v0 + 776) = 11776947;
  *(_QWORD *)(v0 + 784) = 10066329;
  *(_QWORD *)(v0 + 792) = 0x3F0000003F666666;
  qword_256D1CF90 = v0;
  return result;
}

uint64_t destroy for Configuration()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Configuration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MaterialStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MaterialStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23DF5E044 + 4 * byte_23DF6AC15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DF5E078 + 4 * byte_23DF6AC10[v4]))();
}

uint64_t sub_23DF5E078(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF5E080(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF5E088);
  return result;
}

uint64_t sub_23DF5E094(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF5E09CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DF5E0A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF5E0A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF5E0B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DF5E0BC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MaterialStyle()
{
  return &type metadata for MaterialStyle;
}

unint64_t sub_23DF5E0DC()
{
  unint64_t result;

  result = qword_256D1ACF0;
  if (!qword_256D1ACF0)
  {
    result = MEMORY[0x24264927C](&unk_23DF6ACB4, &type metadata for MaterialStyle);
    atomic_store(result, (unint64_t *)&qword_256D1ACF0);
  }
  return result;
}

void sub_23DF5E120()
{
  CGColor *v0;
  CGColorSpace *v1;
  CGColorSpace *v2;
  CGColorRef CopyByMatchingToColorSpace;
  uint64_t v4;

  v1 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  if (v1)
  {
    v2 = v1;
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v1, kCGRenderingIntentDefault, v0, 0);

    if (CopyByMatchingToColorSpace)
    {
      v4 = sub_23DF6A240();
      if (v4)
      {
        if (*(_QWORD *)(v4 + 16) == 4)
        {
          swift_bridgeObjectRelease();

          return;
        }
        swift_bridgeObjectRelease();
      }

    }
  }
  else
  {
    __break(1u);
  }
}

float sub_23DF5E1C0(float a1, float a2, double a3, double a4, float a5)
{
  float v7;
  float v8;
  float v9;
  float result;

  v7 = sinf((float)(a5 + a5) + -1.5708);
  v8 = fminf(fmaxf((float)(asinf(v7) * 0.31831) + 0.5, 0.0), 1.0);
  v9 = a1 + (float)((float)((float)(v8 * v8) * (float)((float)(v8 * -2.0) + 3.0)) * (float)((float)(a1 / a2) - a1));
  result = 2.0 / (float)(v9 + v9);
  __asm { FMOV            V3.4S, #1.0 }
  return result;
}

float32x2_t sub_23DF5E2C8(float32x4_t a1, float a2, int32x4_t a3)
{
  __float2 v3;
  int8x16_t v4;
  float32x2_t v5;

  v3 = __sincosf_stret(a2);
  v4 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a3, a3), (int8x16_t)a3, 0xCuLL), vnegq_f32(a1)), (float32x4_t)a3, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
  v5.i32[0] = vextq_s8(v4, v4, 8uLL).u32[0];
  v5.i32[1] = v4.i32[0];
  return vadd_f32(vadd_f32(vmul_n_f32(*(float32x2_t *)a3.i8, v3.__cosval), vmul_n_f32(v5, v3.__sinval)), vmul_n_f32(vmul_n_f32(*(float32x2_t *)a1.f32, vmuls_lane_f32(a1.f32[2], (float32x4_t)a3, 2)+ vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(a1, (float32x4_t)a3))), 1.0 - v3.__cosval));
}

uint64_t sub_23DF5E370()
{
  return swift_deallocClassInstance();
}

id sub_23DF5E380(void *a1, double a2)
{
  void *v2;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13[2];

  v13[1] = *(double *)MEMORY[0x24BDAC8D0];
  v12 = 0.0;
  v13[0] = 0.0;
  v10 = 0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  objc_msgSend(v2, sel_getRed_green_blue_alpha_, v13, &v12, &v11, &v10);
  objc_msgSend(a1, sel_getRed_green_blue_alpha_, &v9, &v8, &v7, &v6);
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v9 * a2 + (1.0 - a2) * v13[0], v8 * a2 + (1.0 - a2) * v12, v7 * a2 + (1.0 - a2) * v11, 1.0);
}

id sub_23DF5E4A4(float a1)
{
  double v1;
  id v2;
  id v3;
  id v4;
  id v6;

  if (a1 >= 0.0)
  {
    v1 = a1;
    v2 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  }
  else
  {
    v1 = (float)-a1;
    v2 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  }
  v3 = v2;
  v4 = sub_23DF5E380(v3, v1);

  if (v4)
    return v4;
  else
    return v6;
}

uint64_t sub_23DF5E568()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

float UIInterfaceOrientation.rotationAngle.getter(uint64_t a1)
{
  float result;

  result = 0.0;
  if ((unint64_t)(a1 - 2) <= 2)
    return flt_23DF6AD0C[a1 - 2];
  return result;
}

uint64_t type metadata accessor for BundleClass()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Gradient()
{
  return objc_opt_self();
}

void sub_23DF5E5EC()
{
  uint64_t v0;
  uint64_t v1;
  int64_t *v2;
  int64_t *v3;

  v1 = *(_QWORD *)(v0 + 16);
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    if (v1)
    {
      v2 = sub_23DF60160(0, *(_QWORD *)(v1 + 16));
LABEL_6:
      *(_QWORD *)(v0 + 32) = v2;
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
  else if (v1)
  {
    v3 = sub_23DF60160(0, *(_QWORD *)(v1 + 16));
    sub_23DF6001C();
    v2 = v3;
    goto LABEL_6;
  }
  __break(1u);
}

void sub_23DF5E668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  if (*(_BYTE *)(v0 + 25) != 39)
    return;
  v1 = *(_QWORD *)(v0 + 16);
  if (!v1)
    goto LABEL_22;
  v2 = *(_QWORD *)(v0 + 32);
  if (!v2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v3 = *(_QWORD *)(v0 + 40);
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *(_QWORD *)(v2 + 16);
  if (v3 >= v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v5 = v2 + 32;
  v6 = *(_QWORD *)(v2 + 32 + 8 * v3);
  if ((v6 & 0x8000000000000000) != 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 >= *(_QWORD *)(v1 + 16))
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v4 < 2)
    return;
  *(_QWORD *)(v0 + 40) = v3 + 1;
  v7 = *(_QWORD *)(v2 + 16);
  if (v3 + 1 < v7)
    return;
  if (!v7)
    goto LABEL_21;
  v8 = *(_QWORD *)(v5 + 8 * v7 - 8);
  sub_23DF5E5EC();
  v9 = *(_QWORD *)(v0 + 32);
  if (!v9)
  {
LABEL_24:
    __break(1u);
    return;
  }
  v10 = *(_QWORD *)(v9 + 16) >= 3uLL && *(_QWORD *)(v9 + 32) == v8;
  *(_QWORD *)(v0 + 40) = v10;
}

uint64_t sub_23DF5E754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = HelloConfigurationName.rawValue.getter();
  v2 = v1;
  if (v0 == HelloConfigurationName.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23DF6A354();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23DF5E7E8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 1802658116;
    else
      v3 = 0x6974616D6F747541;
    if (v2 == 1)
      v4 = 0xE400000000000000;
    else
      v4 = 0xE900000000000063;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 1802658116;
      else
        v6 = 0x6974616D6F747541;
      if (v5 == 1)
        v7 = 0xE400000000000000;
      else
        v7 = 0xE900000000000063;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE500000000000000;
    v3 = 0x746867694CLL;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE500000000000000;
  if (v3 != 0x746867694CLL)
  {
LABEL_21:
    v8 = sub_23DF6A354();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23DF5E8F0(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 7105601;
  else
    v3 = 0x6572726566657250;
  if (v2)
    v4 = 0xE900000000000064;
  else
    v4 = 0xE300000000000000;
  if ((a2 & 1) != 0)
    v5 = 7105601;
  else
    v5 = 0x6572726566657250;
  if ((a2 & 1) != 0)
    v6 = 0xE300000000000000;
  else
    v6 = 0xE900000000000064;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_23DF6A354();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

double sub_23DF5E990()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23DF5E9D4(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DF5EA24())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_23DF5EA68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23DF5EAAC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DF5EAFC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_23DF5EB40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_23DF5EB84(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DF5EBD4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_23DF5EC18()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride);
  swift_beginAccess();
  return *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32);
}

uint64_t sub_23DF5EC6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride;
  result = swift_beginAccess();
  *(_DWORD *)v3 = a1;
  *(_BYTE *)(v3 + 4) = BYTE4(a1) & 1;
  return result;
}

uint64_t (*sub_23DF5ECBC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DF5ED00()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_23DF5ED44(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DF5ED8C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DF5EDD0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF5EE38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_23DF5EE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23DF5EEE8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23DF5EF2C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_23DF5EF78(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t (*sub_23DF5EFC8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DF5F00C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_23DF5F058(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t (*sub_23DF5F0A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DF5F0EC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_23DF5F138(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t (*sub_23DF5F188())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HelloView.__allocating_init(frame:shareGeometryWithView:)(void *a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  id v11;
  uint64_t v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_23DF605C8(a2, a3, a4, a5);

  return v12;
}

uint64_t HelloView.init(frame:shareGeometryWithView:)(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6;

  v6 = sub_23DF605C8(a2, a3, a4, a5);

  return v6;
}

id sub_23DF5F288()
{
  char *v0;
  unsigned __int8 v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  BOOL v7;
  char *v8;
  double *v9;
  float v10;
  double *v11;
  float v12;
  char *v13;
  char *v14;
  char v15;
  char *v16;
  unsigned __int8 v18[24];
  char v19[24];
  unsigned __int8 v20[24];

  sub_23DF5FD68(v20);
  v1 = v20[0];
  v2 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode];
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  v4 = *((_QWORD *)v2 + 1);
  v5 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_currentLanguageCode];
  v6 = *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_currentLanguageCode + 8];
  if (!v6 || (v3 == *(_QWORD *)v5 ? (v7 = v6 == v4) : (v7 = 0), !v7 && (sub_23DF6A354() & 1) == 0))
  {
    swift_bridgeObjectRetain();
    sub_23DF5914C();
    *(_QWORD *)v5 = v3;
    *((_QWORD *)v5 + 1) = v4;
    swift_bridgeObjectRelease();
  }
  v8 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName];
  swift_beginAccess();
  v19[0] = *v8;
  v18[0] = v1;
  sub_23DF5F630(v19, v18);
  v9 = (double *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress];
  swift_beginAccess();
  v10 = *v9;
  *(float *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperZoom] = fminf(fmaxf(v10, 0.0), 1.0);
  v11 = (double *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress];
  swift_beginAccess();
  v12 = *v11;
  *(float *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperAnimationPosition] = fminf(fmaxf(v12, 0.0), 1.0);
  v13 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle];
  swift_beginAccess();
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngle] = *(_DWORD *)v13;
  v14 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride];
  swift_beginAccess();
  v15 = v14[4];
  v16 = &v0[OBJC_IVAR____TtC11HelloPoster9MetalView_wallpaperRotationAngleOverride];
  *(_DWORD *)v16 = *(_DWORD *)v14;
  v16[4] = v15;
  return objc_msgSend(v0, sel_setNeedsDisplay);
}

void sub_23DF5F48C()
{
  uint64_t v0;
  uint64_t v1;
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _BYTE *v10;
  char v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  uint64_t v14;

  v1 = v0;
  Current = CFAbsoluteTimeGetCurrent();
  v3 = OBJC_IVAR____TtC11HelloPoster9HelloView_lastLanguageChange;
  if (Current - *(double *)(v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_lastLanguageChange) > 60.0)
  {
    v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_userLanguagesRandomizer);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 16);
      if (!v5)
      {
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      if (*(_QWORD *)(v5 + 16))
      {
        v6 = sub_23DF632DC(*(_BYTE *)(v5 + 32));
        v8 = v7;
        v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
LABEL_13:
        swift_beginAccess();
        *v9 = v6;
        v9[1] = v8;
        swift_bridgeObjectRelease();
        *(CFAbsoluteTime *)(v1 + v3) = CFAbsoluteTimeGetCurrent();
        return;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  v10 = (_BYTE *)(v0 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode);
  swift_beginAccess();
  if (*v10 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
      goto LABEL_11;
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_allLanguagesRandomizer))
  {
LABEL_12:
    swift_retain();
    sub_23DF5E668();
    v13 = v12;
    swift_release();
    v6 = sub_23DF632DC(v13);
    v8 = v14;
    v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
    goto LABEL_13;
  }
  __break(1u);
LABEL_11:
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_userLanguagesRandomizer))
    goto LABEL_12;
LABEL_17:
  __break(1u);
}

uint64_t sub_23DF5F630(char *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21[9];

  v3 = v2;
  v19 = *a1;
  v4 = *a2;
  v5 = OBJC_IVAR____TtC11HelloPoster9HelloView_currentConfigurationName;
  v6 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC11HelloPoster9HelloView_currentConfigurationName);
  if (v6 == 12)
    goto LABEL_22;
  LOBYTE(v21[0]) = *a1;
  v20 = v6;
  v7 = HelloConfigurationName.rawValue.getter();
  v9 = v8;
  if (v7 == HelloConfigurationName.rawValue.getter() && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
      goto LABEL_22;
  }
  v12 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC11HelloPoster9HelloView_currentAppearanceMode);
  if (v12 != 3)
  {
    if (v4)
    {
      if (v4 == 1)
      {
        v13 = 0xE400000000000000;
        v14 = 1802658116;
        if (!v12)
        {
LABEL_16:
          v15 = 0xE500000000000000;
          if (v14 != 0x746867694CLL)
            goto LABEL_21;
          goto LABEL_19;
        }
      }
      else
      {
        v14 = 0x6974616D6F747541;
        v13 = 0xE900000000000063;
        if (!v12)
          goto LABEL_16;
      }
    }
    else
    {
      v13 = 0xE500000000000000;
      v14 = 0x746867694CLL;
      if (!v12)
        goto LABEL_16;
    }
    if (v12 == 1)
    {
      v15 = 0xE400000000000000;
      if (v14 != 1802658116)
        goto LABEL_21;
    }
    else
    {
      v15 = 0xE900000000000063;
      if (v14 != 0x6974616D6F747541)
        goto LABEL_21;
    }
LABEL_19:
    if (v13 == v15)
      return swift_bridgeObjectRelease_n();
LABEL_21:
    v17 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      return result;
  }
LABEL_22:
  if (qword_256D1A630 != -1)
    swift_once();
  v18 = qword_256D1CF90;
  if (*(_QWORD *)(qword_256D1CF90 + 16))
  {
    swift_bridgeObjectRetain_n();
    __asm { BR              X8 }
  }
  memset(v21, 0, 64);
  v20 = v4;
  sub_23DF594DC(v21, &v20);
  result = sub_23DF5B0E0(0, 0);
  *(_BYTE *)(v3 + v5) = v19;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC11HelloPoster9HelloView_currentAppearanceMode) = v4;
  return result;
}

uint64_t sub_23DF5FD68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char *v3;
  char v4;
  uint64_t result;
  char v6;
  _QWORD *v7;

  v3 = (char *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode);
  swift_beginAccess();
  if (*v3 && *v3 != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v4 = sub_23DF6A354();
  result = swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
LABEL_6:
    v7 = (_QWORD *)(v1 + OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle);
    result = swift_beginAccess();
    v6 = *v7 == 2;
    goto LABEL_7;
  }
  v6 = *v3;
LABEL_7:
  *a1 = v6;
  return result;
}

id HelloView.__allocating_init(frame:device:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(v5), sel_initWithFrame_device_, a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v6;
}

void HelloView.init(frame:device:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23DF5FF38()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

id HelloView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HelloView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23DF6001C()
{
  char **v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v1 = *v0;
  v2 = *((_QWORD *)*v0 + 2);
  v3 = v2 - 2;
  if (v2 >= 2)
  {
    v4 = 0;
    while (1)
    {
      v13 = 0;
      MEMORY[0x2426492F4](&v13, 8);
      v6 = (v13 * (unsigned __int128)v2) >> 64;
      if (v2 > v13 * v2)
      {
        v7 = -(uint64_t)v2 % v2;
        if (v7 > v13 * v2)
        {
          do
          {
            v13 = 0;
            MEMORY[0x2426492F4](&v13, 8);
          }
          while (v7 > v13 * v2);
          v6 = (v13 * (unsigned __int128)v2) >> 64;
        }
      }
      v8 = v4 + v6;
      if (__OFADD__(v4, v6))
        break;
      if (v4 != v8)
      {
        v9 = *((_QWORD *)v1 + 2);
        if (v4 >= v9)
          goto LABEL_19;
        if (v8 >= v9)
          goto LABEL_20;
        v10 = *(_QWORD *)&v1[8 * v4 + 32];
        v11 = *(_QWORD *)&v1[8 * v8 + 32];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_23DF6045C((uint64_t)v1);
        v12 = *((_QWORD *)v1 + 2);
        if (v4 >= v12)
          goto LABEL_21;
        *(_QWORD *)&v1[8 * v4 + 32] = v11;
        if (v8 >= v12)
          goto LABEL_22;
        *(_QWORD *)&v1[8 * v8 + 32] = v10;
        *v0 = v1;
      }
      --v2;
      if (v4++ == v3)
        return;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
}

int64_t *sub_23DF60160(int64_t *result, int64_t a2)
{
  uint64_t v2;
  int64_t v4;
  int64_t *v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8[3];

  v2 = a2 - (_QWORD)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v2)
      return (int64_t *)MEMORY[0x24BEE4AF8];
    v4 = (int64_t)result;
    if (v2 <= 0)
    {
      v5 = (int64_t *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AF00);
      v5 = (int64_t *)swift_allocObject();
      v6 = _swift_stdlib_malloc_size(v5);
      v7 = v6 - 32;
      if (v6 < 32)
        v7 = v6 - 25;
      v5[2] = v2;
      v5[3] = 2 * (v7 >> 3);
    }
    result = sub_23DF6031C(v8, v5 + 4, v2, v4, a2);
    if (result == (int64_t *)v2)
      return v5;
  }
  __break(1u);
  return result;
}

char *sub_23DF60224(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AF00);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

int64_t *sub_23DF6031C(int64_t *result, int64_t *a2, uint64_t a3, int64_t a4, int64_t a5)
{
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int64_t *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64x2_t v14;
  int64x2_t *v15;
  int64x2_t v16;
  int64_t *v17;
  int64_t v18;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (int64_t *)a3;
  }
  if (a3 < 0)
    goto LABEL_31;
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4)
    goto LABEL_32;
  v6 = a5 - a4;
  if (a5 > a4)
  {
    v5 = a4 + 1;
    *a2 = a4;
    if (a3 == 1)
      goto LABEL_7;
    if (v5 == a5)
    {
      a3 = 1;
      v5 = a5;
      goto LABEL_7;
    }
    v7 = v6 - 2;
    if (v6 - 2 >= (unint64_t)(a3 - 2))
      v7 = a3 - 2;
    if (v7 >= ~a4 + a5)
      v7 = ~a4 + a5;
    v8 = v7 + 1;
    if (v8 >= 5)
    {
      v11 = v8 & 3;
      if ((v8 & 3) == 0)
        v11 = 4;
      v12 = v8 - v11;
      v13 = v5 + v8 - v11;
      v10 = &a2[v8 - v11];
      v9 = v12 + 2;
      v14 = vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_23DF6AD50);
      v15 = (int64x2_t *)(a2 + 3);
      v16 = vdupq_n_s64(2uLL);
      do
      {
        v15[-1] = v14;
        *v15 = vaddq_s64(v14, v16);
        v14 = vaddq_s64(v14, vdupq_n_s64(4uLL));
        v15 += 2;
        v12 -= 4;
      }
      while (v12);
      v5 = v13;
    }
    else
    {
      v9 = 2;
      v10 = a2;
    }
    v17 = v10 + 1;
    while (v5 < a5)
    {
      v18 = v5 + 1;
      *v17 = v5;
      if (a3 == v9)
      {
        ++v5;
        goto LABEL_7;
      }
      ++v9;
      ++v17;
      ++v5;
      if (a5 == v18)
      {
        v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_23DF6045C(uint64_t a1)
{
  return sub_23DF60224(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23DF60470@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v6;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = *(_QWORD *)(result + 16);
  if (v6)
  {
    v26 = a6;
    v9 = a2 >> 16;
    v10 = a3 >> 16;
    v11 = (uint64_t *)(result + 64);
    while (1)
    {
      v12 = *(v11 - 4);
      v13 = *(v11 - 3);
      v14 = *(v11 - 2);
      v15 = *(v11 - 1);
      v16 = *v11;
      v17 = (v13 & 0x2000000000000000) != 0 ? HIBYTE(v13) & 0xF : v12 & 0xFFFFFFFFFFFFLL;
      v18 = v12 == a4 && v13 == a5;
      v19 = v18 && v9 == 0;
      if (v19 && v17 == v10)
        break;
      v28 = *v11;
      v27 = *(v11 - 1);
      v21 = *(v11 - 2);
      v22 = a4;
      v23 = a5;
      v24 = v9;
      v25 = v10;
      result = sub_23DF6A348();
      if ((result & 1) != 0)
      {
        v14 = v21;
        v15 = v27;
        v16 = v28;
        goto LABEL_22;
      }
      v11 += 5;
      --v6;
      a4 = v22;
      a5 = v23;
      v9 = v24;
      v10 = v25;
      if (!v6)
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        goto LABEL_23;
      }
    }
    v12 = a4;
LABEL_22:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
LABEL_23:
    a6 = v26;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  *a6 = v12;
  a6[1] = v13;
  a6[2] = v14;
  a6[3] = v15;
  a6[4] = v16;
  return result;
}

uint64_t sub_23DF605C8(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  objc_class *v22;
  id v23;
  id v24;
  uint64_t ObjCClassFromMetadata;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t *v40;
  char *v41;
  BOOL v42;
  _QWORD *v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t *v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  _QWORD *v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v78;
  unint64_t v79;
  __int128 v80;
  __int128 v81;
  unint64_t *v82;
  unint64_t v83;
  uint64_t v84;
  BOOL v85;
  char *v86;
  _QWORD *v87;
  BOOL v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  char *v94;
  char *v95;
  char v96;
  char v97;
  unint64_t v98;
  unint64_t v99;
  _QWORD **v100;
  unint64_t v101;
  unint64_t v103;
  unint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char v109;
  char v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unsigned __int8 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t result;
  uint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  _QWORD *v132;
  unint64_t v133;
  char *v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  char *v140;
  objc_super v141;
  _QWORD v142[5];
  _OWORD v143[2];
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;

  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_256D1AC68);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v121 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v124 = (uint64_t)&v121 - v17;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress] = 0x3FF0000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress] = 0;
  *(_DWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle] = 0;
  v18 = &v4[OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride];
  *(_DWORD *)v18 = 0;
  v18[4] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle] = 0;
  v19 = &v4[OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode];
  *v19 = 0;
  v19[1] = 0xE000000000000000;
  v4[OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName] = 6;
  v4[OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode] = 2;
  v4[OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode] = 1;
  v20 = &v4[OBJC_IVAR____TtC11HelloPoster9HelloView_currentLanguageCode];
  *v20 = 0;
  v20[1] = 0;
  v4[OBJC_IVAR____TtC11HelloPoster9HelloView_currentConfigurationName] = 12;
  v4[OBJC_IVAR____TtC11HelloPoster9HelloView_currentAppearanceMode] = 3;
  v4[OBJC_IVAR____TtC11HelloPoster9HelloView_currentLanguageMode] = 2;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_allLanguagesRandomizer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_userLanguagesRandomizer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11HelloPoster9HelloView_lastLanguageChange] = 0;
  v21 = MTLCreateSystemDefaultDevice();
  v22 = (objc_class *)type metadata accessor for HelloView();
  v141.receiver = v4;
  v141.super_class = v22;
  v23 = objc_msgSendSuper2(&v141, sel_initWithFrame_device_, v21, a1, a2, a3, a4);
  swift_unknownObjectRelease();
  v24 = v23;
  objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v123 = v24;
  swift_unknownObjectWeakAssign();
  type metadata accessor for BundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v26 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v27 = (void *)sub_23DF6A1EC();
  v28 = sub_23DF6A1EC();
  v29 = (void *)sub_23DF6A1EC();
  v30 = objc_msgSend(v26, sel_URLForResource_withExtension_subdirectory_, v27, v28, v29);

  if (v30)
  {
    sub_23DF6A18C();

    v31 = sub_23DF6A198();
    (*(void (**)(char *, _QWORD, uint64_t, unint64_t))(*(_QWORD *)(v31 - 8) + 56))(v16, 0, 1, v31);
  }
  else
  {
    v31 = sub_23DF6A198();
    (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(*(_QWORD *)(v31 - 8) + 56))(v16, 1, 1, v31);
  }
  v32 = v124;
  sub_23DF62338((uint64_t)v16, v124, qword_256D1AC68);
  sub_23DF62268(v32, (uint64_t)v13);
  sub_23DF6A198();
  v33 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, unint64_t))(v33 + 48))(v13, 1, v31) == 1)
  {
    __break(1u);
    goto LABEL_171;
  }
  v34 = sub_23DF6A1A4();
  v36 = v35;
  (*(void (**)(_QWORD *, unint64_t))(v33 + 8))(v13, v31);
  sub_23DF6A174();
  swift_allocObject();
  sub_23DF6A168();
  sub_23DF622B0();
  sub_23DF6A15C();
  swift_release();
  v125 = 0;
  v140 = (char *)MEMORY[0x24BEE4AF8];
  v33 = (unint64_t)&v140;
  v138 = (_QWORD *)swift_bridgeObjectRetain();
  sub_23DF631F0((uint64_t)v138);
  v37 = (unint64_t)v140;
  v38 = *((_QWORD *)v140 + 2);
  v131 = v34;
  v122 = v36;
  v137 = v38;
  if (v38)
  {
    v136 = (uint64_t)(v140 + 32);
    swift_bridgeObjectRetain();
    v34 = 0;
    v39 = (char *)MEMORY[0x24BEE4AF8];
    v135 = v37;
    while (1)
    {
      if (v34 >= *(_QWORD *)(v37 + 16))
        goto LABEL_162;
      v40 = (uint64_t *)(v136 + 40 * v34);
      v31 = v40[1];
      v139 = *v40;
      v36 = v40[2];
      v13 = (_QWORD *)v40[3];
      v28 = v40[4];
      v41 = v39;
      v5 = *((_QWORD *)v39 + 2);
      if (!v5)
        break;
      v42 = v36 == *((_QWORD *)v39 + 6) && v13 == *((_QWORD **)v39 + 7);
      if (!v42 && (sub_23DF6A354() & 1) == 0)
      {
        if (v5 == 1)
          break;
        v43 = v39 + 96;
        v44 = 1;
        while (1)
        {
          v33 = v44 + 1;
          if (__OFADD__(v44, 1))
            goto LABEL_163;
          v45 = v36 == *(v43 - 1) && v13 == (_QWORD *)*v43;
          if (v45 || (sub_23DF6A354() & 1) != 0)
            break;
          v43 += 5;
          ++v44;
          if (v33 == v5)
            goto LABEL_26;
        }
        v39 = v41;
      }
      v37 = v135;
LABEL_9:
      if (++v34 == v137)
      {
        swift_bridgeObjectRelease_n();
        v34 = v131;
        goto LABEL_33;
      }
    }
LABEL_26:
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v39 = v41;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v39 = sub_23DF669C8(0, v5 + 1, 1, v41);
    v46 = v139;
    v33 = *((_QWORD *)v39 + 2);
    v47 = *((_QWORD *)v39 + 3);
    v5 = v33 + 1;
    if (v33 >= v47 >> 1)
      v39 = sub_23DF669C8((char *)(v47 > 1), v33 + 1, 1, v39);
    v37 = v135;
    *((_QWORD *)v39 + 2) = v5;
    v48 = &v39[40 * v33];
    *((_QWORD *)v48 + 4) = v46;
    *((_QWORD *)v48 + 5) = v31;
    *((_QWORD *)v48 + 6) = v36;
    *((_QWORD *)v48 + 7) = v13;
    *((_QWORD *)v48 + 8) = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  v39 = (char *)MEMORY[0x24BEE4AF8];
LABEL_33:
  v140 = v39;
  swift_bridgeObjectRetain();
  v49 = sub_23DF6A1B0();
  v13 = (_QWORD *)v49;
  v50 = *(_QWORD *)(v49 + 16);
  v134 = v39;
  v128 = v50;
  if (v50)
  {
    v36 = 0;
    v137 = v138[2];
    v127 = v49 + 32;
    v132 = v138 + 4;
    v28 = MEMORY[0x24BEE4AF8];
    v126 = (_QWORD *)v49;
    while (1)
    {
      if (v36 >= v13[2])
        goto LABEL_165;
      v139 = v28;
      v133 = v36;
      v52 = (uint64_t *)(v127 + 16 * v36);
      v28 = *v52;
      v36 = v52[1];
      if (v137)
        break;
      swift_bridgeObjectRetain();
      v61 = v138;
LABEL_62:
      v65 = HIBYTE(v36) & 0xF;
      if ((v36 & 0x2000000000000000) == 0)
        v65 = v28 & 0xFFFFFFFFFFFFLL;
      if (v65)
      {
        v33 = 4 * v65;
        while (1)
        {
          swift_bridgeObjectRetain();
          v5 = sub_23DF6A21C();
          v67 = v66;
          swift_bridgeObjectRelease();
          if (v5 == 45 && v67 == 0xE100000000000000)
            break;
          v68 = sub_23DF6A354();
          swift_bridgeObjectRelease();
          if ((v68 & 1) != 0 || v33 == (unint64_t)sub_23DF6A204() >> 14)
            goto LABEL_73;
        }
        swift_bridgeObjectRelease();
      }
LABEL_73:
      v31 = sub_23DF6A228();
      v70 = v69;
      v72 = v71;
      v74 = v73;
      swift_bridgeObjectRelease();
      v75 = (uint64_t)v61;
      v76 = v125;
      sub_23DF60470(v75, v31, v70, v72, v74, v142);
      v125 = v76;
      swift_bridgeObjectRelease();
      sub_23DF62338((uint64_t)v142, (uint64_t)v143, &qword_256D1AF18);
      if (!*((_QWORD *)&v143[0] + 1))
      {
        v39 = v134;
        v28 = v139;
        goto LABEL_36;
      }
      v145 = v143[0];
      v146 = v143[1];
      v147 = v144;
      v28 = v139;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v39 = v134;
      v13 = v126;
      v51 = v133;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v28 = (uint64_t)sub_23DF669C8(0, *(_QWORD *)(v28 + 16) + 1, 1, (char *)v28);
      v33 = *(_QWORD *)(v28 + 16);
      v78 = *(_QWORD *)(v28 + 24);
      v31 = v33 + 1;
      if (v33 >= v78 >> 1)
        v28 = (uint64_t)sub_23DF669C8((char *)(v78 > 1), v33 + 1, 1, (char *)v28);
      *(_QWORD *)(v28 + 16) = v31;
      v79 = v28 + 40 * v33;
      v80 = v145;
      v81 = v146;
      *(_QWORD *)(v79 + 64) = v147;
      *(_OWORD *)(v79 + 32) = v80;
      *(_OWORD *)(v79 + 48) = v81;
LABEL_37:
      v36 = v51 + 1;
      if (v36 == v128)
      {
        swift_bridgeObjectRelease();
        goto LABEL_81;
      }
    }
    v31 = (unint64_t)v138;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v53 = 0;
    while (v53 < *(_QWORD *)(v31 + 16))
    {
      v54 = &v132[5 * v53];
      v55 = v54[1];
      v33 = v54[3];
      v13 = (_QWORD *)v54[4];
      if (v13)
        v5 = v54[4];
      else
        v5 = MEMORY[0x24BEE4AF8];
      v56 = *(_QWORD *)(v5 + 16);
      if (v56)
      {
        v129 = *v54;
        v130 = v54[2];
        swift_bridgeObjectRetain_n();
        v136 = v55;
        swift_bridgeObjectRetain();
        v135 = v33;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v57 = sub_23DF6A210();
        swift_bridgeObjectRelease();
        if ((v57 & 1) != 0)
        {
LABEL_56:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v28 = v139;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v28 = (uint64_t)sub_23DF669C8(0, *(_QWORD *)(v28 + 16) + 1, 1, (char *)v28);
          v34 = v131;
          v39 = v134;
          v33 = v135;
          v31 = *(_QWORD *)(v28 + 16);
          v62 = *(_QWORD *)(v28 + 24);
          if (v31 >= v62 >> 1)
            v28 = (uint64_t)sub_23DF669C8((char *)(v62 > 1), v31 + 1, 1, (char *)v28);
          *(_QWORD *)(v28 + 16) = v31 + 1;
          v63 = (_QWORD *)(v28 + 40 * v31);
          v64 = v136;
          v63[4] = v129;
          v63[5] = v64;
          v63[6] = v130;
          v63[7] = v33;
          v63[8] = v13;
LABEL_36:
          v13 = v126;
          v51 = v133;
          goto LABEL_37;
        }
        v33 = 0;
        v58 = v5 + 56;
        v31 = v56 - 1;
        while (v31 != v33)
        {
          if (++v33 >= *(_QWORD *)(v5 + 16))
          {
            __break(1u);
LABEL_128:
            if (v53 == 1)
              goto LABEL_174;
            v100 = (_QWORD **)(v138 + 13);
            v34 = 1;
            do
            {
              v101 = v34 + 1;
              if (__OFADD__(v34, 1))
                goto LABEL_167;
              v36 = (unint64_t)*(v100 - 4);
              v33 = (unint64_t)*(v100 - 3);
              v28 = (uint64_t)*(v100 - 2);
              v31 = (unint64_t)*(v100 - 1);
              v13 = *v100;
              if (v36 == 28261 && v33 == 0xE200000000000000)
                goto LABEL_138;
              if ((sub_23DF6A354() & 1) != 0)
              {
                swift_bridgeObjectRetain();
                goto LABEL_140;
              }
              v100 += 5;
              ++v34;
            }
            while (v101 != v53);
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_138:
            v33 = 0xE200000000000000;
            swift_bridgeObjectRetain();
            v36 = 28261;
LABEL_140:
            v34 = v131;
            goto LABEL_141;
          }
          v59 = v58 + 16;
          swift_bridgeObjectRetain();
          v60 = sub_23DF6A210();
          swift_bridgeObjectRelease();
          v58 = v59;
          if ((v60 & 1) != 0)
            goto LABEL_56;
        }
        v34 = v131;
        v33 = v135;
      }
      else
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      ++v53;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v31 = (unint64_t)v138;
      if (v53 == v137)
      {
        swift_bridgeObjectRelease();
        v61 = (_QWORD *)v31;
        goto LABEL_62;
      }
    }
    __break(1u);
LABEL_162:
    __break(1u);
LABEL_163:
    __break(1u);
LABEL_164:
    __break(1u);
LABEL_165:
    __break(1u);
LABEL_166:
    __break(1u);
LABEL_167:
    __break(1u);
    goto LABEL_168;
  }
  swift_bridgeObjectRelease();
  v28 = MEMORY[0x24BEE4AF8];
LABEL_81:
  v137 = *(_QWORD *)(v28 + 16);
  if (!v137)
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
      goto LABEL_110;
LABEL_121:
    v53 = v138[2];
    if (!v53)
      goto LABEL_173;
    v36 = v138[4];
    v33 = v138[5];
    v28 = v138[6];
    v31 = v138[7];
    v13 = (_QWORD *)v138[8];
    if (v36 == 28261 && v33 == 0xE200000000000000)
    {
      v33 = 0xE200000000000000;
      swift_bridgeObjectRetain();
      v36 = 28261;
    }
    else
    {
      if ((sub_23DF6A354() & 1) == 0)
        goto LABEL_128;
      swift_bridgeObjectRetain();
    }
LABEL_141:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_142;
    goto LABEL_169;
  }
  v136 = v28 + 32;
  swift_bridgeObjectRetain();
  v34 = 0;
  v5 = MEMORY[0x24BEE4AF8];
  v33 = 40;
  v139 = v28;
  do
  {
    if (v34 >= *(_QWORD *)(v28 + 16))
      goto LABEL_164;
    v82 = (unint64_t *)(v136 + 40 * v34);
    v83 = *v82;
    v31 = v82[1];
    v36 = v82[2];
    v13 = (_QWORD *)v82[3];
    v28 = v82[4];
    v84 = *(_QWORD *)(v5 + 16);
    if (!v84)
    {
      v135 = *v82;
LABEL_103:
      v86 = (char *)v5;
LABEL_104:
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v5 = (uint64_t)v86;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = (uint64_t)sub_23DF669C8(0, v84 + 1, 1, v86);
      v89 = v135;
      v91 = *(_QWORD *)(v5 + 16);
      v90 = *(_QWORD *)(v5 + 24);
      if (v91 >= v90 >> 1)
        v5 = (uint64_t)sub_23DF669C8((char *)(v90 > 1), v91 + 1, 1, (char *)v5);
      *(_QWORD *)(v5 + 16) = v91 + 1;
      v92 = (_QWORD *)(v5 + 40 * v91);
      v33 = 40;
      v92[4] = v89;
      v92[5] = v31;
      v92[6] = v36;
      v92[7] = v13;
      v92[8] = v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_84;
    }
    v85 = v36 == *(_QWORD *)(v5 + 48) && v13 == *(_QWORD **)(v5 + 56);
    if (v85 || (sub_23DF6A354() & 1) != 0)
      goto LABEL_84;
    v135 = v83;
    if (v84 == 1)
      goto LABEL_103;
    v86 = (char *)v5;
    v87 = (_QWORD *)(v5 + 96);
    v33 = 1;
    while (1)
    {
      v5 = v33 + 1;
      if (__OFADD__(v33, 1))
        goto LABEL_166;
      v88 = v36 == *(v87 - 1) && v13 == (_QWORD *)*v87;
      if (v88 || (sub_23DF6A354() & 1) != 0)
        break;
      v87 += 5;
      ++v33;
      if (v5 == v84)
        goto LABEL_104;
    }
    v5 = (uint64_t)v86;
    v33 = 40;
LABEL_84:
    ++v34;
    v39 = v134;
    v28 = v139;
  }
  while (v34 != v137);
  swift_bridgeObjectRelease_n();
  v34 = v131;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_121;
LABEL_110:
  swift_bridgeObjectRelease();
  v93 = *((_QWORD *)v39 + 2);
  if (!v93)
    goto LABEL_145;
LABEL_111:
  swift_bridgeObjectRetain();
  v94 = v39 + 40;
  v95 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    swift_bridgeObjectRetain();
    v96 = sub_23DF670A8();
    if (v96 != 39)
    {
      v97 = v96;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v95 = sub_23DF668E0(0, *((_QWORD *)v95 + 2) + 1, 1, v95);
      v99 = *((_QWORD *)v95 + 2);
      v98 = *((_QWORD *)v95 + 3);
      if (v99 >= v98 >> 1)
        v95 = sub_23DF668E0((char *)(v98 > 1), v99 + 1, 1, v95);
      *((_QWORD *)v95 + 2) = v99 + 1;
      v95[v99 + 32] = v97;
    }
    v94 += 40;
    --v93;
  }
  while (v93);
  swift_bridgeObjectRelease();
  while (1)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1AF10);
    v106 = swift_allocObject();
    *(_QWORD *)(v106 + 32) = 0;
    *(_QWORD *)(v106 + 40) = 0;
    *(_QWORD *)(v106 + 16) = v95;
    *(_WORD *)(v106 + 24) = 9984;
    sub_23DF5E5EC();
    v13 = v123;
    *(_QWORD *)((char *)v123 + OBJC_IVAR____TtC11HelloPoster9HelloView_allLanguagesRandomizer) = v106;
    swift_release();
    v28 = *(_QWORD *)(v5 + 16);
    if (v28)
    {
      swift_bridgeObjectRetain_n();
      v107 = v5 + 40;
      v108 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        swift_bridgeObjectRetain();
        v109 = sub_23DF670A8();
        if (v109 != 39)
        {
          v110 = v109;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v108 = sub_23DF668E0(0, *((_QWORD *)v108 + 2) + 1, 1, v108);
          v112 = *((_QWORD *)v108 + 2);
          v111 = *((_QWORD *)v108 + 3);
          if (v112 >= v111 >> 1)
            v108 = sub_23DF668E0((char *)(v111 > 1), v112 + 1, 1, v108);
          *((_QWORD *)v108 + 2) = v112 + 1;
          v108[v112 + 32] = v110;
          v34 = v131;
        }
        v107 += 40;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease_n();
      v13 = v123;
    }
    else
    {
      v108 = (char *)MEMORY[0x24BEE4AF8];
    }
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 32) = 0;
    *(_QWORD *)(v31 + 40) = 0;
    *(_QWORD *)(v31 + 16) = v108;
    *(_WORD *)(v31 + 24) = 9984;
    sub_23DF5E5EC();
    v33 = OBJC_IVAR____TtC11HelloPoster9HelloView_userLanguagesRandomizer;
    *(_QWORD *)((char *)v13 + OBJC_IVAR____TtC11HelloPoster9HelloView_userLanguagesRandomizer) = v31;
    swift_release();
    v113 = *(_QWORD *)((char *)v13 + v33);
    if (!v113)
      break;
    v114 = *(_QWORD *)(v113 + 16);
    v36 = v122;
    if (!v114)
      goto LABEL_172;
    if (*(_QWORD *)(v114 + 16))
    {
      v115 = *(_BYTE *)(v114 + 32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v116 = sub_23DF632DC(v115);
      v118 = v117;
      v119 = (_QWORD *)((char *)v13 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
      swift_beginAccess();
      *v119 = v116;
      v119[1] = v118;
      swift_bridgeObjectRelease();
      sub_23DF5F288();

      sub_23DF622F4(v34, v36);
      sub_23DF5B130(v124);
      return (uint64_t)v13;
    }
LABEL_168:
    __break(1u);
LABEL_169:
    v5 = (uint64_t)sub_23DF669C8(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
LABEL_142:
    v104 = *(_QWORD *)(v5 + 16);
    v103 = *(_QWORD *)(v5 + 24);
    if (v104 >= v103 >> 1)
      v5 = (uint64_t)sub_23DF669C8((char *)(v103 > 1), v104 + 1, 1, (char *)v5);
    *(_QWORD *)(v5 + 16) = v104 + 1;
    v105 = (_QWORD *)(v5 + 40 * v104);
    v105[4] = v36;
    v105[5] = v33;
    v105[6] = v28;
    v105[7] = v31;
    v105[8] = v13;
    v39 = v134;
    v93 = *((_QWORD *)v134 + 2);
    if (v93)
      goto LABEL_111;
LABEL_145:
    v95 = (char *)MEMORY[0x24BEE4AF8];
  }
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_174:
  swift_bridgeObjectRelease();
  __break(1u);
  (*(void (**)(_QWORD *, unint64_t))(v33 + 8))(v13, v31);
  swift_unexpectedError();
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for HelloView()
{
  return objc_opt_self();
}

double sub_23DF6192C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress, a2);
}

uint64_t sub_23DF61938(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress);
}

double sub_23DF61944@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress, a2);
}

double keypath_getTm@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_23DF6199C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

float sub_23DF619F8@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  float *v3;
  float result;

  v3 = (float *)(*a1 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_23DF61A48(int *a1, _QWORD *a2)
{
  int v2;
  _DWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_23DF61A9C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 4);
  *(_DWORD *)a2 = *(_DWORD *)v3;
  *(_BYTE *)(a2 + 4) = v5;
  return result;
}

uint64_t sub_23DF61AF4(int *a1, _QWORD *a2)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 4);
  v4 = *a2 + OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride;
  result = swift_beginAccess();
  *(_DWORD *)v4 = v2;
  *(_BYTE *)(v4 + 4) = v3;
  return result;
}

uint64_t sub_23DF61B50@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23DF61BA0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_23DF61BEC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF61C44@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName, a2);
}

uint64_t sub_23DF61C50(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName);
}

uint64_t sub_23DF61C5C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode, a2);
}

uint64_t keypath_get_11Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_23DF61CB4(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode);
}

uint64_t keypath_set_12Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_23DF61D08@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23DF61D58(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for HelloView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HelloView.backlightProgress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of HelloView.backlightProgress.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of HelloView.backlightProgress.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of HelloView.unlockProgress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of HelloView.unlockProgress.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of HelloView.unlockProgress.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of HelloView.rotationAngle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of HelloView.rotationAngle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of HelloView.rotationAngle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x430))();
}

uint64_t dispatch thunk of HelloView.rotationAngleOverride.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x438))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of HelloView.rotationAngleOverride.setter(unint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(unint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x440))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of HelloView.rotationAngleOverride.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x448))();
}

uint64_t dispatch thunk of HelloView.userInterfaceStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of HelloView.userInterfaceStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x458))();
}

uint64_t dispatch thunk of HelloView.userInterfaceStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x460))();
}

uint64_t dispatch thunk of HelloView.languageCode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x468))();
}

uint64_t dispatch thunk of HelloView.languageCode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x470))();
}

uint64_t dispatch thunk of HelloView.languageCode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x478))();
}

uint64_t dispatch thunk of HelloView.configurationName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of HelloView.configurationName.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of HelloView.configurationName.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of HelloView.appearanceMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x498))();
}

uint64_t dispatch thunk of HelloView.appearanceMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4A0))();
}

uint64_t dispatch thunk of HelloView.appearanceMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4A8))();
}

uint64_t dispatch thunk of HelloView.languageMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B0))();
}

uint64_t dispatch thunk of HelloView.languageMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B8))();
}

uint64_t dispatch thunk of HelloView.languageMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4C0))();
}

uint64_t dispatch thunk of HelloView.__allocating_init(frame:shareGeometryWithView:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1392))();
}

uint64_t dispatch thunk of HelloView.updateHelloView()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x578))();
}

uint64_t dispatch thunk of HelloView.chooseRandomLanguage()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x580))();
}

void sub_23DF6211C()
{
  _BYTE *v0;
  char *v1;
  _QWORD *v2;
  _QWORD *v3;

  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_backlightProgress] = 0x3FF0000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_unlockProgress] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngle] = 0;
  v1 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_rotationAngleOverride];
  *(_DWORD *)v1 = 0;
  v1[4] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_userInterfaceStyle] = 0;
  v2 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_languageCode];
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v0[OBJC_IVAR____TtC11HelloPoster9HelloView_configurationName] = 6;
  v0[OBJC_IVAR____TtC11HelloPoster9HelloView_appearanceMode] = 2;
  v0[OBJC_IVAR____TtC11HelloPoster9HelloView_languageMode] = 1;
  v3 = &v0[OBJC_IVAR____TtC11HelloPoster9HelloView_currentLanguageCode];
  *v3 = 0;
  v3[1] = 0;
  v0[OBJC_IVAR____TtC11HelloPoster9HelloView_currentConfigurationName] = 12;
  v0[OBJC_IVAR____TtC11HelloPoster9HelloView_currentAppearanceMode] = 3;
  v0[OBJC_IVAR____TtC11HelloPoster9HelloView_currentLanguageMode] = 2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_allLanguagesRandomizer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_userLanguagesRandomizer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11HelloPoster9HelloView_lastLanguageChange] = 0;

  sub_23DF6A2A0();
  __break(1u);
}

uint64_t sub_23DF62268(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256D1AC68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23DF622B0()
{
  unint64_t result;

  result = qword_256D1AF08;
  if (!qword_256D1AF08)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B2FC, &type metadata for LanguageFileDefinition);
    atomic_store(result, (unint64_t *)&qword_256D1AF08);
  }
  return result;
}

uint64_t sub_23DF622F4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_23DF62338(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void static HelloConfigurationName.default.getter(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

HelloPoster::HelloConfigurationName_optional __swiftcall HelloConfigurationName.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HelloPoster::HelloConfigurationName_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23DF6A2C4();
  result.value = swift_bridgeObjectRelease();
  v5 = 12;
  if (v3 < 0xC)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static HelloConfigurationName.allCases.getter()
{
  return &unk_250EBEE78;
}

uint64_t HelloConfigurationName.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF62418 + 4 * byte_23DF6AD60[*v0]))(1869508429, 0xE400000000000000);
}

uint64_t sub_23DF62418()
{
  return 0x6D75727463657053;
}

unint64_t sub_23DF624CC()
{
  return 0xD000000000000010;
}

uint64_t sub_23DF624E8()
{
  return 0x776F626E696152;
}

uint64_t sub_23DF62500()
{
  return sub_23DF5E754();
}

uint64_t sub_23DF6250C()
{
  sub_23DF6A36C();
  HelloConfigurationName.rawValue.getter();
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

uint64_t sub_23DF62570()
{
  HelloConfigurationName.rawValue.getter();
  sub_23DF6A1F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF625C0()
{
  sub_23DF6A36C();
  HelloConfigurationName.rawValue.getter();
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

HelloPoster::HelloConfigurationName_optional sub_23DF62620(Swift::String *a1)
{
  return HelloConfigurationName.init(rawValue:)(*a1);
}

uint64_t sub_23DF6262C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HelloConfigurationName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23DF62650(_QWORD *a1@<X8>)
{
  *a1 = &unk_250EBEE78;
}

void static HelloAppearanceMode.default.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

HelloPoster::HelloAppearanceMode_optional __swiftcall HelloAppearanceMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HelloPoster::HelloAppearanceMode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23DF6A2C4();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t HelloAppearanceMode.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1802658116;
  if (*v0 != 1)
    v1 = 0x6974616D6F747541;
  if (*v0)
    return v1;
  else
    return 0x746867694CLL;
}

uint64_t sub_23DF62718(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23DF5E7E8(*a1, *a2);
}

uint64_t sub_23DF62724()
{
  sub_23DF6A36C();
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

uint64_t sub_23DF627BC()
{
  sub_23DF6A1F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF62830()
{
  sub_23DF6A36C();
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

HelloPoster::HelloAppearanceMode_optional sub_23DF628C4(Swift::String *a1)
{
  return HelloAppearanceMode.init(rawValue:)(*a1);
}

void sub_23DF628D0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE500000000000000;
  v4 = 0xE400000000000000;
  v5 = 1802658116;
  if (v2 != 1)
  {
    v5 = 0x6974616D6F747541;
    v4 = 0xE900000000000063;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x746867694CLL;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

void static HelloLanguageMode.default.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

HelloPoster::HelloLanguageMode_optional __swiftcall HelloLanguageMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  HelloPoster::HelloLanguageMode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23DF6A2C4();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t HelloLanguageMode.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 7105601;
  else
    return 0x6572726566657250;
}

uint64_t sub_23DF629CC(char *a1, char *a2)
{
  return sub_23DF5E8F0(*a1, *a2);
}

uint64_t sub_23DF629D8()
{
  sub_23DF6A36C();
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

uint64_t sub_23DF62A54()
{
  sub_23DF6A1F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF62AAC()
{
  sub_23DF6A36C();
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

HelloPoster::HelloLanguageMode_optional sub_23DF62B24(Swift::String *a1)
{
  return HelloLanguageMode.init(rawValue:)(*a1);
}

void sub_23DF62B30(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7105601;
  if (!*v1)
    v2 = 0x6572726566657250;
  v3 = 0xE900000000000064;
  if (*v1)
    v3 = 0xE300000000000000;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t static HelloUserInfoKeys.configurationName.getter()
{
  return 0xD000000000000011;
}

uint64_t static HelloUserInfoKeys.appearanceMode.getter()
{
  return 0x6E61726165707061;
}

uint64_t static HelloUserInfoKeys.languageMode.getter()
{
  return 0x65676175676E616CLL;
}

uint64_t static HelloUserInfoKeys.version.getter()
{
  return 0x6E6F6973726576;
}

unint64_t sub_23DF62BE8()
{
  unint64_t result;

  result = qword_256D1AF20;
  if (!qword_256D1AF20)
  {
    result = MEMORY[0x24264927C](&protocol conformance descriptor for HelloConfigurationName, &type metadata for HelloConfigurationName);
    atomic_store(result, (unint64_t *)&qword_256D1AF20);
  }
  return result;
}

unint64_t sub_23DF62C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D1AF28;
  if (!qword_256D1AF28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D1AF30);
    result = MEMORY[0x24264927C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256D1AF28);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242649270](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23DF62CC4()
{
  unint64_t result;

  result = qword_256D1AF38;
  if (!qword_256D1AF38)
  {
    result = MEMORY[0x24264927C](&protocol conformance descriptor for HelloAppearanceMode, &type metadata for HelloAppearanceMode);
    atomic_store(result, (unint64_t *)&qword_256D1AF38);
  }
  return result;
}

unint64_t sub_23DF62D0C()
{
  unint64_t result;

  result = qword_256D1AF40;
  if (!qword_256D1AF40)
  {
    result = MEMORY[0x24264927C](&protocol conformance descriptor for HelloLanguageMode, &type metadata for HelloLanguageMode);
    atomic_store(result, (unint64_t *)&qword_256D1AF40);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HelloConfigurationName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HelloConfigurationName(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23DF62E2C + 4 * byte_23DF6AD71[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23DF62E60 + 4 * byte_23DF6AD6C[v4]))();
}

uint64_t sub_23DF62E60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF62E68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF62E70);
  return result;
}

uint64_t sub_23DF62E7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF62E84);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23DF62E88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF62E90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelloConfigurationName()
{
  return &type metadata for HelloConfigurationName;
}

uint64_t getEnumTagSinglePayload for HelloAppearanceMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HelloAppearanceMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23DF62F88 + 4 * byte_23DF6AD7B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23DF62FBC + 4 * byte_23DF6AD76[v4]))();
}

uint64_t sub_23DF62FBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF62FC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF62FCCLL);
  return result;
}

uint64_t sub_23DF62FD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF62FE0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23DF62FE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF62FEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23DF62FF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HelloAppearanceMode()
{
  return &type metadata for HelloAppearanceMode;
}

uint64_t storeEnumTagSinglePayload for HelloLanguageMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23DF6305C + 4 * byte_23DF6AD85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DF63090 + 4 * byte_23DF6AD80[v4]))();
}

uint64_t sub_23DF63090(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF63098(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF630A0);
  return result;
}

uint64_t sub_23DF630AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF630B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DF630B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF630C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelloLanguageMode()
{
  return &type metadata for HelloLanguageMode;
}

ValueMetadata *type metadata accessor for HelloUserInfoKeys()
{
  return &type metadata for HelloUserInfoKeys;
}

_QWORD *sub_23DF630F4(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_23DF664C8(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B168);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23DF631F0(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_23DF669C8((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23DF632DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF63304 + 4 * aW[a1]))(28261, 0xE200000000000000);
}

uint64_t sub_23DF63304()
{
  return 29541;
}

uint64_t sub_23DF6330C()
{
  return 24931;
}

uint64_t sub_23DF63314()
{
  return 25956;
}

uint64_t sub_23DF6331C()
{
  return 27758;
}

uint64_t sub_23DF63324()
{
  return 29286;
}

uint64_t sub_23DF6332C()
{
  return 24938;
}

uint64_t sub_23DF63334()
{
  return 0x4E435F687ALL;
}

uint64_t sub_23DF63348()
{
  return 0x4B485F687ALL;
}

uint64_t sub_23DF6335C()
{
  return 0x57545F687ALL;
}

uint64_t sub_23DF63370()
{
  return 29281;
}

uint64_t sub_23DF63378()
{
  return 29801;
}

uint64_t sub_23DF63380()
{
  return 28523;
}

uint64_t sub_23DF63388()
{
  return 29808;
}

uint64_t sub_23DF63390()
{
  return 0x52425F7470;
}

uint64_t sub_23DF633A4()
{
  return 24932;
}

uint64_t sub_23DF633AC()
{
  return 30323;
}

uint64_t sub_23DF633B4()
{
  return 25198;
}

uint64_t sub_23DF633BC()
{
  return 26982;
}

uint64_t sub_23DF633C4()
{
  return 27760;
}

uint64_t sub_23DF633CC()
{
  return 30066;
}

uint64_t sub_23DF633D4()
{
  return 26740;
}

uint64_t sub_23DF633DC()
{
  return 29300;
}

uint64_t sub_23DF633E4()
{
  return 29288;
}

uint64_t sub_23DF633EC()
{
  return 29539;
}

uint64_t sub_23DF633F4()
{
  return 25960;
}

uint64_t sub_23DF633FC()
{
  return 26984;
}

uint64_t sub_23DF63404()
{
  return 27749;
}

uint64_t sub_23DF6340C()
{
  return 25705;
}

uint64_t sub_23DF63414()
{
  return 30056;
}

uint64_t sub_23DF6341C()
{
  return 29549;
}

uint64_t sub_23DF63424()
{
  return 28530;
}

uint64_t sub_23DF6342C()
{
  return 27507;
}

uint64_t sub_23DF63434()
{
  return 27509;
}

uint64_t sub_23DF6343C()
{
  return 26998;
}

uint64_t sub_23DF63444()
{
  return 26466;
}

uint64_t sub_23DF6344C()
{
  return 27499;
}

uint64_t sub_23DF63454()
{
  return 29804;
}

uint64_t sub_23DF6345C()
{
  return 27763;
}

uint64_t sub_23DF63464(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_23DF632DC(*a1);
  v5 = v4;
  if (v3 == sub_23DF632DC(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23DF6A354();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23DF634EC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23DF6A36C();
  sub_23DF632DC(v1);
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

uint64_t sub_23DF6354C()
{
  unsigned __int8 *v0;

  sub_23DF632DC(*v0);
  sub_23DF6A1F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF6358C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23DF6A36C();
  sub_23DF632DC(v1);
  sub_23DF6A1F8();
  swift_bridgeObjectRelease();
  return sub_23DF6A384();
}

uint64_t sub_23DF635E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DF670A8();
  *a1 = result;
  return result;
}

uint64_t sub_23DF63614@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23DF632DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL sub_23DF6363C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23DF63658()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x676E697465657267;
  if (*v0 != 1)
    v1 = 0x65676175676E616CLL;
  if (*v0)
    return v1;
  else
    return 7304041;
}

uint64_t sub_23DF636B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF67818(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23DF636DC()
{
  return 0;
}

void sub_23DF636E8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23DF636F4()
{
  sub_23DF68C30();
  return sub_23DF6A3A8();
}

uint64_t sub_23DF6371C()
{
  sub_23DF68C30();
  return sub_23DF6A3B4();
}

uint64_t sub_23DF63744(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  char v11[8];
  _BYTE v12[8];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B240);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF68C30();
  sub_23DF6A39C();
  v11[0] = 0;
  sub_23DF6A330();
  if (!v2)
  {
    v11[0] = 1;
    sub_23DF6A330();
    sub_23DF62338(v3 + 32, (uint64_t)v12, &qword_256D1B248);
    sub_23DF62338((uint64_t)v12, (uint64_t)v11, &qword_256D1B248);
    v10[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B230);
    sub_23DF68C74(&qword_256D1B250, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23DF6A324();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23DF638DC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B258);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF68BA8();
  sub_23DF6A39C();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B208);
  sub_23DF68A9C(&qword_256D1B260, &qword_256D1B208, (uint64_t (*)(void))sub_23DF68CD4, MEMORY[0x24BEE12A0]);
  sub_23DF6A33C();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

double sub_23DF63A00@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_23DF67980(a1, (uint64_t *)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_23DF63A44(_QWORD *a1)
{
  return sub_23DF63744(a1);
}

uint64_t sub_23DF63A7C()
{
  return 1;
}

uint64_t sub_23DF63A84()
{
  sub_23DF6A36C();
  sub_23DF6A378();
  return sub_23DF6A384();
}

uint64_t sub_23DF63AC4()
{
  return sub_23DF6A378();
}

uint64_t sub_23DF63AE8()
{
  sub_23DF6A36C();
  sub_23DF6A378();
  return sub_23DF6A384();
}

uint64_t sub_23DF63B24()
{
  return 0x65676175676E616CLL;
}

uint64_t sub_23DF63B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x65676175676E616CLL && a2 == 0xE900000000000073)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23DF6A354();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_23DF63BE0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23DF63BEC()
{
  sub_23DF68BA8();
  return sub_23DF6A3A8();
}

uint64_t sub_23DF63C14()
{
  sub_23DF68BA8();
  return sub_23DF6A3B4();
}

_QWORD *sub_23DF63C3C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23DF67BF4(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23DF63C64(_QWORD *a1)
{
  uint64_t *v1;

  return sub_23DF638DC(a1, *v1);
}

uint64_t sub_23DF63C7C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF63CA8 + 4 * byte_23DF6B087[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_23DF63CA8()
{
  return 0x6E6F6973726576;
}

uint64_t sub_23DF63CC0()
{
  return 0x6867697279706F63;
}

uint64_t sub_23DF63D40()
{
  return 0x65676175676E616CLL;
}

uint64_t sub_23DF63D58()
{
  return 0x73656B6F727473;
}

uint64_t sub_23DF63D70()
{
  return 0x656C616373;
}

uint64_t sub_23DF63D84(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  char v10;
  char v11;
  char v12;
  _BYTE v14[28];
  char v15;
  _BYTE v16[24];
  _BYTE v17[8];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B270);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF68A14();
  sub_23DF6A39C();
  v14[0] = 0;
  sub_23DF6A30C();
  if (!v2)
  {
    v14[0] = 1;
    sub_23DF6A30C();
    v14[0] = 2;
    sub_23DF6A30C();
    v9 = v3[52];
    v14[0] = 3;
    v15 = v9;
    sub_23DF6A318();
    v10 = v3[60];
    v14[0] = 4;
    v15 = v10;
    sub_23DF6A318();
    v11 = v3[68];
    v14[0] = 5;
    v15 = v11;
    sub_23DF6A318();
    v12 = v3[76];
    v14[0] = 6;
    v15 = v12;
    sub_23DF6A318();
    v14[0] = 7;
    sub_23DF6A30C();
    sub_23DF62338((uint64_t)(v3 + 96), (uint64_t)v17, &qword_256D1B278);
    sub_23DF62338((uint64_t)v17, (uint64_t)v14, &qword_256D1B278);
    v15 = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1C0);
    sub_23DF68A9C(&qword_256D1B280, &qword_256D1B1C0, sub_23DF68D18, MEMORY[0x24BEE12A0]);
    sub_23DF6A324();
    sub_23DF62338((uint64_t)(v3 + 112), (uint64_t)v16, &qword_256D1B298);
    sub_23DF62338((uint64_t)v16, (uint64_t)v14, &qword_256D1B298);
    v15 = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1E8);
    sub_23DF68D80(&qword_256D1B2A0, MEMORY[0x24BEE4168]);
    sub_23DF6A324();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23DF640D0(_QWORD *a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  char v17;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B300);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF696E8();
  sub_23DF6A39C();
  v16 = v15;
  v17 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1E8);
  sub_23DF68D80(&qword_256D1B2A0, MEMORY[0x24BEE4168]);
  sub_23DF6A33C();
  if (!v5)
  {
    v16 = v14;
    v17 = 1;
    sub_23DF6A33C();
    v16 = v13;
    v17 = 2;
    sub_23DF6A33C();
    v16 = v12;
    v17 = 3;
    sub_23DF6A33C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23DF642A0()
{
  unsigned __int8 *v0;

  return sub_23DF63C7C(*v0);
}

uint64_t sub_23DF642A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF67D40(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DF642CC(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_23DF642D8()
{
  sub_23DF68A14();
  return sub_23DF6A3A8();
}

uint64_t sub_23DF64300()
{
  sub_23DF68A14();
  return sub_23DF6A3B4();
}

__n128 sub_23DF64328@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[8];
  char v9;

  sub_23DF68158(a1, (uint64_t)v8);
  if (!v2)
  {
    v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_BYTE *)(a2 + 128) = v9;
    v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_23DF64380(_QWORD *a1)
{
  return sub_23DF63D84(a1);
}

unint64_t sub_23DF643D0()
{
  unsigned __int8 *v0;

  return ((unint64_t)*v0 << 8) + 12400;
}

uint64_t sub_23DF643E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF6937C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DF64408(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23DF64414()
{
  sub_23DF696E8();
  return sub_23DF6A3A8();
}

uint64_t sub_23DF6443C()
{
  sub_23DF696E8();
  return sub_23DF6A3B4();
}

uint64_t sub_23DF64464@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = sub_23DF694D4(a1);
  if (!v2)
  {
    *a2 = v5;
    a2[1] = v6;
    a2[2] = v7;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_23DF64490(_QWORD *a1)
{
  __n128 *v1;

  return sub_23DF640D0(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_23DF644AC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __n128 *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _OWORD v22[8];
  char v23;

  v3 = v2;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_BYTE *)(v2 + 80) = 1;
  *(_DWORD *)(v2 + 84) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_WORD *)(v2 + 112) = 1;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 120) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 128) = v6;
  *(_QWORD *)(v2 + 136) = v6;
  *(_OWORD *)(v2 + 144) = xmmword_23DF6B7F0;
  *(_DWORD *)(v2 + 160) = 1084227584;
  *(_QWORD *)(v2 + 168) = 0;
  *(_QWORD *)(v2 + 176) = 0;
  v7 = sub_23DF6A1A4();
  v9 = v8;
  sub_23DF6A174();
  swift_allocObject();
  sub_23DF6A168();
  sub_23DF67154();
  sub_23DF6A15C();
  swift_release();
  v22[6] = v19;
  v22[7] = v20;
  v23 = v21;
  v22[2] = v15;
  v22[3] = v16;
  v22[4] = v17;
  v22[5] = v18;
  v22[0] = v13;
  v22[1] = v14;
  *(_QWORD *)(v2 + 176) = sub_23DF64FE0(a2);
  swift_release();
  v11 = sub_23DF64694((uint64_t)v22, a2);
  sub_23DF622F4(v7, v9);
  sub_23DF67198((uint64_t)v22);
  swift_unknownObjectRelease();
  v12 = sub_23DF6A198();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  *(_QWORD *)(v3 + 168) = v11;
  swift_release();
  return v3;
}

__n128 *sub_23DF64694(uint64_t a1, void *a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float v41;
  BOOL v42;
  float32x4_t v43;
  float v44;
  float32x4_t v45;
  float v46;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  float32x4_t v52;
  float32x4_t v53;
  uint64_t v54;
  void *v55;
  float v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  float32x4_t v59;
  __n128 *result;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  id v64;
  unint64_t v65;
  __n128 *v66;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  float32x4_t v75;
  __int128 v76;
  float32x4_t v77;
  __int128 v78;
  float32x4_t v79;
  float32x4_t v80;
  __n128 v81;
  __int128 v82;
  float32x4_t v83;
  float32x4_t v84;
  __n128 v85;

  v4 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 120) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 128) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 136) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v2 + 113) = 0;
  v5 = *(_QWORD *)(a1 + 96);
  v73 = v2;
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 16);
    if (v6)
    {
      swift_bridgeObjectRetain();
      sub_23DF6A27C();
      v7 = 0;
      do
      {
        v10 = *(_QWORD *)(v5 + 32 + 8 * v7);
        v11 = *(_QWORD *)(v10 + 16);
        if (v11)
        {
          swift_bridgeObjectRetain();
          sub_23DF6A27C();
          type metadata accessor for CubicBezier();
          v12 = (__int128 *)(v10 + 80);
          do
          {
            v78 = *(v12 - 2);
            v82 = *(v12 - 3);
            v13 = *(v12 - 1);
            v14 = *v12;
            v12 += 4;
            v76 = v13;
            v15 = swift_allocObject();
            *(_OWORD *)(v15 + 16) = v82;
            *(_OWORD *)(v15 + 32) = v78;
            *(_OWORD *)(v15 + 48) = v76;
            *(_OWORD *)(v15 + 64) = v14;
            *(_QWORD *)(v15 + 80) = 0;
            *(_QWORD *)(v15 + 88) = 0;
            sub_23DF6A264();
            sub_23DF6A288();
            sub_23DF6A294();
            sub_23DF6A270();
            --v11;
          }
          while (v11);
          v8 = v4;
        }
        else
        {
          swift_bridgeObjectRetain();
          v8 = v4;
        }
        ++v7;
        type metadata accessor for CubicBezierStroke();
        v9 = swift_allocObject();
        *(_WORD *)(v9 + 24) = 0;
        *(_QWORD *)(v9 + 16) = v8;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23DF6A264();
        sub_23DF6A288();
        sub_23DF6A294();
        sub_23DF6A270();
      }
      while (v7 != v6);
      swift_bridgeObjectRelease();
      v2 = v73;
    }
  }
  if (v4 >> 62)
    goto LABEL_108;
  v16 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v16)
    goto LABEL_13;
LABEL_82:
  while (1)
  {
    swift_bridgeObjectRelease_n();
    v48 = *(char **)(v2 + 120);
    v49 = *((_QWORD *)v48 + 2);
    if (!v49)
      break;
    v50 = 0;
    v51 = 0;
    v52 = *((float32x4_t *)v48 + 2);
    v53 = v52;
    v54 = MEMORY[0x24BEE4AF8];
    v55 = a2;
    while (1)
    {
      v80 = v53;
      v84 = v52;
      v56 = *(float *)(v2 + 84);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 120) = v48;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v48 = sub_23DF66ADC((uint64_t)v48);
        *(_QWORD *)(v2 + 120) = v48;
      }
      if (v51 >= *((_QWORD *)v48 + 2))
        break;
      *(float *)&v48[v50 + 60] = *(float *)&v48[v50 + 60] / v56;
      v48 = *(char **)(v2 + 120);
      v58 = *((_QWORD *)v48 + 2);
      if (v51 >= v58)
        goto LABEL_101;
      ++v51;
      v59 = *(float32x4_t *)&v48[v50 + 32];
      v52 = vminnmq_f32(v84, v59);
      v53 = vmaxnmq_f32(v80, v59);
      v50 += 32;
      if (v49 == v51)
      {
        if (!(v58 >> 58))
          goto LABEL_92;
        __break(1u);
        goto LABEL_91;
      }
    }
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
LABEL_104:
    __break(1u);
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
LABEL_107:
    __break(1u);
LABEL_108:
    swift_bridgeObjectRetain();
    v16 = sub_23DF6A2AC();
    if (v16)
    {
LABEL_13:
      v17 = 0;
      v18 = 0;
      v19 = v4 & 0xC000000000000001;
      v68 = v4 + 32;
      v69 = v4 & 0xFFFFFFFFFFFFFF8;
      v71 = v16;
      v72 = v4;
      v70 = v4 & 0xC000000000000001;
      while (1)
      {
        if (v19)
        {
          v20 = MEMORY[0x242648E2C](v17, v4);
          v21 = __OFADD__(v17++, 1);
          if (v21)
            goto LABEL_102;
        }
        else
        {
          if (v17 >= *(_QWORD *)(v69 + 16))
            goto LABEL_107;
          v20 = *(_QWORD *)(v68 + 8 * v17);
          swift_retain();
          v21 = __OFADD__(v17++, 1);
          if (v21)
            goto LABEL_102;
        }
        v22 = *(_QWORD *)(v20 + 16);
        if (v22 >> 62)
        {
          swift_bridgeObjectRetain();
          if (!sub_23DF6A2AC())
            goto LABEL_14;
        }
        else
        {
          v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v23)
            goto LABEL_14;
        }
        if ((v22 & 0xC000000000000001) != 0)
        {
          v24 = MEMORY[0x242648E2C](0, v22);
        }
        else
        {
          if (!*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_103;
          v24 = *(_QWORD *)(v22 + 32);
          swift_retain();
        }
        swift_bridgeObjectRelease();
        v75 = *(float32x4_t *)(v24 + 16);
        swift_release();
        v25 = *(_QWORD *)(v20 + 16);
        if (v25 >> 62)
        {
          swift_bridgeObjectRetain();
          v26 = sub_23DF6A2AC();
          if (!v26)
            goto LABEL_14;
LABEL_28:
          v27 = v26 - 1;
          if (__OFSUB__(v26, 1))
            goto LABEL_104;
          if ((v25 & 0xC000000000000001) != 0)
          {
            v28 = MEMORY[0x242648E2C](v27, v25);
          }
          else
          {
            if ((v27 & 0x8000000000000000) != 0)
              goto LABEL_105;
            if (v27 >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_106;
            v28 = *(_QWORD *)(v25 + 8 * v27 + 32);
            swift_retain();
          }
          swift_bridgeObjectRelease();
          v77 = *(float32x4_t *)(v28 + 64);
          swift_release();
          swift_bridgeObjectRetain();
          swift_retain();
          v2 = sub_23DF66F50(v4, v20);
          swift_bridgeObjectRelease();
          swift_release();
          v74 = v18;
          if (v2 >> 62)
          {
            v4 = sub_23DF6A2AC();
            if (!v4)
              goto LABEL_81;
LABEL_35:
            v29 = 0;
            while (2)
            {
              if ((v2 & 0xC000000000000001) != 0)
              {
                v30 = MEMORY[0x242648E2C](v29, v2);
                v31 = v29 + 1;
                if (__OFADD__(v29, 1))
                  goto LABEL_94;
              }
              else
              {
                if (v29 >= *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_99;
                v30 = *(_QWORD *)(v2 + 8 * v29 + 32);
                swift_retain();
                v31 = v29 + 1;
                if (__OFADD__(v29, 1))
                {
LABEL_94:
                  __break(1u);
LABEL_95:
                  __break(1u);
LABEL_96:
                  __break(1u);
LABEL_97:
                  __break(1u);
LABEL_98:
                  __break(1u);
LABEL_99:
                  __break(1u);
                  goto LABEL_100;
                }
              }
              v32 = *(_QWORD *)(v30 + 16);
              if (v32 >> 62)
              {
                swift_bridgeObjectRetain();
                if (!sub_23DF6A2AC())
                  goto LABEL_36;
LABEL_46:
                if ((v32 & 0xC000000000000001) != 0)
                {
                  v34 = MEMORY[0x242648E2C](0, v32);
                }
                else
                {
                  if (!*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_95;
                  v34 = *(_QWORD *)(v32 + 32);
                  swift_retain();
                }
                swift_bridgeObjectRelease();
                v83 = *(float32x4_t *)(v34 + 16);
                swift_release();
                v35 = *(_QWORD *)(v30 + 16);
                if (v35 >> 62)
                {
                  swift_bridgeObjectRetain();
                  v36 = sub_23DF6A2AC();
                  if (!v36)
                    goto LABEL_36;
                }
                else
                {
                  v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
                  swift_bridgeObjectRetain();
                  if (!v36)
                    goto LABEL_36;
                }
                v37 = v36 - 1;
                if (__OFSUB__(v36, 1))
                  goto LABEL_96;
                if ((v35 & 0xC000000000000001) != 0)
                {
                  v38 = MEMORY[0x242648E2C](v37, v35);
                }
                else
                {
                  if ((v37 & 0x8000000000000000) != 0)
                    goto LABEL_97;
                  if (v37 >= *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_98;
                  v38 = *(_QWORD *)(v35 + 8 * v37 + 32);
                  swift_retain();
                }
                swift_bridgeObjectRelease();
                v79 = *(float32x4_t *)(v38 + 64);
                swift_release();
                v39 = vsubq_f32(v75, v83);
                v42 = sqrtf((float)((float)(v75.f32[2] - v83.f32[2]) * (float)(v75.f32[2] - v83.f32[2]))+ (float)(vmulq_f32(v39, v39).f32[0]+ (float)((float)(v75.f32[1] - v83.f32[1]) * (float)(v75.f32[1] - v83.f32[1])))) < 2.0;
                v40 = vsubq_f32(v75, v79);
                v41 = sqrtf((float)((float)(v75.f32[2] - v79.f32[2]) * (float)(v75.f32[2] - v79.f32[2]))+ (float)(vmulq_f32(v40, v40).f32[0]+ (float)((float)(v75.f32[1] - v79.f32[1]) * (float)(v75.f32[1] - v79.f32[1]))));
                v42 = v42 || v41 < 2.0;
                if (v42)
                  *(_BYTE *)(v20 + 24) = 1;
                v43 = vsubq_f32(v77, v83);
                v44 = sqrtf((float)((float)(v77.f32[2] - v83.f32[2]) * (float)(v77.f32[2] - v83.f32[2]))+ (float)(vmulq_f32(v43, v43).f32[0]+ (float)((float)(v77.f32[1] - v83.f32[1]) * (float)(v77.f32[1] - v83.f32[1]))));
                swift_release();
                v45 = vsubq_f32(v77, v79);
                v46 = sqrtf((float)((float)(v77.f32[2] - v79.f32[2]) * (float)(v77.f32[2] - v79.f32[2]))+ (float)(vmulq_f32(v45, v45).f32[0]+ (float)((float)(v77.f32[1] - v79.f32[1]) * (float)(v77.f32[1] - v79.f32[1]))));
                if (v44 < 2.0 || v46 < 2.0)
                  *(_BYTE *)(v20 + 25) = 1;
              }
              else
              {
                v33 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (v33)
                  goto LABEL_46;
LABEL_36:
                swift_release();
                swift_bridgeObjectRelease();
              }
              ++v29;
              if (v31 == v4)
                goto LABEL_81;
              continue;
            }
          }
          v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v4)
            goto LABEL_35;
LABEL_81:
          swift_bridgeObjectRelease();
          v2 = v73;
          sub_23DF651B0(v20);
          swift_release();
          *(_BYTE *)(v73 + 113) = 1;
          v16 = v71;
          v4 = v72;
          v19 = v70;
          v18 = v74;
          if (v17 == v71)
            goto LABEL_82;
        }
        else
        {
          v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v26)
            goto LABEL_28;
LABEL_14:
          swift_release();
          swift_bridgeObjectRelease();
          if (v17 == v16)
            goto LABEL_82;
        }
      }
    }
  }
LABEL_91:
  v58 = 0;
  v53 = 0uLL;
  v52 = 0uLL;
  v54 = MEMORY[0x24BEE4AF8];
  v55 = a2;
LABEL_92:
  v81 = (__n128)v53;
  v85 = (__n128)v52;
  result = (__n128 *)objc_msgSend(v55, sel_newBufferWithBytes_length_options_, v48 + 32, 32 * v58, 0);
  v61 = *(_QWORD *)(v2 + 128);
  v62 = *(_QWORD *)(v61 + 16);
  if (v62 >> 61)
  {
    __break(1u);
  }
  else
  {
    v63 = (unint64_t)result;
    v64 = objc_msgSend(v55, sel_newBufferWithBytes_length_options_, v61 + 32, 4 * v62, 0);
    v65 = *(_QWORD *)(*(_QWORD *)(v2 + 128) + 16);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v66 = sub_23DF57E84(v63, (unint64_t)v64, v65, v85, v81);
    *(_QWORD *)(v2 + 120) = v54;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 128) = v54;
    swift_bridgeObjectRelease();
    return v66;
  }
  return result;
}

__n128 *sub_23DF64FE0(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __n128 *result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  __n128 *v17;

  v2 = v1;
  v4 = MEMORY[0x24BEE4AF8];
  v1[15] = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v1[16] = v4;
  swift_bridgeObjectRelease();
  v1[17] = v4;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1ACF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DF6B800;
  type metadata accessor for CubicBezier();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23DF6B810;
  *(_OWORD *)(v6 + 32) = xmmword_23DF6B810;
  *(_OWORD *)(v6 + 48) = xmmword_23DF6B810;
  *(_OWORD *)(v6 + 64) = xmmword_23DF6B810;
  *(_QWORD *)(v6 + 80) = 0;
  *(_QWORD *)(v6 + 88) = 0;
  *(_QWORD *)(inited + 32) = v6;
  sub_23DF6A234();
  v7 = inited;
  type metadata accessor for CubicBezierStroke();
  v8 = swift_initStackObject();
  *(_WORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 16) = v7;
  swift_bridgeObjectRelease();
  sub_23DF651B0(v8);
  result = (__n128 *)swift_bridgeObjectRelease();
  v10 = v2[15];
  v11 = *(_QWORD *)(v10 + 16);
  if (v11 >> 58)
  {
    __break(1u);
  }
  else
  {
    result = (__n128 *)objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v10 + 32, 32 * v11, 0);
    v12 = v2[16];
    v13 = *(_QWORD *)(v12 + 16);
    if (!(v13 >> 61))
    {
      v14 = (unint64_t)result;
      v15 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v12 + 32, 4 * v13, 0);
      v16 = *(_QWORD *)(v2[16] + 16);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v17 = sub_23DF57E84(v14, (unint64_t)v15, v16, (__n128)0, (__n128)0);
      v2[15] = v4;
      swift_bridgeObjectRelease();
      v2[16] = v4;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v2[17] = v4;
      swift_bridgeObjectRelease();
      return v17;
    }
  }
  __break(1u);
  return result;
}

void sub_23DF651B0(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  float32x4_t v25;
  int8x16_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x4_t v29;
  uint64_t v30;
  unint64_t v31;
  char v33;
  char v34;
  float v35;
  float v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  float32x4_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  unint64_t v68;
  _UNKNOWN **v69;
  _QWORD *v70;
  __int128 v71;
  uint64_t v72;
  _UNKNOWN **v73;

  v2 = v1;
  v3 = a1;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v5 = sub_23DF6A2AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v50 = v5 - 1;
  if (v5 < 1)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v70 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v5 != 1)
  {
    v46 = v3;
    v52 = v4 & 0xC000000000000001;
    goto LABEL_23;
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_23DF6A2AC();
  }
  else
  {
    v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v8)
    goto LABEL_22;
  v52 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) != 0)
  {
    v13 = MEMORY[0x242648E2C](0, v4);
    swift_bridgeObjectRelease();
    v61 = *(_OWORD *)(v13 + 16);
    swift_release();
    swift_bridgeObjectRetain();
    v10 = MEMORY[0x242648E2C](0, v4);
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_21;
  }
  v9 = *(_QWORD *)(v4 + 32);
  swift_retain();
  swift_bridgeObjectRelease();
  v61 = *(_OWORD *)(v9 + 16);
  swift_release();
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    swift_bridgeObjectRelease_n();
    __break(1u);
    goto LABEL_23;
  }
  v10 = *(_QWORD *)(v4 + 32);
  swift_retain();
LABEL_15:
  v57 = *(_OWORD *)(v10 + 64);
  swift_release();
  v7 = v57;
  v6 = v61;
  v11 = 0;
LABEL_57:
  while (1)
  {
    v64 = v6;
    v35 = *(float *)((unint64_t)&v64 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    v65 = v7;
    v36 = *(float *)((unint64_t)&v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    v12 = v35 == v36;
    if (v11 == 3)
      break;
    while (1)
    {
      ++v11;
      if (v12)
        break;
      if (v11 == 3)
        goto LABEL_63;
      v12 = 0;
    }
  }
  if (v35 != v36)
  {
LABEL_63:
    v46 = v3;
LABEL_23:
    v3 = 0;
    v47 = v4 & 0xFFFFFFFFFFFFFF8;
    v51 = v5 & ~(v5 >> 63);
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v48 = v5;
    v49 = v4;
    do
    {
      v11 = v51;
      if (v3 == v51)
        goto LABEL_50;
      if (v52)
      {
        MEMORY[0x242648E2C](v3, v4);
      }
      else
      {
        v11 = *(_QWORD *)(v47 + 16);
        if (v3 >= v11)
          goto LABEL_55;
        swift_retain();
      }
      sub_23DF69BAC();
      v16 = v15 / 5.0;
      v11 = LODWORD(v16);
      if ((~LODWORD(v16) & 0x7F800000) == 0)
        goto LABEL_51;
      v11 = 3741319169;
      if (v16 <= -9.2234e18)
        goto LABEL_52;
      if (v16 >= 9.2234e18)
        goto LABEL_53;
      v11 = (uint64_t)v16;
      if ((uint64_t)v16)
      {
        v17 = (uint64_t)v16;
        if (v3 == v50 || (v17 = v11 - 1, !__OFSUB__(v11, 1)))
        {
          if ((v17 & 0x8000000000000000) == 0)
          {
            v53 = v3;
            v18 = 0;
            v19 = (float)v11;
            do
            {
              sub_23DF62338(v2 + 16, (uint64_t)&v71, &qword_256D1B188);
              swift_retain();
              *(double *)&v20 = sub_23DF69CE0((uint64_t)&v71, (float)v18 / v19);
              v55 = v21;
              v58 = v20;
              v54 = v22;
              v62 = v23;
              swift_release();
              *(_OWORD *)(v2 + 16) = v58;
              *(_OWORD *)(v2 + 32) = v55;
              *(_OWORD *)(v2 + 48) = v54;
              *(_OWORD *)(v2 + 64) = v62;
              *(_BYTE *)(v2 + 80) = 0;
              *(double *)&v24 = sub_23DF69A1C((float)v18 / v19);
              v59 = v24;
              *(double *)v25.i64 = sub_23DF69A78((float)v18 / v19);
              v26 = (int8x16_t)vmulq_f32(v25, v25);
              *(float32x2_t *)v26.i8 = vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL));
              v26.i32[0] = vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1)).u32[0];
              v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
              v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
              v29 = vmulq_n_f32(v25, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
              v29.i32[3] = 0;
              v56 = v29;
              v4 = type metadata accessor for CircularArc();
              v30 = swift_allocObject();
              *(_OWORD *)(v30 + 16) = v59;
              *(float32x4_t *)(v30 + 32) = v56;
              *(_OWORD *)(v30 + 48) = v62;
              *(_DWORD *)(v30 + 64) = HIDWORD(v59);
              *(_QWORD *)(v30 + 68) = 0x40C90FDA00000000;
              *(_QWORD *)(v30 + 80) = 0;
              *(_QWORD *)(v30 + 88) = 0;
              *(_BYTE *)(v30 + 96) = 1;
              *(_QWORD *)(v30 + 112) = 0;
              *(_QWORD *)(v30 + 120) = 0;
              *(_BYTE *)(v30 + 128) = 1;
              *(_DWORD *)(v30 + 132) = 0;
              *(_BYTE *)(v30 + 136) = 1;
              swift_retain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v14 = sub_23DF664C8(0, v14[2] + 1, 1, v14);
              v5 = v14[2];
              v31 = v14[3];
              v3 = v5 + 1;
              if (v5 >= v31 >> 1)
                v14 = sub_23DF664C8((_QWORD *)(v31 > 1), v5 + 1, 1, v14);
              v68 = v4;
              v69 = &off_250EBFF88;
              *(_QWORD *)&v67 = v30;
              v14[2] = v3;
              sub_23DF6713C(&v67, (uint64_t)&v14[5 * v5 + 4]);
              swift_release();
              if (v17 == v18)
              {
                swift_release();
                v70 = v14;
                v5 = v48;
                v4 = v49;
                v3 = v53;
                goto LABEL_25;
              }
            }
            while (!__OFADD__(v18++, 1));
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
          }
          __break(1u);
LABEL_55:
          __break(1u);
        }
        __break(1u);
        goto LABEL_57;
      }
      swift_release();
LABEL_25:
      ++v3;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    v33 = *(_BYTE *)(v46 + 24) ^ 1;
    v34 = *(_BYTE *)(v46 + 25) ^ 1;
    if (v14[2])
      goto LABEL_69;
    goto LABEL_71;
  }
  if (v52)
  {
    v37 = MEMORY[0x242648E2C](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v37 = *(_QWORD *)(v4 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  v63 = *(_OWORD *)(v37 + 16);
  swift_release();
  v38 = v63;
  HIDWORD(v38) = 0;
  v60 = v38;
  v39 = type metadata accessor for CircularArc();
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = v63;
  *(_OWORD *)(v40 + 32) = xmmword_23DF6AA70;
  *(_OWORD *)(v40 + 48) = xmmword_23DF6AA80;
  *(_DWORD *)(v40 + 64) = HIDWORD(v63);
  *(_QWORD *)(v40 + 68) = 0x40C90FDA00000000;
  *(_OWORD *)(v40 + 80) = v60;
  *(_BYTE *)(v40 + 96) = 0;
  *(_OWORD *)(v40 + 112) = v60;
  *(_BYTE *)(v40 + 128) = 0;
  *(_DWORD *)(v40 + 132) = HIDWORD(v63);
  *(_BYTE *)(v40 + 136) = 0;
  swift_retain();
  v14 = sub_23DF664C8(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v42 = v14[2];
  v41 = v14[3];
  if (v42 >= v41 >> 1)
    v14 = sub_23DF664C8((_QWORD *)(v41 > 1), v42 + 1, 1, v14);
  v72 = v39;
  v73 = &off_250EBFF88;
  *(_QWORD *)&v71 = v40;
  v14[2] = v42 + 1;
  sub_23DF6713C(&v71, (uint64_t)&v14[5 * v42 + 4]);
  swift_release();
  v34 = 0;
  v33 = 0;
  v70 = v14;
  if (v14[2])
  {
LABEL_69:
    sub_23DF670F8((uint64_t)(v14 + 4), (uint64_t)&v67);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B168);
    type metadata accessor for CircularArc();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v43 = sub_23DF66AF0(v66, 0, v33 & 1);
      sub_23DF66DEC(0, 0, v43);
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
LABEL_71:
  v44 = v70[2];
  if (v44)
  {
    sub_23DF670F8((uint64_t)&v70[5 * v44 - 1], (uint64_t)&v67);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B168);
    type metadata accessor for CircularArc();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v45 = (_QWORD *)sub_23DF66AF0(v66, 1, v34 & 1);
      sub_23DF630F4(v45);
      swift_release();
    }
  }
  sub_23DF659A4((uint64_t)v70);
  swift_bridgeObjectRelease();
}

uint64_t sub_23DF659A4(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int8 v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float v14;
  float v15;
  int64_t v16;
  float v17;
  float v18;
  int v19;
  __int128 v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  __int128 v28;
  __int32 *v29;
  float v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  const double *v35;
  float32x2_t v36;
  float32x4_t v37;
  float32x4_t v38;
  int32x4_t v39;
  float32x4_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  float32x4_t v44;
  float32x4_t v45;
  unint64_t v46;
  unsigned int v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  int64_t v56;
  int64_t v57;
  int64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  int64_t v77;
  int v78;
  __int32 v79;
  __int32 v80;
  float v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  __int128 v85;
  float32x4_t v86;
  int v87;
  uint64_t v88;
  float32x4_t *v89;
  __int128 v90;
  uint64_t v91;
  int64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;

  v2 = *(_QWORD *)(result + 16);
  if (v2 >= 2)
  {
    v3 = v1;
    v76 = *(_QWORD *)(*(_QWORD *)(v1 + 120) + 16);
    if (!HIDWORD(v76))
    {
      v4 = result;
      v5 = result + 32;
      sub_23DF670F8(result + 32, (uint64_t)&v90);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B168);
      type metadata accessor for CircularArc();
      swift_dynamicCast();
      v6 = v89[8].f32[1];
      v7 = v89[8].i8[8];
      swift_release();
      if ((v7 & 1) != 0)
      {
        v8 = *(float *)(v3 + 84);
      }
      else
      {
        if ((*(_BYTE *)(v3 + 112) & 1) == 0)
        {
          v9 = *(_QWORD *)(v3 + 96);
          v10 = *(_QWORD *)(v3 + 104);
          sub_23DF670F8(v5, (uint64_t)&v90);
          if (swift_dynamicCast())
          {
            v11.i64[0] = v9;
            v11.i64[1] = v10;
            v84 = v11;
            v82 = v89[1];
            swift_release();
            v12 = vsubq_f32(v84, v82);
            v13 = vmulq_f32(v12, v12);
            v14 = sqrtf(v13.f32[2]+ (float)((float)((float)(*(float *)&v9 - v82.f32[0]) * (float)(*(float *)&v9 - v82.f32[0]))+ v13.f32[1]));
            v15 = 1.0;
            if (*(_BYTE *)(v3 + 113))
              v15 = 0.5;
            *(float *)(v3 + 84) = *(float *)(v3 + 84) + (float)(v15 * v14);
            *(_QWORD *)(v3 + 96) = 0;
            *(_QWORD *)(v3 + 104) = 0;
            *(_WORD *)(v3 + 112) = 1;
          }
        }
        v8 = v6 + *(float *)(v3 + 84);
      }
      v94 = 0;
      v95 = 0;
      v93 = v4;
      v96 = 0;
      swift_bridgeObjectRetain();
      sub_23DF6615C((uint64_t)&v90);
      if (!v91)
        return swift_bridgeObjectRelease();
      v78 = 0;
      v77 = v2 - 1;
      while (1)
      {
        v16 = v92;
        sub_23DF6713C(&v90, (uint64_t)&v89);
        swift_dynamicCast();
        if ((*(_BYTE *)(v3 + 112) & 1) == 0)
        {
          v17 = sqrtf((float)((float)(COERCE_FLOAT(*(_QWORD *)(v3 + 104)) - *(float *)(v88 + 24))* (float)(COERCE_FLOAT(*(_QWORD *)(v3 + 104)) - *(float *)(v88 + 24)))+ (float)((float)((float)(COERCE_FLOAT(*(_QWORD *)(v3 + 96)) - *(float *)(v88 + 16))* (float)(COERCE_FLOAT(*(_QWORD *)(v3 + 96)) - *(float *)(v88 + 16)))+ (float)((float)(COERCE_FLOAT(HIDWORD(*(_QWORD *)(v3 + 96))) - *(float *)(v88 + 20))* (float)(COERCE_FLOAT(HIDWORD(*(_QWORD *)(v3 + 96))) - *(float *)(v88 + 20)))));
          if (*(_BYTE *)(v3 + 113))
            v18 = 0.5;
          else
            v18 = 1.0;
          *(float *)(v3 + 84) = *(float *)(v3 + 84) + (float)(v18 * v17);
          *(_BYTE *)(v3 + 113) = 0;
        }
        v19 = *(unsigned __int8 *)(v88 + 128);
        if (v19 == 1)
          v8 = *(float *)(v3 + 84);
        if ((*(_BYTE *)(v88 + 96) & 1) != 0)
        {
          v20 = *(_OWORD *)(v88 + 16);
          HIDWORD(v20) = 0;
        }
        else
        {
          v20 = *(_OWORD *)(v88 + 80);
        }
        v85 = v20;
        v21 = *(_DWORD *)(v3 + 84);
        v22 = 132;
        if (*(_BYTE *)(v88 + 136))
          v22 = 64;
        v23 = *(_DWORD *)(v88 + v22);
        v24 = *(_QWORD *)(v3 + 136);
        result = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v3 + 136) = v24;
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23DF667EC(0, *(_QWORD *)(v24 + 16) + 1, 1, (char *)v24);
          v24 = result;
          *(_QWORD *)(v3 + 136) = result;
        }
        v26 = *(_QWORD *)(v24 + 16);
        v25 = *(_QWORD *)(v24 + 24);
        if (v26 >= v25 >> 1)
        {
          result = (uint64_t)sub_23DF667EC((char *)(v25 > 1), v26 + 1, 1, (char *)v24);
          v24 = result;
          *(_QWORD *)(v3 + 136) = result;
        }
        *(_QWORD *)(v24 + 16) = v26 + 1;
        v27 = v24 + 32 * v26;
        *(_OWORD *)(v27 + 32) = v85;
        *(_DWORD *)(v27 + 48) = v21;
        *(_DWORD *)(v27 + 52) = v23;
        *(_BYTE *)(v27 + 56) = v16 < v77;
        v28 = *(_OWORD *)(v88 + 16);
        HIDWORD(v28) = 0;
        *(_OWORD *)(v3 + 96) = v28;
        *(_BYTE *)(v3 + 112) = 0;
        if ((v19 & 1) != 0)
        {
          v29 = (__int32 *)(v88 + 64);
          v30 = *(float *)(v3 + 84);
        }
        else
        {
          if ((*(_BYTE *)(v88 + 136) & 1) != 0)
            goto LABEL_85;
          v29 = (__int32 *)(v88 + 132);
          v30 = v8;
        }
        v81 = v30;
        v31 = 0;
        v80 = *v29;
        do
        {
          *(float32x2_t *)v32.f32 = sub_23DF69968((float)v31 * 0.03125);
          v86 = v32;
          if ((*(_BYTE *)(v88 + 128) & 1) != 0)
          {
            *(float32x2_t *)v33.f32 = vsub_f32(0, *(float32x2_t *)(v88 + 32));
            v33.f32[2] = 0.0 - *(float *)(v88 + 40);
            v33.i32[3] = 0;
            *(float32x2_t *)v34.f32 = sub_23DF5E2C8(v33, *(float *)(v88 + 68)+ (float)((float)((float)v31 * 0.03125)* (float)(*(float *)(v88 + 72) - *(float *)(v88 + 68))), *(int32x4_t *)(v88 + 48));
            v34.i32[3] = 0;
            v83 = v34;
          }
          else
          {
            v35 = (const double *)(v88 + 120);
            v36 = *(float32x2_t *)(v88 + 112);
            v37 = (float32x4_t)vld1q_dup_f64(v35);
            *(float32x2_t *)v38.f32 = vsub_f32(*(float32x2_t *)v32.f32, v36);
            v38.i64[1] = vsubq_f32(v32, v37).u32[2];
            v39 = (int32x4_t)vmulq_f32(v38, v38);
            v39.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), vadd_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1))).u32[0];
            *(float32x2_t *)v37.f32 = vrsqrte_f32((float32x2_t)v39.u32[0]);
            *(float32x2_t *)v37.f32 = vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32)));
            v40 = vmulq_n_f32(v38, vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32))).f32[0]);
            v40.i32[3] = v79;
            v83 = v40;
          }
          v41 = *(_QWORD *)(v3 + 120);
          result = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v3 + 120) = v41;
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_23DF666F4(0, *(_QWORD *)(v41 + 16) + 1, 1, (char *)v41);
            v41 = result;
            *(_QWORD *)(v3 + 120) = result;
          }
          v43 = *(_QWORD *)(v41 + 16);
          v42 = *(_QWORD *)(v41 + 24);
          v44 = v86;
          if (v43 >= v42 >> 1)
          {
            result = (uint64_t)sub_23DF666F4((char *)(v42 > 1), v43 + 1, 1, (char *)v41);
            v44 = v86;
            v41 = result;
            *(_QWORD *)(v3 + 120) = result;
          }
          v44.i32[3] = v80;
          v45 = v83;
          v45.f32[3] = v81;
          *(_QWORD *)(v41 + 16) = v43 + 1;
          v46 = v41 + 32 * v43;
          *(float32x4_t *)(v46 + 32) = v44;
          *(float32x4_t *)(v46 + 48) = v45;
          ++v31;
        }
        while (v31 != 33);
        v47 = v78 + 1;
        if (v78 == -1)
          break;
        ++v78;
        v48 = v47 >= 2;
        v49 = v47 - 2;
        if (v48)
        {
          v50 = 33 * v49;
          if ((v50 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_82;
          v87 = v76 + v50;
          if (__CFADD__((_DWORD)v76, (_DWORD)v50))
            goto LABEL_83;
          v51 = *(_QWORD *)(v3 + 128);
          result = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v3 + 128) = v51;
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_23DF665FC(0, *(_QWORD *)(v51 + 16) + 1, 1, (char *)v51);
            v51 = result;
          }
          v52 = 0;
          *(_QWORD *)(v3 + 128) = v51;
          while (1)
          {
            v53 = v87 + v52;
            if (__CFADD__(v87, (_DWORD)v52))
              break;
            v54 = v53 + 33;
            if (v53 >= 0xFFFFFFDF)
              goto LABEL_78;
            v55 = v53 + 1;
            if (v53 + 1 >= 0xFFFFFFDF)
              goto LABEL_79;
            v56 = *(_QWORD *)(v51 + 16);
            v57 = v56 + 6;
            if (__OFADD__(v56, 6))
              goto LABEL_80;
            result = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)(v3 + 128) = v51;
            if (!(_DWORD)result || v57 > *(_QWORD *)(v51 + 24) >> 1)
            {
              if (v56 <= v57)
                v58 = v56 + 6;
              else
                v58 = v56;
              result = (uint64_t)sub_23DF665FC((char *)result, v58, 1, (char *)v51);
              v51 = result;
            }
            *(_QWORD *)(v3 + 128) = v51;
            v60 = *(_QWORD *)(v51 + 16);
            v59 = *(_QWORD *)(v51 + 24);
            if (v60 >= v59 >> 1)
            {
              result = (uint64_t)sub_23DF665FC((char *)(v59 > 1), v60 + 1, 1, (char *)v51);
              v51 = result;
              *(_QWORD *)(v3 + 128) = result;
            }
            *(_QWORD *)(v51 + 16) = v60 + 1;
            *(_DWORD *)(v51 + 4 * v60 + 32) = v54;
            v61 = *(_QWORD *)(v3 + 128);
            v63 = *(_QWORD *)(v61 + 16);
            v62 = *(_QWORD *)(v61 + 24);
            if (v63 >= v62 >> 1)
            {
              result = (uint64_t)sub_23DF665FC((char *)(v62 > 1), v63 + 1, 1, (char *)v61);
              v61 = result;
              *(_QWORD *)(v3 + 128) = result;
            }
            *(_QWORD *)(v61 + 16) = v63 + 1;
            *(_DWORD *)(v61 + 4 * v63 + 32) = v55;
            v64 = *(_QWORD *)(v3 + 128);
            v66 = *(_QWORD *)(v64 + 16);
            v65 = *(_QWORD *)(v64 + 24);
            if (v66 >= v65 >> 1)
            {
              result = (uint64_t)sub_23DF665FC((char *)(v65 > 1), v66 + 1, 1, (char *)v64);
              v64 = result;
              *(_QWORD *)(v3 + 128) = result;
            }
            *(_QWORD *)(v64 + 16) = v66 + 1;
            *(_DWORD *)(v64 + 4 * v66 + 32) = v53;
            v67 = *(_QWORD *)(v3 + 128);
            v69 = *(_QWORD *)(v67 + 16);
            v68 = *(_QWORD *)(v67 + 24);
            if (v69 >= v68 >> 1)
            {
              result = (uint64_t)sub_23DF665FC((char *)(v68 > 1), v69 + 1, 1, (char *)v67);
              v67 = result;
              *(_QWORD *)(v3 + 128) = result;
            }
            *(_QWORD *)(v67 + 16) = v69 + 1;
            *(_DWORD *)(v67 + 4 * v69 + 32) = v54;
            v70 = *(_QWORD *)(v3 + 128);
            v72 = *(_QWORD *)(v70 + 16);
            v71 = *(_QWORD *)(v70 + 24);
            if (v72 >= v71 >> 1)
            {
              result = (uint64_t)sub_23DF665FC((char *)(v71 > 1), v72 + 1, 1, (char *)v70);
              v70 = result;
              *(_QWORD *)(v3 + 128) = result;
            }
            *(_QWORD *)(v70 + 16) = v72 + 1;
            *(_DWORD *)(v70 + 4 * v72 + 32) = v53 + 34;
            v73 = *(_QWORD *)(v3 + 128);
            v75 = *(_QWORD *)(v73 + 16);
            v74 = *(_QWORD *)(v73 + 24);
            if (v75 >= v74 >> 1)
            {
              result = (uint64_t)sub_23DF665FC((char *)(v74 > 1), v75 + 1, 1, (char *)v73);
              v73 = result;
              *(_QWORD *)(v3 + 128) = result;
            }
            ++v52;
            *(_QWORD *)(v73 + 16) = v75 + 1;
            *(_DWORD *)(v73 + 4 * v75 + 32) = v55;
            v51 = *(_QWORD *)(v3 + 128);
            if (v52 == 32)
              goto LABEL_13;
          }
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
LABEL_80:
          __break(1u);
          break;
        }
LABEL_13:
        swift_release();
        sub_23DF6615C((uint64_t)&v90);
        if (!v91)
          return swift_bridgeObjectRelease();
      }
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
    }
    __break(1u);
LABEL_85:
    __break(1u);
  }
  return result;
}

uint64_t sub_23DF6615C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (*((_BYTE *)v1 + 24) == 1)
  {
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return result;
  }
  v4 = *v1;
  v3 = v1[1];
  v5 = *(_QWORD *)(*v1 + 16);
  if (v3 == v5)
  {
    *((_BYTE *)v1 + 24) = 1;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    return result;
  }
  if (v3 >= v5)
  {
    __break(1u);
  }
  else
  {
    v1[1] = v3 + 1;
    v6 = v1[2];
    if (!__OFADD__(v6, 1))
    {
      v1[2] = v6 + 1;
      result = sub_23DF670F8(v4 + 40 * v3 + 32, a1);
      *(_QWORD *)(a1 + 40) = v6;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23DF66200()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CursiveText()
{
  return objc_opt_self();
}

__n128 __swift_memcpy25_16(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PointInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PointInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PointInfo()
{
  return &type metadata for PointInfo;
}

uint64_t getEnumTagSinglePayload for LanguageCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDA)
    goto LABEL_17;
  if (a2 + 38 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 38) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 38;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 38;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 38;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x27;
  v8 = v6 - 39;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 38 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 38) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD9)
    return ((uint64_t (*)(void))((char *)&loc_23DF66400 + 4 * byte_23DF6B096[v4]))();
  *a1 = a2 + 38;
  return ((uint64_t (*)(void))((char *)sub_23DF66434 + 4 * byte_23DF6B091[v4]))();
}

uint64_t sub_23DF66434(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF6643C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF66444);
  return result;
}

uint64_t sub_23DF66450(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF66458);
  *(_BYTE *)result = a2 + 38;
  return result;
}

uint64_t sub_23DF6645C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF66464(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LanguageCode()
{
  return &type metadata for LanguageCode;
}

unint64_t sub_23DF66484()
{
  unint64_t result;

  result = qword_256D1B160;
  if (!qword_256D1B160)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B1D0, &type metadata for LanguageCode);
    atomic_store(result, (unint64_t *)&qword_256D1B160);
  }
  return result;
}

_QWORD *sub_23DF664C8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B190);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B168);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DF665FC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B170);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DF666F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B178);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DF667EC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B180);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 32 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DF668E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DF669C8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DF66ADC(uint64_t a1)
{
  return sub_23DF666F4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23DF66AF0(uint64_t a1, char a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  float v9;
  __float2 v10;
  float sinval;
  float cosval;
  int8x16_t v13;
  float32x4_t v14;
  float v15;
  float32x4_t v16;
  float32x2_t v17;
  float v18;
  float v19;
  float32x4_t v20;
  float32x4_t v21;
  __float2 v22;
  float v23;
  int8x16_t v24;
  float32x4_t v25;
  float v26;
  float32x4_t v27;
  float32x2_t v28;
  float v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t result;
  float32x2_t v42;
  float32x2_t v43;
  float32x2_t v44;
  float32x2_t v45;
  float32x4_t v46;
  float32x4_t v47;
  __int128 v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  int8x16_t v52;
  float v53;
  __int128 v54;
  uint64_t v55;
  _UNKNOWN **v56;

  if ((a2 & 1) != 0)
    v6 = 16;
  else
    v6 = 15;
  v7 = a2 & 1;
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = (float)v7 * 0.0625;
    if ((a2 & 1) != 0)
    {
      v10 = __sincosf_stret((float)(v9 * 3.1416) * 0.5);
      sinval = v10.__sinval;
      cosval = v10.__cosval;
      v14 = *(float32x4_t *)(a1 + 16);
      v13 = *(int8x16_t *)(a1 + 32);
      v15 = *(float *)(a1 + 64);
      *(float32x2_t *)v16.f32 = vmul_n_f32(*(float32x2_t *)v13.i8, v15);
      v52 = v13;
      v53 = v15;
      v17 = vmul_n_f32((float32x2_t)vextq_s8(v13, v13, 8uLL).u32[0], v15);
      if ((a3 & 1) != 0)
      {
        v46 = *(float32x4_t *)(a1 + 16);
        v42 = v17;
        v44 = *(float32x2_t *)v16.f32;
        v18 = powf(v10.__sinval, 3.0);
        v17 = v42;
        *(float32x2_t *)v16.f32 = v44;
        v14 = v46;
        sinval = v10.__sinval;
        v19 = v10.__sinval - v18;
        *(float32x2_t *)v20.f32 = vadd_f32(*(float32x2_t *)v46.f32, vmul_n_f32(v44, v19));
        v20.f32[2] = v46.f32[2] + (float)(v19 * v42.f32[0]);
        v20.i32[3] = 0;
        v21 = v46;
        v21.i32[3] = 0;
        v50 = v21;
        v51 = v20;
      }
      else
      {
        v33 = *(float32x4_t *)(a1 + 16);
        v33.i32[3] = 0;
        v50 = v33;
        v51 = v33;
      }
      *(float32x2_t *)&v16.u32[2] = v17;
      v34 = vaddq_f32(v14, vmulq_n_f32(v16, sinval));
    }
    else
    {
      v22 = __sincosf_stret((float)((float)(1.0 - v9) * 3.1416) * 0.5);
      v23 = v22.__sinval;
      cosval = v22.__cosval;
      v25 = *(float32x4_t *)(a1 + 16);
      v24 = *(int8x16_t *)(a1 + 32);
      v26 = *(float *)(a1 + 64);
      *(float32x2_t *)v27.f32 = vmul_n_f32(*(float32x2_t *)v24.i8, v26);
      v52 = v24;
      v53 = v26;
      v28 = vmul_n_f32((float32x2_t)vextq_s8(v24, v24, 8uLL).u32[0], v26);
      if ((a3 & 1) != 0)
      {
        v47 = *(float32x4_t *)(a1 + 16);
        v43 = v28;
        v45 = *(float32x2_t *)v27.f32;
        v29 = powf(v22.__sinval, 3.0);
        v28 = v43;
        *(float32x2_t *)v27.f32 = v45;
        v25 = v47;
        v23 = v22.__sinval;
        v30 = v22.__sinval - v29;
        *(float32x2_t *)v31.f32 = vsub_f32(*(float32x2_t *)v47.f32, vmul_n_f32(v45, v30));
        v31.f32[2] = v47.f32[2] - (float)(v30 * v43.f32[0]);
        v31.i32[3] = 0;
        v32 = v47;
        v32.i32[3] = 0;
        v50 = v32;
        v51 = v31;
      }
      else
      {
        v35 = *(float32x4_t *)(a1 + 16);
        v35.i32[3] = 0;
        v50 = v35;
        v51 = v35;
      }
      *(float32x2_t *)&v27.u32[2] = v28;
      v34 = vsubq_f32(v25, vmulq_n_f32(v27, v23));
    }
    v49 = v34;
    v48 = *(_OWORD *)(a1 + 48);
    v36 = type metadata accessor for CircularArc();
    v37 = swift_allocObject();
    *(float32x4_t *)(v37 + 16) = v49;
    *(int8x16_t *)(v37 + 32) = v52;
    *(_OWORD *)(v37 + 48) = v48;
    *(float *)(v37 + 64) = cosval * v53;
    *(_QWORD *)(v37 + 68) = 0x40C90FDA00000000;
    *(float32x4_t *)(v37 + 80) = v50;
    *(_BYTE *)(v37 + 96) = 0;
    *(float32x4_t *)(v37 + 112) = v51;
    *(_BYTE *)(v37 + 128) = 0;
    *(float *)(v37 + 132) = v53;
    *(_BYTE *)(v37 + 136) = 0;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_23DF664C8(0, v8[2] + 1, 1, v8);
    v39 = v8[2];
    v38 = v8[3];
    if (v39 >= v38 >> 1)
      v8 = sub_23DF664C8((_QWORD *)(v38 > 1), v39 + 1, 1, v8);
    v55 = v36;
    v56 = &off_250EBFF88;
    *(_QWORD *)&v54 = v37;
    v8[2] = v39 + 1;
    result = sub_23DF6713C(&v54, (uint64_t)&v8[5 * v39 + 4]);
    if (v6 == v7)
      break;
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      return result;
    }
  }
  return (uint64_t)v8;
}

unint64_t sub_23DF66DEC(unint64_t result, int64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v5 = *(_QWORD **)v3;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  if (v6 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = *(_QWORD *)(a3 + 16);
  v10 = v9 - v8;
  if (__OFSUB__(v9, v8))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v11 = v6 + v10;
  if (__OFADD__(v6, v10))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v11 > v5[3] >> 1)
  {
    if (v6 <= v11)
      v13 = v6 + v10;
    else
      v13 = v6;
    v5 = sub_23DF664C8(isUniquelyReferenced_nonNull_native, v13, 1, v5);
  }
  v14 = (uint64_t)&v5[5 * v7 + 4];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B168);
  result = swift_arrayDestroy();
  if (!v10)
    goto LABEL_19;
  v15 = v5[2];
  v16 = __OFSUB__(v15, a2);
  v17 = v15 - a2;
  if (v16)
    goto LABEL_27;
  result = v14 + 40 * v9;
  v18 = &v5[5 * a2 + 4];
  if ((_QWORD *)result != v18 || result >= (unint64_t)&v18[5 * v17])
    result = (unint64_t)memmove((void *)result, v18, 40 * v17);
  v19 = v5[2];
  v16 = __OFADD__(v19, v10);
  v20 = v19 + v10;
  if (v16)
    goto LABEL_28;
  v5[2] = v20;
LABEL_19:
  if (v9)
    result = swift_arrayInitWithCopy();
  *(_QWORD *)v3 = v5;
  return result;
}

uint64_t sub_23DF66F50(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;

  v9 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_16:
    v4 = sub_23DF6A2AC();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      for (i = 0; ; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = MEMORY[0x242648E2C](i, a1);
          v7 = i + 1;
          if (__OFADD__(i, 1))
          {
LABEL_13:
            __break(1u);
            return v9;
          }
        }
        else
        {
          if (i >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_16;
          }
          v6 = *(_QWORD *)(a1 + 8 * i + 32);
          swift_retain();
          v7 = i + 1;
          if (__OFADD__(i, 1))
            goto LABEL_13;
        }
        if (v6 == a2)
        {
          swift_release();
        }
        else
        {
          sub_23DF6A264();
          sub_23DF6A288();
          sub_23DF6A294();
          sub_23DF6A270();
        }
        if (v7 == v4)
          return v9;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23DF670A8()
{
  unint64_t v0;

  v0 = sub_23DF6A360();
  swift_bridgeObjectRelease();
  if (v0 >= 0x27)
    return 39;
  else
    return v0;
}

uint64_t sub_23DF670F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23DF6713C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_23DF67154()
{
  unint64_t result;

  result = qword_256D1B198;
  if (!qword_256D1B198)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B324, &type metadata for CursiveTextPathDefinition);
    atomic_store(result, (unint64_t *)&qword_256D1B198);
  }
  return result;
}

uint64_t sub_23DF67198(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t destroy for LanguageDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for LanguageDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LanguageDefinition(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LanguageDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageDefinition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageDefinition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageDefinition()
{
  return &type metadata for LanguageDefinition;
}

ValueMetadata *type metadata accessor for LanguageFileDefinition()
{
  return &type metadata for LanguageFileDefinition;
}

uint64_t destroy for CursiveTextPathDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CursiveTextPathDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int128 v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  v6 = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v8 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CursiveTextPathDefinition(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  __int128 v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = v4;
  v5 = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = v5;
  v6 = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(a1 + 64) = v6;
  v7 = *(_DWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_DWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = v8;
  return a1;
}

__n128 __swift_memcpy129_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for CursiveTextPathDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for CursiveTextPathDefinition(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 129))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CursiveTextPathDefinition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 128) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 129) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 129) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CursiveTextPathDefinition()
{
  return &type metadata for CursiveTextPathDefinition;
}

uint64_t sub_23DF67818(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7304041 && a2 == 0xE300000000000000;
  if (v2 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E697465657267 && a2 == 0xE800000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xED00007365646F43)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23DF67980@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B220);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF68C30();
  sub_23DF6A390();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v24 = 0;
  v9 = sub_23DF6A2F4();
  v11 = v10;
  v20 = v9;
  v23 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_23DF6A2F4();
  v14 = v13;
  v18 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B230);
  v22 = 2;
  sub_23DF68C74(&qword_256D1B238, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  v19 = v14;
  swift_bridgeObjectRetain();
  sub_23DF6A2E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = v21;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  v16 = v19;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v20;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v16;
  a2[4] = v15;
  return result;
}

_QWORD *sub_23DF67BF4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1F8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF68BA8();
  sub_23DF6A390();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B208);
    sub_23DF68A9C(&qword_256D1B210, &qword_256D1B208, (uint64_t (*)(void))sub_23DF68BEC, MEMORY[0x24BEE12D0]);
    sub_23DF6A300();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_23DF67D40(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6867697279706F63 && a2 == 0xE900000000000074 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7265507374696E75 && a2 == 0xEA00000000006D45 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7265646E65637361 && a2 == 0xE800000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65646E6563736564 && a2 == 0xE900000000000072 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6867696548706163 && a2 == 0xE900000000000074 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xE800000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x73656B6F727473 && a2 == 0xE700000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x656C616373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_23DF68158@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char v79;
  char v80;
  __int128 v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  char v90;
  __int16 v91;
  char v92;
  int v93;
  char v94;
  __int16 v95;
  char v96;
  int v97;
  char v98;
  __int16 v99;
  char v100;
  int v101;
  char v102;
  __int16 v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char v111;
  __int16 v112;
  char v113;
  char v114;
  __int16 v115;
  char v116;
  char v117;
  __int16 v118;
  char v119;
  char v120;
  __int16 v121;
  char v122;
  char v123;
  uint64_t v124;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = 1;
  v120 = 1;
  v117 = 1;
  v114 = 1;
  v111 = 1;
  v9 = a1[3];
  v65 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_23DF68A14();
  sub_23DF6A390();
  if (v2)
  {
    v68 = v2;
    v66 = 0;
    v12 = 0;
    v70 = 0;
    v13 = 0;
    v124 = 0;
    v14 = 0;
    v64 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v69 = 0;
    v67 = 0;
LABEL_4:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
    v83 = v15;
    v84 = v64;
    v85 = v14;
    v86 = v124;
    v87 = v13;
    v88 = v70;
    v89 = v12;
    v90 = v123;
    v91 = v121;
    v92 = v122;
    v93 = v66;
    v94 = v120;
    v95 = v118;
    v96 = v119;
    v97 = v16;
    v98 = v117;
    v99 = v115;
    v100 = v116;
    v101 = v17;
    v102 = v114;
    v103 = v112;
    v104 = v113;
    v105 = v18;
    v106 = v69;
    v107 = v67;
    v108 = 0;
    v109 = 0;
    v110 = v111;
    return sub_23DF67198((uint64_t)&v83);
  }
  v10 = a2;
  LOBYTE(v83) = 0;
  v11 = sub_23DF6A2D0();
  v21 = v20;
  v63 = v11;
  LOBYTE(v83) = 1;
  swift_bridgeObjectRetain();
  v22 = sub_23DF6A2D0();
  v64 = v21;
  v24 = v23;
  v62 = v22;
  v25 = v21;
  LOBYTE(v83) = 2;
  swift_bridgeObjectRetain();
  v26 = sub_23DF6A2D0();
  v124 = v24;
  v28 = v27;
  v61 = v26;
  LOBYTE(v83) = 3;
  swift_bridgeObjectRetain();
  v29 = sub_23DF6A2DC();
  v70 = v28;
  v30 = HIDWORD(v29) & 1;
  v123 = BYTE4(v29) & 1;
  LOBYTE(v83) = 4;
  v60 = v29;
  v31 = sub_23DF6A2DC();
  v59 = v30;
  v66 = v31;
  v32 = HIDWORD(v31) & 1;
  v120 = BYTE4(v31) & 1;
  LOBYTE(v83) = 5;
  v33 = sub_23DF6A2DC();
  v57 = HIDWORD(v33) & 1;
  v58 = v33;
  v117 = BYTE4(v33) & 1;
  LOBYTE(v83) = 6;
  v34 = sub_23DF6A2DC();
  v55 = v32;
  v56 = v34;
  v54 = HIDWORD(v34) & 1;
  v114 = BYTE4(v34) & 1;
  LOBYTE(v83) = 7;
  v53 = sub_23DF6A2D0();
  v36 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1C0);
  LOBYTE(v71) = 8;
  sub_23DF68A9C(&qword_256D1B1C8, &qword_256D1B1C0, sub_23DF68A78, MEMORY[0x24BEE12D0]);
  v69 = v36;
  swift_bridgeObjectRetain();
  sub_23DF6A2E8();
  v68 = 0;
  v37 = v69;
  v38 = v83;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1E8);
  v80 = 9;
  sub_23DF68D80(&qword_256D1B1F0, MEMORY[0x24BEE4178]);
  v67 = v38;
  swift_bridgeObjectRetain();
  v39 = v68;
  sub_23DF6A2E8();
  v68 = v39;
  if (v39)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = v62;
    v15 = v63;
    v12 = v60;
    v13 = v61;
    v16 = v58;
    v17 = v56;
    v18 = v53;
    goto LABEL_4;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v51 = *((_QWORD *)&v81 + 1);
  v52 = v81;
  v111 = v82;
  v40 = v63;
  *(_QWORD *)&v71 = v63;
  *((_QWORD *)&v71 + 1) = v25;
  v41 = v25;
  v42 = v124;
  *(_QWORD *)&v72 = v62;
  *((_QWORD *)&v72 + 1) = v124;
  v43 = v61;
  v44 = v70;
  *(_QWORD *)&v73 = v61;
  *((_QWORD *)&v73 + 1) = v70;
  LODWORD(v74) = v60;
  BYTE4(v74) = v59;
  DWORD2(v74) = v66;
  BYTE12(v74) = v55;
  LODWORD(v75) = v58;
  BYTE4(v75) = v57;
  DWORD2(v75) = v56;
  BYTE12(v75) = v54;
  *(_QWORD *)&v76 = v53;
  *((_QWORD *)&v76 + 1) = v37;
  v45 = v37;
  v46 = v67;
  *(_QWORD *)&v77 = v67;
  v78 = v81;
  v79 = v82;
  sub_23DF68B44((uint64_t)&v71);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  v83 = v40;
  v84 = v41;
  v85 = v62;
  v86 = v42;
  v87 = v43;
  v88 = v44;
  v89 = v60;
  v90 = v123;
  v91 = v121;
  v92 = v122;
  v93 = v66;
  v94 = v120;
  v95 = v118;
  v96 = v119;
  v97 = v58;
  v98 = v117;
  v99 = v115;
  v100 = v116;
  v101 = v56;
  v102 = v114;
  v103 = v112;
  v104 = v113;
  v105 = v53;
  v106 = v45;
  v107 = v46;
  v108 = v52;
  v109 = v51;
  v110 = v111;
  result = sub_23DF67198((uint64_t)&v83);
  v47 = v78;
  *(_OWORD *)(v10 + 96) = v77;
  *(_OWORD *)(v10 + 112) = v47;
  *(_BYTE *)(v10 + 128) = v79;
  v48 = v74;
  *(_OWORD *)(v10 + 32) = v73;
  *(_OWORD *)(v10 + 48) = v48;
  v49 = v76;
  *(_OWORD *)(v10 + 64) = v75;
  *(_OWORD *)(v10 + 80) = v49;
  v50 = v72;
  *(_OWORD *)v10 = v71;
  *(_OWORD *)(v10 + 16) = v50;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23DF68A14()
{
  unint64_t result;

  result = qword_256D1B1B8;
  if (!qword_256D1B1B8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B690, &type metadata for CursiveTextPathDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B1B8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23DF68A78()
{
  return sub_23DF68A9C(&qword_256D1B1D0, &qword_256D1B1D8, (uint64_t (*)(void))sub_23DF68B00, MEMORY[0x24BEE12D0]);
}

uint64_t sub_23DF68A9C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24264927C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DF68B00()
{
  unint64_t result;

  result = qword_256D1B1E0;
  if (!qword_256D1B1E0)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B668, &type metadata for BezierCurveDefinition);
    atomic_store(result, (unint64_t *)&qword_256D1B1E0);
  }
  return result;
}

uint64_t sub_23DF68B44(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_23DF68BA8()
{
  unint64_t result;

  result = qword_256D1B200;
  if (!qword_256D1B200)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B618, &type metadata for LanguageFileDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B200);
  }
  return result;
}

unint64_t sub_23DF68BEC()
{
  unint64_t result;

  result = qword_256D1B218;
  if (!qword_256D1B218)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B2D4, &type metadata for LanguageDefinition);
    atomic_store(result, (unint64_t *)&qword_256D1B218);
  }
  return result;
}

unint64_t sub_23DF68C30()
{
  unint64_t result;

  result = qword_256D1B228;
  if (!qword_256D1B228)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B5C8, &type metadata for LanguageDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B228);
  }
  return result;
}

uint64_t sub_23DF68C74(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D1B230);
    v8 = a2;
    result = MEMORY[0x24264927C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DF68CD4()
{
  unint64_t result;

  result = qword_256D1B268;
  if (!qword_256D1B268)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B2AC, &type metadata for LanguageDefinition);
    atomic_store(result, (unint64_t *)&qword_256D1B268);
  }
  return result;
}

uint64_t sub_23DF68D18()
{
  return sub_23DF68A9C(&qword_256D1B288, &qword_256D1B1D8, (uint64_t (*)(void))sub_23DF68D3C, MEMORY[0x24BEE12A0]);
}

unint64_t sub_23DF68D3C()
{
  unint64_t result;

  result = qword_256D1B290;
  if (!qword_256D1B290)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B5A0, &type metadata for BezierCurveDefinition);
    atomic_store(result, (unint64_t *)&qword_256D1B290);
  }
  return result;
}

uint64_t sub_23DF68D80(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D1B1E8);
    result = MEMORY[0x24264927C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LanguageDefinition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23DF68E10 + 4 * byte_23DF6B0A0[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23DF68E44 + 4 * byte_23DF6B09B[v4]))();
}

uint64_t sub_23DF68E44(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF68E4C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF68E54);
  return result;
}

uint64_t sub_23DF68E60(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF68E68);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23DF68E6C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF68E74(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LanguageDefinition.CodingKeys()
{
  return &type metadata for LanguageDefinition.CodingKeys;
}

uint64_t getEnumTagSinglePayload for LanguageFileDefinition.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for LanguageFileDefinition.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23DF68F24 + 4 * byte_23DF6B0A5[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DF68F44 + 4 * byte_23DF6B0AA[v4]))();
}

_BYTE *sub_23DF68F24(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DF68F44(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DF68F4C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DF68F54(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DF68F5C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DF68F64(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23DF68F70()
{
  return 0;
}

ValueMetadata *type metadata accessor for LanguageFileDefinition.CodingKeys()
{
  return &type metadata for LanguageFileDefinition.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CursiveTextPathDefinition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CursiveTextPathDefinition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_23DF69064 + 4 * byte_23DF6B0B4[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_23DF69098 + 4 * byte_23DF6B0AF[v4]))();
}

uint64_t sub_23DF69098(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF690A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF690A8);
  return result;
}

uint64_t sub_23DF690B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF690BCLL);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_23DF690C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF690C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CursiveTextPathDefinition.CodingKeys()
{
  return &type metadata for CursiveTextPathDefinition.CodingKeys;
}

ValueMetadata *type metadata accessor for BezierCurveDefinition()
{
  return &type metadata for BezierCurveDefinition;
}

unint64_t sub_23DF690F8()
{
  unint64_t result;

  result = qword_256D1B2A8;
  if (!qword_256D1B2A8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B408, &type metadata for CursiveTextPathDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2A8);
  }
  return result;
}

unint64_t sub_23DF69140()
{
  unint64_t result;

  result = qword_256D1B2B0;
  if (!qword_256D1B2B0)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B4C0, &type metadata for LanguageFileDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2B0);
  }
  return result;
}

unint64_t sub_23DF69188()
{
  unint64_t result;

  result = qword_256D1B2B8;
  if (!qword_256D1B2B8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B578, &type metadata for LanguageDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2B8);
  }
  return result;
}

unint64_t sub_23DF691D0()
{
  unint64_t result;

  result = qword_256D1B2C0;
  if (!qword_256D1B2C0)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B4E8, &type metadata for LanguageDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2C0);
  }
  return result;
}

unint64_t sub_23DF69218()
{
  unint64_t result;

  result = qword_256D1B2C8;
  if (!qword_256D1B2C8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B510, &type metadata for LanguageDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2C8);
  }
  return result;
}

unint64_t sub_23DF69260()
{
  unint64_t result;

  result = qword_256D1B2D0;
  if (!qword_256D1B2D0)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B430, &type metadata for LanguageFileDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2D0);
  }
  return result;
}

unint64_t sub_23DF692A8()
{
  unint64_t result;

  result = qword_256D1B2D8;
  if (!qword_256D1B2D8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B458, &type metadata for LanguageFileDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2D8);
  }
  return result;
}

unint64_t sub_23DF692F0()
{
  unint64_t result;

  result = qword_256D1B2E0;
  if (!qword_256D1B2E0)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B378, &type metadata for CursiveTextPathDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2E0);
  }
  return result;
}

unint64_t sub_23DF69338()
{
  unint64_t result;

  result = qword_256D1B2E8;
  if (!qword_256D1B2E8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B3A0, &type metadata for CursiveTextPathDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2E8);
  }
  return result;
}

uint64_t sub_23DF6937C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12400 && a2 == 0xE200000000000000;
  if (v2 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12656 && a2 == 0xE200000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 12912 && a2 == 0xE200000000000000 || (sub_23DF6A354() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 13168 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23DF6A354();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23DF694D4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _OWORD v8[4];
  char v9;
  __int128 v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B2F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF696E8();
  sub_23DF6A390();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B1E8);
    v9 = 0;
    sub_23DF68D80(&qword_256D1B1F0, MEMORY[0x24BEE4178]);
    sub_23DF6A300();
    v8[3] = v10;
    v9 = 1;
    sub_23DF6A300();
    v8[2] = v10;
    v9 = 2;
    sub_23DF6A300();
    v8[1] = v10;
    v9 = 3;
    sub_23DF6A300();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v8[0] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23DF696E8()
{
  unint64_t result;

  result = qword_256D1B2F8;
  if (!qword_256D1B2F8)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B798, &type metadata for BezierCurveDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B2F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BezierCurveDefinition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BezierCurveDefinition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23DF69808 + 4 * byte_23DF6B0BE[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23DF6983C + 4 * byte_23DF6B0B9[v4]))();
}

uint64_t sub_23DF6983C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF69844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF6984CLL);
  return result;
}

uint64_t sub_23DF69858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF69860);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23DF69864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF6986C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BezierCurveDefinition.CodingKeys()
{
  return &type metadata for BezierCurveDefinition.CodingKeys;
}

unint64_t sub_23DF6988C()
{
  unint64_t result;

  result = qword_256D1B308;
  if (!qword_256D1B308)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B770, &type metadata for BezierCurveDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B308);
  }
  return result;
}

unint64_t sub_23DF698D4()
{
  unint64_t result;

  result = qword_256D1B310;
  if (!qword_256D1B310)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B6E0, &type metadata for BezierCurveDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B310);
  }
  return result;
}

unint64_t sub_23DF6991C()
{
  unint64_t result;

  result = qword_256D1B318;
  if (!qword_256D1B318)
  {
    result = MEMORY[0x24264927C](&unk_23DF6B708, &type metadata for BezierCurveDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D1B318);
  }
  return result;
}

float32x2_t sub_23DF69968(float a1)
{
  uint64_t v1;
  float v2;
  float32x4_t v3;

  v2 = *(float *)(v1 + 68) + (float)((float)(*(float *)(v1 + 72) - *(float *)(v1 + 68)) * a1);
  *(float32x2_t *)v3.f32 = vsub_f32(0, *(float32x2_t *)(v1 + 32));
  v3.f32[2] = 0.0 - *(float *)(v1 + 40);
  v3.i32[3] = 0;
  return vadd_f32(*(float32x2_t *)(v1 + 16), vmul_n_f32(sub_23DF5E2C8(v3, v2, *(int32x4_t *)(v1 + 48)), *(float *)(v1 + 64)));
}

uint64_t sub_23DF699EC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CircularArc()
{
  return objc_opt_self();
}

double sub_23DF69A1C(float a1)
{
  float32x4_t *v1;
  double result;

  __asm { FMOV            V3.4S, #3.0 }
  *(_QWORD *)&result = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v1[4], a1), a1), a1), vaddq_f32(vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v1[1], 1.0 - a1), 1.0 - a1), 1.0 - a1), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[2], _Q3), a1), 1.0 - a1), 1.0 - a1)), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[3], _Q3), a1), a1), 1.0 - a1))).u64[0];
  return result;
}

double sub_23DF69A78(float a1)
{
  float32x4_t *v1;
  double result;

  __asm
  {
    FMOV            V2.4S, #3.0
    FMOV            V6.4S, #6.0
  }
  *(_QWORD *)&result = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[4], _Q2), a1), a1), vsubq_f32(vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[3], _Q6), 1.0 - a1), a1), vsubq_f32(vsubq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[2], _Q2), 1.0 - a1), 1.0 - a1), vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[1], _Q2), 1.0 - a1), 1.0 - a1)), vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[2], _Q6), 1.0 - a1), a1))), vmulq_n_f32(vmulq_n_f32(vmulq_f32(v1[3], _Q2), a1), a1))).u64[0];
  return result;
}

double sub_23DF69AF0(float a1)
{
  float32x4_t *v1;
  float32x4_t v2;
  float32x4_t v3;
  float v4;
  int32x4_t v5;
  float v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v14;
  double result;

  v2.i32[0] = v1[3].i32[0];
  v3.i32[0] = v1[1].i32[0];
  v4 = a1 + a1;
  *(float *)v5.i32 = 1.0 - a1;
  v3.i32[1] = v1[3].i32[1];
  v3.i32[2] = v1[1].i32[2];
  v3.i32[3] = v1[3].i32[3];
  v2.i32[1] = v1[1].i32[1];
  v2.i32[2] = v1[3].i32[2];
  v2.i32[3] = v1[1].i32[3];
  v6 = (float)(1.0 - a1) * 4.0;
  *(float *)&v5.i32[1] = (float)(*(float *)v5.i32 + *(float *)v5.i32) - (float)(a1 * 4.0);
  v7 = vmulq_f32((float32x4_t)vdupq_lane_s64(v5.i64[0], 0), vmulq_f32(v3, (float32x4_t)xmmword_23DF6B830));
  v5.i64[1] = v5.i64[0];
  v8 = vmulq_f32((float32x4_t)vrev64q_s32(v5), vmulq_f32(v2, (float32x4_t)xmmword_23DF6B840));
  __asm { FMOV            V6.4S, #6.0 }
  v14 = vmulq_n_f32(vmulq_f32(v1[4], _Q6), a1);
  __asm { FMOV            V6.4S, #3.0 }
  *(_QWORD *)&result = vaddq_f32(vaddq_f32(vaddq_f32(v7, v8), v14), vmulq_n_f32(vmulq_f32(v1[2], _Q6), v4 - v6)).u64[0];
  return result;
}

void sub_23DF69BAC()
{
  float32x4_t *v0;
  uint64_t v1;
  float32x4_t v2;
  float v3;
  float v4;
  float v5;
  float32x4_t v6;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;

  v1 = 0;
  v2 = v0[1];
  v3 = 0.0;
  v4 = 0.0;
  while (!__OFADD__(v1, 1))
  {
    v9 = v2;
    v5 = (float)((float)(v1 + 1) * 0.001) + 0.0;
    *(double *)v6.i64 = sub_23DF69A1C(v3);
    v2 = v6;
    v7 = vsubq_f32(v6, v9);
    v8 = (int8x16_t)vmulq_f32(v7, v7);
    v4 = v4 + sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))));
    ++v1;
    v3 = v5;
    if (v5 >= 1.0)
      return;
  }
  __break(1u);
}

uint64_t sub_23DF69C5C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CubicBezier()
{
  return objc_opt_self();
}

uint64_t sub_23DF69C8C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CubicBezierStroke()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for RotationMinimizingFrame()
{
  return &type metadata for RotationMinimizingFrame;
}

double sub_23DF69CE0(uint64_t a1, float a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  BOOL v6;
  float32x4_t v7;
  double v8;
  float32x4_t v9;
  float32x4_t v10;
  uint64_t v11;
  __int128 v12;
  BOOL v13;
  double v15;
  float32x4_t v16;
  __int128 v17;
  __int128 v18;
  float32x4_t v19;
  unsigned __int8 v20;

  sub_23DF6A114(a1, (uint64_t)&v19);
  v3 = v20;
  sub_23DF69A78(a2);
  if (v3 == 1)
  {
    v15 = sub_23DF69A1C(a2);
    *(double *)&v5 = sub_23DF69AF0(a2);
    v4 = 0;
    HIDWORD(v5) = 0;
    while (1)
    {
      v17 = v5;
      v6 = *(float *)((unint64_t)&v17 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3))) == 0.0;
      if (v4 == 2)
        break;
      while (1)
      {
        ++v4;
        if (v6)
          break;
        if (v4 == 2)
          return v15;
        v6 = 0;
      }
    }
  }
  else
  {
    v16 = v19;
    *(double *)v7.i64 = sub_23DF69A1C(a2);
    v8 = *(double *)v7.i64;
    v9 = vsubq_f32(v7, v16);
    v10 = vmulq_f32(v9, v9);
    if (sqrtf(v10.f32[2] + (float)(v10.f32[0] + vmuls_lane_f32(v9.f32[1], *(float32x2_t *)v9.f32, 1))) != 0.0)
      return v8;
    v15 = *(double *)v7.i64;
    *(double *)&v12 = sub_23DF69AF0(a2);
    v11 = 0;
    HIDWORD(v12) = 0;
    while (1)
    {
      v18 = v12;
      v13 = *(float *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) == 0.0;
      if (v11 == 2)
        break;
      while (1)
      {
        ++v11;
        if (v13)
          break;
        if (v11 == 2)
          return v15;
        v13 = 0;
      }
    }
  }
  return v15;
}

uint64_t sub_23DF6A114(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D1B188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DF6A15C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23DF6A168()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23DF6A174()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23DF6A180()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23DF6A18C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23DF6A198()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23DF6A1A4()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23DF6A1B0()
{
  return MEMORY[0x24BDCEC88]();
}

uint64_t sub_23DF6A1BC()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_23DF6A1C8()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_23DF6A1D4()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_23DF6A1E0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23DF6A1EC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DF6A1F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DF6A204()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23DF6A210()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23DF6A21C()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23DF6A228()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23DF6A234()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23DF6A240()
{
  return MEMORY[0x24BDBD758]();
}

uint64_t sub_23DF6A24C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DF6A258()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DF6A264()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23DF6A270()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23DF6A27C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23DF6A288()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23DF6A294()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23DF6A2A0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23DF6A2AC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DF6A2B8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23DF6A2C4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DF6A2D0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23DF6A2DC()
{
  return MEMORY[0x24BEE32F0]();
}

uint64_t sub_23DF6A2E8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23DF6A2F4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23DF6A300()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23DF6A30C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23DF6A318()
{
  return MEMORY[0x24BEE3440]();
}

uint64_t sub_23DF6A324()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23DF6A330()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23DF6A33C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23DF6A348()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_23DF6A354()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DF6A360()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23DF6A36C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DF6A378()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DF6A384()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DF6A390()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23DF6A39C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23DF6A3A8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23DF6A3B4()
{
  return MEMORY[0x24BEE4A10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

