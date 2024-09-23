void sub_215BC004C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      objc_end_catch();
      JUMPOUT(0x215BBFFC0);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_215BC00A0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215BC00AC(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x215BC00B8);
}

void sub_215BC9D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215BC9FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215BCAA28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_215BCC9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215BCD270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215BCD494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215BD9B08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDA49C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDAA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215BDADE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDB2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_215BDC42C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDCBA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDD290(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDD4DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDD98C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDDB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_215BDDEBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDE84C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDF03C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDF7E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDF8C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDF9AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BDFF64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE0408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  void *v31;

  objc_sync_exit(v31);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_215BE0958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;

  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_215BE0DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;

  objc_sync_exit(v29);
  _Unwind_Resume(a1);
}

void sub_215BE13C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  void *v39;

  objc_sync_exit(v39);
  _Unwind_Resume(a1);
}

void sub_215BE1F80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE28F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  void *v21;

  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_215BE2BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  void *v21;

  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_215BE3058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;

  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_215BE3288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;

  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void __CRASHING_DUE_TO_PRIVACY_VIOLATION__(uint64_t a1)
{
  qword_254DFC6C0 = a1;
  abort();
}

void sub_215BE49D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_215BE5158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_215BE5928(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE5990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE5ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_215BE639C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE64C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215BE6714(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE6848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215BE69B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215BE6B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215BE7114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t dispatch thunk of NFCTagReaderSessionDelegate.tagReaderSessionDidBecomeActive(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NFCTagReaderSessionDelegate.tagReaderSession(_:didInvalidateWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of NFCTagReaderSessionDelegate.tagReaderSession(_:didDetect:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_215BE7338(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v3 = v2;
  if (a2 >> 62)
    goto LABEL_26;
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    if (!v6)
    {
LABEL_22:
      v17 = v3 + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate;
      if (!MEMORY[0x2199EE174](v17))
        return swift_bridgeObjectRelease();
      v18 = *(_QWORD *)(v17 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v18 + 24))(a1, v7, ObjectType, v18);
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
    v23 = MEMORY[0x24BEE4AF8];
    sub_215BE7760(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
      break;
    v21 = v3;
    v22 = a1;
    v8 = 0;
    v7 = v23;
    while (v6 != v8)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v9 = (void *)MEMORY[0x2199ED91C](v8, a2);
      }
      else
      {
        v9 = *(void **)(a2 + 8 * v8 + 32);
        swift_unknownObjectRetain();
      }
      v10 = objc_msgSend(v9, sel_asNFCFeliCaTag);
      if (v10)
      {
        v11 = v10;
        v3 = 0;
      }
      else
      {
        v12 = objc_msgSend(v9, sel_asNFCISO15693Tag);
        if (v12)
        {
          v11 = v12;
          v3 = 2;
        }
        else
        {
          v13 = objc_msgSend(v9, sel_asNFCISO7816Tag);
          if (v13)
          {
            v11 = v13;
            v3 = 1;
          }
          else
          {
            v14 = objc_msgSend(v9, sel_asNFCMiFareTag);
            if (!v14)
              goto LABEL_28;
            v11 = v14;
            v3 = 3;
          }
        }
      }
      swift_unknownObjectRelease();
      a1 = *(_QWORD *)(v23 + 16);
      v15 = *(_QWORD *)(v23 + 24);
      if (a1 >= v15 >> 1)
        sub_215BE7760(v15 > 1, a1 + 1, 1);
      ++v8;
      *(_QWORD *)(v23 + 16) = a1 + 1;
      v16 = v23 + 16 * a1;
      *(_QWORD *)(v16 + 32) = v11;
      *(_BYTE *)(v16 + 40) = v3;
      if (v6 == v8)
      {
        v3 = v21;
        a1 = v22;
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_26:
    swift_bridgeObjectRetain();
    v6 = sub_215BFADC4();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_28:
  result = sub_215BFADB8();
  __break(1u);
  return result;
}

id sub_215BE7680()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NFCTagReaderSessionDelegateSwiftWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NFCTagReaderSessionDelegateSwiftWrapper()
{
  return objc_opt_self();
}

void type metadata accessor for NFCFeliCaEncryptionId(uint64_t a1)
{
  sub_215BE771C(a1, &qword_254DFB568);
}

void type metadata accessor for NFCISO15693ResponseFlag(uint64_t a1)
{
  sub_215BE771C(a1, &qword_254DFB570);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_215BE771C(a1, &qword_254DFB578);
}

void sub_215BE771C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_215BE7760(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_215BE7798(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_215BE777C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_215BE7964(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_215BE7798(char a1, int64_t a2, char a3, char *a4)
{
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
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB5E0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 16 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_215BFADD0();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199EE084]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_215BE7940(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_215BE7964(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB658);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_215BFADD0();
  __break(1u);
  return result;
}

uint64_t NFCISO7816ResponseAPDU.statusWord1.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t NFCISO7816ResponseAPDU.statusWord1.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*NFCISO7816ResponseAPDU.statusWord1.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO7816ResponseAPDU.statusWord2.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t NFCISO7816ResponseAPDU.statusWord2.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*NFCISO7816ResponseAPDU.statusWord2.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO7816ResponseAPDU.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_215BE7B34(v1, *(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t sub_215BE7B34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_215BE7B48(a1, a2);
  return a1;
}

uint64_t sub_215BE7B48(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t NFCISO7816ResponseAPDU.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_215BE7BC0(*(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t sub_215BE7BC0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_215BE7BD4(a1, a2);
  return a1;
}

uint64_t sub_215BE7BD4(uint64_t a1, unint64_t a2)
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

uint64_t (*NFCISO7816ResponseAPDU.payload.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO7816ResponseAPDU.init(statusWord1:statusWord2:paylaod:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_BYTE *)a5 = result;
  *(_BYTE *)(a5 + 1) = a2;
  *(_QWORD *)(a5 + 8) = a3;
  *(_QWORD *)(a5 + 16) = a4;
  return result;
}

uint64_t NFCISO7816ResponseAPDU.init(statusWord1:statusWord2:payload:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_BYTE *)a5 = result;
  *(_BYTE *)(a5 + 1) = a2;
  *(_QWORD *)(a5 + 8) = a3;
  *(_QWORD *)(a5 + 16) = a4;
  return result;
}

void NFCISO7816Tag.sendCommand(apdu:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_215BE7E80;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_215BE7E88;
  v9[3] = &block_descriptor;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_sendCommandAPDU_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_215BE7D14(int a1, uint64_t a2, int a3, int a4, id a5, void (*a6)(_QWORD *))
{
  id v8;
  _QWORD v9[3];
  char v10;

  if (!a5)
    __asm { BR              X10 }
  v9[1] = 0;
  v9[2] = 0;
  v9[0] = a5;
  v10 = 1;
  v8 = a5;
  a6(v9);

}

uint64_t sub_215BE7E5C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_215BE7E80(int a1, uint64_t a2, int a3, int a4, void *a5)
{
  uint64_t v5;

  sub_215BE7D14(a1, a2, a3, a4, a5, *(void (**)(_QWORD *))(v5 + 16));
}

uint64_t sub_215BE7E88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void (*v9)(uint64_t, unint64_t, uint64_t, uint64_t, void *);
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v9 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v11 = sub_215BFABCC();
  v13 = v12;

  v14 = a5;
  v9(v11, v13, a3, a4, a5);

  sub_215BE7BD4(v11, v13);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t destroy for NFCISO7816ResponseAPDU(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 16);
  if (v1 >> 60 != 15)
    return sub_215BE7BD4(*(_QWORD *)(result + 8), v1);
  return result;
}

uint64_t _s7CoreNFC22NFCISO7816ResponseAPDUVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = (uint64_t *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v3;
  }
  else
  {
    v5 = *v3;
    sub_215BE7B48(*v3, *(_QWORD *)(a2 + 16));
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t assignWithCopy for NFCISO7816ResponseAPDU(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = (_OWORD *)(a1 + 8);
  v4 = (uint64_t *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_215BE7B48(*v4, *(_QWORD *)(a2 + 16));
      v8 = *(_QWORD *)(a1 + 8);
      v9 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 8) = v7;
      *(_QWORD *)(a1 + 16) = v5;
      sub_215BE7BD4(v8, v9);
      return a1;
    }
    sub_215BE807C(a1 + 8);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *v3 = *(_OWORD *)v4;
    return a1;
  }
  v6 = *v4;
  sub_215BE7B48(*v4, *(_QWORD *)(a2 + 16));
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_215BE807C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NFCISO7816ResponseAPDU(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  *(_WORD *)a1 = *(_WORD *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = (_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 16);
    if (v7 >> 60 != 15)
    {
      v8 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = *v5;
      *(_QWORD *)(a1 + 16) = v7;
      sub_215BE7BD4(v8, v6);
      return a1;
    }
    sub_215BE807C(a1 + 8);
  }
  *v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCISO7816ResponseAPDU(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 12);
  v3 = *(_QWORD *)(a1 + 16) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCISO7816ResponseAPDU(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCISO7816ResponseAPDU()
{
  return &type metadata for NFCISO7816ResponseAPDU;
}

uint64_t sub_215BE8200()
{
  uint64_t v0;

  v0 = sub_215BFAC38();
  __swift_allocate_value_buffer(v0, qword_254DFD460);
  __swift_project_value_buffer(v0, (uint64_t)qword_254DFD460);
  return sub_215BFAC2C();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void NFCMiFareTag.sendMiFareCommand(commandPacket:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v7 = (void *)sub_215BFABC0();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  v10[4] = sub_215BE842C;
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_215BE8434;
  v10[3] = &block_descriptor_0;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_sendMiFareCommand_completionHandler_, v7, v9);
  _Block_release(v9);

}

void sub_215BE83A8(int a1, int a2, id a3, void (*a4)(void))
{
  id v6;

  if (a3)
  {
    v6 = a3;
    ((void (*)(id, _QWORD, uint64_t))a4)(a3, 0, 1);

  }
  else
  {
    a4();
  }
}

uint64_t sub_215BE8408()
{
  swift_release();
  return swift_deallocObject();
}

void sub_215BE842C(int a1, int a2, void *a3)
{
  uint64_t v3;

  sub_215BE83A8(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_215BE8434(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(uint64_t, unint64_t, void *);
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v5 = *(void (**)(uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a2;
  v7 = sub_215BFABCC();
  v9 = v8;

  v10 = a3;
  v5(v7, v9, a3);

  sub_215BE7BD4(v7, v9);
  return swift_release();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void NFCMiFareTag.sendMiFareISO7816Command(_:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_215BE86F0;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_215BE7E88;
  v9[3] = &block_descriptor_6;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_sendMiFareISO7816Command_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_215BE85A8(int a1, uint64_t a2, int a3, int a4, id a5, void (*a6)(_QWORD *))
{
  id v8;
  _QWORD v9[3];
  char v10;

  if (!a5)
    __asm { BR              X10 }
  v9[1] = 0;
  v9[2] = 0;
  v9[0] = a5;
  v10 = 1;
  v8 = a5;
  a6(v9);

}

void sub_215BE86F0(int a1, uint64_t a2, int a3, int a4, void *a5)
{
  uint64_t v5;

  sub_215BE85A8(a1, a2, a3, a4, a5, *(void (**)(_QWORD *))(v5 + 16));
}

uint64_t NFCPresentmentIntentAssertion.isValid.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (os_unfair_lock_s *)(v1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  v3 = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t NFCPresentmentIntentAssertion.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_254DFB530 != -1)
    swift_once();
  v2 = sub_215BFAC38();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DFD460);
  v3 = sub_215BFAC20();
  v4 = sub_215BFAD28();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215BBD000, v3, v4, "NFCPresentmentIntentAssertion.deinit", v5, 2u);
    MEMORY[0x2199EE0F0](v5, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  sub_215BFACEC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t NFCPresentmentIntentAssertion.__deallocating_deinit()
{
  NFCPresentmentIntentAssertion.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_215BE887C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BE88D8()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[4] = *(_QWORD *)(v0[2] + 16);
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_215BE8928;
  return sub_215BF5DE4();
}

uint64_t sub_215BE8928()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215BE8998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  *(_BYTE *)(v2 + 16) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  v3 = sub_215BFACC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v1, 1, 1, v3);
  v4 = swift_allocObject();
  swift_weakInit();
  v5 = swift_allocObject();
  swift_weakInit();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v5;
  v6[5] = v4;
  sub_215BE9280(v1, (uint64_t)&unk_254DFBE10, (uint64_t)v6);
  swift_release();
  sub_215BEC42C(v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BE8AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[13] = a4;
  v5[14] = a5;
  v6 = sub_215BFAC14();
  v5[15] = v6;
  v5[16] = *(_QWORD *)(v6 - 8);
  v5[17] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFBE20);
  v5[18] = v7;
  v5[19] = *(_QWORD *)(v7 - 8);
  v5[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BE8B38()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 168) = Strong;
  if (Strong)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254DFBE28);
    sub_215BFACF8();
    swift_beginAccess();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v2;
    *v2 = v0;
    v2[1] = sub_215BE8DC0;
    return sub_215BFAD04();
  }
  else
  {
    if (qword_254DFB530 != -1)
      swift_once();
    v4 = sub_215BFAC38();
    __swift_project_value_buffer(v4, (uint64_t)qword_254DFD460);
    v5 = sub_215BFAC20();
    v6 = sub_215BFAD34();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = swift_slowAlloc();
      v8 = swift_slowAlloc();
      v9 = v8;
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v0 + 88) = sub_215BF6694(0x29287472617473, 0xE700000000000000, &v9);
      sub_215BFAD58();
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v0 + 96) = 62;
      sub_215BFAD58();
      _os_log_impl(&dword_215BBD000, v5, v6, "%s: %ld:Invalid state", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v8, -1, -1);
      MEMORY[0x2199EE0F0](v7, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BE8DC0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BE8E14()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t Strong;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;

  v1 = *(unsigned __int8 *)(v0 + 184);
  if (v1 != 2)
  {
    if ((v1 & 1) != 0)
    {
      if (qword_254DFB530 != -1)
        swift_once();
      v12 = sub_215BFAC38();
      __swift_project_value_buffer(v12, (uint64_t)qword_254DFD460);
      v13 = sub_215BFAC20();
      v14 = sub_215BFAD1C();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = swift_slowAlloc();
        v16 = swift_slowAlloc();
        v23 = v16;
        *(_DWORD *)v15 = 136315394;
        *(_QWORD *)(v15 + 4) = sub_215BF6694(0x29287472617473, 0xE700000000000000, &v23);
        *(_WORD *)(v15 + 12) = 2048;
        *(_QWORD *)(v15 + 14) = 79;
        _os_log_impl(&dword_215BBD000, v13, v14, "%s: %ld: cooldown completed", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199EE0F0](v16, -1, -1);
        MEMORY[0x2199EE0F0](v15, -1, -1);
      }

      v11 = (id)NFSharedSignpostLog();
      if (!v11)
        goto LABEL_19;
    }
    else
    {
      if (qword_254DFB530 != -1)
        swift_once();
      v4 = sub_215BFAC38();
      __swift_project_value_buffer(v4, (uint64_t)qword_254DFD460);
      v5 = sub_215BFAC20();
      v6 = sub_215BFAD1C();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = swift_slowAlloc();
        v8 = swift_slowAlloc();
        v23 = v8;
        *(_DWORD *)v7 = 136315394;
        *(_QWORD *)(v7 + 4) = sub_215BF6694(0x29287472617473, 0xE700000000000000, &v23);
        *(_WORD *)(v7 + 12) = 2048;
        *(_QWORD *)(v7 + 14) = 69;
        _os_log_impl(&dword_215BBD000, v5, v6, "%s: %ld: assertion expired", (uint8_t *)v7, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199EE0F0](v8, -1, -1);
        MEMORY[0x2199EE0F0](v7, -1, -1);
      }

      Strong = swift_weakLoadStrong();
      if (Strong)
      {
        v10 = *(_QWORD *)(Strong + 24);
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v10 + 20));
        *(_BYTE *)(v10 + 16) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 20));
        swift_release();
        swift_release();
      }
      v11 = (id)NFSharedSignpostLog();
      if (!v11)
        goto LABEL_19;
    }
    v17 = v11;
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();
    v19 = *(_QWORD *)(v0 + 128);
    v18 = *(_QWORD *)(v0 + 136);
    v20 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
LABEL_19:
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v21;
    *v21 = v0;
    v21[1] = sub_215BE8DC0;
    return sub_215BFAD04();
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  swift_beginAccess();
  v2 = swift_weakLoadStrong();
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 20));
    *(_BYTE *)(v3 + 16) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
    swift_release();
    swift_release();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BE9280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215BED108(a1, (uint64_t)v7);
  v8 = sub_215BFACC8();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_215BEC42C((uint64_t)v7);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_215BFACB0();
      v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_215BFACBC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v10 = 0;
  v12 = 0;
LABEL_6:
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t static NFCPresentmentIntentAssertion.acquire()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_215BFAC14();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BE9468()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    v2 = v1;
    v4 = v0[4];
    v3 = v0[5];
    v5 = v0[3];
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  v6 = swift_allocObject();
  v0[6] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB850);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 20) = 0;
  *(_BYTE *)(v7 + 16) = 0;
  *(_QWORD *)(v6 + 24) = v7;
  type metadata accessor for NFCPresentmentSuppressionController(0);
  swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_215BF56A4();
  v8 = (_QWORD *)swift_task_alloc();
  v0[7] = v8;
  *v8 = v0;
  v8[1] = sub_215BE9584;
  return sub_215BE887C();
}

uint64_t sub_215BE9584()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v2 + 8))(*(_QWORD *)(v2 + 48));
}

uint64_t sub_215BE95FC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL static CardSession.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CardSession.Error.hash(into:)()
{
  return sub_215BFAE3C();
}

uint64_t CardSession.Error.hashValue.getter()
{
  sub_215BFAE30();
  sub_215BFAE3C();
  return sub_215BFAE48();
}

BOOL sub_215BE96B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_215BE96CC()
{
  return sub_215BFAE3C();
}

uint64_t sub_215BE96F4()
{
  uint64_t v0;

  return sub_215BED0FC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CardSession.APDU.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  sub_215BE7B48(v1, *(_QWORD *)(v0 + 80));
  return v1;
}

uint64_t CardSession.APDU.respond(response:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

void sub_215BE9750()
{
  __asm { BR              X11 }
}

uint64_t sub_215BE9784@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD);

  if ((a1 & 0xFF000000000000) == 0)
    return sub_215BFADB8();
  v4 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(**(int **)(v1[4] + 32) + *(_QWORD *)(v1[4] + 32));
  v2 = (_QWORD *)swift_task_alloc();
  v1[5] = v2;
  *v2 = v1;
  v2[1] = sub_215BE985C;
  return v4(v1[2], v1[3], v1[4]);
}

uint64_t sub_215BE985C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

BOOL static CardSession.APDU.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48) && *(_QWORD *)(a1 + 64) == *(_QWORD *)(a2 + 64);
}

uint64_t CardSession.APDU.deinit()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 48));
  swift_release();
  swift_release();
  sub_215BE7BD4(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return v0;
}

uint64_t CardSession.APDU.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 48));
  swift_release();
  swift_release();
  sub_215BE7BD4(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocClassInstance();
}

BOOL sub_215BE9960(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 48) == *(_QWORD *)(*(_QWORD *)a2 + 48)
      && *(_QWORD *)(*(_QWORD *)a1 + 64) == *(_QWORD *)(*(_QWORD *)a2 + 64);
}

uint64_t _s7CoreNFC29NFCPresentmentIntentAssertionC5ErrorO9hashValueSivg_0()
{
  sub_215BFAE30();
  sub_215BFAE3C();
  return sub_215BFAE48();
}

uint64_t sub_215BE99D8()
{
  sub_215BFAE30();
  sub_215BFAE3C();
  return sub_215BFAE48();
}

uint64_t sub_215BE9A18()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_215BE9A30()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  return swift_task_switch();
}

uint64_t sub_215BE9A4C()
{
  uint64_t v0;

  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112) != 0);
}

uint64_t static CardSession.isEligible.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_254DFC258 + dword_254DFC258);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_215BE9ABC;
  return v3();
}

uint64_t sub_215BE9ABC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_215BE9B0C()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v0 = swift_allocObject();
  *(_BYTE *)(v0 + 16) = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedHardwareManager);
  v5[4] = sub_215BEC200;
  v5[5] = v0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_215BE9C24;
  v5[3] = &block_descriptor_1;
  v2 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_areFeaturesSupported_expiry_completion_, 1, v2, 1.0);
  _Block_release(v2);

  swift_beginAccess();
  v3 = *(unsigned __int8 *)(v0 + 16);
  swift_release();
  return v3;
}

void sub_215BE9C24(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, id);
  id v6;

  v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, v6);
  swift_release();

}

uint64_t CardSession.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;

  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_215BE9CDC;
  return CardSession.init()();
}

uint64_t sub_215BE9CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t CardSession.init()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[2] = v0;
  v2 = sub_215BFAC14();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB888);
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  v1[9] = v4;
  v1[10] = *(_QWORD *)(v4 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB890);
  v1[13] = v5;
  v1[14] = *(_QWORD *)(v5 - 8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BE9E34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB898);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 20) = 0;
  *(_BYTE *)(v2 + 16) = 0;
  *(_QWORD *)(v1 + 16) = v2;
  v3 = OBJC_IVAR____TtC7CoreNFC11CardSession__uiString;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8A8);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0xE000000000000000;
  *(_QWORD *)(v1 + v3) = v4;
  v7 = (uint64_t (*)(void))((char *)&dword_254DFC258 + dword_254DFC258);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v5;
  *v5 = v0;
  v5[1] = sub_215BE9EE8;
  return v7();
}

uint64_t sub_215BE9EE8(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 160) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BE9F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  _QWORD *v12;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (*(_BYTE *)(v0 + 160) == 1)
  {
    v1 = *(_QWORD *)(v0 + 120);
    v2 = *(_QWORD *)(v0 + 128);
    v4 = *(_QWORD *)(v0 + 104);
    v3 = *(_QWORD *)(v0 + 112);
    v5 = *(_QWORD *)(v0 + 96);
    v15 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 64);
    v16 = *(_QWORD *)(v0 + 72);
    v17 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BEE6A10], v8);
    sub_215BFACD4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
    type metadata accessor for CardSession.EventStream(0);
    v10 = swift_allocObject();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + OBJC_IVAR____TtCC7CoreNFC11CardSession11EventStream_stream, v1, v4);
    *(_QWORD *)(v9 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStream) = v10;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    v11(v9 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation, v5, v16);
    v11(v17, v5, v16);
    type metadata accessor for NFCCardSession(0);
    swift_allocObject();
    *(_QWORD *)(v9 + 24) = sub_215BEE6BC(v17);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v12;
    *v12 = v0;
    v12[1] = sub_215BEA1A0;
    return sub_215BEA3C4();
  }
  else
  {
    sub_215BEC254();
    swift_allocError();
    *v14 = 6;
    swift_willThrow();
    swift_release();
    swift_release();
    type metadata accessor for CardSession(0);
    swift_deallocPartialClassInstance();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BEA1A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BEA204()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    v2 = v1;
    v4 = *(_QWORD *)(v0 + 32);
    v3 = *(_QWORD *)(v0 + 40);
    v5 = *(_QWORD *)(v0 + 24);
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  v6 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 112);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_215BEA314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 80);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEA3C4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[4] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB8D0);
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BEA454()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_215BEA4A0;
  return sub_215BF1F04();
}

uint64_t sub_215BEA4A0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215BEA524()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;

  v1 = *(void **)(v0 + 96);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
  if ((swift_dynamicCast() & 1) != 0)
    __asm { BR              X11 }
  v3 = *(void **)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, *(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation, v8);
  *(_QWORD *)(v0 + 24) = 0x4000000000000000;
  sub_215BFACE0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
  sub_215BEC254();
  swift_allocError();
  *v10 = 0;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_215BEA6A8()
{
  JUMPOUT(0x215BEA5D0);
}

void sub_215BEA6B0()
{
  JUMPOUT(0x215BEA5D0);
}

void sub_215BEA6B8()
{
  JUMPOUT(0x215BEA5D0);
}

uint64_t sub_215BEA6C0()
{
  return sub_215BFADB8();
}

void sub_215BEA724()
{
  JUMPOUT(0x215BEA5D0);
}

void sub_215BEA72C()
{
  JUMPOUT(0x215BEA5D0);
}

uint64_t sub_215BEA734()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[10] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB8D0);
  v1[14] = v3;
  v1[15] = *(_QWORD *)(v3 - 8);
  v1[16] = swift_task_alloc();
  v4 = sub_215BFAC14();
  v1[17] = v4;
  v1[18] = *(_QWORD *)(v4 - 8);
  v1[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BEA7EC()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    v2 = v1;
    v4 = v0[18];
    v3 = v0[19];
    v5 = v0[17];
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  v6 = (uint64_t *)(v0[10] + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v7 = *v6;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 32));
  v8 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  v0[20] = v9;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 32));
  swift_release();
  v10 = (_QWORD *)swift_task_alloc();
  v0[21] = v10;
  *v10 = v0;
  v10[1] = sub_215BEA910;
  return sub_215BF36A0(v8, v9);
}

uint64_t sub_215BEA910()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_215BEA97C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  *(_BYTE *)(v0 + 185) = 1;
  v2 = *(_QWORD *)(v1 + 16);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v0 + 185;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  *(_BYTE *)(v2 + 16) = **(_BYTE **)(v3 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  swift_task_dealloc();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEAA50()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;

  v1 = *(void **)(v0 + 176);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 64) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
  if ((swift_dynamicCast() & 1) != 0)
    __asm { BR              X11 }
  v4 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, *(_QWORD *)(v0 + 80) + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation, v7);
  *(_QWORD *)(v0 + 72) = 0x4000000000000000;
  sub_215BFACE0();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v9 = *(void **)(v0 + 176);
  sub_215BEC254();
  swift_allocError();
  *v10 = 0;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_215BEABFC()
{
  JUMPOUT(0x215BEAB78);
}

void sub_215BEAC04()
{
  JUMPOUT(0x215BEAB78);
}

uint64_t sub_215BEAC0C()
{
  return sub_215BFADB8();
}

void sub_215BEAC70()
{
  JUMPOUT(0x215BEAB78);
}

void sub_215BEAC78()
{
  JUMPOUT(0x215BEAB78);
}

BOOL static CardSession.EmulationUIStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CardSession.EmulationUIStatus.hash(into:)()
{
  return sub_215BFAE3C();
}

BOOL sub_215BEACC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_215BEACDC(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  *(_QWORD *)(v2 + 40) = v1;
  v4 = sub_215BFAC14();
  *(_QWORD *)(v2 + 48) = v4;
  *(_QWORD *)(v2 + 56) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 64) = swift_task_alloc();
  *(_BYTE *)(v2 + 89) = *a1;
  return swift_task_switch();
}

uint64_t sub_215BEAD48()
{
  uint64_t v0;
  id v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v1 = (id)NFSharedSignpostLog();
  v2 = *(unsigned __int8 *)(v0 + 89);
  if (!v1)
  {
    if (*(_BYTE *)(v0 + 89))
      goto LABEL_5;
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v3 = v1;
  v4 = *(_QWORD *)(v0 + 56);
  sub_215BFAD4C();
  sub_215BFAC08();
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 48);
  if (!v2)
  {
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    goto LABEL_7;
  }
  sub_215BFABFC();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
LABEL_5:
  v7 = 0;
LABEL_8:
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v8;
  *v8 = v0;
  v8[1] = sub_215BEAE64;
  return sub_215BF40AC(v7);
}

uint64_t sub_215BEAE64()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BEAEC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 40);
  swift_beginAccess();
  *(_BYTE *)(v0 + 88) = 0;
  v2 = *(_QWORD *)(v1 + 16);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v0 + 88;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  *(_BYTE *)(v2 + 16) = **(_BYTE **)(v3 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  swift_task_dealloc();
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEAF68()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEAFA0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v3 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 20));
  if (*(_BYTE *)(v3 + 16) == 2)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
  }
  else
  {
    *(_BYTE *)(v3 + 16) = 2;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
    swift_release();
    v4 = *(_QWORD *)(v0 + 24);
    v5 = sub_215BFACC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v6 + 24) = 0;
    *(_QWORD *)(v6 + 32) = v4;
    *(_BYTE *)(v6 + 40) = 0;
    swift_retain();
    sub_215BEBE98((uint64_t)v2, (uint64_t)&unk_254DFC1B0, v6);
  }
  return swift_release();
}

uint64_t CardSession.EventStream.makeAsyncIterator()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E8);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB890);
  sub_215BFACF8();
  type metadata accessor for CardSession.EventStream.Iterator(0);
  v4 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v4 + OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, v3, v0);
  return v4;
}

uint64_t sub_215BEB184(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_215BEB19C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E8);
  *v1 = v0;
  v1[1] = sub_215BEB220;
  return sub_215BFAD10();
}

uint64_t sub_215BEB220()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_endAccess();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t CardSession.EventStream.Iterator.deinit()
{
  return sub_215BEB440(&OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, &qword_254DFB8E8);
}

uint64_t CardSession.EventStream.Iterator.__deallocating_deinit()
{
  return sub_215BEB494(&OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, &qword_254DFB8E8);
}

uint64_t sub_215BEB2A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = *v1;
  return swift_task_switch();
}

uint64_t sub_215BEB2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = v2;
  if (a2)
  {
    swift_getObjectType();
    sub_215BFACB0();
  }
  return swift_task_switch();
}

uint64_t sub_215BEB330()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = **(_QWORD **)(v0 + 48);
  return swift_task_switch();
}

uint64_t sub_215BEB350()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E8);
  *v1 = v0;
  v1[1] = sub_215BEB3D4;
  return sub_215BFAD10();
}

uint64_t sub_215BEB3D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_endAccess();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t CardSession.EventStream.deinit()
{
  return sub_215BEB440(&OBJC_IVAR____TtCC7CoreNFC11CardSession11EventStream_stream, &qword_254DFB890);
}

uint64_t sub_215BEB440(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + *a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v2;
}

uint64_t CardSession.EventStream.__deallocating_deinit()
{
  return sub_215BEB494(&OBJC_IVAR____TtCC7CoreNFC11CardSession11EventStream_stream, &qword_254DFB890);
}

uint64_t sub_215BEB494(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + *a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_215BEB4E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB890);
  sub_215BFACF8();
  type metadata accessor for CardSession.EventStream.Iterator(0);
  v6 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6 + OBJC_IVAR____TtCCC7CoreNFC11CardSession11EventStream8Iterator_iterator, v5, v2);
  result = swift_release();
  *a1 = v6;
  return result;
}

uint64_t sub_215BEB5B0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  os_unfair_lock_s **v3;
  os_unfair_lock_s *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v3 = (os_unfair_lock_s **)(*a1 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v4 = *v3;
  v5 = (uint64_t *)&(*v3)[4];
  swift_retain();
  os_unfair_lock_lock(v4 + 8);
  sub_215BEC09C(v5, v9);
  os_unfair_lock_unlock(v4 + 8);
  v6 = v9[0];
  v7 = v9[1];
  result = swift_release();
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t sub_215BEB650()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v2 = *v1;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  v3 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  swift_release();
  return v3;
}

uint64_t sub_215BEB6D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  os_unfair_lock_s **v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v8 = *v7;
  v9 = *v7 + 8;
  os_unfair_lock_lock(v9);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v8[4]._os_unfair_lock_opaque = a1;
  *(_QWORD *)&v8[6]._os_unfair_lock_opaque = a2;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v9);
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  v10 = *(_QWORD *)(v2 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 20));
  LODWORD(v9) = *(unsigned __int8 *)(v10 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 20));
  result = swift_release();
  if ((_DWORD)v9 == 1)
  {
    v12 = sub_215BFACC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v6, 1, 1, v12);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v2;
    swift_retain();
    sub_215BEB9D0((uint64_t)v6, (uint64_t)&unk_254DFB908, (uint64_t)v13);
    swift_release();
    return sub_215BEC42C((uint64_t)v6);
  }
  return result;
}

uint64_t sub_215BEB854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a4;
  return swift_task_switch();
}

uint64_t sub_215BEB86C()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (uint64_t *)(v0[5] + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v2 = *v1;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 24);
  v0[6] = v4;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  swift_release();
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  *v5 = v0;
  v5[1] = sub_215BEB928;
  return sub_215BF1B6C(v3, v4);
}

uint64_t sub_215BEB928()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215BEB99C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEB9D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215BED108(a1, (uint64_t)v6);
  v7 = sub_215BFACC8();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_215BEC42C((uint64_t)v6);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  else
  {
    sub_215BFACBC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v9 = sub_215BFACB0();
  v11 = v10;
  swift_unknownObjectRelease();
  if (v11 | v9)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v9;
    v13[3] = v11;
  }
  return swift_task_create();
}

void (*sub_215BEBB40(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC7CoreNFC11CardSession__uiString);
  swift_beginAccess();
  v5 = *v4;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
  v7 = *(_QWORD *)(v5 + 16);
  v6 = *(_QWORD *)(v5 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
  swift_release();
  v3[3] = v7;
  v3[4] = v6;
  return sub_215BEBBE4;
}

void sub_215BEBBE4(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_215BEB6D4(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_215BEB6D4(*(_QWORD *)(*(_QWORD *)a1 + 24), v4);
  }
  free(v2);
}

uint64_t sub_215BEBC48()
{
  return swift_retain();
}

uint64_t CardSession.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

uint64_t CardSession.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC7CoreNFC11CardSession_nfcEventStreamContinuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t CardSession.APDU.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = v0;
  sub_215BFAD7C();
  swift_bridgeObjectRelease();
  sub_215BFAC80();
  swift_bridgeObjectRelease();
  sub_215BFAC80();
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v1 + 80);
  sub_215BE7B48(v3, v2);
  sub_215BFABB4();
  sub_215BE7BD4(v3, v2);
  sub_215BFAC80();
  swift_bridgeObjectRelease();
  sub_215BFAC80();
  return 0x646E6F707365527BLL;
}

uint64_t sub_215BEBE78()
{
  return CardSession.APDU.debugDescription.getter();
}

uint64_t sub_215BEBE98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_215BFACC8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_215BFACBC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_215BEC42C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_215BFACB0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_215BEBFDC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_215BEBFEC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_215BEC050;
  return v6(a1);
}

uint64_t sub_215BEC050()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215BEC09C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_215BEC0B8(uint64_t a1, char a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 48);
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 80);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 16);
    type metadata accessor for CardSession.APDU();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    *(_OWORD *)(v10 + 24) = *(_OWORD *)(a1 + 24);
    *(_QWORD *)(v10 + 40) = v8;
    *(_QWORD *)(v10 + 48) = v5;
    *(_QWORD *)(v10 + 72) = v6;
    *(_QWORD *)(v10 + 80) = v7;
    sub_215BE7B48(v6, v7);
    swift_retain_n();
    swift_retain_n();
    sub_215BE7B48(v6, v7);
    v11 = sub_215BFABD8();
    swift_release();
    swift_release();
    sub_215BE7BD4(v6, v7);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 64);
    type metadata accessor for CardSession.APDU();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = nullsub_1;
    *(_QWORD *)(v10 + 24) = 0;
    *(_QWORD *)(v10 + 32) = &unk_254DFBDF0;
    *(_QWORD *)(v10 + 40) = 0;
    *(_QWORD *)(v10 + 48) = v5;
    *(_OWORD *)(v10 + 72) = xmmword_215BFD4A0;
  }
  *(_QWORD *)(v10 + 64) = v11;
  *(_BYTE *)(v10 + 56) = a2 & 1;
  return v10;
}

uint64_t sub_215BEC1F0()
{
  return swift_deallocObject();
}

uint64_t sub_215BEC200(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_215BEC254()
{
  unint64_t result;

  result = qword_254DFC230;
  if (!qword_254DFC230)
  {
    result = MEMORY[0x2199EE090](&protocol conformance descriptor for CardSession.Error, &type metadata for CardSession.Error);
    atomic_store(result, (unint64_t *)&qword_254DFC230);
  }
  return result;
}

uint64_t type metadata accessor for CardSession(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFBA10);
}

uint64_t type metadata accessor for CardSession.EventStream(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFBC78);
}

uint64_t sub_215BEC2C0()
{
  return objectdestroy_16Tm();
}

uint64_t sub_215BEC2C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_215BED2C0;
  return sub_215BF2588(a1, v4, v5, v6, v7);
}

uint64_t type metadata accessor for CardSession.EventStream.Iterator(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFBD30);
}

uint64_t sub_215BEC358(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_215BEC38C()
{
  return objectdestroy_16Tm();
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215BEC3CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_215BED2C0;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_215BEC42C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_215BEC470()
{
  unint64_t result;

  result = qword_254DFB910;
  if (!qword_254DFB910)
  {
    result = MEMORY[0x2199EE090](&protocol conformance descriptor for NFCPresentmentIntentAssertion.Error, &type metadata for NFCPresentmentIntentAssertion.Error);
    atomic_store(result, (unint64_t *)&qword_254DFB910);
  }
  return result;
}

unint64_t sub_215BEC4B8()
{
  unint64_t result;

  result = qword_254DFB918;
  if (!qword_254DFB918)
  {
    result = MEMORY[0x2199EE090](&protocol conformance descriptor for CardSession.Error, &type metadata for CardSession.Error);
    atomic_store(result, (unint64_t *)&qword_254DFB918);
  }
  return result;
}

unint64_t sub_215BEC500()
{
  unint64_t result;

  result = qword_254DFB920[0];
  if (!qword_254DFB920[0])
  {
    result = MEMORY[0x2199EE090](&protocol conformance descriptor for CardSession.EmulationUIStatus, &type metadata for CardSession.EmulationUIStatus);
    atomic_store(result, qword_254DFB920);
  }
  return result;
}

uint64_t sub_215BEC544()
{
  return MEMORY[0x24BEE3F20];
}

unint64_t sub_215BEC554()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DFB938;
  if (!qword_254DFB938)
  {
    v1 = type metadata accessor for CardSession.EventStream.Iterator(255);
    result = MEMORY[0x2199EE090](&protocol conformance descriptor for CardSession.EventStream.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_254DFB938);
  }
  return result;
}

uint64_t sub_215BEC5A0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_215BEB6D4(v1, v2);
}

uint64_t type metadata accessor for NFCPresentmentIntentAssertion()
{
  return objc_opt_self();
}

uint64_t method lookup function for NFCPresentmentIntentAssertion()
{
  return swift_lookUpClassMethod();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for NFCPresentmentIntentAssertion.Error()
{
  return &type metadata for NFCPresentmentIntentAssertion.Error;
}

uint64_t sub_215BEC630()
{
  return type metadata accessor for CardSession(0);
}

void sub_215BEC638()
{
  unint64_t v0;

  sub_215BECF08(319, qword_254DFBFC0, MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for CardSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CardSession.isEmulationInProgress.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 144) + *(_QWORD *)(*(_QWORD *)v0 + 144));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_215BED2BC;
  return v4();
}

uint64_t dispatch thunk of static CardSession.isSupported.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of CardSession.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(v0 + 160) + *(_QWORD *)(v0 + 160));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_215BEC788;
  return v4();
}

uint64_t sub_215BEC788(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of CardSession.startEmulation()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 176) + *(_QWORD *)(*(_QWORD *)v0 + 176));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_215BED2C0;
  return v4();
}

uint64_t dispatch thunk of CardSession.stopEmulation(status:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 184) + *(_QWORD *)(*(_QWORD *)v1 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_215BEC894;
  return v6(a1);
}

uint64_t sub_215BEC894()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of CardSession.invalidate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CardSession.alertMessage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of CardSession.alertMessage.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of CardSession.alertMessage.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of CardSession.eventStream.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t getEnumTagSinglePayload for CardSession.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CardSession.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_215BEC9F4 + 4 * byte_215BFCFF1[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_215BECA28 + 4 * byte_215BFCFEC[v4]))();
}

uint64_t sub_215BECA28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BECA30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215BECA38);
  return result;
}

uint64_t sub_215BECA44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215BECA4CLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_215BECA50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BECA58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CardSession.Error()
{
  return &type metadata for CardSession.Error;
}

unint64_t *initializeBufferWithCopyOfBuffer for CardSession.Event(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_215BECAA4(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_215BECAA4(unint64_t result)
{
  if (!(result >> 62))
    return swift_retain();
  return result;
}

unint64_t destroy for CardSession.Event(unint64_t *a1)
{
  return sub_215BECABC(*a1);
}

unint64_t sub_215BECABC(unint64_t result)
{
  if (!(result >> 62))
    return swift_release();
  return result;
}

unint64_t *assignWithCopy for CardSession.Event(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_215BECAA4(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_215BECABC(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for CardSession.Event(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_215BECABC(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for CardSession.Event(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xE && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 14);
  v3 = (((*(_QWORD *)a1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)a1 >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xD)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CardSession.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xD)
  {
    *(_QWORD *)result = a2 - 14;
    if (a3 >= 0xE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0xE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_215BECBE0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return *a1 + 2;
}

_QWORD *sub_215BECBF8(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

_QWORD *sub_215BECC08(_QWORD *result, uint64_t a2)
{
  if (a2 < 2)
    *result = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 62);
  else
    *result = (a2 - 2) | 0x8000000000000000;
  return result;
}

ValueMetadata *type metadata accessor for CardSession.Event()
{
  return &type metadata for CardSession.Event;
}

uint64_t type metadata accessor for CardSession.APDU()
{
  return objc_opt_self();
}

uint64_t method lookup function for CardSession.APDU()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for NFCPresentmentSuppressionController.Event(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s7CoreNFC29NFCPresentmentIntentAssertionC5ErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_215BECD48 + 4 * byte_215BFCFFB[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_215BECD7C + 4 * byte_215BFCFF6[v4]))();
}

uint64_t sub_215BECD7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BECD84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215BECD8CLL);
  return result;
}

uint64_t sub_215BECD98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215BECDA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_215BECDA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BECDAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BECDB8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_215BECDC0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CardSession.EmulationUIStatus()
{
  return &type metadata for CardSession.EmulationUIStatus;
}

uint64_t sub_215BECDDC()
{
  return type metadata accessor for CardSession.EventStream(0);
}

void sub_215BECDE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_215BECE20(a1, a2, a3, qword_254DFBC88, MEMORY[0x24BEE6A98]);
}

uint64_t method lookup function for CardSession.EventStream()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_215BECE04()
{
  return type metadata accessor for CardSession.EventStream.Iterator(0);
}

void sub_215BECE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_215BECE20(a1, a2, a3, qword_254DFBD48, MEMORY[0x24BEE6A78]);
}

void sub_215BECE20(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(_QWORD, ValueMetadata *))
{
  unint64_t v5;

  sub_215BECF08(319, a4, a5);
  if (v5 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for CardSession.EventStream.Iterator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CardSession.EventStream.Iterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_215BEC894;
  return v6(a1);
}

void sub_215BECF08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for CardSession.Event);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t getEnumTagSinglePayload for CardSession.SessionState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CardSession.SessionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_215BED02C + 4 * byte_215BFD005[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_215BED060 + 4 * byte_215BFD000[v4]))();
}

uint64_t sub_215BED060(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BED068(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215BED070);
  return result;
}

uint64_t sub_215BED07C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215BED084);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_215BED088(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BED090(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_215BED09C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CardSession.SessionState()
{
  return &type metadata for CardSession.SessionState;
}

unint64_t sub_215BED0B8()
{
  unint64_t result;

  result = qword_254DFBDE8;
  if (!qword_254DFBDE8)
  {
    result = MEMORY[0x2199EE090](&unk_215BFD478, &type metadata for CardSession.SessionState);
    atomic_store(result, (unint64_t *)&qword_254DFBDE8);
  }
  return result;
}

uint64_t sub_215BED0FC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_215BED108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_215BED150()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215BED174(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_215BED2C0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254DFBDF8 + dword_254DFBDF8))(a1, v4);
}

uint64_t sub_215BED1E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_215BED208()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215BED23C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_215BED2C0;
  return sub_215BE8AAC(a1, v4, v5, v7, v6);
}

uint64_t sub_215BED2E4(void *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  unint64_t v11;
  uint64_t result;

  v2 = (void *)sub_215BFABA8();
  v3 = objc_msgSend(v2, sel_domain);
  v4 = sub_215BFAC68();
  v6 = v5;

  v7 = sub_215BFAC50();
  if (!v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v4 != v7 || v8 != v6)
  {
    v10 = sub_215BFADE8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_11;
LABEL_9:

    return 6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_11:
  v11 = (unint64_t)objc_msgSend(v2, sel_code);

  if ((v11 & 0x8000000000000000) == 0 && !HIDWORD(v11))
    return v11;
  result = sub_215BFADAC();
  __break(1u);
  return result;
}

uint64_t sub_215BED47C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for XPCSession(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCSession);
}

uint64_t sub_215BED490(void *a1)
{
  return sub_215BED4A0(a1);
}

uint64_t sub_215BED498(void *a1)
{
  return sub_215BED4A0(a1);
}

uint64_t sub_215BED4A0(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;

  if (qword_254DFB530 != -1)
    swift_once();
  v2 = sub_215BFAC38();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DFD460);
  v3 = a1;
  v4 = a1;
  v5 = sub_215BFAC20();
  v6 = sub_215BFAD34();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v7 = 136315650;
    sub_215BF6694(0xD000000000000015, 0x8000000215C00D70, &v15);
    sub_215BFAD58();
    *(_WORD *)(v7 + 12) = 2048;
    sub_215BFAD58();
    *(_WORD *)(v7 + 22) = 2112;
    v10 = a1;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    sub_215BFAD58();
    *v8 = v14;

    _os_log_impl(&dword_215BBD000, v5, v6, "%s:%ld: xpcError=%@", (uint8_t *)v7, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFBEB0);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v9, -1, -1);
    MEMORY[0x2199EE0F0](v7, -1, -1);
  }
  else
  {

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
  swift_allocError();
  *v11 = a1;
  v12 = a1;
  return swift_continuation_throwingResumeWithError();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199EE048](a1, v6, a5);
}

void sub_215BED754(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_215BED7A4(char a1)
{
  return sub_215BEDDDC(a1, 0xD000000000000010, 0x8000000215C01300, 25, "%s:%ld: fieldChange=%{BOOL}d");
}

uint64_t sub_215BED90C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11[2];
  char v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v11[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DFB530 != -1)
    swift_once();
  v4 = sub_215BFAC38();
  __swift_project_value_buffer(v4, (uint64_t)qword_254DFD460);
  v5 = sub_215BFAC20();
  v6 = sub_215BFAD28();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v11[0] = v8;
    *(_DWORD *)v7 = 136315394;
    v10 = sub_215BF6694(0xD000000000000014, 0x8000000215C012E0, v11);
    sub_215BFAD58();
    *(_WORD *)(v7 + 12) = 2048;
    v10 = 34;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v5, v6, "%s:%ld:", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v8, -1, -1);
    MEMORY[0x2199EE0F0](v7, -1, -1);
  }

  v11[0] = 0;
  v11[1] = 0;
  v12 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  sub_215BFACE0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_215BEDB5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  char v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DFB530 != -1)
    swift_once();
  v4 = sub_215BFAC38();
  __swift_project_value_buffer(v4, (uint64_t)qword_254DFD460);
  v5 = sub_215BFAC20();
  v6 = sub_215BFAD28();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_QWORD *)&v12 = v8;
    *(_DWORD *)v7 = 136315394;
    v11 = sub_215BF6694(0xD000000000000019, 0x8000000215C012C0, (uint64_t *)&v12);
    sub_215BFAD58();
    *(_WORD *)(v7 + 12) = 2048;
    v11 = 39;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v5, v6, "%s:%ld:", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v8, -1, -1);
    MEMORY[0x2199EE0F0](v7, -1, -1);
  }

  v12 = xmmword_215BFD500;
  v13 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  sub_215BFACE0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_215BEDDB4(char a1)
{
  return sub_215BEDDDC(a1, 0xD000000000000012, 0x8000000215C012A0, 44, "%s:%ld: fieldPresent=%{BOOL}d");
}

uint64_t sub_215BEDDDC(char a1, uint64_t a2, unint64_t a3, uint64_t a4, const char *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28[2];
  char v29;

  v26 = a3;
  v9 = v5;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DFB530 != -1)
    swift_once();
  v15 = sub_215BFAC38();
  __swift_project_value_buffer(v15, (uint64_t)qword_254DFD460);
  v16 = sub_215BFAC20();
  v17 = sub_215BFAD28();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v23 = a4;
    v19 = v18;
    v20 = swift_slowAlloc();
    v25 = v9;
    v21 = v20;
    v28[0] = v20;
    *(_DWORD *)v19 = 136315650;
    v24 = a5;
    v27 = sub_215BF6694(a2, v26, v28);
    sub_215BFAD58();
    *(_WORD *)(v19 + 12) = 2048;
    v27 = v23;
    sub_215BFAD58();
    *(_WORD *)(v19 + 22) = 1024;
    LODWORD(v27) = a1 & 1;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v16, v17, v24, (uint8_t *)v19, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v21, -1, -1);
    MEMORY[0x2199EE0F0](v19, -1, -1);
  }

  v28[0] = a1 & 1;
  v28[1] = 0;
  v29 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  sub_215BFACE0();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_215BEE088(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  int v9;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t *v15;
  uint64_t result;
  __int128 v17;
  char v18;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v8 = a1;
    v9 = sub_215BED2E4(a1);
    v11 = v9 != 32 && v9 != 8;
    v12 = OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation;
    if (*(_QWORD *)(v2
                   + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation))
    {
      sub_215BF4F94();
      v13 = swift_allocError();
      *v14 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
      swift_allocError();
      *v15 = v13;
      swift_continuation_throwingResumeWithError();
    }
    *(_QWORD *)(v2 + v12) = 0;
    *(_QWORD *)&v17 = v11;
    *((_QWORD *)&v17 + 1) = 0x2000000000000000;
    v18 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
    sub_215BFACE0();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    v17 = xmmword_215BFD510;
    v18 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
    sub_215BFACE0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    result = *(_QWORD *)(v2
                       + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation);
    if (result)
      return swift_continuation_throwingResume();
  }
  return result;
}

uint64_t sub_215BEE35C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  int v7;
  uint64_t v8;
  _QWORD v10[3];
  char v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1;
  v7 = sub_215BED2E4(a1);
  v8 = 2;
  if (v7 == 5)
    v8 = 3;
  if (v7 == 48)
    v8 = 4;
  v10[1] = v8;
  v10[2] = 0x3000000000000000;
  v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  sub_215BFACE0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_215BFACEC();
}

id sub_215BEE5A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NFCCardSessionDelegate(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_215BEE614()
{
  return type metadata accessor for NFCCardSessionDelegate(0);
}

uint64_t type metadata accessor for NFCCardSessionDelegate(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFBEF8);
}

void sub_215BEE630()
{
  unint64_t v0;

  sub_215BF47A8(319, &qword_254DFBF08, (uint64_t)&type metadata for NFCCardSession.Event, MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

_QWORD *sub_215BEE6BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  objc_class *v20;
  char *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v25 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC250);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  v26 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC200);
  v9 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v1[14] = 0;
  v1[15] = 0;
  v1[16] = 0;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer) = 0;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationTimeLimit) = 0x404E000000000000;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU) = 0;
  v12 = (char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_eventStreamContinuation;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  v27 = *(_QWORD *)(v13 - 8);
  v14 = v12;
  v15 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v14, v25, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE6A10], v2);
  sub_215BFACD4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStream, v11, v24);
  v16 = (char *)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation;
  v17 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))((uint64_t)v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation, v8, v6);
  v18 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v19 = v17;
  v18(v8, v16, v6);
  v20 = (objc_class *)type metadata accessor for NFCCardSessionDelegate(0);
  v21 = (char *)objc_allocWithZone(v20);
  *(_QWORD *)&v21[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation] = 0;
  v18(&v21[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_eventStreamContinuation], v8, v6);
  v28.receiver = v21;
  v28.super_class = v20;
  v22 = objc_msgSendSuper2(&v28, sel_init);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  v1[17] = v22;
  sub_215BF071C();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v15, v13);
  return v1;
}

uint64_t sub_215BEE94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[31] = a3;
  v4[32] = v3;
  v4[29] = a1;
  v4[30] = a2;
  v5 = sub_215BFAC14();
  v4[33] = v5;
  v4[34] = *(_QWORD *)(v5 - 8);
  v4[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BEE9B0()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20[3];

  v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    v2 = v1;
    v4 = *(_QWORD *)(v0 + 272);
    v3 = *(_QWORD *)(v0 + 280);
    v5 = *(_QWORD *)(v0 + 264);
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  v6 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v6 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU);
  if (!v7
    || (v8 = *(_QWORD *)(v0 + 248), *(_QWORD *)(v8 + 48) == *(_QWORD *)(v7 + 48))
    && *(_QWORD *)(v8 + 64) == *(_QWORD *)(v7 + 64)
    && *(_BYTE *)(v7 + 56) != 1)
  {
    v16 = *(_QWORD *)(v6 + 112);
    *(_QWORD *)(v0 + 288) = v16;
    if (v16)
    {
      v17 = *(_QWORD *)(v0 + 240);
      v18 = *(_QWORD *)(v0 + 232);
      swift_unknownObjectRetain();
      sub_215BE7B48(v18, v17);
      swift_retain();
      swift_retain();
      return swift_task_switch();
    }
    else
    {
      sub_215BEC254();
      swift_allocError();
      *v19 = 0;
      swift_willThrow();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    v9 = qword_254DFB530;
    swift_retain();
    if (v9 != -1)
      swift_once();
    v10 = sub_215BFAC38();
    __swift_project_value_buffer(v10, (uint64_t)qword_254DFD460);
    v11 = sub_215BFAC20();
    v12 = sub_215BFAD28();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20[0] = v14;
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)(v0 + 216) = sub_215BF6694(0xD00000000000001FLL, 0x8000000215C01260, v20);
      sub_215BFAD58();
      *(_WORD *)(v13 + 12) = 2048;
      *(_QWORD *)(v0 + 224) = 221;
      sub_215BFAD58();
      _os_log_impl(&dword_215BBD000, v11, v12, "%s:%ld: Unexpected APDU)", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v14, -1, -1);
      MEMORY[0x2199EE0F0](v13, -1, -1);
    }

    v20[0] = 0;
    v20[1] = 0xE000000000000000;
    sub_215BFAD7C();
    swift_bridgeObjectRelease();
    return sub_215BFADB8();
  }
}

uint64_t sub_215BEED20()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;

  v1 = v0;
  v2 = (void *)v0[36];
  v5 = v0 + 31;
  v4 = v0[31];
  v3 = v5[1];
  v7 = v1[29];
  v6 = v1[30];
  v1[2] = v1;
  v1[3] = sub_215BEEF38;
  v8 = swift_continuation_init();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v1[14] = sub_215BF52D4;
  v1[15] = v9;
  v1[10] = MEMORY[0x24BDAC760];
  v1[11] = 1107296256;
  v1[12] = sub_215BED754;
  v1[13] = &block_descriptor_77;
  v10 = _Block_copy(v1 + 10);
  swift_release();
  v11 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_215BFAD70();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFC1C0);
  swift_dynamicCast();
  v12 = (void *)v1[26];
  v13 = (void *)sub_215BFABC0();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v8;
  v14[3] = v3;
  v14[4] = v4;
  v14[5] = v7;
  v14[6] = v6;
  v1[16] = MEMORY[0x24BDAC760];
  v1 += 16;
  v1[4] = sub_215BF5228;
  v1[5] = v14;
  v1[1] = 1107296256;
  v1[2] = sub_215BF6E48;
  v1[3] = &block_descriptor_83;
  v15 = _Block_copy(v1);
  sub_215BE7B48(v7, v6);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_sendAPDU_completion_, v13, v15);
  _Block_release(v15);
  swift_unknownObjectRelease();

  return swift_continuation_await();
}

uint64_t sub_215BEEF38()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 296) = v1;
  if (v1)
    swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BEEFAC()
{
  uint64_t v0;

  sub_215BE7BD4(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_release();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_215BEEFFC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEF038()
{
  uint64_t v0;

  sub_215BE7BD4(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_215BEF09C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t *v31;
  NSObject *oslog;
  uint64_t v33;

  if (a1)
  {
    if (qword_254DFB530 != -1)
      swift_once();
    v7 = sub_215BFAC38();
    __swift_project_value_buffer(v7, (uint64_t)qword_254DFD460);
    v8 = a1;
    v9 = a1;
    v10 = sub_215BFAC20();
    v11 = sub_215BFAD28();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v33 = v13;
      *(_DWORD *)v12 = 136315650;
      sub_215BF6694(0xD00000000000001FLL, 0x8000000215C01260, &v33);
      sub_215BFAD58();
      *(_WORD *)(v12 + 12) = 2048;
      sub_215BFAD58();
      *(_WORD *)(v12 + 22) = 2080;
      v14 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC238);
      v15 = sub_215BFAC74();
      sub_215BF6694(v15, v16, &v33);
      sub_215BFAD58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_215BBD000, v10, v11, "%s:%ld: error=%s", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v13, -1, -1);
      MEMORY[0x2199EE0F0](v12, -1, -1);
    }
    else
    {

    }
    sub_215BEC254();
    v29 = swift_allocError();
    *v30 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
    swift_allocError();
    *v31 = v29;
    swift_continuation_throwingResumeWithError();
  }
  else
  {
    v20 = swift_retain();
    v21 = sub_215BEC0B8(v20, 1, 1);
    swift_release();
    *(_QWORD *)(a3 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU) = v21;
    swift_release();
    swift_continuation_throwingResume();
    if (qword_254DFB530 != -1)
      swift_once();
    v22 = sub_215BFAC38();
    __swift_project_value_buffer(v22, (uint64_t)qword_254DFD460);
    sub_215BE7B48(a5, a6);
    sub_215BE7B48(a5, a6);
    oslog = sub_215BFAC20();
    v23 = sub_215BFAD28();
    if (os_log_type_enabled(oslog, v23))
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v33 = v25;
      *(_DWORD *)v24 = 136315650;
      sub_215BF6694(0xD00000000000001FLL, 0x8000000215C01260, &v33);
      sub_215BFAD58();
      *(_WORD *)(v24 + 12) = 2048;
      sub_215BFAD58();
      *(_WORD *)(v24 + 22) = 2080;
      sub_215BE7B48(a5, a6);
      v26 = sub_215BFABB4();
      v28 = v27;
      sub_215BE7BD4(a5, a6);
      sub_215BF6694(v26, v28, &v33);
      sub_215BFAD58();
      swift_bridgeObjectRelease();
      sub_215BE7BD4(a5, a6);
      sub_215BE7BD4(a5, a6);
      _os_log_impl(&dword_215BBD000, oslog, v23, "%s:%ld: sent=%s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v25, -1, -1);
      MEMORY[0x2199EE0F0](v24, -1, -1);

    }
    else
    {
      sub_215BE7BD4(a5, a6);
      sub_215BE7BD4(a5, a6);

    }
  }
}

uint64_t sub_215BEF5B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 72) = a4;
  *(_QWORD *)(v5 + 80) = a5;
  return swift_task_switch();
}

uint64_t sub_215BEF5C8()
{
  uint64_t v0;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 88) = Strong;
  if (Strong)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEF640()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 112);
  return swift_task_switch();
}

uint64_t sub_215BEF660()
{
  uint64_t v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 96))
    return swift_task_switch();
  if (qword_254DFB530 != -1)
    swift_once();
  v2 = sub_215BFAC38();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DFD460);
  v3 = sub_215BFAC20();
  v4 = sub_215BFAD28();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v7 = v6;
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)(v0 + 40) = sub_215BF6694(0xD000000000000021, 0x8000000215C011C0, &v7);
    sub_215BFAD58();
    *(_WORD *)(v5 + 12) = 2048;
    *(_QWORD *)(v0 + 48) = 256;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v3, v4, "%s:%ld: Emulation has not started", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v6, -1, -1);
    MEMORY[0x2199EE0F0](v5, -1, -1);
    swift_release();

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEF858()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_215BEF8A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 104);
  if (!v1)
    goto LABEL_5;
  if (*(_QWORD *)(v1 + 48) != *(_QWORD *)(v0 + 80) || (*(_BYTE *)(v1 + 56) & 1) != 0)
  {
    swift_release();
LABEL_5:
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_254DFB530 != -1)
    swift_once();
  v3 = sub_215BFAC38();
  __swift_project_value_buffer(v3, (uint64_t)qword_254DFD460);
  v4 = sub_215BFAC20();
  v5 = sub_215BFAD28();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v9 = v7;
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v0 + 56) = sub_215BF6694(0xD000000000000021, 0x8000000215C011C0, &v9);
    sub_215BFAD58();
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v0 + 64) = 265;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v4, v5, "%s:%ld: Stopping emulation", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v7, -1, -1);
    MEMORY[0x2199EE0F0](v6, -1, -1);
  }

  v8 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v8;
  *(_QWORD *)v8 = v0;
  *(_QWORD *)(v8 + 8) = sub_215BEFAD0;
  *(_QWORD *)(v8 + 160) = *(_QWORD *)(v0 + 88);
  *(_BYTE *)(v8 + 184) = 0;
  return swift_task_switch();
}

uint64_t sub_215BEFAD0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BEFB34()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEFB74()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BEFBB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_215BFACC8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_215BFACBC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_215BEC42C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_215BFACB0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_215BEFCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB8D0);
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v5 = sub_215BFAC14();
  v3[11] = v5;
  v3[12] = *(_QWORD *)(v5 - 8);
  v3[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BEFD70()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v1 = (id)NFSharedSignpostLog();
  if (v1)
  {
    v2 = v1;
    v4 = *(_QWORD *)(v0 + 96);
    v3 = *(_QWORD *)(v0 + 104);
    v5 = *(_QWORD *)(v0 + 88);
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  v6 = *(_QWORD *)(v0 + 56);
  v7 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU;
  v8 = *(_QWORD *)(v6 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU);
  if (v8 && (*(_BYTE *)(v8 + 56) & 1) == 0)
  {
    swift_retain();
    sub_215BFAD7C();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = 276;
    sub_215BFADDC();
    sub_215BFAC80();
    swift_bridgeObjectRelease();
    sub_215BFAC80();
    return sub_215BFADB8();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);
    v20 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 40);
    v11 = *(_QWORD *)(v0 + 48);
    v13 = swift_allocObject();
    swift_weakInit();
    *(_QWORD *)(v0 + 16) = 0;
    sub_215BE7B48(v12, v11);
    swift_retain();
    swift_retain();
    MEMORY[0x2199EE0FC](v0 + 16, 8);
    v14 = *(_QWORD *)(v0 + 16);
    type metadata accessor for CardSession.APDU();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_215BF5174;
    *(_QWORD *)(v15 + 24) = v6;
    *(_QWORD *)(v15 + 32) = &unk_254DFC218;
    *(_QWORD *)(v15 + 40) = v13;
    *(_QWORD *)(v15 + 48) = v14;
    *(_QWORD *)(v15 + 72) = v12;
    *(_QWORD *)(v15 + 80) = v11;
    sub_215BE7B48(v12, v11);
    swift_retain();
    swift_retain();
    v16 = sub_215BFABD8();
    swift_release();
    swift_release();
    sub_215BE7BD4(v12, v11);
    *(_QWORD *)(v15 + 64) = v16;
    *(_BYTE *)(v15 + 56) = 0;
    swift_release();
    v17 = swift_retain();
    v18 = sub_215BEC0B8(v17, 0, 1);
    swift_release();
    *(_QWORD *)(v6 + v7) = v18;
    swift_release();
    *(_QWORD *)(v0 + 24) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
    sub_215BFACE0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v20);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BF0090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  return swift_task_switch();
}

uint64_t sub_215BF00AC()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 88) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v2;
    *v2 = v0;
    v2[1] = sub_215BF02C0;
    return sub_215BEE94C(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  }
  else
  {
    if (qword_254DFB530 != -1)
      swift_once();
    v4 = sub_215BFAC38();
    __swift_project_value_buffer(v4, (uint64_t)qword_254DFD460);
    v5 = sub_215BFAC20();
    v6 = sub_215BFAD28();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = swift_slowAlloc();
      v8 = swift_slowAlloc();
      v9 = v8;
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v0 + 40) = sub_215BF6694(0xD000000000000015, 0x8000000215C011F0, &v9);
      sub_215BFAD58();
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v0 + 48) = 281;
      sub_215BFAD58();
      _os_log_impl(&dword_215BBD000, v5, v6, "%s:%ld:", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v8, -1, -1);
      MEMORY[0x2199EE0F0](v7, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BF02C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BF0324()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF0358()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF038C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_215BFACC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = swift_allocObject();
  swift_weakInit();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v5;
  v6[5] = a1;
  sub_215BEFBB4((uint64_t)v3, (uint64_t)&unk_254DFC228, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_215BF046C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[5] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB8D0);
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BF04D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 112);
  if (qword_254DFB530 != -1)
    swift_once();
  v2 = sub_215BFAC38();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DFD460);
  v3 = sub_215BFAC20();
  v4 = sub_215BFAD28();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11 = v6;
    *(_DWORD *)v5 = 136315650;
    *(_QWORD *)(v0 + 24) = sub_215BF6694(0xD000000000000018, 0x8000000215C01150, &v11);
    sub_215BFAD58();
    *(_WORD *)(v5 + 12) = 2048;
    *(_QWORD *)(v0 + 32) = 298;
    sub_215BFAD58();
    *(_WORD *)(v5 + 22) = 1024;
    *(_DWORD *)(v0 + 72) = v1 != 0;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v3, v4, "%s:%ld: disconnected, emuStarted=%{BOOL}d", (uint8_t *)v5, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v6, -1, -1);
    MEMORY[0x2199EE0F0](v5, -1, -1);
  }

  if (v1)
  {
    v8 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_lastReceivedAPDU) = 0;
    swift_release();
    *(_QWORD *)(v0 + 16) = 0x8000000000000002;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
    sub_215BFACE0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF071C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_215BFACC8();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_215BEC42C((uint64_t)v3);
  }
  else
  {
    sub_215BFACBC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_215BFACB0();
      v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_215BF08D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[11] = a4;
  v5 = sub_215BFAC14();
  v4[12] = v5;
  v4[13] = *(_QWORD *)(v5 - 8);
  v4[14] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  v4[15] = v6;
  v4[16] = *(_QWORD *)(v6 - 8);
  v4[17] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB8D0);
  v4[18] = v7;
  v4[19] = *(_QWORD *)(v7 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1F8);
  v4[22] = v8;
  v4[23] = *(_QWORD *)(v8 - 8);
  v4[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BF09C8()
{
  uint64_t v0;
  _QWORD *v1;

  *(_BYTE *)(v0 + 59) = 0;
  *(_QWORD *)(v0 + 200) = (id)NFSharedSignpostLog();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC200);
  sub_215BFACF8();
  *(_QWORD *)(v0 + 208) = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_eventStreamContinuation;
  swift_beginAccess();
  *(_BYTE *)(v0 + 60) = 0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_215BF0AA4;
  return sub_215BFAD04();
}

uint64_t sub_215BF0AA4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BF0AF8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 224) = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 232) = v1;
  v2 = *(unsigned __int8 *)(v0 + 56);
  *(_BYTE *)(v0 + 61) = v2;
  if ((~v1 & 0x3000000000000000) != 0 || v2 != 255)
    __asm { BR              X10 }
  v3 = *(void **)(v0 + 200);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF0BF0()
{
  return swift_task_switch();
}

uint64_t sub_215BF1018()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[12];

  v4 = v0;
  v5 = *(void **)(v2 + 200);
  if (!(v1 | v3))
  {
    if (v5)
    {
      v18 = *(_QWORD *)(v2 + 104);
      v17 = *(_QWORD *)(v2 + 112);
      v19 = *(_QWORD *)(v2 + 96);
      v20 = v5;
      sub_215BFAD4C();
      sub_215BFAC08();
      sub_215BFABFC();

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
    if (qword_254DFB530 != -1)
      swift_once();
    v21 = sub_215BFAC38();
    __swift_project_value_buffer(v21, (uint64_t)qword_254DFD460);
    v22 = sub_215BFAC20();
    v23 = sub_215BFAD28();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v29[0] = v25;
      *(_DWORD *)v24 = 136315650;
      *(_QWORD *)(v24 + 4) = sub_215BF6694(0xD00000000000001BLL, 0x8000000215C01090, v29);
      *(_WORD *)(v24 + 12) = 2048;
      *(_QWORD *)(v24 + 14) = 340;
      *(_WORD *)(v24 + 22) = 1024;
      *(_DWORD *)(v24 + 24) = *v4;
      _os_log_impl(&dword_215BBD000, v22, v23, "%s:%ld: connected, currentFieldState=%{BOOL}d", (uint8_t *)v24, 0x1Cu);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v25, -1, -1);
      MEMORY[0x2199EE0F0](v24, -1, -1);
    }

    if (*v4 != 1)
    {
      v27 = *(_QWORD *)(v2 + 152);
      v26 = *(_QWORD *)(v2 + 160);
      v28 = *(_QWORD *)(v2 + 144);
      *(_BYTE *)(v2 + 59) = 1;
      *(_QWORD *)(v2 + 80) = 0x8000000000000001;
      sub_215BFACE0();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    }
LABEL_18:
    JUMPOUT(0x215BF1610);
  }
  if (v5)
  {
    v7 = *(_QWORD *)(v2 + 104);
    v6 = *(_QWORD *)(v2 + 112);
    v8 = *(_QWORD *)(v2 + 96);
    v9 = v5;
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  if (qword_254DFB530 != -1)
    swift_once();
  v10 = sub_215BFAC38();
  __swift_project_value_buffer(v10, (uint64_t)qword_254DFD460);
  v11 = sub_215BFAC20();
  v12 = sub_215BFAD28();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v29[0] = v14;
    *(_DWORD *)v13 = 136315650;
    *(_QWORD *)(v13 + 4) = sub_215BF6694(0xD00000000000001BLL, 0x8000000215C01090, v29);
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = 353;
    *(_WORD *)(v13 + 22) = 1024;
    *(_DWORD *)(v13 + 24) = *v4;
    _os_log_impl(&dword_215BBD000, v11, v12, "%s:%ld: disconnected, currentFieldState=%{BOOL}d", (uint8_t *)v13, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v14, -1, -1);
    MEMORY[0x2199EE0F0](v13, -1, -1);
  }

  if ((*v4 & 1) == 0)
    goto LABEL_18;
  *(_BYTE *)(v2 + 59) = 0;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 256) = v15;
  *v15 = v2;
  v15[1] = sub_215BF1A64;
  return sub_215BF046C();
}

uint64_t sub_215BF16E8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 240) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 112);
  return swift_task_switch();
}

uint64_t sub_215BF1708()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v19;

  if (qword_254DFB530 != -1)
    swift_once();
  v1 = sub_215BFAC38();
  __swift_project_value_buffer(v1, (uint64_t)qword_254DFD460);
  v2 = sub_215BFAC20();
  v3 = sub_215BFAD28();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 240);
    v5 = *(_DWORD *)(v0 + 224);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v19 = v7;
    *(_DWORD *)v6 = 136316162;
    *(_QWORD *)(v6 + 4) = sub_215BF6694(0xD00000000000001BLL, 0x8000000215C01090, &v19);
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v6 + 14) = 319;
    *(_WORD *)(v6 + 22) = 1024;
    *(_DWORD *)(v6 + 24) = v5 & 1;
    *(_WORD *)(v6 + 28) = 1024;
    *(_DWORD *)(v6 + 30) = v4 != 0;
    *(_WORD *)(v6 + 34) = 1024;
    *(_DWORD *)(v6 + 36) = *(unsigned __int8 *)(v0 + 59);
    _os_log_impl(&dword_215BBD000, v2, v3, "%s:%ld: RF=%{BOOL}d, emuStarted=%{BOOL}d, currentFieldState=%{BOOL}d", (uint8_t *)v6, 0x28u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v7, -1, -1);
    MEMORY[0x2199EE0F0](v6, -1, -1);
  }

  if (*(_BYTE *)(v0 + 59) != (*(_DWORD *)(v0 + 224) & 1))
  {
    v8 = *(_QWORD *)(v0 + 224) & 1;
    v9 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 144);
    v11 = *(_QWORD *)(v0 + 152);
    v13 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v0 + 136);
    v14 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 88) + *(_QWORD *)(v0 + 208);
    *(_BYTE *)(v0 + 59) = *(_QWORD *)(v0 + 224) & 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
    v16 = 0x8000000000000001;
    if (!v8)
      v16 = 0x8000000000000002;
    *(_QWORD *)(v0 + 72) = v16;
    sub_215BFACE0();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v17;
  *v17 = v0;
  v17[1] = sub_215BF0AA4;
  return sub_215BFAD04();
}

uint64_t sub_215BF1974()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215BF19C8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unsigned __int8 v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(_BYTE *)(v0 + 61);
  sub_215BF5064(v2, v1, v3);
  sub_215BF5064(v2, v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v4;
  *v4 = v0;
  v4[1] = sub_215BF0AA4;
  return sub_215BFAD04();
}

uint64_t sub_215BF1A64()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 216) = v3;
  *v3 = v2;
  v3[1] = sub_215BF0AA4;
  return sub_215BFAD04();
}

uint64_t sub_215BF1AE8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 216) = v3;
  *v3 = v2;
  v3[1] = sub_215BF0AA4;
  return sub_215BFAD04();
}

uint64_t sub_215BF1B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  return swift_task_switch();
}

uint64_t sub_215BF1B88()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 176) + 112);
  *(_QWORD *)(v0 + 184) = v1;
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_215BF1BF4()
{
  void **v0;
  void **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = v0;
  v2 = v0[23];
  v0[2] = v0;
  v0[3] = sub_215BF1DB4;
  v3 = swift_continuation_init();
  v4 = swift_allocObject();
  v5 = (void *)MEMORY[0x24BDAC760];
  v1[10] = (void *)MEMORY[0x24BDAC760];
  v1 += 10;
  *(_QWORD *)(v4 + 16) = v3;
  v1[4] = sub_215BF4FE8;
  v1[5] = (void *)v4;
  v1[1] = (void *)1107296256;
  v1[2] = sub_215BED754;
  v1[3] = &block_descriptor_45;
  v6 = _Block_copy(v1);
  swift_release();
  v7 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v6);
  _Block_release(v6);
  sub_215BFAD70();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFC1C0);
  swift_dynamicCast();
  v8 = *v1;
  v9 = (void *)sub_215BFAC5C();
  v1[4] = nullsub_1;
  v1[5] = 0;
  *v1 = v5;
  v1[1] = (void *)1107296256;
  v1[2] = sub_215BF1ED8;
  v1[3] = &block_descriptor_48;
  v10 = _Block_copy(v1);
  objc_msgSend(v8, sel_updateUIString_completion_, v9, v10);
  _Block_release(v10);

  swift_continuation_throwingResume();
  swift_unknownObjectRelease();
  return swift_continuation_await();
}

uint64_t sub_215BF1DB4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 192) = v1;
  if (v1)
    swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BF1E28()
{
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_215BF1E64()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF1E98()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF1ED8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_215BF1F04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 160) = v0;
  return swift_task_switch();
}

uint64_t sub_215BF1F1C()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 160) + 128))
    return sub_215BFADB8();
  sub_215BF4C84();
  swift_getObjectType();
  sub_215BFACB0();
  return swift_task_switch();
}

uint64_t sub_215BF1FE0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v1 = v0;
  v2 = v0[20];
  v1[2] = v1;
  v1[3] = sub_215BF2108;
  v3 = swift_continuation_init();
  v4 = *(_QWORD *)(v2 + 136);
  *(_QWORD *)(v4
            + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation) = v3;
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedHardwareManager);
  v6 = swift_allocObject();
  v1[10] = MEMORY[0x24BDAC760];
  v1 += 10;
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v2;
  v1[4] = sub_215BF4E38;
  v1[5] = v6;
  v1[1] = 1107296256;
  v1[2] = sub_215BF2398;
  v1[3] = &block_descriptor_38;
  v7 = _Block_copy(v1);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_queueCardFieldDetectSession_completionHandler_, v4, v7);
  _Block_release(v7);

  return swift_continuation_await();
}

uint64_t sub_215BF2108()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v1 + 168) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v1 + 8))();
  swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BF2188()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;
  void *v5;
  char *v6;

  v1 = *(void **)(v0 + 168);
  v2 = v1;
  v3 = 0;
  switch(sub_215BED2E4(v1))
  {
    case 2u:
      v3 = 6;
      goto LABEL_10;
    case 8u:
    case 0x20u:
      goto LABEL_10;
    case 0xEu:
      v3 = 8;
      goto LABEL_10;
    case 0x24u:
      swift_getErrorValue();
      sub_215BFADF4();
      return sub_215BFADB8();
    case 0x32u:
      v3 = 7;
      goto LABEL_10;
    case 0x3Au:
      v3 = 9;
      goto LABEL_10;
    case 0x45u:
      v3 = 10;
      goto LABEL_10;
    case 0x46u:
      v3 = 11;
      goto LABEL_10;
    default:
      v3 = 1;
LABEL_10:
      sub_215BF4F94();
      swift_allocError();
      v5 = *(void **)(v0 + 168);
      *v6 = v3;
      swift_willThrow();

      return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

void sub_215BF22C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  id v6;
  id v8;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
    swift_allocError();
    *v5 = a2;
    v6 = a2;
    swift_continuation_throwingResumeWithError();
  }
  else
  {
    *(_QWORD *)(a4 + 128) = a1;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v8 = objc_msgSend((id)objc_opt_self(), sel_sharedHardwareManager);
    objc_msgSend(v8, sel_addNFCHardwareManagerCallbacksListener_, *(_QWORD *)(a4 + 136));

  }
}

uint64_t sub_215BF2398(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_215BF2400(char a1, id a2, uint64_t a3)
{
  id v5;
  id v6;
  int v7;

  if (a2)
  {
    v5 = a2;
    v6 = a2;
    v7 = sub_215BED2E4(a2);
    if (v7 == 14 || v7 == 32 || v7 == 57)
    {
      sub_215BFADB8();
      __break(1u);
    }
    else
    {
      **(_BYTE **)(*(_QWORD *)(a3 + 64) + 40) = 0;
      swift_continuation_resume();

    }
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(a3 + 64) + 40) = a1 & 1;
    swift_continuation_resume();
  }
}

void sub_215BF2528(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_215BF2588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  char v7;
  uint64_t v8;

  v7 = byte_215BFD75E[a5];
  v8 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v8;
  *(_QWORD *)v8 = v5;
  *(_QWORD *)(v8 + 8) = sub_215BED2C0;
  *(_QWORD *)(v8 + 224) = a4;
  *(_BYTE *)(v8 + 264) = v7;
  return swift_task_switch();
}

uint64_t sub_215BF25FC(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 224) = v1;
  *(_BYTE *)(v2 + 264) = a1;
  return swift_task_switch();
}

uint64_t sub_215BF2618()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;

  if (qword_254DFB530 != -1)
    swift_once();
  v1 = sub_215BFAC38();
  __swift_project_value_buffer(v1, (uint64_t)qword_254DFD460);
  swift_retain();
  v2 = sub_215BFAC20();
  v3 = sub_215BFAD28();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 224);
  if (v4)
  {
    v17 = *(_BYTE *)(v0 + 264);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v18 = v7;
    *(_DWORD *)v6 = 136316162;
    *(_QWORD *)(v0 + 144) = sub_215BF6694(0xD000000000000013, 0x8000000215C00FD0, &v18);
    sub_215BFAD58();
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v0 + 144) = 484;
    sub_215BFAD58();
    *(_WORD *)(v6 + 22) = 1024;
    *(_DWORD *)(v0 + 144) = *(_QWORD *)(v5 + 128) != 0;
    sub_215BFAD58();
    *(_WORD *)(v6 + 28) = 1024;
    *(_DWORD *)(v0 + 144) = *(_QWORD *)(v5 + 112) != 0;
    sub_215BFAD58();
    swift_release();
    *(_WORD *)(v6 + 34) = 2080;
    *(_BYTE *)(v0 + 144) = v17;
    v8 = sub_215BFAC74();
    *(_QWORD *)(v0 + 144) = sub_215BF6694(v8, v9, &v18);
    sub_215BFAD58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_215BBD000, v2, v3, "%s:%ld: fdSession=%{BOOL}d, cardSession=%{BOOL}d, reason=%s", (uint8_t *)v6, 0x2Cu);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v7, -1, -1);
    MEMORY[0x2199EE0F0](v6, -1, -1);

  }
  else
  {

    swift_release();
  }
  v10 = *(_QWORD *)(v0 + 224);
  v11 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer;
  objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer), sel_stopTimer);
  v12 = *(void **)(v10 + v11);
  *(_QWORD *)(v10 + v11) = 0;

  v13 = *(_QWORD *)(v10 + 128);
  *(_QWORD *)(v0 + 232) = v13;
  if (v13 || (v14 = *(_QWORD *)(v0 + 224), v15 = *(_QWORD *)(v14 + 112), (*(_QWORD *)(v0 + 248) = v15) != 0))
  {
    swift_unknownObjectRetain();
    return swift_task_switch();
  }
  else
  {
    sub_215BF2F30(v14, *(_BYTE *)(v0 + 264));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BF2928()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void **v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v1 = (void *)v0[29];
  v0[2] = v0;
  v0[3] = sub_215BF2AD8;
  v2 = swift_continuation_init();
  v3 = swift_allocObject();
  v4 = (void *)MEMORY[0x24BDAC760];
  v0[18] = MEMORY[0x24BDAC760];
  v5 = (void **)(v0 + 18);
  *(_QWORD *)(v3 + 16) = v2;
  v5[4] = sub_215BF4DD4;
  v5[5] = (void *)v3;
  v5[1] = (void *)1107296256;
  v5[2] = sub_215BED754;
  v5[3] = &block_descriptor_13;
  v6 = _Block_copy(v5);
  swift_release();
  v7 = objc_msgSend(v1, sel_remoteObjectProxyWithErrorHandler_, v6);
  _Block_release(v6);
  sub_215BFAD70();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1B8);
  swift_dynamicCast();
  v8 = *v5;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v2;
  v5[4] = sub_215BF4DEC;
  v5[5] = (void *)v9;
  *v5 = v4;
  v5[1] = (void *)1107296256;
  v5[2] = sub_215BF1ED8;
  v5[3] = &block_descriptor_19;
  v10 = _Block_copy(v5);
  swift_release();
  objc_msgSend(v8, sel_endSession_, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  return swift_continuation_await();
}

uint64_t sub_215BF2AD8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 240) = v1;
  if (v1)
    swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BF2B4C()
{
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_215BF2B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)(v0 + 248) = v2;
  if (v2)
  {
    swift_unknownObjectRetain();
    return swift_task_switch();
  }
  else
  {
    sub_215BF2F30(v1, *(_BYTE *)(v0 + 264));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BF2BF0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  char v3;

  v1 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_BYTE *)(v0 + 264);
  swift_unknownObjectRelease();
  sub_215BF2F30(v2, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF2C44()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void **v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v1 = (void *)v0[31];
  v0[10] = v0;
  v0[11] = sub_215BF2DF4;
  v2 = swift_continuation_init();
  v3 = swift_allocObject();
  v4 = (void *)MEMORY[0x24BDAC760];
  v0[18] = MEMORY[0x24BDAC760];
  v5 = (void **)(v0 + 18);
  *(_QWORD *)(v3 + 16) = v2;
  v5[4] = sub_215BF52D4;
  v5[5] = (void *)v3;
  v5[1] = (void *)1107296256;
  v5[2] = sub_215BED754;
  v5[3] = &block_descriptor_26;
  v6 = _Block_copy(v5);
  swift_release();
  v7 = objc_msgSend(v1, sel_remoteObjectProxyWithErrorHandler_, v6);
  _Block_release(v6);
  sub_215BFAD70();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFC1C0);
  swift_dynamicCast();
  v8 = *v5;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v2;
  v5[4] = sub_215BF52D8;
  v5[5] = (void *)v9;
  *v5 = v4;
  v5[1] = (void *)1107296256;
  v5[2] = sub_215BF1ED8;
  v5[3] = &block_descriptor_32;
  v10 = _Block_copy(v5);
  swift_release();
  objc_msgSend(v8, sel_endSession_, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  return swift_continuation_await();
}

uint64_t sub_215BF2DF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  *(_QWORD *)(*(_QWORD *)v0 + 256) = v1;
  if (v1)
    swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BF2E68()
{
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_215BF2EA8()
{
  uint64_t v0;

  sub_215BF2F30(*(_QWORD *)(v0 + 224), *(_BYTE *)(v0 + 264));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF2EDC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  char v3;

  v1 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_BYTE *)(v0 + 264);
  swift_unknownObjectRelease();
  sub_215BF2F30(v2, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_215BF2F30(uint64_t a1, char a2)
{
  sub_215BFAC14();
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFB8D0);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(a1 + 112) = 0;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 128) = 0;
  swift_unknownObjectRelease();
  __asm { BR              X11 }
}

id sub_215BF3000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  void *v8;

  *(_QWORD *)(v6 - 72) = 0x4000000000000004;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  sub_215BFACE0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v2);
  sub_215BFACEC();
  result = (id)NFSharedSignpostLog();
  if (result)
  {
    v8 = result;
    sub_215BFAD4C();
    sub_215BFAC08();
    sub_215BFABFC();

    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  }
  return result;
}

void sub_215BF311C()
{
  sub_215BFADB8();
  __break(1u);
  JUMPOUT(0x215BF31B8);
}

id sub_215BF31E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id result;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_215BFAC44();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215BF4C30();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5480], v2);
  swift_retain();
  v6 = (void *)sub_215BFAD40();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = objc_allocWithZone(MEMORY[0x24BEDCD88]);
  aBlock[4] = sub_215BF4C28;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_215BF1ED8;
  aBlock[3] = &block_descriptor_2;
  v8 = _Block_copy(aBlock);
  swift_release();
  v9 = objc_msgSend(v7, sel_initWithCallback_queue_, v8, v6);

  _Block_release(v8);
  v10 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer;
  v11 = *(void **)(v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer) = v9;

  result = *(id *)(v1 + v10);
  if (result)
    return objc_msgSend(result, sel_startTimer_, 60.0);
  return result;
}

uint64_t sub_215BF3354(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_215BFACC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = sub_215BF4C84();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = v5;
  v6[4] = a1;
  swift_retain_n();
  sub_215BEBE98((uint64_t)v3, (uint64_t)&unk_254DFC1A0, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_215BF3424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 32) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB8E0);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215BF3484()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (qword_254DFB530 != -1)
    swift_once();
  v1 = sub_215BFAC38();
  __swift_project_value_buffer(v1, (uint64_t)qword_254DFD460);
  v2 = sub_215BFAC20();
  v3 = sub_215BFAD1C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136315394;
    *(_QWORD *)(v0 + 16) = sub_215BF6694(0xD000000000000015, 0x8000000215C00F90, &v11);
    sub_215BFAD58();
    *(_WORD *)(v4 + 12) = 2048;
    *(_QWORD *)(v0 + 24) = 515;
    sub_215BFAD58();
    _os_log_impl(&dword_215BBD000, v2, v3, "%s:%ld: Session expired", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v5, -1, -1);
    MEMORY[0x2199EE0F0](v4, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 32);
  if (*(_QWORD *)(v6 + 112))
  {
    v7 = *(_QWORD *)(v0 + 40);
    v8 = sub_215BFACC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = 0;
    *(_QWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 32) = v6;
    *(_BYTE *)(v9 + 40) = 2;
    swift_retain();
    sub_215BEBE98(v7, (uint64_t)&unk_254DFC1B0, v9);
    swift_release();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF36A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  return swift_task_switch();
}

uint64_t sub_215BF36BC()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 104);
  if (*(_QWORD *)(v1 + 112))
    return sub_215BFADB8();
  if (*(_QWORD *)(v1 + 128))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_215BFAC5C();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 112) = objc_msgSend((id)objc_opt_self(), sel_configWithInitialUIText_, v3);

    sub_215BF4C84();
    swift_getObjectType();
    sub_215BFACB0();
    return swift_task_switch();
  }
  else
  {
    if (qword_254DFB530 != -1)
      swift_once();
    v4 = sub_215BFAC38();
    __swift_project_value_buffer(v4, (uint64_t)qword_254DFD460);
    v5 = sub_215BFAC20();
    v6 = sub_215BFAD1C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = swift_slowAlloc();
      v8 = swift_slowAlloc();
      v10 = v8;
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v0 + 80) = sub_215BF6694(0xD00000000000001ELL, 0x8000000215C01340, &v10);
      sub_215BFAD58();
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v0 + 80) = 535;
      sub_215BFAD58();
      _os_log_impl(&dword_215BBD000, v5, v6, "%s:%ld: Session has been invalidated", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v8, -1, -1);
      MEMORY[0x2199EE0F0](v7, -1, -1);
    }

    sub_215BF4F94();
    swift_allocError();
    *v9 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215BF399C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[13];
  v1 = v0[14];
  v0[2] = v0;
  v0[3] = sub_215BF39F8;
  v3 = swift_continuation_init();
  sub_215BF3C80(v3, v2, v1);
  return swift_continuation_await();
}

uint64_t sub_215BF39F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 120) = v1;
  if (v1)
    swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BF3A68()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 112);
  sub_215BF31E8();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF3AA0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  _BYTE *v4;
  char *v5;
  char v6;

  v1 = *(void **)(v0 + 120);

  v2 = v1;
  switch(sub_215BED2E4(v1))
  {
    case 2u:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 6;
      goto LABEL_10;
    case 8u:
    case 0x20u:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      *v4 = 0;
      goto LABEL_11;
    case 0xEu:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 8;
      goto LABEL_10;
    case 0x32u:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 7;
      goto LABEL_10;
    case 0x3Au:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 9;
      goto LABEL_10;
    case 0x45u:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 10;
      goto LABEL_10;
    case 0x46u:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 11;
      goto LABEL_10;
    default:
      v3 = *(void **)(v0 + 120);
      sub_215BF4F94();
      swift_allocError();
      v6 = 1;
LABEL_10:
      *v5 = v6;
LABEL_11:
      swift_willThrow();

      return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

void sub_215BF3C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  objc_class *v11;
  char *v12;
  id v13;
  void *v14;
  char *v15;
  void *v16;
  char *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  unint64_t aBlock;
  unint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t, void *, void *);
  void *v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, void *);
  _QWORD *v28;
  uint64_t v29;
  objc_super v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v10(v9, a2 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation, v6);
  v11 = (objc_class *)type metadata accessor for NFCCardSessionDelegate(0);
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation] = 0;
  v10(&v12[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_eventStreamContinuation], (uint64_t)v9, v6);
  v30.receiver = v12;
  v30.super_class = v11;
  v13 = objc_msgSendSuper2(&v30, sel_init);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = *(void **)(a2 + 120);
  *(_QWORD *)(a2 + 120) = v13;

  v15 = *(char **)(a2 + 120);
  if (v15)
  {
    *(_QWORD *)&v15[OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_sessionStartContinuation] = a1;
    v16 = (void *)objc_opt_self();
    v17 = v15;
    v18 = objc_msgSend(v16, sel_sharedHardwareManager);
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = a1;
    v19[3] = a2;
    v19[4] = v17;
    v27 = sub_215BF52B0;
    v28 = v19;
    aBlock = MEMORY[0x24BDAC760];
    v24 = 1107296256;
    v25 = sub_215BF401C;
    v26 = &block_descriptor_112;
    v20 = _Block_copy(&aBlock);
    v21 = v17;
    swift_retain();
    swift_release();
    objc_msgSend(v18, sel_queueCardSession_sessionConfig_completionHandler_, v21, a3, v20);
    _Block_release(v20);

  }
  else
  {
    aBlock = 0;
    v24 = 0xE000000000000000;
    sub_215BFAD7C();
    swift_bridgeObjectRelease();
    aBlock = 0xD00000000000001FLL;
    v24 = 0x8000000215C01390;
    v29 = 546;
    sub_215BFADDC();
    sub_215BFAC80();
    swift_bridgeObjectRelease();
    sub_215BFAC80();
    sub_215BFADB8();
    __break(1u);
  }
}

void sub_215BF3F4C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v8;
  id v9;
  id v11;

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
    swift_allocError();
    *v8 = a4;
    v9 = a4;
    swift_continuation_throwingResumeWithError();
  }
  else
  {
    *(_QWORD *)(a6 + 112) = a1;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v11 = objc_msgSend((id)objc_opt_self(), sel_sharedHardwareManager);
    objc_msgSend(v11, sel_addNFCHardwareManagerCallbacksListener_, a7);

  }
}

uint64_t sub_215BF401C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void (*v9)(uint64_t, uint64_t, id, void *);
  id v10;
  id v11;

  v9 = *(void (**)(uint64_t, uint64_t, id, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v10 = a4;
  v11 = a5;
  v9(a2, a3, v10, a5);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_215BF40AC(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 160) = v1;
  *(_BYTE *)(v2 + 184) = a1;
  return swift_task_switch();
}

uint64_t sub_215BF40C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)(v0 + 168) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v3 = OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_emulationExpirationTimer);
  swift_unknownObjectRetain();
  objc_msgSend(v4, sel_stopTimer);
  v5 = *(void **)(v1 + v3);
  *(_QWORD *)(v1 + v3) = 0;

  return swift_task_switch();
}

uint64_t sub_215BF415C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v1 = (void **)v0;
  v2 = *(void **)(v0 + 168);
  v3 = *(unsigned __int8 *)(v0 + 184);
  v1[2] = v1;
  v1[3] = sub_215BF4324;
  v4 = swift_continuation_init();
  v5 = swift_allocObject();
  v6 = (void *)MEMORY[0x24BDAC760];
  v1[10] = (void *)MEMORY[0x24BDAC760];
  v1 += 10;
  *(_QWORD *)(v5 + 16) = v4;
  v1[4] = sub_215BF52D4;
  v1[5] = (void *)v5;
  v1[1] = (void *)1107296256;
  v1[2] = sub_215BED754;
  v1[3] = &block_descriptor_92;
  v7 = _Block_copy(v1);
  swift_release();
  v8 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_215BFAD70();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFC1C0);
  swift_dynamicCast();
  v9 = *v1;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v4;
  v1[4] = sub_215BF526C;
  v1[5] = (void *)v10;
  *v1 = v6;
  v1[1] = (void *)1107296256;
  v1[2] = sub_215BF6E48;
  v1[3] = &block_descriptor_98;
  v11 = _Block_copy(v1);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v9, sel_stopEmulationWithStatus_completion_, v3, v11);
  _Block_release(v11);
  swift_unknownObjectRelease();
  return swift_continuation_await();
}

uint64_t sub_215BF4324()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 176) = v1;
  if (v1)
    swift_willThrow();
  return swift_task_switch();
}

uint64_t sub_215BF4394()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 160);
  swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 112) = 0;
  swift_unknownObjectRelease();
  v2 = *(void **)(v1 + 120);
  *(_QWORD *)(v1 + 120) = 0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215BF43E0()
{
  uint64_t v0;
  void *v1;
  id v2;
  int v3;
  _BYTE *v4;
  char *v5;
  char v6;

  v1 = *(void **)(v0 + 176);
  v2 = v1;
  v3 = sub_215BED2E4(v1);
  if (v3 == 54)
  {
    sub_215BF4F94();
    swift_allocError();
    v6 = 2;
LABEL_6:
    *v5 = v6;
    goto LABEL_7;
  }
  if (v3 != 32)
  {
    sub_215BF4F94();
    swift_allocError();
    v6 = 1;
    goto LABEL_6;
  }
  sub_215BF4F94();
  swift_allocError();
  *v4 = 0;
LABEL_7:
  swift_willThrow();

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_215BF44C4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  v7[4] = sub_215BF52D8;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_215BF1ED8;
  v7[3] = &block_descriptor_105;
  v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(a2, sel_endSession_, v6);
  _Block_release(v6);
}

uint64_t sub_215BF456C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC200);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_delegateEventStreamContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  v5 = v0 + OBJC_IVAR____TtC7CoreNFC14NFCCardSession_eventStreamContinuation;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_215BF4654()
{
  sub_215BF456C();
  return swift_defaultActor_deallocate();
}

uint64_t sub_215BF466C()
{
  return type metadata accessor for NFCCardSession(0);
}

uint64_t type metadata accessor for NFCCardSession(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFBF68);
}

void sub_215BF4688()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_215BF47A8(319, &qword_254DFBFB8, (uint64_t)&type metadata for NFCCardSession.Event, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_215BF47A8(319, &qword_254DFBF08, (uint64_t)&type metadata for NFCCardSession.Event, MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
    {
      sub_215BF47A8(319, qword_254DFBFC0, (uint64_t)&type metadata for CardSession.Event, MEMORY[0x24BEE6A40]);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_215BF47A8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t destroy for NFCCardSession.Event(uint64_t a1)
{
  return sub_215BF4818(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), sub_215BE7BD4);
}

uint64_t sub_215BF4818(uint64_t result, unint64_t a2, char a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  int v4;

  if ((a3 & 1) != 0)
    v4 = 4;
  else
    v4 = 0;
  if (((a2 >> 60) & 3 | v4) == 1)
    return a4(result, a2 & 0xCFFFFFFFFFFFFFFFLL);
  return result;
}

uint64_t _s7CoreNFC14NFCCardSessionC5EventOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_215BF4818(*(_QWORD *)a2, v4, v5, sub_215BE7B48);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NFCCardSession.Event(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_215BF4818(*(_QWORD *)a2, v4, v5, sub_215BE7B48);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_215BF4818(v6, v7, v8, sub_215BE7BD4);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NFCCardSession.Event(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_215BF4818(v4, v5, v6, sub_215BE7BD4);
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCCardSession.Event(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3FC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1020);
  v3 = ((*(_QWORD *)(a1 + 8) >> 60) & 3 | (4 * *(unsigned __int8 *)(a1 + 16))) ^ 0x3FF;
  if (v3 >= 0x3FB)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NFCCardSession.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 1020;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3FC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3FC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (-a2 & 3) << 60;
      *(_BYTE *)(result + 16) = -a2 >> 2;
    }
  }
  return result;
}

uint64_t sub_215BF49F8(uint64_t a1)
{
  int v1;
  unsigned int v2;

  if (*(_BYTE *)(a1 + 16))
    v1 = 4;
  else
    v1 = 0;
  v2 = (*(_QWORD *)(a1 + 8) >> 60) & 3 | v1;
  if (v2 <= 3)
    return v2;
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_215BF4A28(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_215BF4A38(uint64_t result, uint64_t a2)
{
  if (a2 < 4)
  {
    *(_QWORD *)(result + 8) = *(_QWORD *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *(_QWORD *)result = (a2 - 4);
    *(_QWORD *)(result + 8) = 0;
  }
  *(_BYTE *)(result + 16) = a2 > 3;
  return result;
}

ValueMetadata *type metadata accessor for NFCCardSession.Event()
{
  return &type metadata for NFCCardSession.Event;
}

uint64_t getEnumTagSinglePayload for NFCCardSession.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NFCCardSession.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_215BF4B54 + 4 * byte_215BFD5C9[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_215BF4B88 + 4 * byte_215BFD5C4[v4]))();
}

uint64_t sub_215BF4B88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BF4B90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215BF4B98);
  return result;
}

uint64_t sub_215BF4BA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215BF4BACLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_215BF4BB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BF4BB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NFCCardSession.Error()
{
  return &type metadata for NFCCardSession.Error;
}

unint64_t sub_215BF4BD8()
{
  unint64_t result;

  result = qword_254DFC178;
  if (!qword_254DFC178)
  {
    result = MEMORY[0x2199EE090](&unk_215BFD70C, &type metadata for NFCCardSession.Error);
    atomic_store(result, (unint64_t *)&qword_254DFC178);
  }
  return result;
}

uint64_t sub_215BF4C1C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_215BF4C28()
{
  uint64_t v0;

  return sub_215BF3354(v0);
}

unint64_t sub_215BF4C30()
{
  unint64_t result;

  result = qword_254DFC180;
  if (!qword_254DFC180)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254DFC180);
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_215BF4C84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DFC198;
  if (!qword_254DFC198)
  {
    v1 = type metadata accessor for NFCCardSession(255);
    result = MEMORY[0x2199EE090](&unk_215BFD734, v1);
    atomic_store(result, (unint64_t *)&qword_254DFC198);
  }
  return result;
}

uint64_t sub_215BF4CCC()
{
  return objectdestroy_16Tm();
}

uint64_t sub_215BF4CD4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215BED2C0;
  return sub_215BF3424(a1, v4, v5, v6);
}

uint64_t sub_215BF4D40()
{
  return objectdestroy_16Tm();
}

uint64_t sub_215BF4D48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_215BEC894;
  return sub_215BF2588(a1, v4, v5, v6, v7);
}

uint64_t sub_215BF4DC4()
{
  return swift_deallocObject();
}

uint64_t sub_215BF4DD4(void *a1)
{
  return sub_215BED498(a1);
}

uint64_t sub_215BF4DDC()
{
  return swift_deallocObject();
}

uint64_t sub_215BF4DEC()
{
  return swift_continuation_throwingResume();
}

uint64_t sub_215BF4DF4()
{
  return swift_deallocObject();
}

uint64_t sub_215BF4E04()
{
  return swift_deallocObject();
}

uint64_t sub_215BF4E14()
{
  swift_release();
  return swift_deallocObject();
}

void sub_215BF4E38(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_215BF22C8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_215BF4E40()
{
  return swift_task_switch();
}

uint64_t sub_215BF4E54()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = sub_215BF4F54;
  v1 = swift_continuation_init();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedHardwareManager);
  v3 = swift_allocObject();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  *(_QWORD *)(v3 + 16) = v1;
  v4[4] = sub_215BF52CC;
  v4[5] = v3;
  v4[1] = 1107296256;
  v4[2] = sub_215BF2528;
  v4[3] = &block_descriptor_118;
  v5 = _Block_copy(v4);
  swift_release();
  objc_msgSend(v2, sel_isCardSessionEligibleWithCompletionHandler_, v5);
  _Block_release(v5);

  return swift_continuation_await();
}

uint64_t sub_215BF4F54()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v0 + 8))(*(unsigned __int8 *)(*(_QWORD *)v0 + 128));
}

unint64_t sub_215BF4F94()
{
  unint64_t result;

  result = qword_254DFC1D8;
  if (!qword_254DFC1D8)
  {
    result = MEMORY[0x2199EE090](&unk_215BFD68C, &type metadata for NFCCardSession.Error);
    atomic_store(result, (unint64_t *)&qword_254DFC1D8);
  }
  return result;
}

uint64_t sub_215BF4FD8()
{
  return swift_deallocObject();
}

uint64_t sub_215BF4FE8(void *a1)
{
  return sub_215BED490(a1);
}

uint64_t sub_215BF4FF0()
{
  return objectdestroy_16Tm();
}

uint64_t sub_215BF4FF8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215BED2C0;
  return sub_215BF08D4(a1, v4, v5, v6);
}

uint64_t sub_215BF5064(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if ((~a2 & 0x3000000000000000) != 0 || a3 != 255)
    return sub_215BF4818(result, a2, a3 & 1, sub_215BE7BD4);
  return result;
}

uint64_t sub_215BF50A0(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if ((~a2 & 0x3000000000000000) != 0 || a3 != 255)
    return sub_215BF4818(result, a2, a3 & 1, sub_215BE7B48);
  return result;
}

uint64_t sub_215BF50DC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_215BF5100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_215BED2C0;
  v8[9] = a3;
  v8[10] = v3;
  v8[7] = a1;
  v8[8] = a2;
  return swift_task_switch();
}

uint64_t sub_215BF5174(uint64_t a1)
{
  return sub_215BF038C(a1);
}

uint64_t sub_215BF517C()
{
  return objectdestroy_16Tm();
}

uint64_t sub_215BF5184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_215BEC894;
  v4[9] = v2;
  v4[10] = v3;
  return swift_task_switch();
}

uint64_t sub_215BF51E4()
{
  return swift_deallocObject();
}

uint64_t sub_215BF51F4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_215BE7BD4(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

void sub_215BF5228(void *a1)
{
  uint64_t v1;

  sub_215BEF09C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_215BF5238()
{
  return swift_deallocObject();
}

uint64_t sub_215BF5248()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_215BF526C(uint64_t a1)
{
  uint64_t v1;

  sub_215BF44C4(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_215BF5274()
{
  return swift_deallocObject();
}

uint64_t sub_215BF5284()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_215BF52B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t *v4;

  sub_215BF3F4C(a1, a2, a3, a4, v4[2], v4[3], v4[4]);
}

uint64_t sub_215BF52BC()
{
  return swift_deallocObject();
}

void sub_215BF52CC(char a1, void *a2)
{
  uint64_t v2;

  sub_215BF2400(a1, a2, *(_QWORD *)(v2 + 16));
}

id sub_215BF54CC()
{
  void *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  sub_215BFACEC();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_215BF55E0()
{
  return type metadata accessor for AssertionNotification(0);
}

uint64_t type metadata accessor for AssertionNotification(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFC348);
}

void sub_215BF5628()
{
  unint64_t v0;

  sub_215BF61CC(319, &qword_254DFC358, MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_215BF56A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  objc_class *v15;
  char *v16;
  id v17;
  objc_super v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC498);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_254DFBE28);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 120) = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6A10], v1);
  sub_215BFACD4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v0 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStream, v12, v9);
  v13 = v0 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStreamContinuation;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v0 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStreamContinuation, v8, v5);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v8, v13, v5);
  v15 = (objc_class *)type metadata accessor for AssertionNotification(0);
  v16 = (char *)objc_allocWithZone(v15);
  v14(&v16[OBJC_IVAR____TtC7CoreNFC21AssertionNotification_eventStreamContinuation], (uint64_t)v8, v5);
  v19.receiver = v16;
  v19.super_class = v15;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)(v0 + 112) = v17;
  return v0;
}

uint64_t sub_215BF5898()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[6];

  v1 = v0;
  if (qword_254DFB530 != -1)
    swift_once();
  v2 = sub_215BFAC38();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DFD460);
  v3 = sub_215BFAC20();
  v4 = sub_215BFAD28();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215BBD000, v3, v4, "NFCPresentmentSuppressionController.deinit", v5, 2u);
    MEMORY[0x2199EE0F0](v5, -1, -1);
  }

  v6 = v1 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStreamContinuation;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB840);
  sub_215BFACEC();
  v8 = *(void **)(v1 + 120);
  if (v8)
  {
    v9 = (void *)objc_opt_self();
    v10 = v8;
    v11 = objc_msgSend(v9, sel_sharedHardwareManager);
    v16[4] = sub_215BF5A9C;
    v16[5] = 0;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_215BF6E48;
    v16[3] = &block_descriptor_5;
    v12 = _Block_copy(v16);
    objc_msgSend(v11, sel_releasePresentmentSuppression_completion_, v10, v12);
    _Block_release(v12);

  }
  v13 = v1 + OBJC_IVAR____TtC7CoreNFC35NFCPresentmentSuppressionController_eventStream;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_254DFBE28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_defaultActor_destroy();
  return v1;
}

void sub_215BF5A9C(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  if (a1)
  {
    v2 = a1;
    if (qword_254DFB530 != -1)
      swift_once();
    v3 = sub_215BFAC38();
    __swift_project_value_buffer(v3, (uint64_t)qword_254DFD460);
    v4 = a1;
    v5 = a1;
    oslog = sub_215BFAC20();
    v6 = sub_215BFAD28();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = swift_slowAlloc();
      v8 = swift_slowAlloc();
      v12 = v8;
      *(_DWORD *)v7 = 136315650;
      sub_215BF6694(0x74696E696564, 0xE600000000000000, &v12);
      sub_215BFAD58();
      *(_WORD *)(v7 + 12) = 2048;
      sub_215BFAD58();
      *(_WORD *)(v7 + 22) = 2080;
      swift_getErrorValue();
      v9 = sub_215BFADF4();
      sub_215BF6694(v9, v10, &v12);
      sub_215BFAD58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_215BBD000, oslog, v6, "%s:%ld: %s", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2199EE0F0](v8, -1, -1);
      MEMORY[0x2199EE0F0](v7, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_215BF5CE8()
{
  sub_215BF5898();
  return swift_defaultActor_deallocate();
}

uint64_t sub_215BF5D00()
{
  return type metadata accessor for NFCPresentmentSuppressionController(0);
}

uint64_t type metadata accessor for NFCPresentmentSuppressionController(uint64_t a1)
{
  return sub_215BEC358(a1, (uint64_t *)&unk_254DFC390);
}

void sub_215BF5D1C()
{
  unint64_t v0;
  unint64_t v1;

  sub_215BF61CC(319, qword_254DFC3A8, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_215BF61CC(319, &qword_254DFC358, MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_215BF5DE4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = v0;
  sub_215BF6558();
  if (v0)
  {
    swift_getObjectType();
    sub_215BFACB0();
  }
  return swift_task_switch();
}

uint64_t sub_215BF5E48()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;

  v1 = v0[17];
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = sub_215BF5F54;
  v2 = swift_continuation_init();
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedHardwareManager);
  v4 = *(_QWORD *)(v1 + 112);
  v5 = swift_allocObject();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  *(_QWORD *)(v5 + 16) = v2;
  v6[4] = sub_215BF65B0;
  v6[5] = v5;
  v6[1] = 1107296256;
  v6[2] = sub_215BF64E4;
  v6[3] = &block_descriptor_3;
  v7 = _Block_copy(v6);
  swift_release();
  objc_msgSend(v3, sel_requestPresentmentSuppressionWithDelegate_completion_, v4, v7);
  _Block_release(v7);

  return swift_continuation_await();
}

uint64_t sub_215BF5F54()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
  {
    swift_willThrow();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    *(_QWORD *)(v1 + 144) = *(_QWORD *)(v1 + 128);
    return swift_task_switch();
  }
}

uint64_t sub_215BF5FD0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  if (qword_254DFB530 != -1)
    swift_once();
  v1 = *(void **)(v0 + 144);
  v2 = sub_215BFAC38();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DFD460);
  v3 = v1;
  v4 = sub_215BFAC20();
  v5 = sub_215BFAD28();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 144);
  if (v6)
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315650;
    *(_QWORD *)(v0 + 80) = sub_215BF6694(0x2865726975716361, 0xE900000000000029, &v13);
    sub_215BFAD58();
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v0 + 80) = 98;
    sub_215BFAD58();
    *(_WORD *)(v8 + 22) = 2048;
    *(_QWORD *)(v0 + 80) = objc_msgSend(v7, sel_unsignedLongLongValue);
    sub_215BFAD58();

    _os_log_impl(&dword_215BBD000, v4, v5, "%s:%ld: handle=%llu", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199EE0F0](v9, -1, -1);
    MEMORY[0x2199EE0F0](v8, -1, -1);
  }
  else
  {

  }
  v10 = *(_QWORD *)(v0 + 136);
  v11 = *(void **)(v10 + 120);
  *(_QWORD *)(v10 + 120) = *(_QWORD *)(v0 + 144);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_215BF61CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for NFCPresentmentSuppressionController.Event);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t storeEnumTagSinglePayload for NFCPresentmentSuppressionController.Event(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_215BF6260 + 4 * byte_215BFD775[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_215BF6294 + 4 * byte_215BFD770[v4]))();
}

uint64_t sub_215BF6294(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BF629C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215BF62A4);
  return result;
}

uint64_t sub_215BF62B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215BF62B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_215BF62BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215BF62C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NFCPresentmentSuppressionController.Event()
{
  return &type metadata for NFCPresentmentSuppressionController.Event;
}

unint64_t sub_215BF62E4()
{
  unint64_t result;

  result = qword_254DFC470;
  if (!qword_254DFC470)
  {
    result = MEMORY[0x2199EE090](&unk_215BFD890, &type metadata for NFCPresentmentSuppressionController.Event);
    atomic_store(result, (unint64_t *)&qword_254DFC470);
  }
  return result;
}

uint64_t sub_215BF6328(void *a1, id a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  _BYTE *v6;
  id v7;
  uint64_t result;
  _BYTE *v9;
  uint64_t *v10;

  if (a2)
  {
    v4 = a2;
    switch(sub_215BED2E4(a2))
    {
      case 0xEu:
      case 0x20u:
        goto LABEL_8;
      case 0x45u:
      case 0x46u:
        sub_215BF6DFC();
        v5 = swift_allocError();
        *v9 = 0;
        break;
      default:
        sub_215BF6DFC();
        v5 = swift_allocError();
        *v6 = 1;
        break;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC1E0);
    swift_allocError();
    *v10 = v5;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a1)
  {
    **(_QWORD **)(*(_QWORD *)(a3 + 64) + 40) = a1;
    v7 = a1;
    return swift_continuation_throwingResume();
  }
  else
  {
LABEL_8:
    result = sub_215BFADB8();
    __break(1u);
  }
  return result;
}

void sub_215BF64E4(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

unint64_t sub_215BF6558()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DFC478;
  if (!qword_254DFC478)
  {
    v1 = type metadata accessor for NFCPresentmentSuppressionController(255);
    result = MEMORY[0x2199EE090](&unk_215BFD8B8, v1);
    atomic_store(result, (unint64_t *)&qword_254DFC478);
  }
  return result;
}

uint64_t sub_215BF65A0()
{
  return swift_deallocObject();
}

uint64_t sub_215BF65B0(void *a1, void *a2)
{
  uint64_t v2;

  return sub_215BF6328(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_215BF65D0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_215BF6604(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_215BF6624(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_215BF6694(v6, v7, a3);
  v8 = *a1 + 8;
  sub_215BFAD58();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_215BF6694(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_215BF6764(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_215BF6DC0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_215BF6DC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_215BF6764(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_215BFAD64();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_215BF691C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_215BFADA0();
  if (!v8)
  {
    sub_215BFADAC();
    __break(1u);
LABEL_17:
    result = sub_215BFADD0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_215BF691C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_215BF69B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_215BF6B88(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_215BF6B88(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_215BF69B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_215BF6B24(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_215BFAD88();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_215BFADAC();
      __break(1u);
LABEL_10:
      v2 = sub_215BFAC8C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_215BFADD0();
    __break(1u);
LABEL_14:
    result = sub_215BFADAC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_215BF6B24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC480);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_215BF6B88(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC480);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_215BFADD0();
  __break(1u);
  return result;
}

_BYTE **sub_215BF6CD4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_215BF6CE4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_215BFADD0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_215BF6D78@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_215BF6DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_215BF6DFC()
{
  unint64_t result;

  result = qword_254DFC488;
  if (!qword_254DFC488)
  {
    result = MEMORY[0x2199EE090](&protocol conformance descriptor for NFCPresentmentIntentAssertion.Error, &type metadata for NFCPresentmentIntentAssertion.Error);
    atomic_store(result, (unint64_t *)&qword_254DFC488);
  }
  return result;
}

void sub_215BF6E48(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t NFCTagReaderSession.upcastTag(_:)()
{
  return swift_unknownObjectRetain();
}

id NFCTagReaderSession.connectedTag.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id result;
  void *v4;

  result = objc_msgSend(v1, sel_connectedTag);
  if (result)
  {
    v4 = (void *)swift_unknownObjectRetain();
    sub_215BF92A4(v4, a1);
    return (id)swift_unknownObjectRelease();
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 8) = -1;
  }
  return result;
}

id NFCTagReaderSession.init(pollingOption:delegate:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v7 = (objc_class *)type metadata accessor for NFCTagReaderSessionDelegateSwiftWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate + 8] = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a3;
  swift_unknownObjectWeakAssign();
  v14.receiver = v8;
  v14.super_class = v7;
  v9 = objc_msgSendSuper2(&v14, sel_init);
  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = v9;
  v12 = objc_msgSend(v10, sel_initWithPollingOption_swiftDelegate_queue_, a1, v11, a4);
  swift_unknownObjectRelease();

  return v12;
}

uint64_t NFCTagReaderSession.connect(to:completionHandler:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];

  v4 = *a1;
  v7[4] = a2;
  v7[5] = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_215BF6E48;
  v7[3] = &block_descriptor_4;
  v5 = _Block_copy(v7);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_connectToTag_completionHandler_, v4, v5);
  _Block_release(v5);
  return swift_unknownObjectRelease();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t NFCFeliCaPollingResponse.manufactureParameter.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_215BE7B48(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t NFCFeliCaPollingResponse.manufactureParameter.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_215BE7BD4(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*NFCFeliCaPollingResponse.manufactureParameter.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaPollingResponse.requestData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_215BE7B34(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t NFCFeliCaPollingResponse.requestData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_215BE7BC0(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NFCFeliCaPollingResponse.requestData.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaPollingResponse.init(manufactureParameter:requestData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t NFCFeliCaStatusFlag.statusFlag1.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t NFCFeliCaStatusFlag.statusFlag1.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*NFCFeliCaStatusFlag.statusFlag1.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaStatusFlag.statusFlag2.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t NFCFeliCaStatusFlag.statusFlag2.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*NFCFeliCaStatusFlag.statusFlag2.modify())()
{
  return nullsub_1;
}

CoreNFC::NFCFeliCaStatusFlag __swiftcall NFCFeliCaStatusFlag.init(statusFlag1:statusFlag2:)(Swift::Int statusFlag1, Swift::Int statusFlag2)
{
  Swift::Int *v2;
  CoreNFC::NFCFeliCaStatusFlag result;

  *v2 = statusFlag1;
  v2[1] = statusFlag2;
  result.statusFlag2 = statusFlag2;
  result.statusFlag1 = statusFlag1;
  return result;
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag1.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag1.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.statusFlag1.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag2.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t NFCFeliCaRequsetServiceV2Response.statusFlag2.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.statusFlag2.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.encryptionIdentifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t NFCFeliCaRequsetServiceV2Response.encryptionIdentifier.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.encryptionIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListAES.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListAES.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListAES.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListDES.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListDES.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*NFCFeliCaRequsetServiceV2Response.nodeKeyVersionListDES.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequsetServiceV2Response.init(statusFlag1:statusFlag2:encryptionIdentifier:nodeKeyVersionListAES:nodeKeyVersionListDES:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag1.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag1.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.statusFlag1.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag2.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.statusFlag2.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.statusFlag2.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.basicVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_215BE7B34(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.basicVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_215BE7BC0(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.basicVersion.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.optionVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_215BE7B34(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.optionVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_215BE7BC0(*(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*NFCFeliCaRequestSpecificationVersionResponse.optionVersion.modify())()
{
  return nullsub_1;
}

uint64_t NFCFeliCaRequestSpecificationVersionResponse.init(statusFlag1:statusFlag2:basicVersion:optionVersion:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

void NFCFeliCaTag.polling(systemCode:requestCode:timeSlot:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  v11 = (void *)sub_215BFABC0();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a5;
  *(_QWORD *)(v12 + 24) = a6;
  v14[4] = sub_215BF76C8;
  v14[5] = v12;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_215BF76D0;
  v14[3] = &block_descriptor_5;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_pollingWithSystemCode_requestCode_timeSlot_completionHandler_, v11, a3, a4, v13);
  _Block_release(v13);

}

void sub_215BF751C(int a1, int a2, int a3, uint64_t a4, id a5, void (*a6)(_QWORD *))
{
  id v8;
  _QWORD v9[4];
  char v10;

  if (!a5)
    __asm { BR              X10 }
  v9[0] = a5;
  memset(&v9[1], 0, 24);
  v10 = 1;
  v8 = a5;
  a6(v9);

}

uint64_t sub_215BF76A4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_215BF76C8(int a1, int a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v5;

  sub_215BF751C(a1, a2, a3, a4, a5, *(void (**)(_QWORD *))(v5 + 16));
}

uint64_t sub_215BF76D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(uint64_t, unint64_t, uint64_t, unint64_t, void *);
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v7 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  v8 = a2;
  v9 = sub_215BFABCC();
  v11 = v10;

  v12 = a3;
  v13 = sub_215BFABCC();
  v15 = v14;

  v16 = a4;
  v7(v9, v11, v13, v15, a4);

  sub_215BE7BD4(v13, v15);
  sub_215BE7BD4(v9, v11);
  return swift_release();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void NFCFeliCaTag.requestService(nodeCodeList:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v6 = (void *)sub_215BFAC98();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_215BF7884;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_215BF789C;
  v9[3] = &block_descriptor_6_0;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_requestServiceWithNodeCodeList_completionHandler_, v6, v8);
  _Block_release(v8);

}

void sub_215BF7884(int a1, void *a2)
{
  uint64_t v2;

  sub_215BF79D0(a1, a2, *(void (**)(void))(v2 + 16));
}

void sub_215BF789C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = sub_215BFACA4();
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();

}

void NFCFeliCaTag.requestResponse(resultHandler:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v7[4] = sub_215BF7A2C;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_215BF2528;
  v7[3] = &block_descriptor_12;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_requestResponseWithCompletionHandler_, v6);
  _Block_release(v6);
}

void sub_215BF79D0(int a1, id a2, void (*a3)(void))
{
  id v5;

  if (a2)
  {
    v5 = a2;
    ((void (*)(id, uint64_t))a3)(a2, 1);

  }
  else
  {
    a3();
  }
}

void sub_215BF7A2C(int a1, void *a2)
{
  uint64_t v2;

  sub_215BF79D0(a1, a2, *(void (**)(void))(v2 + 16));
}

void NFCFeliCaTag.readWithoutEncryption(serviceCodeList:blockList:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v7 = (void *)sub_215BFAC98();
  v8 = (void *)sub_215BFAC98();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  v11[4] = sub_215BF7BBC;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_215BF7BC4;
  v11[3] = &block_descriptor_18;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler_, v7, v8, v10);
  _Block_release(v10);

}

void sub_215BF7B30(void *a1, uint64_t a2, uint64_t a3, id a4, void (*a5)(id *))
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  if (a4)
  {
    v9 = 0;
    v10 = 0;
    v8 = a4;
    v11 = 1;
    v7 = a4;
    a5(&v8);

  }
  else
  {
    v8 = a1;
    v9 = a2;
    v10 = a3;
    v11 = 0;
    swift_bridgeObjectRetain();
    a5(&v8);
    swift_bridgeObjectRelease();
  }
}

void sub_215BF7BBC(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;

  sub_215BF7B30(a1, a2, a3, a4, *(void (**)(id *))(v4 + 16));
}

void sub_215BF7BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void (*v8)(uint64_t, uint64_t, uint64_t, void *);
  uint64_t v9;
  id v10;

  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  v9 = sub_215BFACA4();
  swift_retain();
  v10 = a5;
  v8(a2, a3, v9, a5);
  swift_release();
  swift_bridgeObjectRelease();

}

void NFCFeliCaTag.writeWithoutEncryption(serviceCodeList:blockList:blockData:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v8 = (void *)sub_215BFAC98();
  v9 = (void *)sub_215BFAC98();
  v10 = (void *)sub_215BFAC98();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  v13[4] = sub_215BF7D74;
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_215BF7D8C;
  v13[3] = &block_descriptor_24;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler_, v8, v9, v10, v12);
  _Block_release(v12);

}

void sub_215BF7D74(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  sub_215BF8600(a1, a2, a3, *(void (**)(id *))(v3 + 16));
}

void sub_215BF7D8C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (*v7)(uint64_t, uint64_t, void *);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  v8 = a4;
  v7(a2, a3, a4);
  swift_release();

}

void NFCFeliCaTag.requestSystemCode(resultHandler:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v7[4] = sub_215BF90FC;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_215BF789C;
  v7[3] = &block_descriptor_30;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_requestSystemCodeWithCompletionHandler_, v6);
  _Block_release(v6);
}

void NFCFeliCaTag.requestServiceV2(nodeCodeList:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v6 = (void *)sub_215BFAC98();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_215BF8080;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_215BF8088;
  v9[3] = &block_descriptor_36;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_requestServiceV2WithNodeCodeList_completionHandler_, v6, v8);
  _Block_release(v8);

}

void sub_215BF7F94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, id a6, void (*a7)(id *))
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v15;
  __int128 v16;
  __int128 v17;
  char v18;

  if (a6)
  {
    v15 = a6;
    v16 = 0u;
    v17 = 0u;
    v18 = 1;
    v9 = a6;
    a7(&v15);

    return;
  }
  v10 = a5;
  v11 = a4;
  if (!*(_QWORD *)(a4 + 16))
  {
    v11 = 0;
    if (*(_QWORD *)(a5 + 16))
      goto LABEL_5;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_7;
LABEL_5:
  swift_bridgeObjectRetain();
LABEL_8:
  v15 = a1;
  *(_QWORD *)&v16 = a2;
  *((_QWORD *)&v16 + 1) = a3;
  *(_QWORD *)&v17 = v11;
  *((_QWORD *)&v17 + 1) = v10;
  v18 = 0;
  a7(&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_215BF8080(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v6;

  sub_215BF7F94(a1, a2, a3, a4, a5, a6, *(void (**)(id *))(v6 + 16));
}

void sub_215BF8088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v12;
  uint64_t v13;
  id v14;

  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  v12 = sub_215BFACA4();
  v13 = sub_215BFACA4();
  swift_retain();
  v14 = a7;
  v11(a2, a3, a4, v12, v13, a7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

void NFCFeliCaTag.requestSpecificationVersion(resultHandler:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v7[4] = sub_215BF8448;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_215BF846C;
  v7[3] = &block_descriptor_42;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_requestSpecificationVersionWithCompletionHandler_, v6);
  _Block_release(v6);
}

void sub_215BF8210(int a1, int a2, int a3, uint64_t a4, int a5, int a6, id a7, void (*a8)(id *), uint64_t a9)
{
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;

  if (!a7)
    __asm { BR              X10 }
  v12 = a7;
  v13 = 0u;
  v14 = 0u;
  v15 = 0;
  v16 = 1;
  v11 = a7;
  a8(&v12);

}

void sub_215BF8448(int a1, int a2, int a3, uint64_t a4, int a5, int a6, void *a7)
{
  uint64_t v7;

  sub_215BF8210(a1, a2, a3, a4, a5, a6, a7, *(void (**)(id *))(v7 + 16), *(_QWORD *)(v7 + 24));
}

uint64_t sub_215BF846C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  void (*v11)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, void *);
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;

  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  v12 = a4;
  v13 = sub_215BFABCC();
  v15 = v14;

  v16 = a5;
  v17 = sub_215BFABCC();
  v19 = v18;

  v20 = a6;
  v11(a2, a3, v13, v15, v17, v19, a6);

  sub_215BE7BD4(v17, v19);
  sub_215BE7BD4(v13, v15);
  return swift_release();
}

void NFCFeliCaTag.resetMode(resultHandler:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v7[4] = sub_215BF90D4;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_215BF7D8C;
  v7[3] = &block_descriptor_48_0;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_resetModeWithCompletionHandler_, v6);
  _Block_release(v6);
}

void sub_215BF8600(void *a1, uint64_t a2, id a3, void (*a4)(id *))
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;

  if (a3)
  {
    v7 = a3;
    v8 = 0;
    v9 = 1;
    v6 = a3;
    a4(&v7);

  }
  else
  {
    v7 = a1;
    v8 = a2;
    v9 = 0;
    a4(&v7);
  }
}

void NFCFeliCaTag.sendFeliCaCommand(commandPacket:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v7 = (void *)sub_215BFABC0();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  v10[4] = sub_215BE842C;
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_215BE8434;
  v10[3] = &block_descriptor_54;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_sendFeliCaCommandPacket_completionHandler_, v7, v9);
  _Block_release(v9);

}

uint64_t initializeBufferWithCopyOfBuffer for NFCFeliCaPollingResponse(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NFCFeliCaPollingResponse(uint64_t *a1)
{
  uint64_t result;
  unint64_t v3;

  result = sub_215BE7BD4(*a1, a1[1]);
  v3 = a1[3];
  if (v3 >> 60 != 15)
    return sub_215BE7BD4(a1[2], v3);
  return result;
}

uint64_t initializeWithCopy for NFCFeliCaPollingResponse(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = a2[1];
  sub_215BE7B48(*a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = a2 + 2;
  v7 = a2[3];
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    sub_215BE7B48(*v6, v7);
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t *assignWithCopy for NFCFeliCaPollingResponse(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v4 = *a2;
  v5 = a2[1];
  sub_215BE7B48(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_215BE7BD4(v6, v7);
  v8 = a2 + 2;
  v9 = a2[3];
  if ((unint64_t)a1[3] >> 60 != 15)
  {
    if (v9 >> 60 != 15)
    {
      v11 = *v8;
      sub_215BE7B48(*v8, v9);
      v12 = a1[2];
      v13 = a1[3];
      a1[2] = v11;
      a1[3] = v9;
      sub_215BE7BD4(v12, v13);
      return a1;
    }
    sub_215BE807C((uint64_t)(a1 + 2));
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 1) = *(_OWORD *)v8;
    return a1;
  }
  v10 = *v8;
  sub_215BE7B48(*v8, v9);
  a1[2] = v10;
  a1[3] = v9;
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for NFCFeliCaPollingResponse(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_215BE7BD4(v4, v5);
  v6 = (uint64_t *)(a2 + 16);
  v7 = a1[3];
  if (v7 >> 60 != 15)
  {
    v8 = *(_QWORD *)(a2 + 24);
    if (v8 >> 60 != 15)
    {
      v9 = a1[2];
      a1[2] = *v6;
      a1[3] = v8;
      sub_215BE7BD4(v9, v7);
      return a1;
    }
    sub_215BE807C((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaPollingResponse(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaPollingResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaPollingResponse()
{
  return &type metadata for NFCFeliCaPollingResponse;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaStatusFlag(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaStatusFlag(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NFCFeliCaStatusFlag()
{
  return &type metadata for NFCFeliCaStatusFlag;
}

uint64_t destroy for NFCFeliCaRequsetServiceV2Response()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NFCFeliCaRequsetServiceV2Response(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NFCFeliCaRequsetServiceV2Response(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
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

uint64_t assignWithTake for NFCFeliCaRequsetServiceV2Response(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaRequsetServiceV2Response(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaRequsetServiceV2Response(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaRequsetServiceV2Response()
{
  return &type metadata for NFCFeliCaRequsetServiceV2Response;
}

uint64_t destroy for NFCFeliCaRequestSpecificationVersionResponse(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 24);
  if (v2 >> 60 != 15)
    result = sub_215BE7BD4(*(_QWORD *)(result + 16), v2);
  v3 = *(_QWORD *)(v1 + 40);
  if (v3 >> 60 != 15)
    return sub_215BE7BD4(*(_QWORD *)(v1 + 32), v3);
  return result;
}

uint64_t initializeWithCopy for NFCFeliCaRequestSpecificationVersionResponse(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = (uint64_t *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
  }
  else
  {
    v6 = *v4;
    sub_215BE7B48(*v4, *(_QWORD *)(a2 + 24));
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v5;
  }
  v7 = (uint64_t *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v7;
  }
  else
  {
    v9 = *v7;
    sub_215BE7B48(*v7, v8);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v8;
  }
  return a1;
}

_QWORD *assignWithCopy for NFCFeliCaRequestSpecificationVersionResponse(_QWORD *a1, _QWORD *a2)
{
  _OWORD *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = a1 + 2;
  v5 = a2 + 2;
  v6 = a2[3];
  if (a1[3] >> 60 == 15)
  {
    if (v6 >> 60 != 15)
    {
      v7 = *v5;
      sub_215BE7B48(*v5, a2[3]);
      a1[2] = v7;
      a1[3] = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
    sub_215BE807C((uint64_t)(a1 + 2));
LABEL_6:
    *v4 = *(_OWORD *)v5;
    goto LABEL_8;
  }
  v8 = *v5;
  sub_215BE7B48(*v5, a2[3]);
  v9 = a1[2];
  v10 = a1[3];
  a1[2] = v8;
  a1[3] = v6;
  sub_215BE7BD4(v9, v10);
LABEL_8:
  v11 = a2 + 4;
  v12 = a2[5];
  if (a1[5] >> 60 != 15)
  {
    if (v12 >> 60 != 15)
    {
      v14 = *v11;
      sub_215BE7B48(*v11, v12);
      v15 = a1[4];
      v16 = a1[5];
      a1[4] = v14;
      a1[5] = v12;
      sub_215BE7BD4(v15, v16);
      return a1;
    }
    sub_215BE807C((uint64_t)(a1 + 4));
    goto LABEL_13;
  }
  if (v12 >> 60 == 15)
  {
LABEL_13:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v11;
    return a1;
  }
  v13 = *v11;
  sub_215BE7B48(*v11, v12);
  a1[4] = v13;
  a1[5] = v12;
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NFCFeliCaRequestSpecificationVersionResponse(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = (_OWORD *)(a1 + 16);
  v5 = (_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  if (v6 >> 60 == 15)
    goto LABEL_4;
  v7 = *(_QWORD *)(a2 + 24);
  if (v7 >> 60 == 15)
  {
    sub_215BE807C(a1 + 16);
LABEL_4:
    *v4 = *v5;
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)v5;
  *(_QWORD *)(a1 + 24) = v7;
  sub_215BE7BD4(v8, v6);
LABEL_6:
  v9 = (_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 >> 60 != 15)
  {
    v11 = *(_QWORD *)(a2 + 40);
    if (v11 >> 60 != 15)
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 32) = *v9;
      *(_QWORD *)(a1 + 40) = v11;
      sub_215BE7BD4(v12, v10);
      return a1;
    }
    sub_215BE807C(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCFeliCaRequestSpecificationVersionResponse(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 12);
  v3 = *(_QWORD *)(a1 + 24) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCFeliCaRequestSpecificationVersionResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)(result + 24) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCFeliCaRequestSpecificationVersionResponse()
{
  return &type metadata for NFCFeliCaRequestSpecificationVersionResponse;
}

uint64_t NFCNDEFPayload.wellKnownTypeTextPayload()(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v15[2];

  v2 = v1;
  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFC4A0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = 0;
  v6 = objc_msgSend(v2, sel_wellKnownTypeTextPayloadWithLocale_, v15);
  v7 = v15[0];
  if (!v6)
  {
    v12 = v15[0];
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v13 = sub_215BFABF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v5, 1, 1, v13);
    goto LABEL_6;
  }
  v8 = v6;
  v9 = sub_215BFAC68();
  v10 = v7;

  if (!v7)
    goto LABEL_5;
LABEL_3:
  sub_215BFABE4();
  v11 = sub_215BFABF0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 0, 1, v11);
LABEL_6:
  sub_215BF925C((uint64_t)v5, a1);

  return v9;
}

uint64_t sub_215BF925C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254DFC4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_215BF92A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t result;

  v4 = objc_msgSend(a1, sel_asNFCFeliCaTag);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
LABEL_9:
    result = swift_unknownObjectRelease();
    *(_QWORD *)a2 = v5;
    *(_BYTE *)(a2 + 8) = v6;
    return result;
  }
  v7 = objc_msgSend(a1, sel_asNFCISO15693Tag);
  if (v7)
  {
    v5 = v7;
    v6 = 2;
    goto LABEL_9;
  }
  v8 = objc_msgSend(a1, sel_asNFCISO7816Tag);
  if (v8)
  {
    v5 = v8;
    v6 = 1;
    goto LABEL_9;
  }
  v9 = objc_msgSend(a1, sel_asNFCMiFareTag);
  if (v9)
  {
    v5 = v9;
    v6 = 3;
    goto LABEL_9;
  }
  result = sub_215BFADB8();
  __break(1u);
  return result;
}

id NFCTag.isAvailable.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isAvailable);
}

uint64_t initializeBufferWithCopyOfBuffer for NFCTag(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for NFCTag()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for NFCTag(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for NFCTag(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCTag(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NFCTag(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_215BF953C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_215BF9544(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for NFCTag()
{
  return &type metadata for NFCTag;
}

uint64_t type metadata accessor for NFCAtomicWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NFCAtomicWrapper);
}

uint64_t NFCISO15693SystemInfo.uniqueIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_215BE7B48(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t NFCISO15693SystemInfo.uniqueIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_215BE7BD4(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.uniqueIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.dataStorageFormatIdentifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t NFCISO15693SystemInfo.dataStorageFormatIdentifier.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.dataStorageFormatIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.applicationFamilyIdentifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t NFCISO15693SystemInfo.applicationFamilyIdentifier.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.applicationFamilyIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.blockSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t NFCISO15693SystemInfo.blockSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.blockSize.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.totalBlocks.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t NFCISO15693SystemInfo.totalBlocks.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.totalBlocks.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.icReference.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t NFCISO15693SystemInfo.icReference.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t (*NFCISO15693SystemInfo.icReference.modify())()
{
  return nullsub_1;
}

uint64_t NFCISO15693SystemInfo.init(uniqueIdentifier:dataStorageFormatIdentifier:applicationFamilyIdentifier:blockSize:totalBlocks:icReference:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  *a8 = result;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  return result;
}

uint64_t NFCISO15693MultipleBlockSecurityStatus.blockSecurityStatus.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NFCISO15693MultipleBlockSecurityStatus.blockSecurityStatus.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*NFCISO15693MultipleBlockSecurityStatus.blockSecurityStatus.modify())()
{
  return nullsub_1;
}

CoreNFC::NFCISO15693MultipleBlockSecurityStatus __swiftcall NFCISO15693MultipleBlockSecurityStatus.init(blockSecurityStatus:)(CoreNFC::NFCISO15693MultipleBlockSecurityStatus blockSecurityStatus)
{
  CoreNFC::NFCISO15693MultipleBlockSecurityStatus *v1;

  v1->blockSecurityStatus._rawValue = blockSecurityStatus.blockSecurityStatus._rawValue;
  return blockSecurityStatus;
}

void NFCISO15693Tag.readSingleBlock(requestFlags:blockNumber:resultHandler:)(unsigned __int8 a1, unsigned __int8 a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  v11[4] = sub_215BFAB70;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_215BE8434;
  v11[3] = &block_descriptor_6;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_readSingleBlockWithRequestFlags_blockNumber_completionHandler_, a1, a2, v10);
  _Block_release(v10);
}

uint64_t sub_215BF97B0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void NFCISO15693Tag.readMultipleBlocks(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_215BFA568(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_24D451940, (uint64_t)sub_215BF7884, (uint64_t)&block_descriptor_6_1, (SEL *)&selRef_readMultipleBlocksWithRequestFlags_blockRange_completionHandler_);
}

void NFCISO15693Tag.getSystemInfo(requestFlags:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_215BF9A00;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_215BF9A24;
  v9[3] = &block_descriptor_12_0;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_getSystemInfoAndUIDWithRequestFlag_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_215BF98F8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, id a8, void (*a9)(uint64_t *), uint64_t a10)
{
  id v11;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;

  if (a8)
  {
    v14 = (uint64_t)a8;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 1;
    v11 = a8;
    a9(&v14);

  }
  else if (a2 >> 60 == 15)
  {
    sub_215BFADB8();
    __break(1u);
  }
  else
  {
    v14 = a1;
    *(_QWORD *)&v15 = a2;
    *((_QWORD *)&v15 + 1) = a3;
    *(_QWORD *)&v16 = a4;
    *((_QWORD *)&v16 + 1) = a5;
    *(_QWORD *)&v17 = a6;
    *((_QWORD *)&v17 + 1) = a7;
    v18 = 0;
    sub_215BE7B48(a1, a2);
    a9(&v14);
    sub_215BE7BC0(a1, a2);
  }
}

void sub_215BF9A00(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v8;

  sub_215BF98F8(a1, a2, a3, a4, a5, a6, a7, a8, *(void (**)(uint64_t *))(v8 + 16), *(_QWORD *)(v8 + 24));
}

uint64_t sub_215BF9A24(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v13;
  void (*v14)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  id v15;
  unint64_t v16;
  unint64_t v17;
  id v18;

  v13 = a2;
  v14 = *(void (**)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v15 = v13;
    v13 = (void *)sub_215BFABCC();
    v17 = v16;

  }
  else
  {
    swift_retain();
    v17 = 0xF000000000000000;
  }
  v18 = a8;
  v14(v13, v17, a3, a4, a5, a6, a7, a8);

  sub_215BE7BC0((uint64_t)v13, v17);
  return swift_release();
}

void NFCISO15693Tag.fastReadMultipleBlocks(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_215BFA568(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_24D4519E0, (uint64_t)sub_215BF90FC, (uint64_t)&block_descriptor_18_0, (SEL *)&selRef_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler_);
}

void NFCISO15693Tag.customCommand(requestFlags:customCommandCode:customRequestParameters:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  v11 = (void *)sub_215BFABC0();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a5;
  *(_QWORD *)(v12 + 24) = a6;
  v14[4] = sub_215BF9C2C;
  v14[5] = v12;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_215BE8434;
  v14[3] = &block_descriptor_24_0;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler_, a1, a2, v11, v13);
  _Block_release(v13);

}

void sub_215BF9C2C(int a1, int a2, void *a3)
{
  uint64_t v3;

  sub_215BE83A8(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

void NFCISO15693Tag.extendedReadSingleBlock(requestFlags:blockNumber:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  v11[4] = sub_215BFAB70;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_215BE8434;
  v11[3] = &block_descriptor_30_0;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler_, a1, a2, v10);
  _Block_release(v10);
}

void NFCISO15693Tag.extendedWriteMultipleBlocks(requestFlags:blockRange:dataBlocks:completionHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];

  v7 = v6;
  v13 = (void *)sub_215BFAC98();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a5;
  *(_QWORD *)(v14 + 24) = a6;
  v16[4] = sub_215BF9E1C;
  v16[5] = v14;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_215BF6E48;
  v16[3] = &block_descriptor_36_0;
  v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler_, a1, a2, a3, v13, v15);
  _Block_release(v15);

}

uint64_t sub_215BF9E1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void NFCISO15693Tag.authenticate(requestFlags:cryptoSuiteIdentifier:message:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_215BF9E80(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&unk_24D451B20, (uint64_t)sub_215BFAB08, (uint64_t)&block_descriptor_42_0, (SEL *)&selRef_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler_);
}

void sub_215BF9E80(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, SEL *a11)
{
  void *v11;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];

  v16 = (void *)sub_215BFABC0();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a5;
  *(_QWORD *)(v17 + 24) = a6;
  v19[4] = a9;
  v19[5] = v17;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = sub_215BF9F70;
  v19[3] = a10;
  v18 = _Block_copy(v19);
  swift_retain();
  swift_release();
  objc_msgSend(v11, *a11, a1, a2, v16, v18);
  _Block_release(v18);

}

uint64_t sub_215BF9F70(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (*v7)(uint64_t, uint64_t, unint64_t, void *);
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v7 = *(void (**)(uint64_t, uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  v8 = a3;
  v9 = sub_215BFABCC();
  v11 = v10;

  v12 = a4;
  v7(a2, v9, v11, a4);

  sub_215BE7BD4(v9, v11);
  return swift_release();
}

void NFCISO15693Tag.keyUpdate(requestFlags:keyIdentifier:message:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_215BF9E80(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&unk_24D451B70, (uint64_t)sub_215BFAB08, (uint64_t)&block_descriptor_48_1, (SEL *)&selRef_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler_);
}

void NFCISO15693Tag.challenge(requestFlags:cryptoSuiteIdentifier:message:completionHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v11 = (void *)sub_215BFABC0();
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_215BF6E48;
  v13[3] = &block_descriptor_51;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler_, a1, a2, v11, v12);
  _Block_release(v12);

}

void NFCISO15693Tag.readBuffer(requestFlags:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_215BFA1EC;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_215BF9F70;
  v9[3] = &block_descriptor_57;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_readBufferWithRequestFlags_completionHandler_, a1, v8);
  _Block_release(v8);
}

void sub_215BFA1EC(unsigned __int8 a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;

  sub_215BFA74C(a1, a2, a3, a4, *(void (**)(id, uint64_t, uint64_t, uint64_t))(v4 + 16), *(_QWORD *)(v4 + 24), (void (*)(uint64_t, uint64_t))sub_215BE7B48, (void (*)(uint64_t, uint64_t))sub_215BE7BD4);
}

void NFCISO15693Tag.extendedGetMultipleBlockSecurityStatus(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  v13[4] = sub_215BFA498;
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_215BFA4A0;
  v13[3] = &block_descriptor_63;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler_, a1, a2, a3, v12);
  _Block_release(v12);
}

void sub_215BFA2F8(unint64_t a1, _QWORD *a2, void (*a3)(_QWORD **), uint64_t a4)
{
  _QWORD *v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD **);
  _QWORD *v19;
  char v20;

  if (a2)
  {
    v19 = a2;
    v20 = 1;
    v7 = a2;
    a3(&v19);

    return;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_215BFADC4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v9)
    goto LABEL_15;
  v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_215BE777C(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v17 = a4;
    v18 = a3;
    v11 = 0;
    v10 = v19;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x2199ED91C](v11, a1);
      else
        v12 = *(id *)(a1 + 8 * v11 + 32);
      v13 = v12;
      v14 = objc_msgSend(v12, sel_integerValue, v17, v18);

      v19 = v10;
      v16 = v10[2];
      v15 = v10[3];
      if (v16 >= v15 >> 1)
      {
        sub_215BE777C(v15 > 1, v16 + 1, 1);
        v10 = v19;
      }
      ++v11;
      v10[2] = v16 + 1;
      v10[v16 + 4] = v14;
    }
    while (v9 != v11);
    a3 = v18;
LABEL_15:
    v19 = v10;
    v20 = 0;
    a3(&v19);
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void sub_215BFA498(unint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  sub_215BFA2F8(a1, a2, *(void (**)(_QWORD **))(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_215BFA4A0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_215BFAACC();
  v5 = sub_215BFACA4();
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();

}

void NFCISO15693Tag.extendedFastReadMultipleBlocks(requestFlags:blockRange:resultHandler:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_215BFA568(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_24D451C88, (uint64_t)sub_215BF90FC, (uint64_t)&block_descriptor_69, (SEL *)&selRef_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler_);
}

void sub_215BFA568(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  void *v10;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a4;
  *(_QWORD *)(v17 + 24) = a5;
  v19[4] = a8;
  v19[5] = v17;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = sub_215BF789C;
  v19[3] = a9;
  v18 = _Block_copy(v19);
  swift_retain();
  swift_release();
  objc_msgSend(v10, *a10, a1, a2, a3, v18);
  _Block_release(v18);
}

void NFCISO15693Tag.sendRequest(requestFlags:commandCode:data:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  if (a4 >> 60 == 15)
    v11 = 0;
  else
    v11 = (void *)sub_215BFABC0();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a5;
  *(_QWORD *)(v12 + 24) = a6;
  v14[4] = sub_215BFA800;
  v14[5] = v12;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_215BFA828;
  v14[3] = &block_descriptor_75;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_sendRequestWithFlag_commandCode_data_completionHandler_, a1, a2, v11, v13);
  _Block_release(v13);

}

void sub_215BFA74C(unsigned __int8 a1, uint64_t a2, uint64_t a3, id a4, void (*a5)(id, uint64_t, uint64_t, uint64_t), uint64_t a6, void (*a7)(uint64_t, uint64_t), void (*a8)(uint64_t, uint64_t))
{
  id v10;
  unint64_t v13;

  if (a4)
  {
    v10 = a4;
    a5(a4, 0, 0, 1);

  }
  else
  {
    v13 = a1;
    a7(a2, a3);
    a5((id)v13, a2, a3, 0);
    a8(a2, a3);
  }
}

void sub_215BFA800(unsigned __int8 a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;

  sub_215BFA74C(a1, a2, a3, a4, *(void (**)(id, uint64_t, uint64_t, uint64_t))(v4 + 16), *(_QWORD *)(v4 + 24), (void (*)(uint64_t, uint64_t))sub_215BE7B34, (void (*)(uint64_t, uint64_t))sub_215BE7BC0);
}

uint64_t sub_215BFA828(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  void (*v7)(uint64_t, void *, unint64_t, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;

  v5 = a3;
  v7 = *(void (**)(uint64_t, void *, unint64_t, void *))(a1 + 32);
  if (a3)
  {
    swift_retain();
    v8 = v5;
    v5 = (void *)sub_215BFABCC();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a4;
  v7(a2, v5, v10, a4);

  sub_215BE7BC0((uint64_t)v5, v10);
  return swift_release();
}

uint64_t destroy for NFCISO15693SystemInfo(uint64_t a1)
{
  return sub_215BE7BD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t initializeWithCopy for NFCISO15693SystemInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_215BE7B48(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t *assignWithCopy for NFCISO15693SystemInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_215BE7B48(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_215BE7BD4(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NFCISO15693SystemInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_215BE7BD4(v4, v5);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for NFCISO15693SystemInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NFCISO15693SystemInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NFCISO15693SystemInfo()
{
  return &type metadata for NFCISO15693SystemInfo;
}

ValueMetadata *type metadata accessor for NFCISO15693MultipleBlockSecurityStatus()
{
  return &type metadata for NFCISO15693MultipleBlockSecurityStatus;
}

unint64_t sub_215BFAACC()
{
  unint64_t result;

  result = qword_254DFC6B0;
  if (!qword_254DFC6B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254DFC6B0);
  }
  return result;
}

uint64_t sub_215BFABA8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_215BFABB4()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_215BFABC0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_215BFABCC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_215BFABD8()
{
  return MEMORY[0x24BDCDDB0]();
}

uint64_t sub_215BFABE4()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_215BFABF0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_215BFABFC()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_215BFAC08()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_215BFAC14()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_215BFAC20()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_215BFAC2C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_215BFAC38()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_215BFAC44()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_215BFAC50()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_215BFAC5C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_215BFAC68()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_215BFAC74()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_215BFAC80()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_215BFAC8C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_215BFAC98()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_215BFACA4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_215BFACB0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_215BFACBC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_215BFACC8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_215BFACD4()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_215BFACE0()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_215BFACEC()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_215BFACF8()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_215BFAD04()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_215BFAD10()
{
  return MEMORY[0x24BEE6A68]();
}

uint64_t sub_215BFAD1C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_215BFAD28()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_215BFAD34()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_215BFAD40()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_215BFAD4C()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_215BFAD58()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_215BFAD64()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_215BFAD70()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_215BFAD7C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_215BFAD88()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_215BFAD94()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_215BFADA0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_215BFADAC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_215BFADB8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_215BFADC4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_215BFADD0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_215BFADDC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_215BFADE8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_215BFADF4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_215BFAE00()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_215BFAE0C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_215BFAE18()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_215BFAE24()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_215BFAE30()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_215BFAE3C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_215BFAE48()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t NFLogGetLogger()
{
  return MEMORY[0x24BEDCCD0]();
}

uint64_t NFSharedLogGetLogger()
{
  return MEMORY[0x24BEDCD28]();
}

uint64_t NFSharedSignpostLog()
{
  return MEMORY[0x24BEDCD40]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x24BEDCEE0](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

