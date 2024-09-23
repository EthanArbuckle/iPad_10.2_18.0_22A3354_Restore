void sub_22D27C97C(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    AXLogLiveTranscription();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXLTSpeechTranscriber initializeAudioTap].cold.1();

    objc_end_catch();
    JUMPOUT(0x22D27C964);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  void *v0;

  return objc_msgSend(v0, "pid");
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_22D283F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D284724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Block_object_dispose(&a39, 8);
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

void sub_22D284D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id AXLCLocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.LiveTranscription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("Localizable"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v1;
  }
  v5 = v4;

  return v5;
}

void sub_22D285848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D285F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void handleInputBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  void *v13;

  AXLogLiveTranscription();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    handleInputBuffer_cold_1(a5, v12);

  +[AXLTAudioOutManager sharedInstance](AXLTAudioOutManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleInputBufferWithContext:audioQueue:audioBuffer:timestamp:packetCount:packetDesc:", a1, a2, a3, a4, a5, a6);

}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

LiveTranscription::AXLTCaptionActionsType_optional __swiftcall AXLTCaptionActionsType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (LiveTranscription::AXLTCaptionActionsType_optional)rawValue;
}

uint64_t AXLTCaptionActionsType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_22D287F58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22D287F6C()
{
  sub_22D28B5E0();
  sub_22D28B5EC();
  return sub_22D28B5F8();
}

uint64_t sub_22D287FB0()
{
  return sub_22D28B5EC();
}

uint64_t sub_22D287FD8()
{
  sub_22D28B5E0();
  sub_22D28B5EC();
  return sub_22D28B5F8();
}

LiveTranscription::AXLTCaptionActionsType_optional sub_22D288018(Swift::Int *a1)
{
  return AXLTCaptionActionsType.init(rawValue:)(*a1);
}

void sub_22D288020(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t AXLTCaption.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AXLTCaption.appID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.appName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.time.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.time.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*AXLTCaption.time.modify())()
{
  return nullsub_1;
}

uint64_t AXLTCaption.text.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*AXLTCaption.text.modify())()
{
  return nullsub_1;
}

uint64_t AXLTCaption.segments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AXLTCaption.segments.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 72) = a1;
  return result;
}

uint64_t (*AXLTCaption.segments.modify())()
{
  return nullsub_1;
}

uint64_t AXLTCaption.placeholder.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.placeholder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  return result;
}

uint64_t (*AXLTCaption.placeholder.modify())()
{
  return nullsub_1;
}

void AXLTCaption.actionType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 96);
}

_BYTE *AXLTCaption.actionType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 96) = *result;
  return result;
}

uint64_t (*AXLTCaption.actionType.modify())()
{
  return nullsub_1;
}

void __swiftcall AXLTCaption.init(id:appID:appName:time:text:segments:placeholder:actionType:)(LiveTranscription::AXLTCaption *__return_ptr retstr, Swift::Int id, Swift::String appID, Swift::String appName, Swift::String time, Swift::String text, Swift::OpaquePointer segments, Swift::String placeholder, LiveTranscription::AXLTCaptionActionsType actionType)
{
  LiveTranscription::AXLTCaptionActionsType v9;

  v9 = *(_BYTE *)actionType;
  retstr->id = id;
  retstr->appID = appID;
  retstr->appName = appName;
  retstr->time = time;
  retstr->text._countAndFlagsBits = text._countAndFlagsBits;
  *(Swift::String *)&retstr->text._object = *(Swift::String *)&text._object;
  retstr->placeholder = placeholder;
  retstr->actionType = v9;
}

id sub_22D28827C(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_22D28B5C8();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_22D28B5C8();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x22E30FF2C](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x22E30FF2C](0, v2);
LABEL_21:
    v14 = v13;
    sub_22D289380();
    v15 = sub_22D28B5A4();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x22E30FF2C](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x22E30FF2C](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_22D28B5A4();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_22D28B5A4();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void sub_22D288560(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void __swiftcall mergeCaptions(_:_:)(LiveTranscription::AXLTCaption *__return_ptr retstr, LiveTranscription::AXLTCaption *a2, LiveTranscription::AXLTCaption *a3)
{
  void *object;
  void *v5;
  void *rawValue;
  void *v7;
  unint64_t v8;
  void *v9;
  LiveTranscription::AXLTCaptionActionsType actionType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t countAndFlagsBits;
  Swift::Int id;
  Swift::String text;

  countAndFlagsBits = a2->appID._countAndFlagsBits;
  id = a2->id;
  object = a2->appName._object;
  v5 = a2->time._object;
  v12 = a2->time._countAndFlagsBits;
  v13 = a2->appName._countAndFlagsBits;
  rawValue = a2->segments._rawValue;
  v11 = a2->placeholder._countAndFlagsBits;
  v7 = a2->placeholder._object;
  actionType = a2->actionType;
  v9 = a2->appID._object;
  text = a2->text;
  swift_bridgeObjectRetain();
  sub_22D28B58C();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D28B58C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_bridgeObjectRetain();
  sub_22D2887EC(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->id = id;
  retstr->appID._countAndFlagsBits = countAndFlagsBits;
  retstr->appID._object = v9;
  retstr->appName._countAndFlagsBits = v13;
  retstr->appName._object = object;
  retstr->time._countAndFlagsBits = v12;
  retstr->time._object = v5;
  retstr->text = text;
  retstr->segments._rawValue = rawValue;
  retstr->placeholder._countAndFlagsBits = v11;
  retstr->placeholder._object = v7;
  retstr->actionType = actionType;
}

Swift::String __swiftcall mergeStrings(_:_:)(Swift::String_optional a1, Swift::String_optional a2)
{
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v4;
  void *v5;
  Swift::String result;
  uint64_t v7;

  if (a1.value._object)
    countAndFlagsBits = a1.value._countAndFlagsBits;
  else
    countAndFlagsBits = 0;
  if (a1.value._object)
    object = a1.value._object;
  else
    object = (void *)0xE000000000000000;
  v7 = countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_22D28B58C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22D28B58C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v7;
  v5 = object;
  result._object = v5;
  result._countAndFlagsBits = v4;
  return result;
}

uint64_t sub_22D2887EC(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_22D28B5C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_22D28B5C8();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x22E30FF38](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_22D2889A4(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_22D28B5C8();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_22D28B598();
  }
  __break(1u);
  return result;
}

uint64_t sub_22D2889A4(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_22D28B5C8();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_22D28B5C8();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_22D2893BC();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255D681D0);
            v10 = sub_22D288B38(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_22D289380();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_22D288B38(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_22D288BB8(v6, a2, a3);
  return sub_22D288B8C;
}

void sub_22D288B8C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_22D288BB8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x22E30FF2C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_22D288C24;
  }
  __break(1u);
  return result;
}

void sub_22D288C24(id *a1)
{

}

BOOL _s17LiveTranscription11AXLTCaptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _BOOL8 result;
  char v14;
  char v15;
  char v16;
  char v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  v2 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v26 = *(_QWORD *)(a1 + 64);
  v27 = *(_QWORD *)(a1 + 56);
  v23 = *(_QWORD *)(a1 + 80);
  v19 = *(unsigned __int8 *)(a1 + 96);
  v7 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_QWORD *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 88);
  v22 = *(_QWORD *)(a2 + 80);
  v20 = *(_QWORD *)(a2 + 88);
  v18 = *(unsigned __int8 *)(a2 + 96);
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
    || (v12 = sub_22D28B5D4(), result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v4 == v6 || (v14 = sub_22D28B5D4(), result = 0, (v14 & 1) != 0))
    {
      if (v3 == v9 && v5 == v8 || (v15 = sub_22D28B5D4(), result = 0, (v15 & 1) != 0))
      {
        if (v27 == v10 && v26 == v11 || (v16 = sub_22D28B5D4(), result = 0, (v16 & 1) != 0))
        {
          if ((sub_22D28827C(v25, v24) & 1) != 0)
          {
            if (v23 == v22 && v21 == v20)
              return v19 == v18;
            v17 = sub_22D28B5D4();
            result = 0;
            if ((v17 & 1) != 0)
              return v19 == v18;
            return result;
          }
          return 0;
        }
      }
    }
  }
  return result;
}

unint64_t sub_22D288E00()
{
  unint64_t result;

  result = qword_255D681C8;
  if (!qword_255D681C8)
  {
    result = MEMORY[0x22E31043C]("݉^\"d#", &type metadata for AXLTCaptionActionsType);
    atomic_store(result, (unint64_t *)&qword_255D681C8);
  }
  return result;
}

uint64_t sub_22D288E44()
{
  return MEMORY[0x24BEE1778];
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXLTCaptionActionsType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AXLTCaptionActionsType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D288F3C + 4 * byte_22D28CBA5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22D288F70 + 4 * byte_22D28CBA0[v4]))();
}

uint64_t sub_22D288F70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D288F78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D288F80);
  return result;
}

uint64_t sub_22D288F8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D288F94);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22D288F98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D288FA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D288FAC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D288FB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXLTCaptionActionsType()
{
  return &type metadata for AXLTCaptionActionsType;
}

uint64_t initializeBufferWithCopyOfBuffer for AXLTCaption(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AXLTCaption()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AXLTCaption(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AXLTCaption(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AXLTCaption(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for AXLTCaption(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 97))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXLTCaption(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 97) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AXLTCaption()
{
  return &type metadata for AXLTCaption;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E310424]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_22D289380()
{
  unint64_t result;

  result = qword_255D681D8;
  if (!qword_255D681D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D681D8);
  }
  return result;
}

unint64_t sub_22D2893BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D681E0;
  if (!qword_255D681E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D681D0);
    result = MEMORY[0x22E31043C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255D681E0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E310430](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t appIDKey.getter()
{
  return 0x4449707061;
}

uint64_t appNameKey.getter()
{
  return 0x656D614E707061;
}

uint64_t textKey.getter()
{
  return 1954047348;
}

uint64_t timeKey.getter()
{
  return 1701669236;
}

uint64_t segmentTextKey.getter()
{
  return 0x54746E656D676573;
}

unint64_t segmentConfidenceKey.getter()
{
  return 0xD000000000000011;
}

uint64_t notificationValueKey.getter()
{
  return 0x65756C6176;
}

uint64_t placeholderID.getter()
{
  return 0x6C6F686563616C70;
}

uint64_t sub_22D28950C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_22D2897C8();
  qword_255D681E8 = result;
  unk_255D681F0 = v1;
  return result;
}

uint64_t placeholderName.getter()
{
  return sub_22D28966C(&qword_255D681A0, &qword_255D681E8);
}

uint64_t sub_22D289564()
{
  uint64_t result;
  uint64_t v1;

  result = sub_22D2897C8();
  qword_255D681F8 = result;
  unk_255D68200 = v1;
  return result;
}

uint64_t placeholderMicName.getter()
{
  return sub_22D28966C(&qword_255D681A8, &qword_255D681F8);
}

uint64_t sub_22D2895BC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_22D2897C8();
  qword_255D68208 = result;
  unk_255D68210 = v1;
  return result;
}

uint64_t placeholderText.getter()
{
  return sub_22D28966C(&qword_255D681B0, &qword_255D68208);
}

uint64_t sub_22D289614()
{
  uint64_t result;
  uint64_t v1;

  result = sub_22D2897C8();
  qword_255D68218 = result;
  unk_255D68220 = v1;
  return result;
}

uint64_t placeholderPausedText.getter()
{
  return sub_22D28966C(&qword_255D681B8, &qword_255D68218);
}

uint64_t sub_22D28966C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t actionsInfoKey.getter()
{
  return 0x49736E6F69746361;
}

uint64_t actionSeparated.getter()
{
  return 0x65536E6F69746361;
}

uint64_t placeholderKey.getter()
{
  return 0x6C6F686563616C70;
}

uint64_t textLinesNumberMin.getter()
{
  return 1;
}

uint64_t textLinesNumberMax.getter()
{
  return 3;
}

uint64_t textLinesAccessibilityNumberMax.getter()
{
  return 3;
}

double textOnScreenTimeInterval.getter()
{
  return 5.0;
}

void sub_22D289740()
{
  qword_255D68228 = 0x4030000000000000;
}

double placeholderTimeInterval.getter()
{
  if (qword_255D681C0 != -1)
    swift_once();
  return *(double *)&qword_255D68228;
}

double captionTextTimeLimit.getter()
{
  return 30.0;
}

double micCaptionTextTimeLimit.getter()
{
  return 30.0;
}

double historyTimeIntervalMax.getter()
{
  return 60.0;
}

double historyTimeIntervalMaxBraille.getter()
{
  return 600.0;
}

double historyCheckTimeInterval.getter()
{
  return 10.0;
}

uint64_t sub_22D2897C8()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v0 = (void *)sub_22D28B574();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (!v1)
    return 0;
  v2 = (void *)sub_22D28B574();
  v3 = (void *)sub_22D28B574();
  v4 = (void *)sub_22D28B574();
  v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  v6 = sub_22D28B580();
  return v6;
}

ValueMetadata *type metadata accessor for AXLTUtilities()
{
  return &type metadata for AXLTUtilities;
}

void handleInputBuffer_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_22D27A000, a2, OS_LOG_TYPE_DEBUG, "HandleInputBuffer with packets: %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22D28B574()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D28B580()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D28B58C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D28B598()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D28B5A4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22D28B5B0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D28B5BC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22D28B5C8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D28B5D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D28B5E0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D28B5EC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D28B5F8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXLogLiveTranscription()
{
  return MEMORY[0x24BDFE130]();
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x24BDB68D0](inAQ, *(_QWORD *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x24BDB68D8](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x24BDB68E0](inAQ, inBuffer, *(_QWORD *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x24BDB68F8](inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x24BDB6908](inAQ, *(_QWORD *)&inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x24BDB6910](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(_QWORD *)&inFlags, outAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BDB6940](inAQ, *(_QWORD *)&inID, inData, *(_QWORD *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x24BDB6948](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x24BDB6950](inAQ, inImmediate);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

