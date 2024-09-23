uint64_t sub_100003B74()
{
  if (qword_100061248[0] != -1)
    dispatch_once(qword_100061248, &stru_100051E00);
  return byte_100061240;
}

void sub_100003BB4(id a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const void *Value;
  unsigned int v4;
  BOOL v6;
  id v7;

  v1 = (const __CFDictionary *)MGCopyAnswer(CFSTR("oPeik/9e8lQWMszEjbPzng"), 0);
  if (v1)
  {
    v2 = v1;
    Value = CFDictionaryGetValue(v1, CFSTR("ArtworkDeviceSubType"));
    v7 = (id)objc_claimAutoreleasedReturnValue(Value);
    if (v7)
    {
      v4 = objc_msgSend(v7, "intValue");
      v6 = v4 == 2556 || v4 == 2796;
      byte_100061240 = v6;
    }
    CFRelease(v2);

  }
}

uint64_t sub_100003C8C()
{
  if (qword_100061248[0] != -1)
    dispatch_once(qword_100061248, &stru_100051E00);
  if (byte_100061240)
    return 1;
  else
    return SBSIsSystemApertureAvailable();
}

uint64_t sub_100003CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (_QWORD *)(a2
                + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  v5 = *(_QWORD *)(a2
                 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  v6 = *(_QWORD *)(a2
                 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler
                 + 8);
  *v4 = &j___s20PreviewsFoundationOS7PromiseC7succeed4withyx_tF;
  v4[1] = a1;
  swift_retain(a1);
  sub_100006728(v5, v6);
  return static ProcessUtilities.kill(processHandle:)(a3);
}

id sub_100003D80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  Class isa;
  uint64_t v28;
  _QWORD *v29;
  Class v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void (*v52)(char *, uint64_t);
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;
  uint64_t v62;
  char *v63;
  id v64;
  NSURL *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  void (*v82)(char *, uint64_t);
  NSURL *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  void (*v100)(char *, uint64_t);
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void (*v108)(char *, uint64_t);
  void (*v109)(char *, _QWORD, uint64_t);
  id v110;
  char *v111;
  char *v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127[2];

  v119 = a2;
  v2 = type metadata accessor for Logger(0);
  v115 = *(_QWORD *)(v2 - 8);
  v116 = v2;
  v3 = __chkstk_darwin(v2);
  v114 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v113 = (char *)&v109 - v5;
  v120 = type metadata accessor for URL.DirectoryHint(0);
  v118 = *(_QWORD *)(v120 - 8);
  __chkstk_darwin(v120);
  v7 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = type metadata accessor for URL(0);
  v121 = *(_QWORD *)(v117 - 8);
  v8 = __chkstk_darwin(v117);
  v112 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v111 = (char *)&v109 - v11;
  v12 = __chkstk_darwin(v10);
  v122 = (char *)&v109 - v13;
  v14 = __chkstk_darwin(v12);
  v123 = (char *)&v109 - v15;
  __chkstk_darwin(v14);
  v124 = (char *)&v109 - v16;
  v17 = type metadata accessor for BinaryType(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v109 - v22;
  v24 = objc_msgSend(objc_allocWithZone((Class)FBMutableProcessExecutionContext), "init");
  v25 = PreviewAgentLaunchConfiguration.environment.getter(objc_msgSend(v24, "setLaunchIntent:", 4));
  v26 = sub_10000481C(v25);
  swift_bridgeObjectRelease(v25);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  objc_msgSend(v24, "setEnvironment:", isa);

  v28 = PreviewAgentLaunchConfiguration.arguments.getter();
  v29 = sub_100004BD8(v28);
  swift_bridgeObjectRelease(v28);
  v30 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v29);
  objc_msgSend(v24, "setArguments:", v30);

  v31 = ((uint64_t (*)(void))PreviewAgentLaunchConfiguration.binaryType.getter)();
  v32 = BinaryType.cpuType.getter(v31);
  v33 = *(uint64_t (**)(char *, uint64_t))(v18 + 8);
  v34 = v33(v23, v17);
  v35 = PreviewAgentLaunchConfiguration.binaryType.getter(v34);
  v36 = BinaryType.cpuSubtype.getter(v35);
  v33(v21, v17);
  v37 = objc_msgSend((id)objc_opt_self(FBProcessExecutableSlice), "sliceWithType:subtype:", v32, v36);
  objc_msgSend(v24, "setOverrideExecutableSlice:", v37);

  v39 = PreviewAgentLaunchConfiguration.environment.getter(v38);
  if (*(_QWORD *)(v39 + 16) && (v40 = sub_100007C5C(0xD000000000000037, 0x8000000100045BB0), (v41 & 1) != 0))
  {
    v42 = (uint64_t *)(*(_QWORD *)(v39 + 56) + 16 * v40);
    v44 = *v42;
    v43 = v42[1];
    swift_bridgeObjectRetain(v43);
    swift_bridgeObjectRelease(v39);
    if (v43)
    {
      if (v44 == 49 && v43 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease(0xE100000000000000);
      }
      else
      {
        v46 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v43, 49, 0xE100000000000000, 0);
        swift_bridgeObjectRelease(v43);
        if ((v46 & 1) == 0)
          return v24;
      }
      v110 = (id)objc_opt_self(NSFileManager);
      v47 = objc_msgSend(v110, "defaultManager");
      v48 = objc_msgSend(v47, "temporaryDirectory");

      static URL._unconditionallyBridgeFromObjectiveC(_:)(v48);
      strcpy((char *)v127, "agent-stderr");
      BYTE5(v127[1]) = 0;
      HIWORD(v127[1]) = -5120;
      v49 = v118;
      v109 = *(void (**)(char *, _QWORD, uint64_t))(v118 + 104);
      v50 = v120;
      v109(v7, enum case for URL.DirectoryHint.isDirectory(_:), v120);
      v51 = sub_100006A74();
      URL.appending<A>(component:directoryHint:)(v127, v7, &type metadata for String, v51);
      v52 = *(void (**)(char *, uint64_t))(v49 + 8);
      v52(v7, v50);
      swift_bridgeObjectRelease(v127[1]);
      v53 = objc_msgSend(objc_allocWithZone((Class)NSDate), "init");
      v54 = objc_msgSend(v53, "description");

      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
      v57 = v56;

      v127[0] = AgentDescriptor.Bundle.bundleID.getter();
      v127[1] = v58;
      v59._countAndFlagsBits = 45;
      v59._object = (void *)0xE100000000000000;
      String.append(_:)(v59);
      v60._countAndFlagsBits = v55;
      v60._object = v57;
      String.append(_:)(v60);
      swift_bridgeObjectRelease(v57);
      v61._countAndFlagsBits = 1954051118;
      v61._object = (void *)0xE400000000000000;
      String.append(_:)(v61);
      v62 = v127[1];
      v109(v7, enum case for URL.DirectoryHint.notDirectory(_:), v50);
      v63 = v122;
      URL.appending<A>(component:directoryHint:)(v127, v7, &type metadata for String, v51);
      v52(v7, v50);
      swift_bridgeObjectRelease(v62);
      v64 = objc_msgSend(v110, "defaultManager");
      URL._bridgeToObjectiveC()(v65);
      v67 = v66;
      v127[0] = 0;
      LODWORD(v52) = objc_msgSend(v64, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v66, 1, 0, v127);

      v68 = v127[0];
      if ((_DWORD)v52)
      {
        v69 = (id)v127[0];
        v70 = v113;
        static Logger.previews.getter(v69);
        v71 = v121;
        v72 = v111;
        v73 = v117;
        v74 = (*(uint64_t (**)(char *, char *, uint64_t))(v121 + 16))(v111, v63, v117);
        v75 = Logger.logObject.getter(v74);
        v76 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v75, v76))
        {
          v77 = (uint8_t *)swift_slowAlloc(12, -1);
          v78 = swift_slowAlloc(32, -1);
          v127[0] = v78;
          *(_DWORD *)v77 = 136446210;
          v120 = (uint64_t)(v77 + 4);
          v79 = URL.path.getter();
          v81 = v80;
          v125 = sub_100010F78(v79, v80, v127);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v120);
          swift_bridgeObjectRelease(v81);
          v82 = *(void (**)(char *, uint64_t))(v121 + 8);
          v82(v72, v73);
          _os_log_impl((void *)&_mh_execute_header, v75, v76, "ApplicationLauncher: Redirecting stderr to %{public}s", v77, 0xCu);
          swift_arrayDestroy(v78, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v78, -1, -1);
          swift_slowDealloc(v77, -1, -1);

          (*(void (**)(char *, uint64_t))(v115 + 8))(v113, v116);
        }
        else
        {
          v82 = *(void (**)(char *, uint64_t))(v71 + 8);
          v82(v72, v73);

          (*(void (**)(char *, uint64_t))(v115 + 8))(v70, v116);
        }
        URL._bridgeToObjectiveC()(v83);
        v107 = v106;
        objc_msgSend(v24, "setStandardErrorURL:", v106);

        v82(v63, v73);
        v82(v123, v73);
        v82(v124, v73);
      }
      else
      {
        v84 = (id)v127[0];
        v85 = _convertNSErrorToError(_:)(v68);

        v86 = swift_willThrow();
        v87 = v114;
        static Logger.previews.getter(v86);
        v88 = v121;
        v89 = v112;
        v90 = v63;
        v91 = v63;
        v92 = v117;
        (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v112, v90, v117);
        swift_errorRetain(v85);
        v93 = swift_errorRetain(v85);
        v94 = Logger.logObject.getter(v93);
        v95 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v94, v95))
        {
          v96 = swift_slowAlloc(22, -1);
          v120 = swift_slowAlloc(64, -1);
          v127[0] = v120;
          *(_DWORD *)v96 = 136446466;
          v97 = URL.path.getter();
          v99 = v98;
          v125 = sub_100010F78(v97, v98, v127);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v96 + 4);
          swift_bridgeObjectRelease(v99);
          v100 = *(void (**)(char *, uint64_t))(v88 + 8);
          v100(v89, v92);
          *(_WORD *)(v96 + 12) = 2080;
          v125 = v85;
          swift_errorRetain(v85);
          v101 = sub_100006658(&qword_10005EFF0);
          v102 = String.init<A>(describing:)(&v125, v101);
          v104 = v103;
          v125 = sub_100010F78(v102, v103, v127);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v96 + 14);
          swift_bridgeObjectRelease(v104);
          swift_errorRelease(v85);
          swift_errorRelease(v85);
          _os_log_impl((void *)&_mh_execute_header, v94, v95, "ApplicationLauncher: Could not redirect stderr to %{public}s: %s", (uint8_t *)v96, 0x16u);
          v105 = v120;
          swift_arrayDestroy(v120, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v105, -1, -1);
          swift_slowDealloc(v96, -1, -1);

          swift_errorRelease(v85);
          (*(void (**)(char *, uint64_t))(v115 + 8))(v114, v116);
          v100(v122, v92);
          v100(v123, v92);
          v100(v124, v92);
        }
        else
        {

          swift_errorRelease(v85);
          swift_errorRelease(v85);
          v108 = *(void (**)(char *, uint64_t))(v88 + 8);
          v108(v89, v92);
          swift_errorRelease(v85);
          (*(void (**)(char *, uint64_t))(v115 + 8))(v87, v116);
          v108(v91, v92);
          v108(v123, v92);
          v108(v124, v92);
        }
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease(v39);
  }
  return v24;
}

uint64_t sub_10000481C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];
  _OWORD v42[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100006658(&qword_10005EFF8);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v32 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v31)
      goto LABEL_37;
    v15 = *(_QWORD *)(v32 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v31)
        goto LABEL_37;
      v15 = *(_QWORD *)(v32 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v31)
          goto LABEL_37;
        v15 = *(_QWORD *)(v32 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v31)
            goto LABEL_37;
          v15 = *(_QWORD *)(v32 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = 16 * v13;
    v19 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = v19[1];
    v21 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v18);
    v23 = *v21;
    v22 = v21[1];
    *(_QWORD *)&v42[0] = *v19;
    *((_QWORD *)&v42[0] + 1) = v20;
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v22);
    swift_dynamicCast(&v34, v42, &type metadata for String, &type metadata for AnyHashable, 7);
    v33[0] = v23;
    v33[1] = v22;
    swift_dynamicCast(v37, v33, &type metadata for String, (char *)&type metadata for Any + 8, 7);
    v38 = v34;
    v39 = v35;
    v40 = v36;
    sub_100006AB8(v37, v41);
    v34 = v38;
    v35 = v39;
    v36 = v40;
    sub_100006AB8(v41, v42);
    sub_100006AB8(v42, &v38);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v24 = -1 << *((_BYTE *)v3 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)])) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)&v7[8 * v26];
      }
      while (v30 == -1);
      v10 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v34;
    *(_OWORD *)(v11 + 16) = v35;
    *(_QWORD *)(v11 + 32) = v36;
    result = (uint64_t)sub_100006AB8(&v38, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v31)
  {
LABEL_37:
    swift_release(v3);
    sub_100006AC8(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v32 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v31)
      goto LABEL_37;
    v15 = *(_QWORD *)(v32 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

_QWORD *sub_100004BD8(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];
  _OWORD v10[2];
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    v11 = &_swiftEmptyArrayStorage;
    sub_100019A40(0, v1, 0);
    v2 = &_swiftEmptyArrayStorage;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain(v5);
      swift_dynamicCast(v10, v9, &type metadata for String, (char *)&type metadata for Any + 8, 7);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_100019A40(0, v2[2] + 1, 1);
        v2 = v11;
      }
      v7 = v2[2];
      v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_100019A40(v6 > 1, v7 + 1, 1);
        v2 = v11;
      }
      v4 += 2;
      v2[2] = v7 + 1;
      sub_100006AB8(v10, &v2[4 * v7 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_100004CFC(char *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t (*v36)(void);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  id v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t aBlock[5];
  uint64_t v46;

  v37 = a3;
  v41 = a1;
  v5 = type metadata accessor for Logger(0);
  v42 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AgentDescriptor.Bundle(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = __chkstk_darwin(v8);
  v38 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v35 - v12;
  v14 = swift_allocObject(&unk_100052190, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, a2);
  v36 = *(uint64_t (**)(void))(v9 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v36)(v13, a3, v8);
  v15 = *(unsigned __int8 *)(v9 + 80);
  v16 = (v15 + 16) & ~v15;
  v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_1000521B8, v18 + 8, v15 | 7);
  v39 = v9;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v19 + v16, v13, v8);
  *(_QWORD *)(v19 + v17) = v14;
  v20 = v41;
  *(_QWORD *)(v19 + v18) = v41;
  aBlock[4] = (uint64_t)sub_100006A18;
  v46 = v19;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10001F978;
  aBlock[3] = (uint64_t)&unk_1000521D0;
  v21 = _Block_copy(aBlock);
  v22 = v46;
  swift_retain(v20);
  swift_release(v22);
  v40 = a2;
  objc_msgSend(a2, "setCompletionBlock:", v21);
  _Block_release(v21);
  static Logger.uv.getter(v23);
  v24 = v38;
  v25 = v36();
  v41 = v7;
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc(12, -1);
    v29 = swift_slowAlloc(32, -1);
    aBlock[0] = v29;
    *(_DWORD *)v28 = 136315138;
    v30 = sub_100006618(&qword_10005EFD8, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
    v31 = dispatch thunk of CustomStringConvertible.description.getter(v8, v30);
    v33 = v32;
    v44 = sub_100010F78(v31, v32, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, aBlock, v28 + 4);
    swift_bridgeObjectRelease(v33);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v24, v8);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "will begin launch transaction for %s", v28, 0xCu);
    swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v24, v8);
  }

  (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  return objc_msgSend(v40, "begin");
}

void sub_100005078(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  char v29;
  uint64_t v30;
  char v31;
  char *v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *Strong;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _DWORD *v52;
  _DWORD *v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;

  v57 = a1;
  v7 = type metadata accessor for AgentDescriptor.Bundle(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  *(_QWORD *)&v60 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)v54 - v11;
  v13 = type metadata accessor for Logger(0);
  v55 = *(_QWORD *)(v13 - 8);
  v56 = v13;
  v14 = __chkstk_darwin(v13);
  v16 = (char *)v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = a3 + 16;
  static Logger.uv.getter(v14);
  *(_QWORD *)&v59 = *(_QWORD *)(v8 + 16);
  v17 = ((uint64_t (*)(char *, uint64_t, uint64_t))v59)(v12, a2, v7);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(18, -1);
    v54[1] = a4;
    v21 = v20;
    v22 = swift_slowAlloc(32, -1);
    v54[0] = a2;
    v23 = v22;
    *(_QWORD *)&v61 = v22;
    *(_DWORD *)v21 = 136315394;
    v24 = sub_100006618(&qword_10005EFD8, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
    v25 = dispatch thunk of CustomStringConvertible.description.getter(v7, v24);
    v27 = v26;
    v63 = sub_100010F78(v25, v26, (uint64_t *)&v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v21 + 4);
    swift_bridgeObjectRelease(v27);
    v28 = *(void (**)(char *, uint64_t))(v8 + 8);
    v28(v12, v7);
    *(_WORD *)(v21 + 12) = 1024;
    v29 = v57;
    LODWORD(v63) = v57 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, (char *)&v63 + 4, v21 + 14);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "launch transaction completed for %s with success = %{BOOL}d", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    v30 = v23;
    a2 = v54[0];
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v56);
    v31 = v29;
  }
  else
  {
    v28 = *(void (**)(char *, uint64_t))(v8 + 8);
    v28(v12, v7);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v56);
    v31 = v57;
  }
  v32 = (char *)v60;
  v34 = v58;
  v33 = (void (*)(uint64_t, uint64_t, uint64_t))v59;
  if ((v31 & 1) == 0
    || (swift_beginAccess(v58, &v63, 0, 0), (v35 = (void *)swift_unknownObjectWeakLoadStrong(v34)) == 0)
    || (v36 = v35, v37 = objc_msgSend(v35, "process"), v36, !v37))
  {
    swift_beginAccess(v34, &v61, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v34);
    if (Strong)
    {
      v42 = Strong;
      v43 = objc_msgSend(Strong, "error");

      v33((uint64_t)v32, a2, v7);
      if (v43)
      {
LABEL_15:
        v28(v32, v7);
        Promise.fail(with:)(v43);
        v48 = (uint64_t)v43;
        goto LABEL_16;
      }
    }
    else
    {
      v33((uint64_t)v32, a2, v7);
    }
    v44 = type metadata accessor for ProcessError(0);
    v45 = sub_100006618(&qword_10005EFE0, (uint64_t (*)(uint64_t))&type metadata accessor for ProcessError, (uint64_t)&protocol conformance descriptor for ProcessError);
    v43 = (id)swift_allocError(v44, v45, 0, 0);
    v47 = v46;
    v33(v46, (uint64_t)v32, v7);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v47, enum case for ProcessError.noLaunchedProcess(_:), v44);
    goto LABEL_15;
  }
  v38 = objc_msgSend(v37, "handle");
  if (v38)
  {
    v39 = v38;
    v40 = objc_msgSend(v38, "auditToken");

    if (v40)
    {
      objc_msgSend(v40, "realToken");
      v59 = v62;
      v60 = v61;

      v61 = v60;
      v62 = v59;
      Promise.succeed(with:)(&v61);

      return;
    }
  }
  v49 = type metadata accessor for ProcessError(0);
  v50 = sub_100006618(&qword_10005EFE0, (uint64_t (*)(uint64_t))&type metadata accessor for ProcessError, (uint64_t)&protocol conformance descriptor for ProcessError);
  v51 = swift_allocError(v49, v50, 0, 0);
  v53 = v52;
  *v52 = objc_msgSend(v37, "pid");
  (*(void (**)(_DWORD *, _QWORD, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v53, enum case for ProcessError.noAuditTokenForPid(_:), v49);
  Promise.fail(with:)(v51);

  v48 = v51;
LABEL_16:
  swift_errorRelease(v48);
}

uint64_t sub_100005588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch(sub_1000055A0, 0, 0);
}

uint64_t sub_1000055A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD **)(v0 + 16);
  AgentDescriptor.Bundle.bundleID.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityForEmbeddedApplicationIdentifier:", v4);

  swift_bridgeObjectRelease(v3);
  *v1 = v5;
  v6 = enum case for PreviewAgentJITBootstrapMethod.runningBoardIdentity(_:);
  v7 = type metadata accessor for PreviewAgentJITBootstrapMethod(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v1, v6, v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000564C(uint64_t result)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(result
                                      + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  if (v1)
  {
    v2 = *(_QWORD *)(result
                   + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler
                   + 8);
    v3 = swift_retain(v2);
    v1(v3);
    return sub_100006728((uint64_t)v1, v2);
  }
  return result;
}

id sub_100005714()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProcessExitObserver()
{
  return objc_opt_self(_TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EE78, (uint64_t)&unk_100051F88);
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EE80, (uint64_t)&unk_100051FB8);
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EE88, (uint64_t)&unk_100051FD8);
}

void type metadata accessor for UISDeviceIdiom(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EE90, (uint64_t)&unk_100051FF8);
}

void type metadata accessor for BSDeviceHomeButtonType(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EE98, (uint64_t)&unk_100052018);
}

void type metadata accessor for BSDeviceClass(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EEA0, (uint64_t)&unk_100052038);
}

id sub_10000581C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = (void *)v1(v3);
  swift_release(v2);
  return v4;
}

BOOL sub_100005854(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_100005868@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005878(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100005884(uint64_t a1, uint64_t a2)
{
  return sub_10000594C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005890(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000058D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100005940(uint64_t a1, uint64_t a2)
{
  return sub_10000594C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000594C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100005988(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1000059FC(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100005A78@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

Swift::Int sub_100005AB8()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100005AFC()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100005B24(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

_QWORD *sub_100005B64@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_100005B70@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_100005B80(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100005B8C()
{
  return sub_100006618(&qword_10005EEA8, (uint64_t (*)(uint64_t))type metadata accessor for UIInterfaceOrientation, (uint64_t)&unk_10003FC24);
}

uint64_t sub_100005BB8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

BOOL sub_100005C40(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_100005C54@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_100005C68(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

BOOL sub_100005C7C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_100005C90(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

uint64_t sub_100005CA4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100005CE8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005D10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006618((unint64_t *)&unk_1000608A0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003FE38);
  v3 = sub_100006618((unint64_t *)&unk_10005EFC0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003FD8C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005D94()
{
  uint64_t v0;
  uint64_t v1;
  NSString v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  char *v13;
  char *v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  void *v26;
  objc_super v27;
  id v28;

  AgentDescriptor.Bundle.bundleID.getter();
  v1 = v0;
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityForEmbeddedApplicationIdentifier:", v2);

  v4 = objc_msgSend((id)objc_opt_self(RBSProcessPredicate), "predicateMatchingIdentity:", v3);
  v5 = (void *)objc_opt_self(RBSProcessHandle);
  v28 = 0;
  v6 = v4;
  v7 = objc_msgSend(v5, "handleForPredicate:error:", v6, &v28);
  v8 = v28;
  if (!v7)
  {
    v21 = v28;
    v22 = _convertNSErrorToError(_:)(v8);

    swift_willThrow();
    swift_errorRelease(v22);
    swift_bridgeObjectRelease(v1);
LABEL_6:
    sub_100006658(&qword_10005F000);
    LOBYTE(v25) = 2;
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ApplicationLauncher.swift", 115, 2, 19, 30, "killAgent(identifier:pid:)", 26, (_DWORD)v25);
  }
  v9 = v7;
  v10 = v28;

  v11 = (void *)RBSProcessHandle.applicationProcess.getter();
  swift_bridgeObjectRelease(v1);
  if (!v11)
  {

    goto LABEL_6;
  }
  v12 = (objc_class *)type metadata accessor for ProcessExitObserver();
  v13 = (char *)objc_allocWithZone(v12);
  v14 = &v13[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process] = v11;
  v27.receiver = v13;
  v27.super_class = v12;
  v15 = v11;
  v16 = (char *)objc_msgSendSuper2(&v27, "init");
  objc_msgSend(*(id *)&v16[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process], "addObserver:", v16);
  v17 = sub_100006658(&qword_10005F000);
  __chkstk_darwin(v17);
  v25 = v16;
  v26 = v9;
  v18 = Future.__allocating_init(dsoHandle:file:line:column:function:callback:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ApplicationLauncher.swift", 115, 2, 24, 35, "killAgent(identifier:pid:)", 26, 2, sub_100006AD0, &v24);
  v19 = swift_allocObject(&unk_100052208, 24, 7);
  *(_QWORD *)(v19 + 16) = v16;
  v20 = v16;
  Future.observeFinish(_:)(sub_100006AD8, v19);

  swift_release(v19);
  return v18;
}

uint64_t sub_10000609C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  char *v39;
  char v40[16];
  id v41;
  char *v42;
  _QWORD aBlock[5];
  uint64_t v44;

  v2 = type metadata accessor for PreviewAgentLaunchConfiguration(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AgentDescriptor.Bundle(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = __chkstk_darwin(v6);
  v10 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v38 - v12;
  v39 = (char *)&v38 - v12;
  PreviewAgentLaunchConfiguration.agentBundle.getter(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v14 = v13;
  v15 = v6;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v14, v6);
  v16 = *(unsigned __int8 *)(v3 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = (v4 + v18 + v17) & ~v18;
  v20 = swift_allocObject(&unk_100052118, v19 + v8, v16 | v18 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v20 + v17, v5, v2);
  v21 = v20 + v19;
  v22 = v15;
  v23 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v21, v10, v15);
  v24 = v39;
  AgentDescriptor.Bundle.bundleID.getter(v23);
  v26 = v25;
  v27 = String._bridgeToObjectiveC()();
  v28 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityForEmbeddedApplicationIdentifier:", v27);
  swift_bridgeObjectRelease(v26);

  v29 = objc_allocWithZone((Class)FBApplicationProcessLaunchTransaction);
  aBlock[4] = sub_1000068A8;
  v44 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000581C;
  aBlock[3] = &unk_100052130;
  v30 = _Block_copy(aBlock);
  v31 = v44;
  swift_retain(v20);
  swift_release(v31);
  v32 = objc_msgSend(v29, "initWithProcessIdentity:executionContextProvider:", v28, v30);

  _Block_release(v30);
  sub_100006658(&qword_10005EFD0);
  v41 = v32;
  v42 = v24;
  v33 = v24;
  v34 = Future.__allocating_init(dsoHandle:file:line:column:function:callback:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ApplicationLauncher.swift", 115, 2, 98, 44, "launchAgent(with:)", 18, 2, sub_100006908, v40);
  v35 = swift_allocObject(&unk_100052168, 24, 7);
  *(_QWORD *)(v35 + 16) = v32;
  v36 = v32;
  Future.observeCancelation(_:)(sub_100006910, v35);
  swift_release(v35);

  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v33, v22);
  return v34;
}

uint64_t sub_1000063AC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006598();
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_100052060, 24, 7);
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_1000065F8;
  v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001F9B4;
  aBlock[3] = &unk_100052078;
  v11 = _Block_copy(aBlock);
  v12 = v22;
  v13 = v1;
  v14 = swift_release(v12);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v15 = sub_100006618(&qword_10005EF78, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_100006658(&qword_10005EF80);
  v17 = sub_100006698();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_100006598()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005EF70;
  if (!qword_10005EF70)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005EF70);
  }
  return result;
}

uint64_t sub_1000065D4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000065F8()
{
  uint64_t v0;

  return sub_10000564C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100006600(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006610(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100006618(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006658(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006698()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005EF88;
  if (!qword_10005EF88)
  {
    v1 = sub_1000066E4(&qword_10005EF80);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005EF88);
  }
  return result;
}

uint64_t sub_1000066E4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006728(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EF90, (uint64_t)&unk_1000520B0);
}

void type metadata accessor for UIUserInterfaceIdiom(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005EF98, (uint64_t)&unk_1000520D8);
}

uint64_t sub_100006760()
{
  return sub_100006618(&qword_10005EFA0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003FD50);
}

uint64_t sub_10000678C()
{
  return sub_100006618(&qword_10005EFA8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003FD24);
}

uint64_t sub_1000067B8()
{
  return sub_100006618((unint64_t *)&unk_10005EFB0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003FDC0);
}

ValueMetadata *type metadata accessor for ApplicationLauncher()
{
  return &type metadata for ApplicationLauncher;
}

uint64_t sub_1000067F4()
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
  uint64_t v11;

  v1 = type metadata accessor for PreviewAgentLaunchConfiguration(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for AgentDescriptor.Bundle(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

id sub_1000068A8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for PreviewAgentLaunchConfiguration(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AgentDescriptor.Bundle(0) - 8) + 80);
  return sub_100003D80(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

id sub_100006908(char *a1)
{
  uint64_t v1;

  return sub_100004CFC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_100006910()
{
  uint64_t v0;
  void *v1;
  NSString v2;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "failWithReason:", v2);

}

uint64_t sub_100006968()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000698C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for AgentDescriptor.Bundle(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));
  swift_release(*(_QWORD *)(v0 + v7));
  return swift_deallocObject(v0, v7 + 8, v5);
}

void sub_100006A18(int a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(type metadata accessor for AgentDescriptor.Bundle(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_100005078(a1, v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_100006A74()
{
  unint64_t result;

  result = qword_10005EFE8;
  if (!qword_10005EFE8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10005EFE8);
  }
  return result;
}

_OWORD *sub_100006AB8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006AC8(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100006AD0(uint64_t a1)
{
  uint64_t v1;

  return sub_100003CF4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

id sub_100006AD8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (_QWORD *)(v1
                + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  v3 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);
  v4 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler
                 + 8);
  *v2 = 0;
  v2[1] = 0;
  sub_100006728(v3, v4);
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process), "removeObserver:", v1);
}

uint64_t initializeBufferWithCopyOfBuffer for LocalSceneHost.Client(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100006B5C(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006B68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100006B88(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
  sub_100006BC8(a1, &qword_10005F008, (uint64_t)&unk_100052288);
}

void sub_100006BC8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

double sub_100006C30(uint64_t a1, uint64_t a2)
{
  id v2;
  double v3;
  double v4;

  v2 = sub_100006C78(a1, a2);
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

id sub_100006C78(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  v4 = v3;

  v5 = objc_msgSend(v4, "displayConfiguration");
  return v5;
}

id sub_100006CC4()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(id *)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(id *)v0;
  v4 = v2;
  return v1;
}

uint64_t sub_100006D00()
{
  void **v0;

  return sub_1000070D8(*v0);
}

uint64_t BSDeviceClass.description.getter(int a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t result;
  Swift::String v5;
  void *object;
  _QWORD v7[6];

  v3 = a1 + 1;
  result = 30324;
  switch(v3)
  {
    case 0:
      result = 0x6E776F6E6B6E75;
      break;
    case 1:
      result = 0x656E6F6870;
      break;
    case 2:
      result = 6582128;
      break;
    case 3:
      result = 6578544;
      break;
    case 4:
      return result;
    case 5:
      result = 0x6863746177;
      break;
    default:
      v7[4] = v1;
      v7[5] = v2;
      strcpy((char *)v7, "unrecognized:");
      HIWORD(v7[1]) = -4864;
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
      object = v5._object;
      String.append(_:)(v5);
      swift_bridgeObjectRelease(object);
      result = v7[0];
      break;
  }
  return result;
}

uint64_t sub_100006E10()
{
  int *v0;

  return BSDeviceClass.description.getter(*v0);
}

uint64_t BSDeviceHomeButtonType.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  Swift::String v5;
  void *object;
  _QWORD v7[6];

  v3 = a1 + 1;
  result = 0x6E776F6E6B6E75;
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      result = 0x79636167656CLL;
      break;
    case 2:
      result = 1112036179;
      break;
    case 3:
      result = 1701736302;
      break;
    default:
      v7[4] = v1;
      v7[5] = v2;
      strcpy((char *)v7, "unrecognized:");
      HIWORD(v7[1]) = -4864;
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      object = v5._object;
      String.append(_:)(v5);
      swift_bridgeObjectRelease(object);
      result = v7[0];
      break;
  }
  return result;
}

uint64_t sub_100006EFC()
{
  uint64_t *v0;

  return BSDeviceHomeButtonType.description.getter(*v0);
}

uint64_t UISDeviceIdiom.description.getter(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  Swift::String v4;
  void *object;
  uint64_t v6;

  result = 6513005;
  switch(a1)
  {
    case 0:
      result = 0x6669636570736E75;
      break;
    case 1:
      result = 0x656E6F6870;
      break;
    case 2:
      result = 6578544;
      break;
    case 3:
      result = 30324;
      break;
    case 4:
      result = 0x79616C50726163;
      break;
    case 5:
      result = 0x6863746177;
      break;
    case 6:
      return result;
    case 7:
      result = 0x6E6F69736976;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      v3 = 0x656E696665646E75;
      goto LABEL_3;
    default:
      v3 = 0x6E676F6365726E75;
LABEL_3:
      v6 = v3;
      v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      object = v4._object;
      String.append(_:)(v4);
      swift_bridgeObjectRelease(object);
      result = v6;
      break;
  }
  return result;
}

uint64_t sub_100007054()
{
  uint64_t *v0;

  return UISDeviceIdiom.description.getter(*v0);
}

__n128 initializeWithTake for DisplayCapabilities(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for DisplayCapabilities()
{
  return &type metadata for DisplayCapabilities;
}

uint64_t sub_10000708C(void *a1)
{
  char *v1;

  v1 = (char *)objc_msgSend(a1, "deviceInfoIntegerValueForKey:", UISDeviceContextDeviceIdiomKey);
  if ((unint64_t)(v1 - 1) > 6)
    return -1;
  else
    return qword_100040010[(_QWORD)(v1 - 1)];
}

uint64_t sub_1000070D8(void *a1)
{
  Swift::String v2;
  uint64_t result;
  Swift::String v4;
  void *object;
  Swift::String v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[0] = 0;
  v15[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(51);
  v2._countAndFlagsBits = 0x3D656369766544;
  v2._object = (void *)0xE700000000000000;
  String.append(_:)(v2);
  result = (uint64_t)objc_msgSend(a1, "deviceInfoIntegerValueForKey:", UISDeviceContextDeviceClassKey);
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    v4._countAndFlagsBits = BSDeviceClass.description.getter(result);
    object = v4._object;
    String.append(_:)(v4);
    swift_bridgeObjectRelease(object);
    v6._countAndFlagsBits = 0x3D6D6F696449202CLL;
    v6._object = (void *)0xE800000000000000;
    String.append(_:)(v6);
    v14 = sub_10000708C(a1);
    type metadata accessor for UIUserInterfaceIdiom(0);
    _print_unlocked<A, B>(_:_:)(&v14, v15, v7, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v8._countAndFlagsBits = 0x7542656D6F48202CLL;
    v8._object = (void *)0xED00003D6E6F7474;
    String.append(_:)(v8);
    v9._countAndFlagsBits = BSDeviceHomeButtonType.description.getter((uint64_t)objc_msgSend(a1, "deviceInfoIntegerValueForKey:", UISDeviceContextHomeButtonTypeKey));
    v10 = v9._object;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(v10);
    v11._countAndFlagsBits = 0x72656E726F43202CLL;
    v11._object = (void *)0xEF3D737569646152;
    String.append(_:)(v11);
    v12._countAndFlagsBits = Double.description.getter(objc_msgSend(a1, "deviceInfoFloatValueForKey:", UISDeviceContextDeviceCornerRadiusKey));
    v13 = v12._object;
    String.append(_:)(v12);
    swift_bridgeObjectRelease(v13);
    return v15[0];
  }
  __break(1u);
  return result;
}

void sub_100007298()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)objc_opt_self(UISDeviceContext);
  if (!objc_msgSend(v0, "uv_loadedInitialContext"))
    objc_msgSend(v0, "defaultContext");
  if (objc_msgSend((id)objc_opt_self(UISDisplayContext), "uv_loadedInitialContext"))
    goto LABEL_6;
  v1 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  v2 = objc_msgSend(v1, "displayConfiguration");

  if (v2)
  {
    objc_msgSend(objc_allocWithZone((Class)UISDisplayContext), "initWithDisplayConfiguration:", v2);

LABEL_6:
    sub_100003C8C();
    return;
  }
  __break(1u);
}

uint64_t initializeBufferWithCopyOfBuffer for MainDisplay(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for MainDisplay(id *a1)
{

}

uint64_t _s12PreviewShell19DisplayCapabilitiesVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for MainDisplay(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t _s12PreviewShell19DisplayCapabilitiesVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1000074E4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MainDisplay()
{
  return &type metadata for MainDisplay;
}

uint64_t sub_100007540()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t updated;
  uint64_t v49;
  _BYTE v50[24];

  v1 = v0;
  v47 = type metadata accessor for ShellToHostMessage(0);
  __chkstk_darwin(v47);
  v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Unreachable(0);
  v46 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateSeed(0);
  v7 = *(_QWORD *)(updated - 8);
  v8 = __chkstk_darwin(updated);
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v45 - v12;
  SceneUpdateHandshake.updateSeed.getter(v11);
  v14 = v0 + 24;
  swift_beginAccess(v0 + 24, v50, 32, 0);
  v15 = *(_QWORD *)(v0 + 24);
  if (*(_QWORD *)(v15 + 16) && (v16 = sub_100007CC0((uint64_t)v13), (v17 & 1) != 0))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
    swift_endAccess(v50);
    swift_retain(v18);
    Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000033, 0x8000000100045CE0, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostPreferenceResolver.swift", 118, 2, 31, 36, "resolveHandshake(_:)", 20, 2);
    v19 = sub_100006618((unint64_t *)&qword_10005F130, (uint64_t (*)(uint64_t))&type metadata accessor for Unreachable, (uint64_t)&protocol conformance descriptor for Unreachable);
    v20 = swift_allocError(v4, v19, 0, 0);
    v47 = v7;
    v21 = v46;
    v22 = *(void (**)(uint64_t, char *, uint64_t))(v46 + 16);
    v22(v23, v6, v4);
    Promise.fail(with:)(v20);
    swift_errorRelease(v20);
    swift_beginAccess(v14, v50, 33, 0);
    v24 = sub_1000082D4((uint64_t)v13);
    swift_endAccess(v50);
    swift_release(v24);
    sub_100006658(&qword_10005F120);
    v25 = swift_allocError(v4, v19, 0, 0);
    v22(v26, v6, v4);
    LOBYTE(v44) = 2;
    v27 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostPreferenceResolver.swift", 118, 2, 34, 27, "resolveHandshake(_:)", 20, v44, v25);
    swift_release(v18);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v13, updated);
    swift_errorRelease(v25);
  }
  else
  {
    swift_endAccess(v50);
    sub_100006658(&qword_10005F120);
    v46 = static Future.create(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostPreferenceResolver.swift", 118, 2, 37, 65, "resolveHandshake(_:)", 20, 2);
    v29 = v28;
    v30 = v7;
    v31 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v32 = updated;
    v31(v10, v13, updated);
    swift_beginAccess(v1 + 24, v50, 33, 0);
    swift_retain(v29);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v1 + 24));
    v49 = *(_QWORD *)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0x8000000000000000;
    v45 = v29;
    sub_10000A770(v29, (uint64_t)v10, isUniquelyReferenced_nonNull_native);
    v34 = *(_QWORD *)(v1 + 24);
    *(_QWORD *)(v1 + 24) = v49;
    swift_bridgeObjectRelease(v34);
    v35 = *(void (**)(char *, uint64_t))(v30 + 8);
    v35(v10, v32);
    swift_endAccess(v50);
    v36 = sub_100006658(&qword_10005F128);
    v37 = &v3[*(int *)(v36 + 48)];
    v38 = *(int *)(v36 + 64);
    SceneUpdateHandshake.preferences.getter();
    v39 = ((uint64_t (*)(char *, char *, uint64_t))v31)(v37, v13, v32);
    *(_QWORD *)&v3[v38] = SceneUpdateHandshake.fenceHandle.getter(v39);
    swift_storeEnumTagMultiPayload(v3, v47, 0);
    SceneMessenger.send(message:)(v3);
    v40 = sub_100007C20((uint64_t)v3);
    v41 = (void *)SceneUpdateHandshake.fenceHandle.getter(v40);
    if (v41)
    {
      v42 = v41;
      objc_msgSend(v41, "invalidate");
      swift_release(v45);

      v35(v13, v32);
    }
    else
    {
      v35(v13, v32);
      swift_release(v45);
    }
    return v46;
  }
  return v27;
}

uint64_t sub_100007A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];

  v5 = v2 + 24;
  swift_beginAccess(v2 + 24, v12, 32, 0);
  v6 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_100007CC0(a1), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    swift_endAccess(v12);
    swift_retain(v9);
    Promise.succeed(with:)(a2);
    swift_release(v9);
  }
  else
  {
    swift_endAccess(v12);
  }
  swift_beginAccess(v5, v12, 33, 0);
  v10 = sub_1000082D4(a1);
  swift_endAccess(v12);
  return swift_release(v10);
}

uint64_t sub_100007AD4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for HostPreferenceResolver()
{
  return objc_opt_self(_TtC12PreviewShell22HostPreferenceResolver);
}

uint64_t sub_100007B20()
{
  return sub_100007540();
}

id sub_100007B40(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v4 = type metadata accessor for ShellToHostMessage(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(int *)(sub_100006658(&qword_10005F118) + 48);
  v8 = type metadata accessor for PreviewPreferences(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, a1, v8);
  *(_QWORD *)&v6[v7] = a2;
  swift_storeEnumTagMultiPayload(v6, v4, 1);
  v9 = a2;
  SceneMessenger.send(message:)(v6);
  sub_100007C20((uint64_t)v6);
  return objc_msgSend(v9, "invalidate");
}

uint64_t sub_100007C20(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ShellToHostMessage(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100007C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100007F60(a1, a2, v5);
}

unint64_t sub_100007CC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t updated;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  updated = type metadata accessor for SceneUpdateSeed(0);
  v6 = sub_100006618(&qword_10005F138, (uint64_t (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, updated, v6);
  return sub_100008040(a1, v7, (uint64_t (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, &qword_10005F148, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
}

unint64_t sub_100007D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for AgentDescriptor.Bundle(0);
  v6 = sub_100006618(&qword_10005F150, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100008040(a1, v7, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, &qword_10005F158, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
}

unint64_t sub_100007DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  if (a2)
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v7, a1, a2);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v5 = Hasher._finalize()();
  return sub_100008170(a1, a2, v5);
}

unint64_t sub_100007E70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for ContentCategory(0);
  v6 = sub_100006618(&qword_10005F180, (uint64_t (*)(uint64_t))&type metadata accessor for ContentCategory, (uint64_t)&protocol conformance descriptor for ContentCategory);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100008040(a1, v7, (uint64_t (*)(uint64_t))&type metadata accessor for ContentCategory, &qword_10005F188, (uint64_t)&protocol conformance descriptor for ContentCategory);
}

unint64_t sub_100007F08(Swift::UInt a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return sub_100008238(a1, v3);
}

unint64_t sub_100007F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100008040(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  uint64_t v17;
  char v18;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  unint64_t *v22;
  uint64_t v23;

  v22 = a4;
  v23 = a5;
  v6 = v5;
  v20 = a1;
  v21 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      v17 = sub_100006618(v22, v21, v23);
      v18 = dispatch thunk of static Equatable.== infix(_:_:)(v11, v20, v8, v17);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v18 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_100008170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = ~v5;
    v10 = *(_QWORD *)(v3 + 48);
    do
    {
      v11 = (_QWORD *)(v10 + 16 * v6);
      v12 = v11[1];
      if (v12)
      {
        if (a2)
        {
          v13 = *v11 == a1 && v12 == a2;
          if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0) & 1) != 0)
            return v6;
        }
      }
      else if (!a2)
      {
        return v6;
      }
      v6 = (v6 + 1) & v9;
    }
    while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

unint64_t sub_100008238(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1000082D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  v5 = sub_100007CC0(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000B34C((uint64_t (*)(_QWORD))&type metadata accessor for SceneUpdateSeed, &qword_10005F140);
    v8 = v14;
  }
  v9 = *(_QWORD *)(v8 + 48);
  updated = type metadata accessor for SceneUpdateSeed(0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v9 + *(_QWORD *)(*(_QWORD *)(updated - 8) + 72) * v5, updated);
  v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v5);
  sub_10000A00C(v5, v8, (uint64_t (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, &qword_10005F138, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  v12 = *v2;
  *v2 = v8;
  swift_bridgeObjectRelease(v12);
  return v11;
}

uint64_t sub_1000083E0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100007C5C(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  v14 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000B184();
    v10 = v14;
  }
  swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v7 + 8));
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v7);
  sub_100009E1C(v7, v10);
  v12 = *v3;
  *v3 = v10;
  swift_bridgeObjectRelease(v12);
  return v11;
}

uint64_t sub_1000084AC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100007DF0(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  v14 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000B57C();
    v10 = v14;
  }
  swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v7 + 8));
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v7);
  sub_10000A2A4(v7, v10);
  v12 = *v3;
  *v3 = v10;
  swift_bridgeObjectRelease(v12);
  return v11;
}

uint64_t sub_100008578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100007D58(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v19 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000B72C();
      v10 = v19;
    }
    v11 = *(_QWORD *)(v10 + 48);
    v12 = type metadata accessor for AgentDescriptor.Bundle(0);
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * v7, v12);
    v13 = *(_QWORD *)(v10 + 56);
    v14 = type metadata accessor for LaunchPayload(0);
    v15 = *(_QWORD *)(v14 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a2, v13 + *(_QWORD *)(v15 + 72) * v7, v14);
    sub_10000A49C(v7, v10);
    v16 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a2, 0, 1, v14);
  }
  else
  {
    v18 = type metadata accessor for LaunchPayload(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a2, 1, 1, v18);
  }
}

uint64_t sub_1000086B4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100007DF0(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  v14 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000BBC0();
    v10 = v14;
  }
  swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v7 + 8));
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v7);
  sub_10000A2A4(v7, v10);
  v12 = *v3;
  *v3 = v10;
  swift_bridgeObjectRelease(v12);
  return v11;
}

Swift::Int sub_100008780(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100006658(&qword_10005F190);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_unknownObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100008A94(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t *a4, unint64_t *a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  _QWORD *v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int64_t v46;
  _QWORD *v47;
  uint64_t i;
  uint64_t (*v49)(uint64_t);
  unint64_t *v50;
  uint64_t v51;
  int v52;

  v50 = a5;
  v51 = a6;
  v8 = v6;
  v49 = a3;
  v11 = a3(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v45 - v13;
  v15 = *v8;
  if (*(_QWORD *)(*v8 + 24) > a1)
    a1 = *(_QWORD *)(*v8 + 24);
  sub_100006658(a4);
  v52 = a2;
  v16 = static _DictionaryStorage.resize(original:capacity:move:)(v15, a1, a2);
  v17 = v16;
  if (!*(_QWORD *)(v15 + 16))
    goto LABEL_43;
  v18 = 1 << *(_BYTE *)(v15 + 32);
  v19 = *(_QWORD *)(v15 + 64);
  v47 = (_QWORD *)(v15 + 64);
  if (v18 < 64)
    v20 = ~(-1 << v18);
  else
    v20 = -1;
  v21 = v20 & v19;
  v45 = v8;
  v46 = (unint64_t)(v18 + 63) >> 6;
  v22 = v16 + 64;
  result = swift_retain(v15);
  v24 = 0;
  for (i = v15; ; v15 = i)
  {
    if (v21)
    {
      v26 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v27 = v26 | (v24 << 6);
      goto LABEL_24;
    }
    v28 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v28 >= v46)
      break;
    v29 = v47;
    v30 = v47[v28];
    ++v24;
    if (!v30)
    {
      v24 = v28 + 1;
      if (v28 + 1 >= v46)
        goto LABEL_36;
      v30 = v47[v24];
      if (!v30)
      {
        v31 = v28 + 2;
        if (v31 >= v46)
        {
LABEL_36:
          swift_release(v15);
          v8 = v45;
          if ((v52 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v30 = v47[v31];
        if (!v30)
        {
          while (1)
          {
            v24 = v31 + 1;
            if (__OFADD__(v31, 1))
              goto LABEL_45;
            if (v24 >= v46)
              goto LABEL_36;
            v30 = v47[v24];
            ++v31;
            if (v30)
              goto LABEL_23;
          }
        }
        v24 = v31;
      }
    }
LABEL_23:
    v21 = (v30 - 1) & v30;
    v27 = __clz(__rbit64(v30)) + (v24 << 6);
LABEL_24:
    v32 = *(_QWORD *)(v12 + 72);
    v33 = *(_QWORD *)(v15 + 48) + v32 * v27;
    if ((v52 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v12 + 32))(v14, v33, v11);
      v34 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v27);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v14, v33, v11);
      v34 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v27);
      swift_retain(v34);
    }
    v35 = *(_QWORD *)(v17 + 40);
    v36 = sub_100006618(v50, v49, v51);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v35, v11, v36);
    v37 = -1 << *(_BYTE *)(v17 + 32);
    v38 = result & ~v37;
    v39 = v38 >> 6;
    if (((-1 << v38) & ~*(_QWORD *)(v22 + 8 * (v38 >> 6))) != 0)
    {
      v25 = __clz(__rbit64((-1 << v38) & ~*(_QWORD *)(v22 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v40 = 0;
      v41 = (unint64_t)(63 - v37) >> 6;
      do
      {
        if (++v39 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v42 = v39 == v41;
        if (v39 == v41)
          v39 = 0;
        v40 |= v42;
        v43 = *(_QWORD *)(v22 + 8 * v39);
      }
      while (v43 == -1);
      v25 = __clz(__rbit64(~v43)) + (v39 << 6);
    }
    *(_QWORD *)(v22 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v12 + 32))(*(_QWORD *)(v17 + 48) + v32 * v25, v14, v11);
    *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v25) = v34;
    ++*(_QWORD *)(v17 + 16);
  }
  swift_release(v15);
  v8 = v45;
  v29 = v47;
  if ((v52 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v44 = 1 << *(_BYTE *)(v15 + 32);
  if (v44 >= 64)
    bzero(v29, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v29 = -1 << v44;
  *(_QWORD *)(v15 + 16) = 0;
LABEL_43:
  result = swift_release(v15);
  *v8 = v17;
  return result;
}

Swift::Int sub_100008E20(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD *v34;
  __int128 v35;
  _QWORD v36[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100006658(&qword_10005F178);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_39;
        v19 = v34[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_39;
          v19 = v34[v14];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_39:
              swift_release(v5);
              v3 = v32;
              if ((a2 & 1) != 0)
              {
                v31 = 1 << *(_BYTE *)(v5 + 32);
                if (v31 >= 64)
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v14 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_46;
                if (v14 >= v33)
                  goto LABEL_39;
                v19 = v34[v14];
                ++v20;
                if (v19)
                  goto LABEL_24;
              }
            }
            v14 = v20;
          }
        }
LABEL_24:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v17);
      v35 = v21;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v17 + 8);
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain(*((_QWORD *)&v21 + 1));
        swift_bridgeObjectRetain(v22);
      }
      Hasher.init(_seed:)(v36, *(_QWORD *)(v8 + 40));
      if (v23)
      {
        Hasher._combine(_:)(1uLL);
        String.hash(into:)(v36, v35, v23);
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v8 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_45;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v12 + 8 * v26);
        }
        while (v30 == -1);
        v15 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_OWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15) = v35;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v15) = v22;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100009130(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  _QWORD *v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[4];
  int v48;
  uint64_t *v49;
  int64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;

  v3 = v2;
  v6 = type metadata accessor for LaunchPayload(0);
  v56 = *(_QWORD *)(v6 - 8);
  v57 = v6;
  __chkstk_darwin(v6);
  v55 = &v47[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for AgentDescriptor.Bundle(0);
  v54 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = &v47[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = *v3;
  if (*(_QWORD *)(*v3 + 24) <= a1)
    v12 = a1;
  else
    v12 = *(_QWORD *)(*v3 + 24);
  sub_100006658(&qword_10005F160);
  v13 = static _DictionaryStorage.resize(original:capacity:move:)(v11, v12, a2);
  v14 = v13;
  if (!*(_QWORD *)(v11 + 16))
  {
    v44 = v11;
LABEL_45:
    result = swift_release(v44);
    *v3 = v14;
    return result;
  }
  v15 = 1 << *(_BYTE *)(v11 + 32);
  v16 = *(_QWORD *)(v11 + 64);
  v51 = (_QWORD *)(v11 + 64);
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v49 = v3;
  v50 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 64;
  v53 = v11;
  result = swift_retain(v11);
  v21 = 0;
  v48 = a2;
  v22 = 16;
  if ((a2 & 1) != 0)
    v22 = 32;
  v52 = v22;
  v23 = v22;
  while (1)
  {
    if (v18)
    {
      v25 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v26 = v25 | (v21 << 6);
      goto LABEL_27;
    }
    v27 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (v27 >= v50)
    {
      v45 = v53;
      swift_release(v53);
      v3 = v49;
      v28 = v51;
      if ((v48 & 1) != 0)
      {
LABEL_40:
        v46 = 1 << *(_BYTE *)(v45 + 32);
        if (v46 >= 64)
          bzero(v28, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v28 = -1 << v46;
        *(_QWORD *)(v45 + 16) = 0;
      }
LABEL_44:
      v44 = v45;
      goto LABEL_45;
    }
    v28 = v51;
    v29 = v51[v27];
    ++v21;
    if (!v29)
    {
      v21 = v27 + 1;
      if (v27 + 1 >= v50)
        goto LABEL_37;
      v29 = v51[v21];
      if (!v29)
        break;
    }
LABEL_26:
    v18 = (v29 - 1) & v29;
    v26 = __clz(__rbit64(v29)) + (v21 << 6);
LABEL_27:
    v31 = v53;
    v32 = *(_QWORD *)(v54 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v54 + v23))(v10, *(_QWORD *)(v53 + 48) + v32 * v26, v8);
    v33 = *(_QWORD *)(v31 + 56);
    v34 = *(_QWORD *)(v56 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v56 + v23))(v55, v33 + v34 * v26, v57);
    v35 = *(_QWORD *)(v14 + 40);
    v36 = sub_100006618(&qword_10005F150, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v35, v8, v36);
    v37 = -1 << *(_BYTE *)(v14 + 32);
    v38 = result & ~v37;
    v39 = v38 >> 6;
    if (((-1 << v38) & ~*(_QWORD *)(v19 + 8 * (v38 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v38) & ~*(_QWORD *)(v19 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v40 = 0;
      v41 = (unint64_t)(63 - v37) >> 6;
      do
      {
        if (++v39 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_46;
        }
        v42 = v39 == v41;
        if (v39 == v41)
          v39 = 0;
        v40 |= v42;
        v43 = *(_QWORD *)(v19 + 8 * v39);
      }
      while (v43 == -1);
      v24 = __clz(__rbit64(~v43)) + (v39 << 6);
    }
    *(_QWORD *)(v19 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v54 + 32))(*(_QWORD *)(v14 + 48) + v32 * v24, v10, v8);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v56 + 32))(*(_QWORD *)(v14 + 56) + v34 * v24, v55, v57);
    ++*(_QWORD *)(v14 + 16);
  }
  v30 = v27 + 2;
  if (v30 >= v50)
  {
LABEL_37:
    v45 = v53;
    swift_release(v53);
    v3 = v49;
    if ((v48 & 1) != 0)
      goto LABEL_40;
    goto LABEL_44;
  }
  v29 = v51[v30];
  if (v29)
  {
    v21 = v30;
    goto LABEL_26;
  }
  while (1)
  {
    v21 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v21 >= v50)
      goto LABEL_37;
    v29 = v51[v21];
    ++v30;
    if (v29)
      goto LABEL_26;
  }
LABEL_47:
  __break(1u);
  return result;
}

Swift::Int sub_100009528(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100006658((uint64_t *)&unk_10005F1A0);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10000983C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD *v34;
  __int128 v35;
  _QWORD v36[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100006658(&qword_10005F198);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_39;
        v19 = v34[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_39;
          v19 = v34[v14];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_39:
              swift_release(v5);
              v3 = v32;
              if ((a2 & 1) != 0)
              {
                v31 = 1 << *(_BYTE *)(v5 + 32);
                if (v31 >= 64)
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v14 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_46;
                if (v14 >= v33)
                  goto LABEL_39;
                v19 = v34[v14];
                ++v20;
                if (v19)
                  goto LABEL_24;
              }
            }
            v14 = v20;
          }
        }
LABEL_24:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v17);
      v35 = v21;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v17 + 8);
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain(*((_QWORD *)&v21 + 1));
        swift_retain(v22);
      }
      Hasher.init(_seed:)(v36, *(_QWORD *)(v8 + 40));
      if (v23)
      {
        Hasher._combine(_:)(1uLL);
        String.hash(into:)(v36, v35, v23);
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v8 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_45;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v12 + 8 * v26);
        }
        while (v30 == -1);
        v15 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_OWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15) = v35;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v15) = v22;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100009B4C(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  Swift::Int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  Swift::UInt v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  Swift::Int *v34;
  char v35;
  uint64_t v36[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100006658(&qword_10005F170);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v9 = 0;
    v10 = (_QWORD *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v18 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v19 = v18 | (v9 << 6);
      }
      else
      {
        v20 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v20 >= v14)
          goto LABEL_34;
        v21 = v10[v20];
        ++v9;
        if (!v21)
        {
          v9 = v20 + 1;
          if (v20 + 1 >= v14)
            goto LABEL_34;
          v21 = v10[v9];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v14)
            {
LABEL_34:
              if ((v35 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v34;
                goto LABEL_41;
              }
              v33 = 1 << *(_BYTE *)(v5 + 32);
              if (v33 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v10 = -1 << v33;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v10[v22];
            if (!v21)
            {
              while (1)
              {
                v9 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_43;
                if (v9 >= v14)
                  goto LABEL_34;
                v21 = v10[v9];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v9 = v22;
          }
        }
LABEL_24:
        v13 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v9 << 6);
      }
      v23 = 8 * v19;
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v23);
      v25 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v23);
      Hasher.init(_seed:)(v36, *(_QWORD *)(v8 + 40));
      Hasher._combine(_:)(v24);
      result = Hasher._finalize()();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v15 + 8 * (v27 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v15 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v15 + 8 * v28);
        }
        while (v32 == -1);
        v16 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v17) = v24;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v17) = v25;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_41:
  *v3 = v8;
  return result;
}

unint64_t sub_100009E1C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100009FF0(int64_t a1, uint64_t a2)
{
  return sub_10000A00C(a1, a2, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, &qword_10005F150, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
}

unint64_t sub_10000A00C(int64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v7;
  unint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  unint64_t v40;
  uint64_t (*v41)(uint64_t);
  unint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v42 = a4;
  v43 = a5;
  v41 = a3;
  v7 = a3(0);
  v44 = *(_QWORD *)(v7 - 8);
  result = __chkstk_darwin(v7);
  v10 = (char *)&v39 - v9;
  v11 = a2 + 64;
  v12 = -1 << *(_BYTE *)(a2 + 32);
  v13 = (a1 + 1) & ~v12;
  if (((1 << v13) & *(_QWORD *)(a2 + 64 + 8 * (v13 >> 6))) != 0)
  {
    v14 = ~v12;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v12);
    if ((*(_QWORD *)(v11 + 8 * (v13 >> 6)) & (1 << v13)) != 0)
    {
      v40 = (result + 1) & v14;
      v15 = *(_QWORD *)(v44 + 72);
      v39 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
      v16 = v14;
      do
      {
        v17 = v11;
        v18 = v15;
        v19 = v15 * v13;
        v20 = v16;
        v39(v10, *(_QWORD *)(a2 + 48) + v15 * v13, v7);
        v21 = *(_QWORD *)(a2 + 40);
        v22 = sub_100006618(v42, v41, v43);
        v23 = dispatch thunk of Hashable._rawHashValue(seed:)(v21, v7, v22);
        result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v10, v7);
        v16 = v20;
        v24 = v23 & v20;
        if (a1 >= (uint64_t)v40)
        {
          if (v24 >= v40 && a1 >= (uint64_t)v24)
          {
LABEL_16:
            v27 = *(_QWORD *)(a2 + 48);
            v15 = v18;
            result = v27 + v18 * a1;
            v28 = v27 + v19;
            if (v18 * a1 < v19 || result >= v28 + v18)
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v28, 1, v7);
              v16 = v20;
              v11 = v17;
            }
            else
            {
              v29 = v18 * a1 == v19;
              v11 = v17;
              if (!v29)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v16 = v20;
              }
            }
            v30 = *(_QWORD *)(a2 + 56);
            v31 = (_QWORD *)(v30 + 8 * a1);
            v32 = (_QWORD *)(v30 + 8 * v13);
            if (a1 != v13 || (a1 = v13, v31 >= v32 + 1))
            {
              *v31 = *v32;
              a1 = v13;
            }
            goto LABEL_5;
          }
        }
        else if (v24 >= v40 || a1 >= (uint64_t)v24)
        {
          goto LABEL_16;
        }
        v11 = v17;
        v15 = v18;
LABEL_5:
        v13 = (v13 + 1) & v16;
      }
      while (((*(_QWORD *)(v11 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
    }
    v33 = (uint64_t *)(v11 + 8 * ((unint64_t)a1 >> 6));
    v34 = *v33;
    v35 = (-1 << a1) - 1;
  }
  else
  {
    v33 = (uint64_t *)(v11 + 8 * ((unint64_t)a1 >> 6));
    v35 = *v33;
    v34 = (-1 << a1) - 1;
  }
  *v33 = v35 & v34;
  v36 = *(_QWORD *)(a2 + 16);
  v37 = __OFSUB__(v36, 1);
  v38 = v36 - 1;
  if (v37)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v38;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000A2A4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v11 = *v9;
        v10 = v9[1];
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        if (v10)
        {
          Hasher._combine(_:)(1uLL);
          swift_bridgeObjectRetain(v10);
          String.hash(into:)(v26, v11, v10);
        }
        else
        {
          Hasher._combine(_:)(0);
        }
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v10);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_14;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_14:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000A49C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, unint64_t, uint64_t);
  unint64_t v43;
  uint64_t v44;

  v4 = type metadata accessor for AgentDescriptor.Bundle(0);
  v44 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v43 = (result + 1) & v11;
      v12 = *(_QWORD *)(v44 + 72);
      v42 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v42(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v18 = *(_QWORD *)(a2 + 40);
        v19 = sub_100006618(&qword_10005F150, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
        v20 = dispatch thunk of Hashable._rawHashValue(seed:)(v18, v4, v19);
        result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v7, v4);
        v13 = v17;
        v21 = v20 & v17;
        if (a1 >= (uint64_t)v43)
        {
          if (v21 >= v43 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            v24 = *(_QWORD *)(a2 + 48);
            v25 = v24 + v15 * a1;
            v26 = v24 + v16;
            v8 = v14;
            if (v15 * a1 < v16 || v25 >= v26 + v15)
            {
              swift_arrayInitWithTakeFrontToBack(v25, v26, 1, v4);
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v27 = *(_QWORD *)(a2 + 56);
            v28 = type metadata accessor for LaunchPayload(0);
            v29 = *(_QWORD *)(*(_QWORD *)(v28 - 8) + 72);
            v30 = v29 * a1;
            result = v27 + v29 * a1;
            v31 = v29 * v10;
            v32 = v27 + v29 * v10;
            v33 = v32 + v29;
            if (v30 < v31 || result >= v33)
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v32, 1, v28);
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v30 != v31)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v43 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v35 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v36 = *v35;
    v37 = (-1 << a1) - 1;
  }
  else
  {
    v35 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v37 = *v35;
    v36 = (-1 << a1) - 1;
  }
  *v35 = v37 & v36;
  v38 = *(_QWORD *)(a2 + 16);
  v39 = __OFSUB__(v38, 1);
  v40 = v38 - 1;
  if (v39)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v40;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10000A770(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t updated;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  updated = type metadata accessor for SceneUpdateSeed(0);
  v9 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_100007CC0(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release(*(_QWORD *)(v21 + 8 * v14));
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10000B34C((uint64_t (*)(_QWORD))&type metadata accessor for SceneUpdateSeed, &qword_10005F140);
    goto LABEL_7;
  }
  sub_100008A94(v17, a3 & 1, (uint64_t (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, &qword_10005F140, &qword_10005F138, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  v23 = sub_100007CC0(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(updated);
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, updated);
  return sub_10000B034(v14, (uint64_t)v11, a1, v20, (uint64_t (*)(_QWORD))&type metadata accessor for SceneUpdateSeed);
}

uint64_t sub_10000A904(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100007C5C(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000B184();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100008780(v15, a4 & 1);
  v21 = sub_100007C5C(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10000AA60(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for AgentDescriptor.Bundle(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_100007D58(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release(*(_QWORD *)(v21 + 8 * v14));
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10000B34C((uint64_t (*)(_QWORD))&type metadata accessor for AgentDescriptor.Bundle, &qword_10005F168);
    goto LABEL_7;
  }
  sub_100008A94(v17, a3 & 1, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor.Bundle, &qword_10005F168, &qword_10005F150, (uint64_t)&protocol conformance descriptor for AgentDescriptor.Bundle);
  v23 = sub_100007D58(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10000B034(v14, (uint64_t)v11, a1, v20, (uint64_t (*)(_QWORD))&type metadata accessor for AgentDescriptor.Bundle);
}

uint64_t sub_10000ABF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100007DF0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000B57C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100008E20(v15, a4 & 1);
  v21 = sub_100007DF0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InjectedSceneIdentity);
  __break(1u);
  return result;
}

uint64_t sub_10000AD50(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for AgentDescriptor.Bundle(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_100007D58(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = type metadata accessor for LaunchPayload(0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_10000B72C();
      goto LABEL_7;
    }
    sub_100009130(v17, a3 & 1);
    v24 = sub_100007D58(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_10000B0CC(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
  __break(1u);
  return result;
}

uint64_t sub_10000AED8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100007DF0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000BBC0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_10000983C(v15, a4 & 1);
  v21 = sub_100007DF0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InjectedSceneIdentity);
  __break(1u);
  return result;
}

uint64_t sub_10000B034(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v9 = a4[6];
  v10 = a5(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a2, v10);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v12 = a4[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a4[2] = v14;
  return result;
}

uint64_t sub_10000B0CC(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for AgentDescriptor.Bundle(0);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = type metadata accessor for LaunchPayload(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

void *sub_10000B184()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_100006658(&qword_10005F190);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_unknownObjectRetain(v20);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000B338()
{
  return sub_10000B34C((uint64_t (*)(_QWORD))&type metadata accessor for AgentDescriptor.Bundle, &qword_10005F168);
}

void *sub_10000B34C(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;

  v4 = a1(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v26 - v6;
  sub_100006658(a2);
  v27 = v2;
  v8 = *v2;
  v9 = static _DictionaryStorage.copy(original:)(*v2);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v8);
    *v27 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v28 = v8 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v15 = 1 << *(_BYTE *)(v8 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v8 + 64);
  v29 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v29)
      goto LABEL_26;
    v24 = *(_QWORD *)(v28 + 8 * v23);
    ++v14;
    if (!v24)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v29)
        goto LABEL_26;
      v24 = *(_QWORD *)(v28 + 8 * v14);
      if (!v24)
        break;
    }
LABEL_25:
    v17 = (v24 - 1) & v24;
    v19 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v20, v4);
    v21 = 8 * v19;
    v22 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v19);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v20, v7, v4);
    *(_QWORD *)(*(_QWORD *)(v10 + 56) + v21) = v22;
    result = (void *)swift_retain(v22);
  }
  v25 = v23 + 2;
  if (v25 >= v29)
    goto LABEL_26;
  v24 = *(_QWORD *)(v28 + 8 * v25);
  if (v24)
  {
    v14 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v14 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v14 >= v29)
      goto LABEL_26;
    v24 = *(_QWORD *)(v28 + 8 * v14);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000B57C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100006658(&qword_10005F178);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v18);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v18) = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    swift_bridgeObjectRetain(*((_QWORD *)&v19 + 1));
    result = (void *)swift_bridgeObjectRetain(v17);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_10000B72C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = type metadata accessor for LaunchPayload(0);
  v37 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for AgentDescriptor.Bundle(0);
  v36 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006658(&qword_10005F160);
  v33 = v0;
  v3 = *v0;
  v4 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release(v3);
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release(v42);
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10000BA0C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_100006658((uint64_t *)&unk_10005F1A0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000BBC0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100006658(&qword_10005F198);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v18);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v18) = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    swift_bridgeObjectRetain(*((_QWORD *)&v19 + 1));
    result = (void *)swift_retain(v17);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000BD70()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  sub_100006658(&qword_10005F170);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_10000BEFC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t *v20;
  NSObject *v21;
  NSObject **v22;
  uint64_t v23;
  NSObject **v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a1, "scene");
  v8 = objc_msgSend(v7, "settings");
  v9 = objc_msgSend(v8, "displayConfiguration");

  if (v9)
  {
    v11 = objc_msgSend(v9, "identity");
    v12 = objc_msgSend(v11, "rootIdentity");

    v28 = v12;
    __chkstk_darwin(v13);
    *(&v24 - 2) = (NSObject **)v12;
    *(&v24 - 1) = (NSObject **)v9;
    swift_beginAccess(v1 + 16, &v26, 33, 0);
    v14 = sub_100006658(&qword_10005F2B0);
    v15 = sub_10000C60C();
    KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)(&v29, &v28, sub_10000C5F4, &v24 - 4, v14, v15);
    swift_endAccess(&v26);
    v16 = v29;
    objc_msgSend(v29, "addScene:", v7);

  }
  else
  {
    static Logger.uv.getter(v10);
    v17 = v7;
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
    {
      v25 = v3;
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v20 = 138412290;
      v26 = v17;
      v21 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v20 + 4);
      v22 = v24;
      *v24 = v17;

      v3 = v25;
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v19, "Cannot bind FBScene lacking display configuration: %@", v20, 0xCu);
      v23 = sub_100006658(&qword_10005F2A8);
      swift_arrayDestroy(v22, 1, v23);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v20, -1, -1);
    }
    else
    {

      v18 = v17;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

id sub_10000C1EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  NSObject *v17;
  NSObject **v18;
  uint8_t *v19;
  uint64_t v20;
  id result;
  NSObject **v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;

  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter(v9);
  v12 = a1;
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v27 = v3;
    v15 = swift_slowAlloc(12, -1);
    v26 = a3;
    v16 = (uint8_t *)v15;
    v22 = (NSObject **)swift_slowAlloc(8, -1);
    v23 = v16;
    v24 = v8;
    *(_DWORD *)v16 = 138412290;
    v25 = a2;
    v28 = v12;
    v17 = v12;
    v8 = v24;
    a2 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v16 + 4);
    v18 = v22;
    *v22 = v12;

    v19 = v23;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Adding a new root window binder for local scene, with root display identity: %@", v23, 0xCu);
    v20 = sub_100006658(&qword_10005F2A8);
    swift_arrayDestroy(v18, 1, v20);
    swift_slowDealloc(v18, -1, -1);
    a3 = v26;
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {

    v13 = v12;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  result = objc_msgSend(objc_allocWithZone((Class)UIRootWindowScenePresentationBinder), "initWithPriority:displayConfiguration:", 0, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000C3EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SceneBinder.DefaultBinder()
{
  return objc_opt_self(_TtCV12PreviewShell11SceneBinderP33_1FBBF994FD0C34216FD11E30B179066113DefaultBinder);
}

void sub_10000C430(void *a1)
{
  sub_10000BEFC(a1);
}

uint64_t sub_10000C450()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];
  __int128 v7;
  uint64_t v8;

  if (qword_10005ECA0 != -1)
    swift_once(&qword_10005ECA0, sub_10001D7E4);
  v0 = type metadata accessor for PreviewShellPluginRegistry(0);
  v1 = sub_10000C53C(v0, (uint64_t)qword_100064188);
  v2 = swift_beginAccess(v1, v6, 32, 0);
  PreviewShellPluginRegistry.sceneBinder.getter(&v7, v2);
  swift_endAccess(v6);
  if (v8)
    return sub_10000C5DC(&v7, (uint64_t)&qword_10005F1B0);
  v4 = type metadata accessor for SceneBinder.DefaultBinder();
  v5 = swift_allocObject(v4, 24, 7);
  *(_QWORD *)(v5 + 16) = &_swiftEmptyDictionarySingleton;
  qword_10005F1C8 = v4;
  qword_10005F1D0 = sub_10000C554();
  qword_10005F1B0 = v5;
  return sub_10000C59C((uint64_t)&v7);
}

uint64_t sub_10000C53C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_10000C554()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005F298;
  if (!qword_10005F298)
  {
    v1 = type metadata accessor for SceneBinder.DefaultBinder();
    result = swift_getWitnessTable(&unk_1000400F8, v1);
    atomic_store(result, (unint64_t *)&qword_10005F298);
  }
  return result;
}

uint64_t sub_10000C59C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_10005F2A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C5DC(__int128 *a1, uint64_t a2)
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

id sub_10000C5F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_10000C1EC(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_10000C60C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005F2B8;
  if (!qword_10005F2B8)
  {
    v1 = sub_1000066E4(&qword_10005F2B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_10005F2B8);
  }
  return result;
}

uint64_t sub_10000C658()
{
  return sub_10000EE88();
}

uint64_t sub_10000C678(int a1)
{
  return sub_10000C6B0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.prepareForRelaunch(), 45, (uint64_t)"prepareForRelaunch(of:)", 23);
}

uint64_t sub_10000C694(int a1)
{
  return sub_10000C6B0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.stop(), 53, (uint64_t)"stop(pid:)", 10);
}

uint64_t sub_10000C6B0(int a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 *v16;
  __int128 v18;
  uint64_t v19;
  int v20;
  _BYTE v21[24];
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  int v25;

  v11 = v5 + 56;
  swift_beginAccess(v11, v21, 0, 0);
  sub_10000D6D0(v11, (uint64_t)&v18);
  if (!v19)
  {
    v15 = &qword_10005F3A0;
    v16 = &v18;
LABEL_6:
    sub_10000D718((uint64_t)v16, v15);
    sub_100006658(&qword_10005F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, a3, 30, a4, a5, 2);
  }
  sub_10000C5DC(&v18, (uint64_t)v22);
  v25 = v20;
  if (v20 != a1)
  {
    v15 = &qword_10005F3A8;
    v16 = (__int128 *)v22;
    goto LABEL_6;
  }
  v12 = v23;
  v13 = v24;
  sub_10000D648(v22, v23);
  v14 = a2(v12, v13);
  sub_10000D718((uint64_t)v22, &qword_10005F3A8);
  return v14;
}

uint64_t sub_10000C7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  v8 = v7;
  v33 = a6;
  v34 = a7;
  v31 = a4;
  v32 = a5;
  v29 = a1;
  v30 = a3;
  v35 = type metadata accessor for ExecutionLane(0);
  v10 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PreviewAgentConnector(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
  v17 = *(unsigned __int8 *)(v14 + 80);
  v18 = (v17 + 24) & ~v17;
  v19 = swift_allocObject(&unk_100052520, v18 + v15, v17 | 7);
  *(_QWORD *)(v19 + 16) = v8;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v19 + v18, v16, v13);
  swift_retain_n(v8, 2);
  v20 = sub_10000F0E4(v29, a2, v30, v31, v32, v33, v34, (uint64_t)sub_10000D524, v8, (uint64_t)sub_10000D5A0, v19);
  swift_release(v19);
  v21 = swift_release(v8);
  static ExecutionLane.main.getter(v21);
  swift_retain(v8);
  Future.observeSuccess(on:_:)(v12, sub_10000D5E0, v8);
  swift_release(v8);
  v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23 = v35;
  v22(v12, v35);
  v24 = swift_retain(v8);
  static ExecutionLane.any.getter(v24);
  v25 = type metadata accessor for PropertyList(0);
  v26 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 96, 40, "performUpdate(for:using:makeProviderBox:updatePayload:controlStates:agentContext:)", 82, 2, v12, sub_10000D600, v8, v25);
  swift_release(v20);
  swift_release(v8);
  v22(v12, v23);
  return v26;
}

uint64_t sub_10000CA1C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t updated;
  _BYTE v22[24];

  sub_10002D5F8(a1);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000D648(a1, v6);
  v8 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v6, v7);
  v9 = a2 + 7;
  swift_beginAccess(a2 + 7, v22, 0, 0);
  v10 = a2[10];
  if (!v10)
  {

    goto LABEL_5;
  }
  v11 = a2[11];
  v12 = sub_10000D648(v9, v10);
  v13 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v12);
  v15 = &v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(char *))(v13 + 16))(v15);
  v16 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v10, v11);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v10);

  if (v8 != v16)
  {
LABEL_5:
    v17 = (unsigned int *)&enum case for SceneUpdateTiming.async(_:);
    goto LABEL_6;
  }
  v17 = (unsigned int *)&enum case for SceneUpdateTiming.fenced(_:);
LABEL_6:
  v18 = *v17;
  updated = type metadata accessor for SceneUpdateTiming(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 104))(a3, v18, updated);
}

uint64_t sub_10000CB70(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[24];
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BYTE v26[24];

  sub_10002D714(a1);
  v4 = a1[3];
  v5 = a1[4];
  sub_10000D648(a1, v4);
  v6 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v4, v5);
  v7 = (uint64_t)(a2 + 7);
  swift_beginAccess(a2 + 7, v26, 0, 0);
  v8 = a2[10];
  if (!v8)
  {

    if (!a2[10])
      goto LABEL_5;
    goto LABEL_4;
  }
  v9 = a2[11];
  v10 = sub_10000D648(a2 + 7, a2[10]);
  v11 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v10);
  v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v11 + 16))(v13);
  v14 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v8, v9);
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v8);

  if (v6 != v14)
  {
    if (!a2[10])
    {
LABEL_5:
      v17 = a1[3];
      v18 = a1[4];
      sub_10000D648(a1, v17);
      dispatch thunk of CanvasContentHost.didActivate()(v17, v18);
      goto LABEL_6;
    }
LABEL_4:
    sub_10000D66C((uint64_t)(a2 + 7), (uint64_t)v22);
    v15 = v23;
    v16 = v24;
    sub_10000D648(v22, v23);
    dispatch thunk of CanvasContentHost.didDeactivate()(v15, v16);
    sub_10000D6B0(v22);
    goto LABEL_5;
  }
LABEL_6:
  v19 = sub_10000D66C((uint64_t)a1, (uint64_t)v22);
  v25 = PreviewAgentConnector.pid.getter(v19);
  swift_beginAccess(v7, v21, 33, 0);
  sub_10000D7B4((uint64_t)v22, v7, &qword_10005F3A0);
  return swift_endAccess(v21);
}

uint64_t sub_10000CD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t v20;
  uint64_t v21;
  uint64_t updated;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v4 = type metadata accessor for PropertyList(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006658(&qword_10005F390);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HostIdentity(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for HostedPreviewReply(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(a2 + 32);
  v17 = *(_QWORD *)(a2 + 40);
  ObjectType = swift_getObjectType(v18);
  dispatch thunk of PreviewShellScene.hostIdentity.getter(ObjectType, *(_QWORD *)(*(_QWORD *)(v17 + 8) + 8));
  v20 = type metadata accessor for SceneLayout(0);
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v9, a1, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v9, 0, 1, v20);
  type metadata accessor for CanvasUpdater.UpdateResult(0);
  updated = CanvasUpdateOutput.controlDescriptions.getter();
  v23 = CanvasUpdateOutput.controlStates.getter();
  CanvasUpdateOutput.hostedOutput.getter();
  HostedPreviewReply.init(hostIdentity:sceneLayout:controlDescriptions:controlStates:contentPayload:)(v12, v9, updated, v23, v6);
  v24 = sub_10000D608(&qword_10005F398, 255, (uint64_t (*)(uint64_t))&type metadata accessor for HostedPreviewReply, (uint64_t)&protocol conformance descriptor for HostedPreviewReply);
  PropertyListRepresentable.propertyList.getter(v13, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_10000CF48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[24];
  __int128 v28[2];
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  v1 = sub_100006658(&qword_10005F3B0);
  v26 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006658(&qword_10005F3B8);
  __chkstk_darwin(v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006658(&qword_10005F000);
  v23 = 2;
  v25 = static Future.create(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 111, 52, "confirmReadyForDisplayAfterAsyncResize()", 40, v23);
  v8 = v7;
  swift_beginAccess(v0 + 56, v27, 0, 0);
  if (*(_QWORD *)(v0 + 80))
  {
    sub_10000D66C(v0 + 56, (uint64_t)v28);
    sub_10000C5DC(v28, (uint64_t)v29);
    v9 = v30;
    v10 = v31;
    sub_10000D648(v29, v30);
    v11 = dispatch thunk of CanvasContentHost.confirmReadyForDisplayAfterAsyncResize()(v9, v10);
    v12 = swift_allocObject(&unk_100052598, 32, 7);
    *(_QWORD *)(v12 + 16) = sub_10000D7F8;
    *(_QWORD *)(v12 + 24) = v8;
    swift_retain(v8);
    Future.observeSuccess(_:)(sub_10000D800, v12);
    swift_release(v11);
    swift_release(v12);
    sub_10000D6B0(v29);
  }
  v13 = swift_allocBox(v4);
  v15 = v14;
  v16 = type metadata accessor for CancellationToken(0);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v17(v15, 1, 1, v16);
  EventStream.Sink.eventStream.getter(v18);
  v19 = swift_allocObject(&unk_100052548, 32, 7);
  *(_QWORD *)(v19 + 16) = v8;
  *(_QWORD *)(v19 + 24) = v13;
  v20 = swift_allocObject(&unk_100052570, 32, 7);
  *(_QWORD *)(v20 + 16) = sub_10000D780;
  *(_QWORD *)(v20 + 24) = v19;
  swift_retain(v8);
  swift_retain(v13);
  v22 = 2;
  EventStream.observe(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 126, 44, "confirmReadyForDisplayAfterAsyncResize()", 40, v22, sub_10000D7AC, v20, v1);
  swift_release(v8);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v1);
  v17((uint64_t)v6, 0, 1, v16);
  swift_beginAccess(v15, v29, 1, 0);
  sub_10000D7B4((uint64_t)v6, v15, &qword_10005F3B8);
  swift_release(v13);
  return v25;
}

uint64_t sub_10000D264()
{
  return Promise<A>.trySucceed()();
}

uint64_t sub_10000D2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  _BYTE v10[32];

  v3 = type metadata accessor for CancellationToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = swift_projectBox(a2);
  Promise<A>.trySucceed()();
  swift_beginAccess(v7, v10, 0, 0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3);
  if (!(_DWORD)result)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
    v9 = 2;
    CancellationToken.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 128, 26, "confirmReadyForDisplayAfterAsyncResize()", 40, v9);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_10000D3D8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  sub_10000D718(v0 + 56, &qword_10005F3A0);
  swift_release(*(_QWORD *)(v0 + 104));
  return swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for HostedPreviewCanvas()
{
  return objc_opt_self(_TtC12PreviewShell19HostedPreviewCanvas);
}

uint64_t sub_10000D44C(int a1)
{
  return sub_10000C6B0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.prepareForRelaunch(), 45, (uint64_t)"prepareForRelaunch(of:)", 23);
}

uint64_t sub_10000D484(int a1)
{
  return sub_10000C6B0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasContentHost.stop(), 53, (uint64_t)"stop(pid:)", 10);
}

uint64_t sub_10000D4BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7)
{
  return sub_10000C7E0(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10000D4DC()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t sub_10000D4E8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_10000D608(&qword_10005F388, a2, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000D524@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;

  return sub_10000CA1C(a1, v2, a2);
}

uint64_t sub_10000D52C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for PreviewAgentConnector(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000D5A0(_QWORD *a1)
{
  uint64_t v1;

  type metadata accessor for PreviewAgentConnector(0);
  return sub_10000CB70(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_10000D5E0()
{
  return EventStream.Sink.send<A>()();
}

uint64_t sub_10000D600(uint64_t a1)
{
  uint64_t v1;

  return sub_10000CD44(a1, v1);
}

uint64_t sub_10000D608(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_10000D648(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000D66C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D6B0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000D6D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005F3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D718(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006658(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D754()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D780()
{
  uint64_t v0;

  return sub_10000D2B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000D788()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D7AC(uint64_t a1)
{
  uint64_t v1;

  return sub_10001F9E0(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_10000D7B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006658(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D7F8()
{
  return sub_10000D264();
}

uint64_t sub_10000D800()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_10000D824()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  objc_class *v11;
  objc_super v13;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = static Logger.uv.getter(v4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "DisplayTransformer created", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v11 = (objc_class *)type metadata accessor for DisplayTransformer();
  v13.receiver = v1;
  v13.super_class = v11;
  return objc_msgSendSuper2(&v13, "init");
}

id sub_10000D9F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisplayTransformer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DisplayTransformer()
{
  return objc_opt_self(_TtC12PreviewShell18DisplayTransformer);
}

uint64_t sub_10000DA44(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_10000E89C();
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_10000DCC0(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_10000DEA4(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10000E140((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_10000E89C();
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_10000E1C0((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_10000DCC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100006658((uint64_t *)&unk_10005F460);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_10000E89C();
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10000DEA4(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10000DEA4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100006658((uint64_t *)&unk_10005F460);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_10000E140(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_10000E1C0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10000DEA4(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_10000E334();
      goto LABEL_14;
    }
    sub_10000E4DC(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_10000E89C();
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_10000E334()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100006658((uint64_t *)&unk_10005F460);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000E4DC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100006658((uint64_t *)&unk_10005F460);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000E754(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = sub_10000E89C();
  v5 = sub_10000E8D8();
  result = Set.init(minimumCapacity:)(v3, v4, v5);
  v15 = result;
  if (v2)
  {
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    result = swift_bridgeObjectRelease(a1);
    if (!v7)
      return v15;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return v15;
  }
  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_10000DA44((Swift::Int *)&v14, v10);

      }
    }
    else
    {
      v11 = (void **)(a1 + 32);
      do
      {
        v12 = *v11++;
        sub_10000DA44((Swift::Int *)&v14, v12);

        --v7;
      }
      while (v7);
    }
    return v15;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000E89C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005F450;
  if (!qword_10005F450)
  {
    v1 = objc_opt_self(FBSDisplayConfiguration);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005F450);
  }
  return result;
}

unint64_t sub_10000E8D8()
{
  unint64_t result;
  unint64_t v1;

  result = qword_10005F458;
  if (!qword_10005F458)
  {
    v1 = sub_10000E89C();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10005F458);
  }
  return result;
}

uint64_t type metadata accessor for SimDisplay()
{
  return objc_opt_self(_TtC12PreviewShell10SimDisplay);
}

id sub_10000EB10()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v1 = *v0 + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities;
  v2 = *(id *)v1;
  v3 = *(void **)(v1 + 8);
  v4 = *(id *)v1;
  v5 = v3;
  return v2;
}

id sub_10000EB5C(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  objc_class *ObjectType;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;

  v7 = v6;
  ObjectType = (objc_class *)swift_getObjectType(v6);
  v13 = type metadata accessor for Logger(0);
  v45 = *(_QWORD *)(v13 - 8);
  v46 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRelease(a6);
  v16 = &v7[OBJC_IVAR____TtC12PreviewShell10SimDisplay_name];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  *(_DWORD *)&v7[OBJC_IVAR____TtC12PreviewShell10SimDisplay_displayID] = a3;
  v17 = v7;
  sub_100007298();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = v19;
  v25 = a4;
  v26 = objc_msgSend(v24, "displayEdgeInfo");
  if (!v26)
    v26 = objc_msgSend(objc_allocWithZone((Class)UISApplicationSupportDisplayEdgeInfo), "init");
  v27 = objc_msgSend(v24, "exclusionArea");
  v28 = objc_msgSend(objc_allocWithZone((Class)UISDisplayContext), "initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:", v25, v26, v27);

  v29 = &v17[OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities];
  *(_QWORD *)v29 = v23;
  *((_QWORD *)v29 + 1) = v28;
  v29[16] = v21 & 1;
  static Logger.uv.getter(v30);
  v31 = v17;
  v32 = v15;
  v33 = Logger.logObject.getter(v31);
  v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = swift_slowAlloc(18, -1);
    v36 = swift_slowAlloc(32, -1);
    v49 = v36;
    *(_DWORD *)v35 = 67240450;
    LODWORD(v48) = a3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 4, v35 + 4);
    *(_WORD *)(v35 + 8) = 2082;
    v44 = v35 + 10;
    v37 = (void *)*((_QWORD *)v29 + 1);
    v38 = *(id *)v29;
    v39 = v37;
    v40 = sub_1000070D8(v38);
    v42 = v41;

    v48 = sub_100010F78(v40, v42, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v44);

    swift_bridgeObjectRelease(v42);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "SimDisplay %{public}u capabilities: <%{public}s>", (uint8_t *)v35, 0x12u);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v46);
  v50.receiver = v31;
  v50.super_class = ObjectType;
  return objc_msgSendSuper2(&v50, "init");
}

uint64_t sub_10000EE88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t updated;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  __int128 v23[2];
  _BYTE v24[24];

  v1 = v0;
  if (*(_QWORD *)(v0 + 16))
  {
    *(_QWORD *)&v23[0] = *(_QWORD *)(v0 + 16);
    updated = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
    v3 = sub_100006618(&qword_10005F688, type metadata accessor for CanvasUpdater.UpdateDelegate, (uint64_t)&unk_1000402E0);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 95, 42, "invalidate()", 12, 2, updated, v3);
    v4 = *(_QWORD *)(v1 + 16);
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)(v1 + 16) = 0;
  swift_release(v4);
  swift_beginAccess(v1 + 40, v24, 0, 0);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = v5 + 64;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain_n(v5, 2);
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_8;
    }
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v10)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v12;
    if (!v18)
    {
      v12 = v17 + 1;
      if (v17 + 1 >= v10)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v12);
      if (!v18)
      {
        v12 = v17 + 2;
        if (v17 + 2 >= v10)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (!v18)
        {
          v12 = v17 + 3;
          if (v17 + 3 >= v10)
            goto LABEL_28;
          v18 = *(_QWORD *)(v6 + 8 * v12);
          if (!v18)
          {
            v12 = v17 + 4;
            if (v17 + 4 >= v10)
              goto LABEL_28;
            v18 = *(_QWORD *)(v6 + 8 * v12);
            if (!v18)
              break;
          }
        }
      }
    }
LABEL_27:
    v9 = (v18 - 1) & v18;
    v14 = __clz(__rbit64(v18)) + (v12 << 6);
LABEL_8:
    sub_10000D66C(*(_QWORD *)(v5 + 56) + 40 * v14, (uint64_t)v23);
    sub_10000C5DC(v23, (uint64_t)v20);
    v15 = v21;
    v16 = v22;
    sub_10000D648(v20, v21);
    dispatch thunk of CanvasContentProviderBox.invalidateProviders()(v15, v16);
    result = sub_10000D6B0(v20);
  }
  v19 = v17 + 5;
  if (v19 >= v10)
  {
LABEL_28:
    swift_release(v5);
    return swift_bridgeObjectRelease(v5);
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v12 = v19;
    goto LABEL_27;
  }
  while (1)
  {
    v12 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v12 >= v10)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v12);
    ++v19;
    if (v18)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000F0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t updated;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t ObjectType;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char v98[16];
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[3];
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  v12 = v11;
  v88 = a8;
  v85 = a7;
  v91 = a6;
  v90 = a5;
  v89 = a2;
  v16 = type metadata accessor for ExecutionLane(0);
  v92 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v93 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = type metadata accessor for ContentKey(0);
  v87 = *(_QWORD *)(v95 - 8);
  __chkstk_darwin(v95);
  v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = type metadata accessor for Logger(0);
  v83 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v97 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 113, 25, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, 2);
  v99 = a3;
  v100 = a4;
  v101 = v12;
  swift_beginAccess(v12 + 5, v104, 33, 0);
  v21 = sub_100006658(&qword_10005F678);
  v22 = sub_100010E58();
  KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)(&v107, a1, sub_100010E20, v98, v21, v22);
  swift_endAccess(v104);
  sub_10000D66C((uint64_t)&v107, (uint64_t)v104);
  v24 = v12[3];
  v23 = v12[4];
  updated = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
  swift_allocObject(updated, *(unsigned int *)(updated + 48), *(unsigned __int16 *)(updated + 52));
  swift_unknownObjectRetain(v24);
  swift_retain(a11);
  v26 = sub_100011810((uint64_t)v104, v24, v23, a10, a11);
  swift_unknownObjectRelease(v24);
  swift_release(a11);
  v27 = v12[2];
  v96 = updated;
  v28 = v19;
  if (v27)
  {
    v104[0] = v27;
    v29 = sub_100006618(&qword_10005F688, type metadata accessor for CanvasUpdater.UpdateDelegate, (uint64_t)&unk_1000402E0);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 121, 42, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, 2, updated, v29);
    v30 = v12[2];
  }
  else
  {
    v30 = 0;
  }
  v86 = a9;
  v12[2] = v26;
  swift_retain(v26);
  v31 = swift_release(v30);
  v32 = v97;
  static Logger.uv.getter(v31);
  v33 = v87;
  v34 = v95;
  (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v28, a1, v95);
  sub_10000D66C((uint64_t)&v107, (uint64_t)v104);
  v35 = swift_retain_n(v12, 2);
  v36 = Logger.logObject.getter(v35);
  v37 = static os_log_type_t.default.getter();
  v82 = v37;
  v38 = os_log_type_enabled(v36, v37);
  v94 = v16;
  if (v38)
  {
    v39 = swift_slowAlloc(32, -1);
    v81 = swift_slowAlloc(96, -1);
    v103 = v81;
    *(_DWORD *)v39 = 136446722;
    ObjectType = swift_getObjectType(v24);
    v41 = dispatch thunk of PreviewShellScene.identifier.getter(ObjectType, *(_QWORD *)(*(_QWORD *)(v23 + 8) + 8));
    v43 = v42;
    v102 = sub_100010F78(v41, v42, &v103);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v102, &v103, v39 + 4);
    swift_release_n(v12, 2);
    swift_bridgeObjectRelease(v43);
    *(_WORD *)(v39 + 12) = 2082;
    v44 = sub_100006618(&qword_10005F6A0, (uint64_t (*)(uint64_t))&type metadata accessor for ContentKey, (uint64_t)&protocol conformance descriptor for ContentKey);
    v45 = v95;
    v46 = dispatch thunk of CustomStringConvertible.description.getter(v95, v44);
    v48 = v47;
    v102 = sub_100010F78(v46, v47, &v103);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v102, &v103, v39 + 14);
    swift_bridgeObjectRelease(v48);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v45);
    *(_WORD *)(v39 + 22) = 2082;
    v50 = v105;
    v49 = v106;
    sub_10000D648(v104, v105);
    v51 = dispatch thunk of CustomStringConvertible.description.getter(v50, *(_QWORD *)(v49 + 8));
    v53 = v52;
    v102 = sub_100010F78(v51, v52, &v103);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v102, &v103, v39 + 24);
    swift_bridgeObjectRelease(v53);
    sub_10000D6B0(v104);
    _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v82, "Canvas %{public}s performing update for %{public}s using %{public}s", (uint8_t *)v39, 0x20u);
    v54 = v81;
    swift_arrayDestroy(v81, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v54, -1, -1);
    swift_slowDealloc(v39, -1, -1);

    (*(void (**)(char *, uint64_t))(v83 + 8))(v97, v84);
  }
  else
  {
    swift_release_n(v12, 2);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v34);
    sub_10000D6B0(v104);

    (*(void (**)(char *, uint64_t))(v83 + 8))(v32, v84);
  }
  v55 = v96;
  v56 = v85;
  sub_100006658(&qword_10005F690);
  LOBYTE(v79) = 2;
  v97 = (char *)static Future.create(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 128, 89, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, v79);
  v58 = v57;
  v95 = v57;
  v59 = v108;
  v60 = v109;
  sub_10000D648(&v107, v108);
  v61 = (_QWORD *)swift_allocObject(&unk_1000525F0, 48, 7);
  v62 = v86;
  v61[2] = v88;
  v61[3] = v62;
  v61[4] = v26;
  v61[5] = v12;
  v105 = v55;
  v106 = sub_100006618(&qword_10005F698, type metadata accessor for CanvasUpdater.UpdateDelegate, (uint64_t)&unk_100040308);
  v104[0] = v26;
  swift_retain_n(v26, 2);
  swift_retain(v12);
  swift_retain(v62);
  v63 = dispatch thunk of CanvasContentProviderBox.performUpdate(using:providerPromise:updatePayload:controlStates:agentContext:makeSceneContext:delegate:)(v89, v58, v90, v91, v56, sub_100011A18, v61, v104, v59, v60);
  swift_release(v61);
  sub_10000D6B0(v104);
  v64 = swift_allocObject(&unk_100052618, 32, 7);
  *(_QWORD *)(v64 + 16) = v12;
  *(_QWORD *)(v64 + 24) = v26;
  swift_retain(v26);
  v65 = swift_retain(v12);
  v66 = v93;
  static ExecutionLane.any.getter(v65);
  v67 = type metadata accessor for SceneLayout(0);
  v91 = v26;
  v68 = Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 143, 54, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, 2, v66, sub_100011A50, v64, v67);
  swift_release(v64);
  v69 = *(void (**)(char *, uint64_t))(v92 + 8);
  v70 = v94;
  v69(v66, v94);
  sub_100006658(&qword_10005F000);
  LOBYTE(v78) = 2;
  v71 = static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 147, 38, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, v78, v63, v68);
  static ExecutionLane.any.getter(v71);
  v72 = type metadata accessor for CanvasUpdater.UpdateResult(0);
  LOBYTE(v77) = 2;
  v73 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 148, 25, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, v77, v66, sub_100010298, 0, v72);
  swift_release(v71);
  v69(v66, v70);
  v74 = v91;
  v104[0] = v91;
  v75 = sub_100006618(&qword_10005F688, type metadata accessor for CanvasUpdater.UpdateDelegate, (uint64_t)&unk_1000402E0);
  swift_retain(v73);
  Invalidatable.onInvalidation(_:)(sub_100011AB0, v73, v96, v75);
  swift_release(v74);
  swift_release(v73);
  swift_release(v97);
  swift_release(v95);
  swift_release(v63);
  swift_release(v68);
  sub_10000D6B0(&v107);
  return v73;
}

uint64_t sub_10000F9C8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char v4;

  v1 = (_QWORD *)(a1
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  v2 = *(_QWORD *)(a1
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  *v1 = 0;
  v1[1] = 0;
  swift_unknownObjectRelease(v2);
  v4 = 2;
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 42, 44, "init(providerBox:scene:didUpdate:)", 34, v4);
}

uint64_t sub_10000FA48(uint64_t a1)
{
  uint64_t updated;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  updated = type metadata accessor for SceneUpdateSeed(0);
  v3 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 49, 29, "perform(handshake:)", 19, 2);
  SceneUpdateHandshake.updateSeed.getter(v6);
  v7 = sub_100006618(&qword_10005F6D0, (uint64_t (*)(uint64_t))&type metadata accessor for SceneUpdateSeed, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  dispatch thunk of RawRepresentable.rawValue.getter(&v13, updated, v7);
  dispatch thunk of RawRepresentable.rawValue.getter(&v12, updated, v7);
  v9 = v12;
  v8 = v13;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, updated);
  if (v8 == v9)
    return Promise.trySucceed(with:)(a1);
  return result;
}

uint64_t sub_10000FB90(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v3 = v2 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene;
  v4 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  if (v4)
  {
    v6 = result;
    v7 = *(_QWORD *)(v3 + 8);
    ObjectType = swift_getObjectType(v4);
    v9 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v7 + 16);
    swift_unknownObjectRetain(v4);
    v9(v12, ObjectType, v7);
    swift_unknownObjectRelease(v4);
    v10 = v13;
    v11 = v14;
    sub_10000D648(v12, v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v6, a2, v10, v11);
    return sub_10000D6B0(v12);
  }
  return result;
}

uint64_t sub_10000FC44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  sub_100011DB4(v1 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_providerBox, (uint64_t)v11);
  v3 = v12;
  if (v12)
  {
    v4 = v13;
    sub_10000D648(v11, v12);
    dispatch thunk of CanvasContentProviderBox.notePreviewCrashed(pid:)(a1, v3, v4);
    result = sub_10000D6B0(v11);
  }
  else
  {
    result = sub_100011E04((uint64_t)v11);
  }
  v6 = v1 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene;
  v7 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  if (v7)
  {
    v8 = *(_QWORD *)(v6 + 8);
    ObjectType = swift_getObjectType(v7);
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24);
    swift_unknownObjectRetain(v7);
    v10(a1, ObjectType, v8);
    return swift_unknownObjectRelease(v7);
  }
  return result;
}

uint64_t sub_10000FD18()
{
  _QWORD *v0;
  char *v1;
  uint64_t updated;

  swift_release(v0[2]);
  v1 = (char *)v0
     + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_seed;
  updated = type metadata accessor for SceneUpdateSeed(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v1, updated);
  swift_release(*(_QWORD *)((char *)v0
                          + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_didUpdate
                          + 8));
  sub_100011E04((uint64_t)v0+ OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_providerBox);
  swift_unknownObjectRelease(*(_QWORD *)((char *)v0
                                       + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene));
  swift_release(*(_QWORD *)((char *)v0
                          + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_handshakeFuture));
  swift_release(*(_QWORD *)((char *)v0
                          + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_handshakePromise));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_10000FDC4(uint64_t a1)
{
  return sub_10000FA48(a1);
}

uint64_t sub_10000FDE4(uint64_t a1, uint64_t a2)
{
  return sub_10000FB90(a1, a2);
}

void sub_10000FE04()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);

  v1 = (_QWORD *)(*v0
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  v2 = *v1;
  if (*v1)
  {
    v3 = v1[1];
    ObjectType = swift_getObjectType(*v1);
    v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
    swift_unknownObjectRetain(v2);
    v5(ObjectType, v3);
    swift_unknownObjectRelease(v2);
  }
}

void sub_10000FE78()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);

  v1 = (_QWORD *)(*v0
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  v2 = *v1;
  if (*v1)
  {
    v3 = v1[1];
    ObjectType = swift_getObjectType(*v1);
    v5 = *(void (**)(uint64_t, uint64_t))(v3 + 56);
    swift_unknownObjectRetain(v2);
    v5(ObjectType, v3);
    swift_unknownObjectRelease(v2);
  }
}

uint64_t sub_10000FEEC(uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v2 = (_QWORD *)(*v1
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    v5 = v2[1];
    ObjectType = swift_getObjectType(*v2);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 64);
    swift_unknownObjectRetain(v3);
    v7(v4, ObjectType, v5);
    return swift_unknownObjectRelease(v3);
  }
  return result;
}

void sub_10000FF74()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);

  v1 = (_QWORD *)(*v0
                + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  v2 = *v1;
  if (*v1)
  {
    v3 = v1[1];
    ObjectType = swift_getObjectType(*v1);
    v5 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
    swift_unknownObjectRetain(v2);
    v5(ObjectType, v3);
    swift_unknownObjectRelease(v2);
  }
}

uint64_t sub_10000FFE8(uint64_t a1)
{
  return sub_10000FC44(a1);
}

uint64_t sub_100010008@<X0>(_QWORD *a1@<X0>, void (*a2)(_QWORD *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t updated;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t ObjectType;
  uint64_t v26;
  char *v27;
  _QWORD v29[2];
  void (*v30)(_QWORD *);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];

  v33 = a5;
  v34 = a6;
  v30 = a2;
  v31 = a4;
  v29[1] = a3;
  v7 = type metadata accessor for PreviewSceneRole(0);
  __chkstk_darwin(v7);
  v32 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateSeed(0);
  v10 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SceneUpdateTiming(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)v29 - v18;
  v20 = a1[3];
  v21 = a1[4];
  v22 = sub_10000D648(a1, v20);
  v35[3] = v20;
  v35[4] = *(_QWORD *)(v21 + 8);
  v23 = sub_100011B40(v35);
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v23, v22, v20);
  v30(v35);
  sub_10000D6B0(v35);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v31 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_seed, updated);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  v24 = *(_QWORD *)(v33 + 32);
  ObjectType = swift_getObjectType(*(_QWORD *)(v33 + 24));
  v26 = *(_QWORD *)(*(_QWORD *)(v24 + 8) + 8);
  v27 = v32;
  dispatch thunk of PreviewShellScene.role.getter(ObjectType, v26);
  SceneUpdateContext.init(seed:timing:role:)(v12, v17, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
}

uint64_t sub_1000101EC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[5];

  v5 = a1[3];
  v6 = a1[4];
  v7 = sub_10000D648(a1, v5);
  v12[3] = v5;
  v8 = *(_QWORD *)(v6 + 8);
  v12[4] = v8;
  v9 = sub_100011B40(v12);
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v9, v7, v5);
  v10 = sub_1000115C8(a3, (uint64_t)v9, a2, v5, v8);
  sub_10000D6B0(v12);
  return v10;
}

uint64_t sub_100010298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t updated;

  v4 = a1 + *(int *)(sub_100006658(&qword_10005F6B0) + 48);
  v5 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
  v6 = a2 + *(int *)(type metadata accessor for CanvasUpdater.UpdateResult(0) + 20);
  updated = type metadata accessor for CanvasUpdateOutput(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 16))(v6, a1, updated);
}

uint64_t sub_100010320(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t updated;
  void *v12;
  uint64_t v13;
  uint64_t ObjectType;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  __int128 v28[2];
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = type metadata accessor for ExecutionLane(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = SceneUpdateHandshake.fenceHandle.getter(v8);
  if (updated)
  {
    v12 = (void *)updated;
    v13 = *(_QWORD *)(v2 + 32);
    ObjectType = swift_getObjectType(*(_QWORD *)(v2 + 24));
    v15 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter(ObjectType, *(_QWORD *)(*(_QWORD *)(v13 + 8) + 8));
    objc_msgSend(v12, "applyToScene:", v15);

  }
  v16 = *(_QWORD *)(v3 + 24);
  v17 = *(_QWORD *)(v3 + 32);
  v18 = swift_getObjectType(v16);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v17 + 16))(v29, v18, v17);
  v19 = v30;
  v20 = v31;
  sub_10000D648(v29, v30);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 8))(a1, v19, v20);
  sub_10000D66C(a2, (uint64_t)v28);
  v22 = swift_allocObject(&unk_1000526E0, 56, 7);
  v23 = sub_10000C5DC(v28, v22 + 16);
  static ExecutionLane.any.getter(v23);
  v24 = type metadata accessor for SceneUpdateTiming(0);
  v27 = 2;
  v25 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 217, 19, "resolveHandshake(_:with:)", 25, v27, v10, sub_100011CC8, v22, v24);
  swift_release(v21);
  swift_release(v22);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_10000D6B0(v29);
  return v25;
}

uint64_t sub_1000104F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v5 = type metadata accessor for ExecutionLane(0);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SceneLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = __chkstk_darwin(v8);
  v12 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (uint64_t *)((char *)&v25 - v13);
  assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 239, 25, "completeHandshake(for:with:)", 28, 2);
  (*(void (**)(uint64_t))(a1
                                  + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_didUpdate))(a2);
  v15 = *(_QWORD *)(v2 + 32);
  ObjectType = swift_getObjectType(*(_QWORD *)(v2 + 24));
  sub_100010A54(ObjectType, *(_QWORD *)(*(_QWORD *)(v15 + 8) + 8), v14);
  sub_100011C2C();
  v17 = static CATransaction.afterSynchronize()();
  (*(void (**)(char *, _QWORD *, uint64_t))(v9 + 16))(v12, v14, v8);
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = (v18 + 16) & ~v18;
  v20 = swift_allocObject(&unk_100052690, v19 + v10, v18 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v20 + v19, v12, v8);
  v21 = swift_allocObject(&unk_1000526B8, 32, 7);
  *(_QWORD *)(v21 + 16) = sub_100011C74;
  *(_QWORD *)(v21 + 24) = v20;
  static ExecutionLane.any.getter(v21);
  v24 = 2;
  v22 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 246, 60, "completeHandshake(for:with:)", 28, v24, v7, sub_1000122C8, v21, v8);
  swift_release(v17);
  swift_release(v21);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v14, v8);
  return v22;
}

uint64_t sub_100010740(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t updated;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v4 = type metadata accessor for ExecutionLane(0);
  v27 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateTiming(0);
  v8 = *(_QWORD *)(updated - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(updated);
  v11 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v26 - v12;
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v14((char *)&v26 - v12, a1, updated);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v13, updated);
  if (v15 == enum case for SceneUpdateTiming.fenced(_:))
  {
    sub_100006658(&qword_10005F120);
    return static Future.succeeded(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 221, 38, "resolveHandshake(_:with:)", 25, 2, a1);
  }
  else if (v15 == enum case for SceneUpdateTiming.async(_:))
  {
    v26 = v4;
    v17 = a2[3];
    v18 = a2[4];
    sub_10000D648(a2, v17);
    v19 = dispatch thunk of CanvasContentHost.confirmReadyForDisplayAfterAsyncResize()(v17, v18);
    v14(v11, a1, updated);
    v20 = *(unsigned __int8 *)(v8 + 80);
    v21 = (v20 + 16) & ~v20;
    v22 = swift_allocObject(&unk_100052708, v21 + v9, v20 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v22 + v21, v11, updated);
    v23 = swift_allocObject(&unk_100052730, 32, 7);
    *(_QWORD *)(v23 + 16) = sub_100011D40;
    *(_QWORD *)(v23 + 24) = v22;
    static ExecutionLane.any.getter();
    v16 = Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 227, 37, "resolveHandshake(_:with:)", 25, 2, v6, sub_100011D94, v23, updated);
    swift_release(v19);
    swift_release(v23);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v26);
  }
  else
  {
    sub_100006658(&qword_10005F120);
    v24 = SceneUpdateTiming.unknownTimingError.getter();
    v16 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 230, 35, "resolveHandshake(_:with:)", 25, 2, v24);
    swift_errorRelease(v24);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, updated);
  }
  return v16;
}

void sub_100010A54(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v4 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter(a1, a2);
  v5 = objc_msgSend(v4, "_FBSScene");

  v25 = objc_msgSend(v5, "settings");
  v6 = objc_opt_self(UVPreviewSceneSettings);
  v7 = (void *)swift_dynamicCastObjCClass(v25, v6);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "previewSceneLayout");
    if (v9 == (id)1)
    {
      objc_msgSend(v8, "frame");
      v15 = v14;
      v17 = v16;

      *a3 = v15;
      a3[1] = v17;
      v18 = (unsigned int *)&enum case for SceneLayout.custom(_:);
LABEL_17:
      v23 = *v18;
      v24 = type metadata accessor for SceneLayout(0);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(a3, v23, v24);
      return;
    }
    if (!v9)
    {
      v10 = objc_msgSend(v8, "interfaceOrientation");

      switch((unint64_t)v10)
      {
        case 2uLL:
          v11 = (unsigned int *)&enum case for PreviewTraits.Orientation.portraitUpsideDown(_:);
          break;
        case 3uLL:
          v11 = (unsigned int *)&enum case for PreviewTraits.Orientation.landscapeRight(_:);
          break;
        case 4uLL:
          v11 = (unsigned int *)&enum case for PreviewTraits.Orientation.landscapeLeft(_:);
          break;
        default:
          v11 = (unsigned int *)&enum case for PreviewTraits.Orientation.portrait(_:);
          break;
      }
      v21 = *v11;
      v22 = type metadata accessor for PreviewTraits.Orientation(0);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(a3, v21, v22);
      v18 = (unsigned int *)&enum case for SceneLayout.device(_:);
      goto LABEL_17;
    }
    if (qword_10005ECF8 != -1)
      swift_once(&qword_10005ECF8, sub_100031938);
    v19 = type metadata accessor for SceneLayout(0);
    v20 = sub_10000C53C(v19, (uint64_t)qword_1000641D8);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(a3, v20, v19);

  }
  else
  {

    if (qword_10005ECF8 != -1)
      swift_once(&qword_10005ECF8, sub_100031938);
    v12 = type metadata accessor for SceneLayout(0);
    v13 = sub_10000C53C(v12, (uint64_t)qword_1000641D8);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a3, v13, v12);
  }
}

uint64_t sub_100010CE4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_unknownObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for CanvasUpdater()
{
  return objc_opt_self(_TtC12PreviewShell13CanvasUpdater);
}

uint64_t sub_100010D38()
{
  return type metadata accessor for CanvasUpdater.UpdateDelegate(0);
}

uint64_t type metadata accessor for CanvasUpdater.UpdateDelegate(uint64_t a1)
{
  return sub_100011A7C(a1, qword_10005F5B8, (uint64_t)&nominal type descriptor for CanvasUpdater.UpdateDelegate);
}

uint64_t sub_100010D54(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  result = type metadata accessor for SceneUpdateSeed(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = (char *)&value witness table for () + 64;
    v4[3] = "(";
    v4[4] = &unk_100040298;
    v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100010DF4()
{
  return sub_100006618(&qword_10005F670, type metadata accessor for CanvasUpdater.UpdateDelegate, (uint64_t)&unk_1000402B0);
}

uint64_t sub_100010E20()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(*(_QWORD *)(v0 + 32) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) + 32) + 8));
}

unint64_t sub_100010E58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005F680;
  if (!qword_10005F680)
  {
    v1 = sub_1000066E4(&qword_10005F678);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_10005F680);
  }
  return result;
}

uint64_t sub_100010EA4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100010EB4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100010EE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100010F08(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_100010F78(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_100010F78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100011048(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100011B00((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100011B00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000D6B0(v12);
  return v7;
}

uint64_t sub_100011048(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100011200(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100011200(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100011294(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10001146C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10001146C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100011294(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100011408(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100011408(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100006658(&qword_10005F6A8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10001146C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100006658(&qword_10005F6A8);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_BYTE **sub_1000115B8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1000115C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t updated;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  int v26;
  __int128 v27[2];
  _QWORD v28[5];

  v10 = type metadata accessor for ExecutionLane(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[3] = a4;
  v28[4] = a5;
  v14 = sub_100011B40(v28);
  v15 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(v14, a2, a4);
  static ExecutionLane.main.getter(v15);
  sub_10000D66C((uint64_t)v28, (uint64_t)v27);
  v16 = swift_allocObject(&unk_100052640, 64, 7);
  *(_QWORD *)(v16 + 16) = a3;
  sub_10000C5DC(v27, v16 + 24);
  updated = type metadata accessor for SceneUpdateTiming(0);
  swift_retain(a3);
  v25 = 2;
  v18 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 203, 18, "performHandshake(for:with:)", 27, v25, v13, sub_100011BA8, v16, updated);
  swift_release(v16);
  v19 = *(uint64_t (**)(char *, uint64_t))(v11 + 8);
  v20 = v19(v13, v10);
  static ExecutionLane.main.getter(v20);
  sub_10000D66C((uint64_t)v28, (uint64_t)v27);
  v21 = swift_allocObject(&unk_100052668, 72, 7);
  *(_QWORD *)(v21 + 16) = a3;
  *(_QWORD *)(v21 + 24) = a1;
  sub_10000C5DC(v27, v21 + 32);
  v22 = type metadata accessor for SceneLayout(0);
  swift_retain(a3);
  swift_retain(a1);
  LOBYTE(v26) = 2;
  v23 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 206, 18, "performHandshake(for:with:)", 27, v26, v13, sub_100011C04, v21, v22);
  swift_release(v18);
  swift_release(v21);
  v19(v13, v10);
  sub_10000D6B0(v28);
  return v23;
}

_QWORD *sub_100011810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  int v20;
  uint64_t v21;

  v6 = v5;
  v21 = *v5;
  v12 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v19 = 2;
  v5[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 24, 52, "UpdateDelegate", 14, v19, 0, 0);
  SceneUpdateSeed.init()();
  v13 = (_QWORD *)((char *)v5
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_scene);
  *v13 = 0;
  v13[1] = 0;
  sub_100011DB4(a1, (uint64_t)v5+ OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_providerBox);
  v14 = *v13;
  *v13 = a2;
  v13[1] = a3;
  swift_unknownObjectRetain(a2);
  swift_unknownObjectRelease(v14);
  v15 = (_QWORD *)((char *)v6
                 + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_didUpdate);
  *v15 = a4;
  v15[1] = a5;
  sub_100006658(&qword_10005F6C8);
  swift_retain(a5);
  LOBYTE(v20) = 2;
  *(_QWORD *)((char *)v6
            + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_handshakeFuture) = static Future.create(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 38, 96, "init(providerBox:scene:didUpdate:)", 34, v20);
  *(_QWORD *)((char *)v6
            + OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_handshakePromise) = v16;
  v17 = sub_100006618(&qword_10005F688, type metadata accessor for CanvasUpdater.UpdateDelegate, (uint64_t)&unk_1000402E0);
  swift_retain(v6);
  Invalidatable.onInvalidation(_:)(sub_100011DFC, v6, v21, v17);
  swift_release(v6);
  sub_100011E04(a1);
  return v6;
}

uint64_t sub_1000119E4()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100011A18@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100010008(a1, *(void (**)(_QWORD *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t sub_100011A24()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011A50(_QWORD *a1)
{
  uint64_t v1;

  return sub_1000101EC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t type metadata accessor for CanvasUpdater.UpdateResult(uint64_t a1)
{
  return sub_100011A7C(a1, qword_10005F730, (uint64_t)&nominal type descriptor for CanvasUpdater.UpdateResult);
}

uint64_t sub_100011A7C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100011AB0()
{
  char v1;

  v1 = 2;
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 153, 32, "update(contentKey:connector:makeProviderBox:updatePayload:controlStates:agentContext:willUpdate:didUpdate:)", 107, v1);
}

uint64_t sub_100011B00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_100011B40(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_100011B7C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  sub_10000D6B0((_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100011BA8(uint64_t a1)
{
  uint64_t v1;

  return sub_100010320(a1, v1 + 24);
}

uint64_t sub_100011BD0()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  sub_10000D6B0(v0 + 4);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100011C04()
{
  uint64_t v0;

  return sub_1000104F4(*(_QWORD *)(v0 + 24), v0 + 32);
}

unint64_t sub_100011C2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005F6B8;
  if (!qword_10005F6B8)
  {
    v1 = objc_opt_self(CATransaction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005F6B8);
  }
  return result;
}

uint64_t sub_100011C68()
{
  return sub_100011CDC((uint64_t (*)(_QWORD))&type metadata accessor for SceneLayout);
}

uint64_t sub_100011C74@<X0>(uint64_t a1@<X8>)
{
  return sub_100011D4C((uint64_t (*)(_QWORD))&type metadata accessor for SceneLayout, a1);
}

uint64_t sub_100011C80()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011CA4()
{
  uint64_t v0;

  sub_10000D6B0((_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100011CC8(uint64_t a1)
{
  uint64_t v1;

  return sub_100010740(a1, (_QWORD *)(v1 + 16));
}

uint64_t sub_100011CD0()
{
  return sub_100011CDC((uint64_t (*)(_QWORD))&type metadata accessor for SceneUpdateTiming);
}

uint64_t sub_100011CDC(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16) & ~v4;
  v6 = v5 + *(_QWORD *)(v3 + 64);
  v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100011D40@<X0>(uint64_t a1@<X8>)
{
  return sub_100011D4C((uint64_t (*)(_QWORD))&type metadata accessor for SceneUpdateTiming, a1);
}

uint64_t sub_100011D4C@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2+ ((*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80)), v4);
}

uint64_t sub_100011D94()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100011DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005F6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011DFC()
{
  uint64_t v0;

  return sub_10000F9C8(v0);
}

uint64_t sub_100011E04(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_10005F6C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_100011E44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t updated;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = type metadata accessor for SceneLayout(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    updated = type metadata accessor for CanvasUpdateOutput(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(updated - 8) + 16))(v9, v10, updated);
  }
  return a1;
}

uint64_t sub_100011EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t updated;

  v4 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  updated = type metadata accessor for CanvasUpdateOutput(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v5, updated);
}

uint64_t sub_100011F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for CanvasUpdateOutput(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 16))(v8, v9, updated);
  return a1;
}

uint64_t sub_100011FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for CanvasUpdateOutput(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 24))(v8, v9, updated);
  return a1;
}

uint64_t sub_100012040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for CanvasUpdateOutput(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 32))(v8, v9, updated);
  return a1;
}

uint64_t sub_1000120BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for CanvasUpdateOutput(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 40))(v8, v9, updated);
  return a1;
}

uint64_t sub_100012138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012144);
}

uint64_t sub_100012144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t updated;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for SceneLayout(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    updated = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    updated = type metadata accessor for CanvasUpdateOutput(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 48);
  }
  return v9(v10, a2, updated);
}

uint64_t sub_1000121B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000121C4);
}

uint64_t sub_1000121C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for SceneLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    updated = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    updated = type metadata accessor for CanvasUpdateOutput(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 56);
  }
  return v11(v12, a2, a2, updated);
}

uint64_t sub_100012240(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[2];

  result = type metadata accessor for SceneLayout(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for CanvasUpdateOutput(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000122CC()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for SimDisplaySceneRegistry();
  result = swift_initStaticObject(v0, &unk_10005ED10);
  qword_100064158 = result;
  return result;
}

uint64_t sub_100012304()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SimDisplaySceneRegistry()
{
  return objc_opt_self(_TtC12PreviewShell23SimDisplaySceneRegistry);
}

ValueMetadata *type metadata accessor for SimDisplaySceneRegistry.UnsupportedOnDevice()
{
  return &type metadata for SimDisplaySceneRegistry.UnsupportedOnDevice;
}

uint64_t sub_100012344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  void *object;
  unint64_t v32;
  NSString v33;
  id v34;
  void *v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  _QWORD *v47;
  id v48;
  id v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  objc_class *v68;
  char *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t ObjectType;
  uint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  objc_super v90;
  void **v91;
  unint64_t v92;
  void **aBlock;
  unint64_t v94;
  void (*v95)(uint64_t, void *);
  void *v96;
  id (*v97)(void *);
  uint64_t v98;
  uint64_t v99;

  v4 = v3;
  v88 = a3;
  v84 = a2;
  ObjectType = swift_getObjectType(v4);
  v6 = type metadata accessor for SceneCrashedStyle(0);
  v80 = *(_QWORD *)(v6 - 8);
  v81 = v6;
  __chkstk_darwin(v6);
  v79 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = type metadata accessor for PreviewSceneRole(0);
  v77 = *(_QWORD *)(v99 - 8);
  v8 = __chkstk_darwin(v99);
  v86 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v87 = (char *)&v70 - v11;
  v12 = __chkstk_darwin(v10);
  v74 = (char *)&v70 - v13;
  __chkstk_darwin(v12);
  v85 = (char *)&v70 - v14;
  v78 = type metadata accessor for SceneStoppedStyle(0);
  v76 = *(_QWORD *)(v78 - 8);
  __chkstk_darwin(v78);
  v75 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Identifier(0);
  v82 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView;
  *(_QWORD *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView] = 0;
  v20 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController;
  *(_QWORD *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController] = 0;
  v21 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController;
  *(_QWORD *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController] = 0;
  v72 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer;
  *(_QWORD *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer] = 0;
  v73 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage;
  *(_QWORD *)&v4[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = 0;
  v89 = v4;
  v22 = a1;
  v23 = (void *)PreviewSceneAgentProxy.scene.getter();
  v24 = objc_msgSend(v23, "scene");

  v25 = objc_msgSend(v24, "uiPresentationManager");
  if (!v25)
  {
    v46 = sub_1000141B4();
    swift_allocError(&type metadata for RemoteContentViewController.InvalidSceneError, v46, 0, 0);
    *v47 = v24;
    v48 = v24;
    swift_willThrow(v48);

    swift_release(v22);
    swift_unknownObjectRelease(v84);

    swift_release(*(_QWORD *)&v4[v72]);
    v49 = *(id *)&v4[v73];
    v50 = v89;

    swift_deallocPartialClassInstance(v50, ObjectType, *(unsigned int *)((swift_isaMask & *(_QWORD *)v50) + 0x30), *(unsigned __int16 *)((swift_isaMask & *(_QWORD *)v50) + 0x34));
    return (uint64_t)v49;
  }
  v72 = (uint64_t)v24;
  v73 = v22;
  v26 = v84;
  aBlock = 0;
  v94 = 0xE000000000000000;
  v27 = v25;
  _StringGuts.grow(_:)(25);
  v28 = swift_bridgeObjectRelease(v94);
  aBlock = (void **)0xD000000000000017;
  v94 = 0x8000000100046710;
  Identifier.init()(v28);
  v29 = sub_100006618(&qword_10005F888, (uint64_t (*)(uint64_t))&type metadata accessor for Identifier, (uint64_t)&protocol conformance descriptor for Identifier);
  v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v16, v29);
  object = v30._object;
  String.append(_:)(v30);
  swift_bridgeObjectRelease(object);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v18, v16);
  v32 = v94;
  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  v71 = v27;
  v34 = objc_msgSend(v27, "createPresenterWithIdentifier:", v33);

  *(_QWORD *)&v89[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter] = v34;
  v97 = sub_100012B04;
  v98 = 0;
  aBlock = _NSConcreteStackBlock;
  v94 = 1107296256;
  v95 = sub_100012B14;
  v96 = &unk_1000527F0;
  v35 = _Block_copy(&aBlock);
  swift_release(v98);
  objc_msgSend(v34, "modifyPresentationContext:", v35);
  _Block_release(v35);
  result = swift_isEscapingClosureAtFileLocation(0, "", 123, 43, 50, 1);
  if ((result & 1) == 0)
  {
    v82 = swift_getObjectType(v26);
    dispatch thunk of PreviewShellScene.role.getter(v82, v88);
    v37 = enum case for PreviewSceneRole.hosted(_:);
    v38 = v77;
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 104);
    v40 = v74;
    v41 = v99;
    v39(v74, enum case for PreviewSceneRole.hosted(_:), v99);
    v42 = sub_100006618((unint64_t *)&unk_10005F890, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewSceneRole, (uint64_t)&protocol conformance descriptor for PreviewSceneRole);
    dispatch thunk of RawRepresentable.rawValue.getter(&aBlock, v41, v42);
    dispatch thunk of RawRepresentable.rawValue.getter(&v91, v41, v42);
    v43 = v94;
    v44 = v92;
    if (aBlock == v91 && v94 == v92)
    {
      v45 = 1;
      v44 = v94;
    }
    else
    {
      v45 = _stringCompareWithSmolCheck(_:_:expecting:)(aBlock, v94, v91, v92, 0);
    }
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(v44);
    v51 = *(void (**)(char *, uint64_t))(v38 + 8);
    v52 = v99;
    v51(v40, v99);
    v53 = ((uint64_t (*)(char *, uint64_t))v51)(v85, v52);
    v54 = v75;
    if ((v45 & 1) != 0)
    {
      v55 = v82;
      v56 = v88;
      dispatch thunk of PreviewShellScene.stoppedStyle.getter(v82, v88);
    }
    else
    {
      static SceneStoppedStyle.none.getter(v53);
      v56 = v88;
      v55 = v82;
    }
    (*(void (**)(char *, char *, uint64_t))(v76 + 32))(&v89[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle], v54, v78);
    dispatch thunk of PreviewShellScene.role.getter(v55, v56);
    v57 = v37;
    v58 = v99;
    v39(v86, v57, v99);
    dispatch thunk of RawRepresentable.rawValue.getter(&aBlock, v58, v42);
    dispatch thunk of RawRepresentable.rawValue.getter(&v91, v58, v42);
    v59 = v94;
    v60 = v92;
    if (aBlock == v91 && v94 == v92)
    {
      swift_bridgeObjectRelease_n(v94, 2);
      v61 = v99;
      v51(v86, v99);
      v51(v87, v61);
      v62 = v73;
      v63 = (void *)v72;
    }
    else
    {
      v64 = _stringCompareWithSmolCheck(_:_:expecting:)(aBlock, v94, v91, v92, 0);
      swift_bridgeObjectRelease(v59);
      swift_bridgeObjectRelease(v60);
      v65 = v99;
      v51(v86, v99);
      v66 = ((uint64_t (*)(char *, uint64_t))v51)(v87, v65);
      v62 = v73;
      v63 = (void *)v72;
      if ((v64 & 1) == 0)
      {
        v67 = v79;
        static SceneCrashedStyle.none.getter(v66);
        goto LABEL_17;
      }
    }
    v67 = v79;
    dispatch thunk of PreviewShellScene.crashedStyle.getter(v82, v56);
LABEL_17:
    v68 = (objc_class *)ObjectType;
    v69 = v89;
    (*(void (**)(char *, char *, uint64_t))(v80 + 32))(&v89[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle], v67, v81);

    v90.receiver = v69;
    v90.super_class = v68;
    v49 = objc_msgSendSuper2(&v90, "initWithNibName:bundle:", 0, 0);

    swift_release(v62);
    swift_unknownObjectRelease(v26);
    return (uint64_t)v49;
  }
  __break(1u);
  return result;
}

id sub_100012B04(void *a1)
{
  return objc_msgSend(a1, "setAppearanceStyle:", 2);
}

void sub_100012B14(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id sub_100012B6C()
{
  char *v0;
  char *v1;
  id result;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v1 = v0;
  v8.receiver = v0;
  v8.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v8, "viewDidLoad");
  result = objc_msgSend(v0, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = result;
  v4 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter];
  objc_msgSend(v5, "activate");
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v6 = result;
  v7 = objc_msgSend(v5, "presentationView");
  objc_msgSend(v6, "addSubview:", v7);

  if (SceneStoppedStyle.snapshotStyle.getter() != 3)
    return (id)sub_100012CD4(0.1);
  result = (id)SceneCrashedStyle.snapshotStyle.getter();
  if (result != 3)
    return (id)sub_100012CD4(0.1);
  return result;
}

uint64_t sub_100012CD4(Swift::Double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = type metadata accessor for DispatchScheduler(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer;
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer);
  if (v8)
  {
    swift_retain(v8);
    DelayedInvocation.cancel()();
    swift_release(v8);
  }
  sub_100006598();
  v9 = static OS_dispatch_queue.main.getter();
  DispatchScheduler.init(queue:)(v9);
  v10 = swift_allocObject(&unk_100052828, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v2);
  v11 = type metadata accessor for DelayedInvocation(0);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  v12 = DelayedInvocation.init<A>(scheduler:callback:)(v6, sub_100014234, v10, v4, &protocol witness table for DispatchScheduler);
  v13 = *(_QWORD *)(v2 + v7);
  *(_QWORD *)(v2 + v7) = v12;
  result = swift_release(v13);
  v15 = *(_QWORD *)(v2 + v7);
  if (v15)
  {
    swift_retain(*(_QWORD *)(v2 + v7));
    DelayedInvocation.schedule(delay:)(a1);
    return swift_release(v15);
  }
  return result;
}

void sub_100012E48()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  objc_super v62;

  v62.receiver = v0;
  v62.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v62, "viewDidLayoutSubviews");
  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter], "presentationView");
  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v3 = v2;
  objc_msgSend(v2, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v1, "setFrame:", v5, v7, v9, v11);
  v12 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView];
  if (!v12)
    goto LABEL_6;
  v13 = v12;
  v14 = objc_msgSend(v0, "view");
  if (!v14)
    goto LABEL_20;
  v15 = v14;
  objc_msgSend(v14, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v13, "setFrame:", v17, v19, v21, v23);
  v24 = objc_msgSend(v0, "view");
  if (!v24)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v25 = v24;
  objc_msgSend(v24, "bringSubviewToFront:", v13);

LABEL_6:
  v26 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController];
  if (!v26)
    goto LABEL_12;
  v27 = v26;
  v28 = objc_msgSend(v27, "view");
  if (!v28)
    goto LABEL_22;
  v29 = v28;
  v30 = objc_msgSend(v0, "view");
  if (!v30)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v31 = v30;
  objc_msgSend(v30, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v29, "setFrame:", v33, v35, v37, v39);
  v40 = objc_msgSend(v0, "view");
  if (!v40)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v41 = v40;
  v42 = objc_msgSend(v27, "view");
  if (!v42)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v43 = v42;
  objc_msgSend(v41, "bringSubviewToFront:", v42);

LABEL_12:
  v44 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController];
  if (!v44)
    return;
  v45 = v44;
  v46 = objc_msgSend(v45, "view");
  if (!v46)
    goto LABEL_26;
  v47 = v46;
  v48 = objc_msgSend(v0, "view");
  if (!v48)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v49 = v48;
  objc_msgSend(v48, "bounds");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;

  objc_msgSend(v47, "setFrame:", v51, v53, v55, v57);
  v58 = objc_msgSend(v0, "view");
  if (!v58)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v59 = v58;
  v60 = objc_msgSend(v45, "view");
  if (!v60)
  {
LABEL_29:
    __break(1u);
    return;
  }
  v61 = v60;
  objc_msgSend(v59, "bringSubviewToFront:", v60);

}

void sub_1000131F4()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v1 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView];
  if (v2)
    objc_msgSend(v2, "removeFromSuperview");
  v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter], "newSnapshotPresentationView");
  v4 = objc_msgSend(v0, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "addSubview:", v3);

    v6 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v3;

  }
  else
  {
    __break(1u);
  }
}

void sub_10001328C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  os_log_type_t v25;
  _QWORD *v26;
  os_log_type_t v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v1 = v0;
  v2 = type metadata accessor for SceneStoppedStyle(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController])
  {
    v51 = v3;
    static Logger.uv.getter(v8);
    v12 = v0;
    v13 = Logger.logObject.getter(v12);
    v50 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, (os_log_type_t)v50))
    {
      v46 = v13;
      v48 = v11;
      v49 = v1;
      v14 = swift_slowAlloc(32, -1);
      v44 = (_QWORD *)swift_slowAlloc(8, -1);
      v45 = swift_slowAlloc(64, -1);
      v53 = v45;
      *(_DWORD *)v14 = 136315650;
      v47 = v14 + 4;
      v15 = objc_msgSend(*(id *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter], "identifier");
      v16 = v2;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v19 = v18;

      v52 = sub_100010F78(v17, v19, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v47);

      swift_bridgeObjectRelease(v19);
      *(_WORD *)(v14 + 12) = 2080;
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v5, &v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle], v16);
      v47 = v16;
      v20 = String.init<A>(describing:)(v5, v16);
      v22 = v21;
      v52 = sub_100010F78(v20, v21, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v14 + 14);

      swift_bridgeObjectRelease(v22);
      *(_WORD *)(v14 + 22) = 2112;
      v23 = sub_10001377C();
      v24 = v23;
      if (v23)
        v52 = (uint64_t)v23;
      else
        v52 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v14 + 24);
      v25 = v50;
      v26 = v44;
      *v44 = v24;

      v27 = v25;
      v28 = v46;
      _os_log_impl((void *)&_mh_execute_header, v46, v27, "Showing stopped UI for %s using style %s with image %@", (uint8_t *)v14, 0x20u);
      v29 = sub_100006658(&qword_10005F2A8);
      swift_arrayDestroy(v26, 1, v29);
      swift_slowDealloc(v26, -1, -1);
      v30 = v45;
      swift_arrayDestroy(v45, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      v11 = v48;
      v1 = v49;
      v2 = v47;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    v31 = *(_QWORD *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer];
    if (v31)
    {
      swift_retain(*(_QWORD *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer]);
      DelayedInvocation.cancel()();
      swift_release(v31);
    }
    v32 = objc_msgSend(*(id *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter], "newSnapshot");
    v33 = objc_msgSend(v32, "CGImage");

    v34 = *(void **)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage];
    *(_QWORD *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = v33;

    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v5, &v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle], v2);
    v35 = sub_10001377C();
    v36 = objc_allocWithZone((Class)type metadata accessor for StoppedViewController(0));
    v37 = (void *)StoppedViewController.init(style:snapshotImage:)(v5, v35);
    objc_msgSend(v12, "addChildViewController:", v37);
    v38 = objc_msgSend(v12, "view");
    if (v38)
    {
      v39 = v38;
      v40 = objc_msgSend(v37, "view");
      if (v40)
      {
        v41 = v40;
        objc_msgSend(v39, "addSubview:", v40);

        objc_msgSend(v37, "didMoveToParentViewController:", v12);
        v42 = *(void **)&v1[v11];
        *(_QWORD *)&v1[v11] = v37;

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

id sub_10001377C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  id v10;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage);
  if (!v1)
    return 0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter);
  v3 = v1;
  v4 = objc_msgSend(v2, "scene");
  v5 = 2.0;
  if (v4)
  {
    v6 = v4;
    v7 = objc_msgSend(v4, "settings");

    v8 = objc_msgSend(v7, "displayConfiguration");
    if (v8)
    {
      objc_msgSend(v8, "pointScale");
      v5 = v9;

    }
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:scale:orientation:", v3, 0, v5);

  return v10;
}

void sub_10001387C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;

  v1 = v0;
  v2 = type metadata accessor for SceneCrashedStyle(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController])
  {
    static Logger.uv.getter(v8);
    v12 = v0;
    v13 = Logger.logObject.getter(v12);
    v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, (os_log_type_t)v47))
    {
      v43 = v13;
      v40 = v6;
      v45 = v11;
      v46 = v1;
      v14 = swift_slowAlloc(32, -1);
      v41 = (_QWORD *)swift_slowAlloc(8, -1);
      v42 = swift_slowAlloc(64, -1);
      v49 = v42;
      *(_DWORD *)v14 = 136315650;
      v44 = v14 + 4;
      v15 = objc_msgSend(*(id *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter], "identifier");
      v16 = v3;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v19 = v18;

      v48 = sub_100010F78(v17, v19, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v44);

      swift_bridgeObjectRelease(v19);
      *(_WORD *)(v14 + 12) = 2080;
      v44 = v16;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v5, &v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle], v2);
      v20 = String.init<A>(describing:)(v5, v2);
      v22 = v21;
      v48 = sub_100010F78(v20, v21, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v14 + 14);

      swift_bridgeObjectRelease(v22);
      *(_WORD *)(v14 + 22) = 2112;
      v23 = sub_10001377C();
      v24 = v23;
      if (v23)
        v48 = (uint64_t)v23;
      else
        v48 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v14 + 24);
      v25 = v40;
      v26 = v41;
      *v41 = v24;

      v27 = v43;
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v47, "Showing stopped UI for %s using style %s with image %@", (uint8_t *)v14, 0x20u);
      v28 = sub_100006658(&qword_10005F2A8);
      swift_arrayDestroy(v26, 1, v28);
      swift_slowDealloc(v26, -1, -1);
      v29 = v42;
      swift_arrayDestroy(v42, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v25);
      v11 = v45;
      v1 = v46;
      v3 = v44;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    v30 = *(_QWORD *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer];
    if (v30)
    {
      swift_retain(*(_QWORD *)&v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer]);
      DelayedInvocation.cancel()();
      swift_release(v30);
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v12[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle], v2);
    v31 = sub_10001377C();
    v32 = objc_allocWithZone((Class)type metadata accessor for CrashedViewController(0));
    v33 = (void *)CrashedViewController.init(style:snapshotImage:)(v5, v31);
    objc_msgSend(v12, "addChildViewController:", v33);
    v34 = objc_msgSend(v12, "view");
    if (v34)
    {
      v35 = v34;
      v36 = objc_msgSend(v33, "view");
      if (v36)
      {
        v37 = v36;
        objc_msgSend(v35, "addSubview:", v36);

        objc_msgSend(v33, "didMoveToParentViewController:", v12);
        v38 = *(void **)&v1[v11];
        *(_QWORD *)&v1[v11] = v33;

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_100013D1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (char *)Strong;
    v4 = objc_msgSend(*(id *)(Strong + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter), "newSnapshot");
    v5 = objc_msgSend(v4, "CGImage");

    v6 = *(void **)&v3[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage];
    *(_QWORD *)&v3[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = v5;

  }
  swift_beginAccess(v1, &v9, 0, 0);
  v7 = swift_unknownObjectWeakLoadStrong(v1);
  if (v7)
  {
    v8 = (void *)v7;
    sub_100012CD4(5.0);

  }
}

unint64_t sub_100013DEC(void *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;
  Swift::String v7;

  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease(0xE000000000000000);
  v2 = objc_msgSend(a1, "identifier");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v5);
  v7._countAndFlagsBits = 39;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  return 0xD000000000000016;
}

uint64_t sub_100013EA8(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "description");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);

  swift_bridgeObjectRelease(v5);
  return 0x203A656E656353;
}

unint64_t sub_100013F3C()
{
  void **v0;

  return sub_100013DEC(*v0);
}

uint64_t sub_100013F44()
{
  void **v0;

  return sub_100013EA8(*v0);
}

uint64_t sub_100013F4C()
{
  return 0;
}

uint64_t sub_100013F7C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014378();
  return HumanReadableError.errorDescription.getter(a1, v2);
}

uint64_t sub_100013FB0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014378();
  return HumanReadableError.description.getter(a1, v2);
}

uint64_t sub_1000140D0()
{
  return type metadata accessor for RemoteContentViewController(0);
}

uint64_t type metadata accessor for RemoteContentViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10005F868;
  if (!qword_10005F868)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RemoteContentViewController);
  return result;
}

uint64_t sub_100014114(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[8];

  v5[0] = "\b";
  v5[1] = &unk_100040458;
  result = type metadata accessor for SceneStoppedStyle(319);
  if (v3 <= 0x3F)
  {
    v5[2] = *(_QWORD *)(result - 8) + 64;
    v5[3] = &unk_100040458;
    result = type metadata accessor for SceneCrashedStyle(319);
    if (v4 <= 0x3F)
    {
      v5[4] = *(_QWORD *)(result - 8) + 64;
      v5[5] = &unk_100040458;
      v5[6] = &unk_100040458;
      v5[7] = &unk_100040458;
      result = swift_updateClassMetadata2(a1, 256, 8, v5, a1 + 80);
      if (!result)
        return 0;
    }
  }
  return result;
}

unint64_t sub_1000141B4()
{
  unint64_t result;

  result = qword_10005F880;
  if (!qword_10005F880)
  {
    result = swift_getWitnessTable(&unk_10004059C, &type metadata for RemoteContentViewController.InvalidSceneError);
    atomic_store(result, (unint64_t *)&qword_10005F880);
  }
  return result;
}

uint64_t sub_1000141F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014208(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100014210()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100014234()
{
  uint64_t v0;

  sub_100013D1C(v0);
}

void sub_10001423C()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000467E0, "PreviewShell/RemoteContentViewController.swift", 46, 2, 58, 0);
  __break(1u);
}

ValueMetadata *type metadata accessor for RemoteContentViewController.InvalidSceneError()
{
  return &type metadata for RemoteContentViewController.InvalidSceneError;
}

unint64_t sub_1000142EC()
{
  unint64_t result;

  result = qword_10005F8A0;
  if (!qword_10005F8A0)
  {
    result = swift_getWitnessTable(&unk_1000404BC, &type metadata for RemoteContentViewController.InvalidSceneError);
    atomic_store(result, (unint64_t *)&qword_10005F8A0);
  }
  return result;
}

unint64_t sub_100014334()
{
  unint64_t result;

  result = qword_10005F8A8;
  if (!qword_10005F8A8)
  {
    result = swift_getWitnessTable(&unk_100040494, &type metadata for RemoteContentViewController.InvalidSceneError);
    atomic_store(result, (unint64_t *)&qword_10005F8A8);
  }
  return result;
}

unint64_t sub_100014378()
{
  unint64_t result;

  result = qword_10005F8B0;
  if (!qword_10005F8B0)
  {
    result = swift_getWitnessTable(&unk_100040504, &type metadata for RemoteContentViewController.InvalidSceneError);
    atomic_store(result, (unint64_t *)&qword_10005F8B0);
  }
  return result;
}

uint64_t sub_1000144C8@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  objc_class *v20;
  id v21;
  void *v22;
  uint64_t v23;
  objc_super v25;

  v2 = v1;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006658(&qword_10005F9E8);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v25 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v25 - v15;
  sub_100014B6C((uint64_t)v2 + OBJC_IVAR____TtC12PreviewShell15ApplicationInfo_overrideExecutableURL, (uint64_t)v14);
  v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v17(v14, 1, v4))
  {
    sub_100014BB4((uint64_t)v14);
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v18(v16, 1, 1, v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v14, v4);
    v19 = sub_100014BB4((uint64_t)v14);
    URL.absoluteURL.getter(v19);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v18(v16, 0, 1, v4);
    if (v17(v16, 1, v4) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v16, v4);
      return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v18)(a1, 0, 1, v4);
    }
  }
  v20 = (objc_class *)type metadata accessor for ApplicationInfo(0);
  v25.receiver = v2;
  v25.super_class = v20;
  v21 = objc_msgSendSuper2(&v25, "executableURL");
  if (v21)
  {
    v22 = v21;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v21);

    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  v18(v11, v23, 1, v4);
  sub_100014BF4((uint64_t)v11, a1);
  return sub_100014BB4((uint64_t)v16);
}

id sub_100014718(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  char *v7;
  uint64_t v8;
  objc_super v10;

  v7 = &a1[OBJC_IVAR____TtC12PreviewShell15ApplicationInfo_overrideExecutableURL];
  v8 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v10.receiver = a1;
  v10.super_class = (Class)type metadata accessor for ApplicationInfo(0);
  return objc_msgSendSuper2(&v10, *a4, a3);
}

id sub_100014798()
{
  return sub_100014A30(0, (uint64_t (*)(void))type metadata accessor for ApplicationInfo);
}

uint64_t sub_1000147B8()
{
  return type metadata accessor for ApplicationInfo(0);
}

uint64_t type metadata accessor for ApplicationInfo(uint64_t a1)
{
  uint64_t result;

  result = qword_10005F8E8;
  if (!qword_10005F8E8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ApplicationInfo);
  return result;
}

void sub_1000147FC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100014868(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
  }
}

void sub_100014868(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10005F8F8)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10005F8F8);
  }
}

id sub_1000148BC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ApplicationInfoProvider()), "init");
  qword_100064160 = (uint64_t)result;
  return result;
}

id sub_100014A24(uint64_t a1)
{
  return sub_100014A30(a1, type metadata accessor for ApplicationInfoProvider);
}

id sub_100014A30(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for ApplicationInfoProvider()
{
  return objc_opt_self(_TtC12PreviewShell23ApplicationInfoProvider);
}

id sub_100014A84(uint64_t a1, uint64_t a2)
{
  NSString v3;
  id v4;
  id result;
  void *v6;
  unsigned int v7;
  id v8;

  swift_bridgeObjectRetain(a2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v4 = objc_msgSend((id)objc_opt_self(LSApplicationProxy), "applicationProxyForIdentifier:", v3);

  if (!v4)
    return 0;
  result = objc_msgSend(v4, "appState");
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, "isValid");

    if (v7)
    {
      v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ApplicationInfo(0)), "initWithApplicationProxy:", v4);

      return v8;
    }

    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_100014B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005F9E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014BB4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_10005F9E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005F9E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014C3C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v6 = sub_100006658(&qword_10005FAC8);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LaunchPayload(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_10000D718(a1, &qword_10005FAC8);
    sub_100008578(a2, (uint64_t)v8);
    v13 = type metadata accessor for AgentDescriptor.Bundle(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_10000D718((uint64_t)v8, &qword_10005FAC8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v19 = *v3;
    *v3 = 0x8000000000000000;
    sub_10000AD50((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    v16 = *v3;
    *v3 = v19;
    swift_bridgeObjectRelease(v16);
    v17 = type metadata accessor for AgentDescriptor.Bundle(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a2, v17);
  }
}

uint64_t sub_100014DC8(uint64_t a1)
{
  int64_t v1;
  unint64_t *v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  int v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v1)
    return (uint64_t)v2;
  v26 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_100019A5C(0, v1, 0);
  v2 = (unint64_t *)&_swiftEmptyArrayStorage;
  result = sub_100019D84(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v20 = v1;
  v21 = v5;
  v22 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_26;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
    v24 = type metadata accessor for HostedPreviewCanvas();
    v25 = sub_100006618((unint64_t *)&qword_100060C10, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_10004019C);
    *(_QWORD *)&v23 = v12;
    v26 = v2;
    v14 = v2[2];
    v13 = v2[3];
    swift_retain(v12);
    if (v14 >= v13 >> 1)
    {
      sub_100019A5C(v13 > 1, v14 + 1, 1);
      v2 = v26;
    }
    v2[2] = v14 + 1;
    result = sub_10000C5DC(&v23, (uint64_t)&v2[5 * v14 + 4]);
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_27;
    v8 = a1 + 64;
    v15 = *(_QWORD *)(v22 + 8 * v11);
    if ((v15 & (1 << v6)) == 0)
      goto LABEL_28;
    v5 = v21;
    if (*(_DWORD *)(a1 + 36) != v21)
      goto LABEL_29;
    v16 = v15 & (-2 << (v6 & 0x3F));
    if (v16)
    {
      v9 = __clz(__rbit64(v16)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v20;
    }
    else
    {
      v17 = v11 + 1;
      v18 = (unint64_t)(v9 + 63) >> 6;
      v10 = v20;
      if (v11 + 1 < v18)
      {
        v19 = *(_QWORD *)(v22 + 8 * v17);
        if (!v19)
        {
          v17 = v11 + 2;
          if (v11 + 2 >= v18)
            goto LABEL_4;
          v19 = *(_QWORD *)(v22 + 8 * v17);
          if (!v19)
          {
            while (v18 - 3 != v11)
            {
              v19 = *(_QWORD *)(a1 + 88 + 8 * v11++);
              if (v19)
              {
                v17 = v11 + 2;
                goto LABEL_17;
              }
            }
            goto LABEL_4;
          }
        }
LABEL_17:
        v9 = __clz(__rbit64(v19)) + (v17 << 6);
      }
    }
LABEL_4:
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return (uint64_t)v2;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

_QWORD *sub_10001501C()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for PreviewShellService(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_100015058();
  qword_100064170 = (uint64_t)result;
  return result;
}

_QWORD *sub_100015058()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[24];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PreviewShellPluginRegistry(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[2] = _swiftEmptyDictionarySingleton;
  v1[3] = _swiftEmptyDictionarySingleton;
  v1[4] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UserAlertController()), "init");
  ServerFarm.init()();
  if (qword_10005ECA0 != -1)
    swift_once(&qword_10005ECA0, sub_10001D7E4);
  v10 = sub_10000C53C(v6, (uint64_t)qword_100064188);
  swift_beginAccess(v10, v33, 0, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v1 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_pluginRegistry, v9, v6);
  v11 = objc_msgSend((id)objc_opt_self(FBSystemService), "sharedInstance");
  if (qword_10005EC90 != -1)
    swift_once(&qword_10005EC90, sub_1000148BC);
  objc_msgSend(v11, "setDelegate:", qword_100064160);

  v12 = objc_msgSend((id)objc_opt_self(NSProcessInfo), "processInfo");
  v13 = objc_msgSend(v12, "environment");

  v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_100007C5C(0xD000000000000012, 0x8000000100046940), (v16 & 1) != 0))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v14 + 56) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    swift_bridgeObjectRetain(v18);
    v20 = swift_bridgeObjectRelease(v14);
    static Logger.uv.getter(v20);
    v21 = swift_bridgeObjectRetain(v18);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v29 = v19;
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v25 = swift_slowAlloc(32, -1);
      v30 = v2;
      v26 = v25;
      v32 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain(v18);
      v31 = sub_100010F78(v29, v18, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v24 + 4);
      swift_bridgeObjectRelease_n(v18, 3);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "PreviewShell created with MallocStackLogging=%s", v24, 0xCu);
      swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v30);
    }
    else
    {

      swift_bridgeObjectRelease_n(v18, 2);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v14);
  }
  return v1;
}

uint64_t sub_100015428(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD v28[3];
  void *v29;
  _BYTE v30[32];

  v3 = type metadata accessor for DeviceType(0);
  __chkstk_darwin(v3);
  v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100018780(a1);
  if ((Agent.pid.getter() & 0x100000000) != 0)
  {
    swift_release(v6);
    sub_100006658(&qword_10005F000);
    LOBYTE(v25) = 2;
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 274, 30, "prepareProvidersForRelaunch(of:)", 32, (_DWORD)v25);
  }
  else
  {
    swift_beginAccess(v1 + 24, v30, 0, 0);
    v28[0] = *(_QWORD *)(v1 + 24);
    v7 = __chkstk_darwin(v28[0]);
    swift_bridgeObjectRetain(v7);
    v8 = sub_100006658(&qword_10005FAD8);
    v26 = sub_10001AC64(&qword_10005FAE0, &qword_10005FAD8, (uint64_t)&protocol conformance descriptor for [A : B].Values);
    v24 = v8;
    v25 = (char *)&type metadata for () + 8;
    v23 = (uint64_t)&v23;
    v9 = ((uint64_t (*)(const mach_header_64 *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, const char *, uint64_t, __int16, uint64_t (*)(_QWORD *)))Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:))(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 277, 44, "prepareProvidersForRelaunch(of:)", 32, 2, sub_10001AFBC);
    swift_release(v9);
    v10 = swift_bridgeObjectRelease(v28[0]);
    Agent.deviceType.getter(v10);
    v11 = type metadata accessor for SimulatorDevicePayload(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v5, 1, v11) == 1)
    {
      if (qword_10005ECD0 != -1)
        swift_once(&qword_10005ECD0, sub_10001F594);
      v12 = qword_1000641A0;
      swift_beginAccess(qword_1000641A0 + 16, v28, 0, 0);
      v13 = *(_QWORD *)(v12 + 16);
      v14 = swift_bridgeObjectRetain(v13);
      v15 = (void *)sub_100014DC8(v14);
      v16 = swift_bridgeObjectRelease(v13);
    }
    else
    {
      if (qword_10005EC88 != -1)
        swift_once(&qword_10005EC88, sub_1000122CC);
      assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SimDisplaySceneRegistry.swift", 119, 2, 309, 26, "allCanvases", 11, 2);
      v16 = sub_10001B4DC((uint64_t)v5, (uint64_t (*)(_QWORD))&type metadata accessor for DeviceType);
      v15 = &_swiftEmptyArrayStorage;
    }
    v29 = v15;
    __chkstk_darwin(v16);
    v18 = sub_100006658(&qword_10005FAE8);
    v19 = sub_10001AC64(&qword_10005FAF0, &qword_10005FAE8, (uint64_t)&protocol conformance descriptor for [A]);
    v25 = (char *)&type metadata for () + 8;
    v26 = v19;
    v23 = (uint64_t)&v23;
    v24 = v18;
    LOWORD(v22) = 2;
    v20 = ((uint64_t (*)(const mach_header_64 *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, uint64_t (*)(_QWORD *)))Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:))(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 290, 23, "prepareProvidersForRelaunch(of:)", 32, v22, sub_10001B014);
    swift_bridgeObjectRelease(v29);
    LOBYTE(v25) = 2;
    v21 = Future.ignoringValue(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 291, 27, "prepareProvidersForRelaunch(of:)", 32, (_DWORD)v25);
    swift_release(v20);
    swift_release(v6);
    return v21;
  }
}

uint64_t sub_100015828(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  _BYTE *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint8_t *v109;
  uint8_t *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  uint64_t v144;

  v135 = (char *)a2;
  v123 = type metadata accessor for ExecutionLane(0);
  v122 = *(_QWORD *)(v123 - 8);
  __chkstk_darwin(v123);
  v137 = (char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = type metadata accessor for AgentDescriptor(0);
  v117 = *(_QWORD *)(v118 - 8);
  __chkstk_darwin(v118);
  v116 = (char *)&v108 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = type metadata accessor for Logger(0);
  v114 = *(_QWORD *)(v115 - 8);
  __chkstk_darwin(v115);
  v133 = (char *)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = type metadata accessor for PreviewAgentLauncherRegistry(0);
  v131 = *(_QWORD *)(v132 - 8);
  __chkstk_darwin(v132);
  v7 = (char *)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = type metadata accessor for ProcessType(0);
  v130 = *(_QWORD *)(v129 - 8);
  v8 = __chkstk_darwin(v129);
  v113 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v108 - v10;
  v138 = type metadata accessor for AgentDescriptor.Bundle(0);
  v128 = *(_QWORD *)(v138 - 8);
  v12 = __chkstk_darwin(v138);
  v136 = (char *)&v108 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v108 - v14;
  v16 = type metadata accessor for DeviceType(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v108 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LaunchPayload(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = __chkstk_darwin(v19);
  v126 = (char *)&v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = v22;
  __chkstk_darwin(v21);
  v24 = (char *)&v108 - v23;
  v127 = type metadata accessor for BatchIdentity(0);
  v25 = *(_QWORD *)(v127 - 8);
  v26 = __chkstk_darwin(v127);
  v134 = (char *)&v108 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = v27;
  __chkstk_darwin(v26);
  v29 = (char *)&v108 - v28;
  v139 = v20;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v30(v24, a1, v19);
  sub_10001B380((uint64_t)v135, (uint64_t)v18, (uint64_t (*)(_QWORD))&type metadata accessor for DeviceType);
  v135 = v24;
  v31 = v18;
  v32 = v11;
  v33 = BatchIdentity.init(_:_:)(v24, v31);
  v34 = BatchIdentity.agentBundle.getter(v33);
  v35 = LaunchPayload.processType.getter(v34);
  PreviewShellPluginRegistry.launchers.getter(v35);
  PreviewAgentLauncherRegistry.subscript.getter(&v142, v11);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v7, v132);
  if (v143)
  {
    v124 = v29;
    v131 = v25;
    v125 = v15;
    v36 = sub_10000C5DC(&v142, (uint64_t)&v144);
    static Logger.uv.getter(v36);
    v37 = v126;
    v113 = (char *)v30;
    v38 = ((uint64_t (*)(char *, uint64_t, uint64_t))v30)(v126, a1, v19);
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.default.getter();
    v41 = os_log_type_enabled(v39, v40);
    v42 = a1;
    v112 = v11;
    if (v41)
    {
      v43 = (uint8_t *)swift_slowAlloc(12, -1);
      v44 = swift_slowAlloc(32, -1);
      v132 = a1;
      v45 = v44;
      *(_QWORD *)&v142 = v44;
      v110 = v43;
      *(_DWORD *)v43 = 136315138;
      v109 = v43 + 4;
      v46 = (uint64_t)v116;
      LaunchPayload.agentDescriptor.getter();
      v47 = sub_100006618(&qword_10005FB88, (uint64_t (*)(uint64_t))&type metadata accessor for AgentDescriptor, (uint64_t)&protocol conformance descriptor for AgentDescriptor);
      v48 = v118;
      v49 = dispatch thunk of CustomStringConvertible.description.getter(v118, v47);
      v50 = v19;
      v52 = v51;
      v53 = v117;
      (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v46, v48);
      v141 = sub_100010F78(v49, v52, (uint64_t *)&v142);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v141, &v142, v109);
      v54 = v52;
      v19 = v50;
      swift_bridgeObjectRelease(v54);
      (*(void (**)(char *, uint64_t))(v139 + 8))(v126, v50);
      v55 = v110;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Preparing display & canvases for relaunch of %s", v110, 0xCu);
      swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
      v56 = v45;
      v42 = v132;
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v55, -1, -1);

      (*(void (**)(char *, uint64_t))(v114 + 8))(v133, v115);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v139 + 8))(v37, v19);

      (*(void (**)(char *, uint64_t))(v114 + 8))(v133, v115);
      v48 = v118;
      v53 = v117;
      v46 = (uint64_t)v116;
    }
    sub_100006658(&qword_10005F000);
    v64 = sub_100006658(&qword_10005F448);
    v65 = swift_allocObject(v64, 48, 7);
    *(_OWORD *)(v65 + 16) = xmmword_100040620;
    v66 = v124;
    *(_QWORD *)(v65 + 32) = sub_100019E0C();
    LaunchPayload.agentDescriptor.getter();
    v67 = sub_100015428(v46);
    v68 = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v46, v48);
    *(_QWORD *)(v65 + 40) = v67;
    *(_QWORD *)&v142 = v65;
    specialized Array._endMutation()(v68);
    v69 = v142;
    LOWORD(v107) = 2;
    v126 = (char *)static Future.inverting(dsoHandle:file:line:column:function:accumulateErrors:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 81, 45, "relaunch(with:for:)", 19, (_DWORD)v107, v142);
    v70 = swift_bridgeObjectRelease(v69);
    v71 = LaunchPayload.environment.getter(v70);
    if (!*(_QWORD *)(v71 + 16) || (v72 = sub_100007C5C(0xD00000000000002FLL, 0x8000000100046C20), (v73 & 1) == 0))
    {
      v80 = swift_bridgeObjectRelease(v71);
      v133 = 0;
      LODWORD(v132) = 1;
      v82 = v138;
      v83 = v128;
      v84 = v125;
      v85 = v127;
      v81 = v131;
LABEL_26:
      v111 = v19;
      static ExecutionLane.main.getter(v80);
      (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v136, v84, v82);
      sub_10000D66C((uint64_t)&v144, (uint64_t)&v142);
      (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v134, v66, v85);
      ((void (*)(char *, uint64_t, uint64_t))v113)(v135, v42, v19);
      v88 = *(unsigned __int8 *)(v83 + 80);
      v89 = (v88 + 24) & ~v88;
      v90 = v82;
      v91 = (v121 + v89 + 7) & 0xFFFFFFFFFFFFFFF8;
      v92 = *(unsigned __int8 *)(v81 + 80);
      v93 = (v92 + v91 + 40) & ~v92;
      v94 = (v119 + v93 + 7) & 0xFFFFFFFFFFFFFFF8;
      v95 = *(unsigned __int8 *)(v139 + 80);
      v96 = (v95 + v94 + 9) & ~v95;
      v97 = swift_allocObject(&unk_100052AC8, v96 + v120, v88 | v92 | v95 | 7);
      v98 = v90;
      v99 = v85;
      v100 = v97;
      v101 = v140;
      *(_QWORD *)(v97 + 16) = v140;
      (*(void (**)(uint64_t, char *, uint64_t))(v83 + 32))(v97 + v89, v136, v98);
      sub_10000C5DC(&v142, v100 + v91);
      (*(void (**)(uint64_t, char *, uint64_t))(v81 + 32))(v100 + v93, v134, v99);
      v102 = v100 + v94;
      *(_QWORD *)v102 = v133;
      *(_BYTE *)(v102 + 8) = v132;
      (*(void (**)(uint64_t, char *, uint64_t))(v139 + 32))(v100 + v96, v135, v111);
      swift_retain(v101);
      v103 = v137;
      v104 = v126;
      v63 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 91, 34, "relaunch(with:for:)", 19, 2, v137, sub_10001B184, v100, &type metadata for ProcessID);
      swift_release(v104);
      swift_release(v100);
      (*(void (**)(char *, uint64_t))(v122 + 8))(v103, v123);
      sub_10000D6B0(&v144);
      (*(void (**)(char *, uint64_t))(v130 + 8))(v112, v129);
      (*(void (**)(char *, uint64_t))(v83 + 8))(v125, v138);
      (*(void (**)(char *, uint64_t))(v81 + 8))(v124, v99);
      return v63;
    }
    v74 = (uint64_t *)(*(_QWORD *)(v71 + 56) + 16 * v72);
    v76 = *v74;
    v75 = v74[1];
    swift_bridgeObjectRetain(v75);
    v77 = swift_bridgeObjectRelease(v71);
    v141 = 0;
    __chkstk_darwin(v77);
    v107 = &v141;
    if ((v75 & 0x1000000000000000) != 0 || !(v75 & 0x2000000000000000 | v76 & 0x1000000000000000))
    {
      _StringGuts._slowWithCString<A>(_:)(&v142, sub_10001B244, &v106, v76, v75, &type metadata for Bool);
      v80 = swift_bridgeObjectRelease(v75);
      v79 = v142;
    }
    else
    {
      if ((v75 & 0x2000000000000000) != 0)
      {
        *(_QWORD *)&v142 = v76;
        *((_QWORD *)&v142 + 1) = v75 & 0xFFFFFFFFFFFFFFLL;
        if (v76 <= 0x20u && ((0x100003E01uLL >> v76) & 1) != 0)
        {
          v79 = 0;
          v81 = v131;
        }
        else
        {
          v86 = (_BYTE *)_swift_stdlib_strtod_clocale(&v142, &v141);
          v81 = v131;
          if (v86)
            v79 = *v86 == 0;
          else
            v79 = 0;
        }
        v80 = swift_bridgeObjectRelease(v75);
        goto LABEL_23;
      }
      if ((v76 & 0x1000000000000000) != 0)
        v78 = (_BYTE *)((v75 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v78 = (_BYTE *)_StringObject.sharedUTF8.getter(v76, v75);
      sub_10001B244(v78, (BOOL *)&v142);
      v79 = v142;
      v80 = swift_bridgeObjectRelease(v75);
    }
    v81 = v131;
LABEL_23:
    v87 = (char *)v141;
    if (!v79)
      v87 = 0;
    v133 = v87;
    LODWORD(v132) = v79 ^ 1;
    v82 = v138;
    v83 = v128;
    v84 = v125;
    v85 = v127;
    goto LABEL_26;
  }
  sub_10000D718((uint64_t)&v142, &qword_10005FB70);
  sub_100006658(&qword_10005FB78);
  v57 = v130;
  v58 = v113;
  v59 = v129;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v113, v11, v129);
  v60 = type metadata accessor for UnknownProcessType(0);
  v61 = sub_100006618(&qword_10005FB80, (uint64_t (*)(uint64_t))&type metadata accessor for UnknownProcessType, (uint64_t)&protocol conformance descriptor for UnknownProcessType);
  v62 = swift_allocError(v60, v61, 0, 0);
  UnknownProcessType.init(processType:)(v58);
  LOBYTE(v107) = 2;
  v63 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 71, 27, "relaunch(with:for:)", 19, (_DWORD)v107, v62);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v32, v59);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v15, v138);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v127);
  swift_errorRelease(v62);
  return v63;
}

uint64_t sub_1000164BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t v35;
  _BYTE v37[4];
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];

  v45 = a8;
  v38 = a7;
  v40 = a5;
  v41 = a6;
  v39 = a4;
  v10 = type metadata accessor for AgentDescriptor.Bundle(0);
  v43 = *(_QWORD *)(v10 - 8);
  v44 = v10;
  __chkstk_darwin(v10);
  v12 = &v37[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_100006658(&qword_10005FB90);
  __chkstk_darwin(v13);
  v15 = &v37[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = type metadata accessor for BatchIdentity(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = &v37[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess(a2 + 16, v47, 32, 0);
  v20 = *(_QWORD *)(a2 + 16);
  v21 = *(_QWORD *)(v20 + 16);
  v42 = a3;
  if (v21 && (v22 = sub_100007D58(a3), (v23 & 1) != 0))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v22);
    swift_endAccess(v47);
    v47[0] = v24;
    v25 = type metadata accessor for Agent(0);
    v26 = sub_100006618(&qword_10005FAD0, (uint64_t (*)(uint64_t))&type metadata accessor for Agent, (uint64_t)&protocol conformance descriptor for Agent);
    swift_retain(v24);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 93, 33, "relaunch(with:for:)", 19, 2, v25, v26);
  }
  else
  {
    swift_endAccess(v47);
    v24 = 0;
  }
  v27 = v38 & 1;
  sub_10000D66C(v39, (uint64_t)v47);
  v28 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v17 + 16))(v19, v40, v16);
  ServerFarm.jitBootstrapAgentServer.getter(v28);
  v29 = type metadata accessor for Agent(0);
  swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
  v30 = Agent.init(launcher:batchIdentity:jitBootstrapAgentServer:jitBootstrapTimeout:)(v47, v19, v15, v41, v27);
  v31 = v43;
  v32 = v44;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v43 + 16))(v12, v42, v44);
  swift_beginAccess(a2 + 16, v47, 33, 0);
  swift_retain(v30);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(a2 + 16));
  v46 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0x8000000000000000;
  sub_10000AA60(v30, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
  v34 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v46;
  swift_bridgeObjectRelease(v34);
  (*(void (**)(_BYTE *, uint64_t))(v31 + 8))(v12, v32);
  swift_endAccess(v47);
  v35 = Agent.launch(with:killing:)(v45, v24);
  swift_release(v30);
  swift_release(v24);
  return v35;
}

char *sub_1000167B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  int v96;
  int v97;
  _QWORD v98[4];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t updated;
  void (*v113)(char *, uint64_t);
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124[2];
  _QWORD v125[2];
  uint64_t v126;

  v2 = v1;
  v120 = type metadata accessor for ExecutionLane(0);
  v113 = *(void (**)(char *, uint64_t))(v120 - 8);
  __chkstk_darwin(v120);
  v114 = (char *)&v99 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for ShellUpdatePayload(0);
  v115 = *(_QWORD *)(updated - 8);
  v5 = *(_QWORD *)(v115 + 64);
  __chkstk_darwin(updated);
  v121 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = type metadata accessor for ContentProviderRegistry(0);
  v117 = *(_QWORD *)(v119 - 8);
  __chkstk_darwin(v119);
  v116 = (char *)&v99 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006658(&qword_10005FB08);
  __chkstk_darwin(v7);
  v9 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ContentCategory(0);
  __chkstk_darwin(v10);
  v118 = (uint64_t)&v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for ContentKey(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = __chkstk_darwin(v12);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v99 - v17;
  v122 = a1;
  v19 = ShellUpdatePayload.pid.getter(v16);
  v123 = v2;
  v20 = v126;
  v21 = sub_100017218(v19);
  if (!v20)
  {
    v23 = v115;
    v102 = v14;
    v103 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v110 = v5;
    v24 = v121;
    v126 = v21;
    v107 = 0;
    v108 = v13;
    v109 = v12;
    v25 = v118;
    v26 = v122;
    v27 = ((uint64_t (*)(void))ShellUpdatePayload.contentCategory.getter)();
    ShellUpdatePayload.contentOverride.getter(v27);
    v28 = ContentKey.init(for:with:)(v25, v9);
    v29 = v116;
    PreviewShellPluginRegistry.providers.getter(v28);
    v30 = ContentProviderRegistry.boxRecipe(for:)(v18);
    v32 = v31;
    v111 = v33;
    v34 = ~(_BYTE)v33;
    v35 = (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v29, v119);
    if (v34)
    {
      v117 = v30;
      v118 = v32;
      v119 = (uint64_t)v18;
      v36 = v126;
      v37 = Agent.applyUpdateFor(payload:)(v26);
      v38 = v24;
      v39 = v24;
      v40 = updated;
      v105 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
      v105(v39, v26, updated);
      v41 = *(unsigned __int8 *)(v23 + 80);
      v106 = ~v41;
      v100 = v41 + 16;
      v42 = (v41 + 16) & ~v41;
      v104 = v41;
      v99 = v110 + 7;
      v43 = (v110 + 7 + v42) & 0xFFFFFFFFFFFFFFF8;
      v44 = (v43 + 15) & 0xFFFFFFFFFFFFFFF8;
      v101 = v41 | 7;
      v45 = swift_allocObject(&unk_100052988, v44 + 8, v41 | 7);
      v46 = v45 + v42;
      v47 = v40;
      v115 = *(_QWORD *)(v23 + 32);
      ((void (*)(uint64_t, char *, uint64_t))v115)(v46, v38, v40);
      *(_QWORD *)(v45 + v43) = v36;
      v48 = v123;
      *(_QWORD *)(v45 + v44) = v123;
      swift_retain(v36);
      v49 = swift_retain(v48);
      v50 = v114;
      static ExecutionLane.any.getter(v49);
      v51 = sub_100006658(&qword_10005FB18);
      v116 = (char *)Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 122, 25, "performUpdate(payload:)", 23, 2, v50, sub_10001A904, v45, v51);
      swift_release(v37);
      swift_release(v45);
      v52 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v113 + 1);
      v53 = v120;
      v54 = v52(v50, v120);
      v113 = (void (*)(char *, uint64_t))v52;
      if ((v111 & 1) != 0)
      {
        v68 = sub_10001A970(v117, v118);
        static ExecutionLane.main.getter(v68);
        v69 = v121;
        v105(v121, v122, v47);
        v70 = (v104 + 24) & v106;
        v71 = (v99 + v70) & 0xFFFFFFFFFFFFFFF8;
        v72 = swift_allocObject(&unk_1000529B0, v71 + 8, v101);
        v73 = v123;
        *(_QWORD *)(v72 + 16) = v123;
        ((void (*)(uint64_t, char *, uint64_t))v115)(v72 + v70, v69, v47);
        v74 = v126;
        *(_QWORD *)(v72 + v71) = v126;
        v75 = v47;
        v76 = swift_allocObject(&unk_1000529D8, 32, 7);
        *(_QWORD *)(v76 + 16) = sub_10001AA08;
        *(_QWORD *)(v76 + 24) = v72;
        swift_retain(v74);
        swift_retain(v73);
        v77 = sub_100006658(&qword_10005FB20);
        LOBYTE(v96) = 2;
        v123 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 157, 22, "performUpdate(payload:)", 23, v96, v50, sub_10001AA6C, v76, v77);
        swift_release(v76);
        v78 = v52(v50, v53);
        static ExecutionLane.main.getter(v78);
        v79 = v108;
        v80 = v103;
        v81 = v109;
        (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v103, v119, v109);
        v82 = v121;
        v83 = v75;
        v105(v121, v122, v75);
        v84 = *(unsigned __int8 *)(v79 + 80);
        v85 = (v84 + 16) & ~v84;
        v86 = (v102 + v85 + 7) & 0xFFFFFFFFFFFFFFF8;
        v87 = (v100 + v86) & v106;
        v88 = swift_allocObject(&unk_100052A00, v87 + v110, v104 | v84 | 7);
        (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v88 + v85, v80, v81);
        v89 = (_QWORD *)(v88 + v86);
        v90 = v117;
        v91 = v118;
        *v89 = v117;
        v89[1] = v91;
        ((void (*)(unint64_t, char *, uint64_t))v115)(v88 + v87, v82, v83);
        v92 = swift_allocObject(&unk_100052A28, 32, 7);
        *(_QWORD *)(v92 + 16) = sub_10001AB3C;
        *(_QWORD *)(v92 + 24) = v88;
        sub_10001A970(v90, v91);
        v93 = type metadata accessor for PropertyList(0);
        v94 = v114;
        LOBYTE(v97) = 2;
        v95 = v123;
        v9 = (char *)Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 163, 22, "performUpdate(payload:)", 23, v97, v114, sub_10001ABD0, v92, v93);
        swift_release(v95);
        swift_release(v92);
        swift_release(v116);
        LOBYTE(v95) = v111;
        sub_10001AC1C(v90, v91, v111);
        sub_10001AC1C(v90, v91, v95);
        swift_release(v126);
        v113(v94, v120);
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v119, v81);
      }
      else
      {
        v55 = v47;
        v103 = (char *)&v99;
        __chkstk_darwin(v54);
        v56 = v117;
        v57 = v118;
        v98[3] = v118;
        v58 = v121;
        swift_beginAccess(v123 + 24, v124, 33, 0);
        sub_10001A970(v56, v57);
        v59 = sub_100006658(&qword_10005FB28);
        v60 = sub_10001AC64(&qword_10005FB30, &qword_10005FB28, (uint64_t)&protocol conformance descriptor for [A : B]);
        KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)(v125, v119, sub_10001AC3C, v98, v59, v60);
        swift_endAccess(v124);
        sub_10000D66C((uint64_t)v125, (uint64_t)v124);
        v105(v58, v122, v55);
        v61 = (v104 + 56) & v106;
        v62 = swift_allocObject(&unk_100052A50, v61 + v110, v101);
        sub_10000C5DC(v124, v62 + 16);
        ((void (*)(uint64_t, char *, uint64_t))v115)(v62 + v61, v58, v55);
        v63 = swift_allocObject(&unk_100052A78, 32, 7);
        *(_QWORD *)(v63 + 16) = sub_10001AD18;
        *(_QWORD *)(v63 + 24) = v62;
        static ExecutionLane.any.getter(v63);
        v64 = type metadata accessor for PropertyList(0);
        LOBYTE(v96) = 2;
        v65 = v116;
        v9 = (char *)Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 146, 23, "performUpdate(payload:)", 23, v96, v50, sub_10001AA6C, v63, v64);
        LOBYTE(v59) = v111;
        sub_10001AC1C(v56, v57, v111);
        swift_release(v65);
        swift_release(v63);
        sub_10001AC1C(v56, v57, v59);
        swift_release(v126);
        v113(v50, v120);
        sub_10000D6B0(v125);
        (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v119, v109);
      }
    }
    else
    {
      ShellUpdatePayload.contentCategory.getter(v35);
      v9 = (char *)type metadata accessor for UnknownContentCategory(0);
      v66 = sub_100006618(&qword_10005FB10, (uint64_t (*)(uint64_t))&type metadata accessor for UnknownContentCategory, (uint64_t)&protocol conformance descriptor for UnknownContentCategory);
      swift_allocError(v9, v66, 0, 0);
      v67 = UnknownContentCategory.init(category:)(v25);
      swift_willThrow(v67);
      swift_release(v126);
      (*(void (**)(char *, uint64_t))(v108 + 8))(v18, v109);
    }
  }
  return v9;
}

uint64_t sub_100017218(int a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  _BYTE v22[24];

  swift_beginAccess(v1 + 16, v22, 0, 0);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = v3 + 64;
  v5 = 1 << *(_BYTE *)(v3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v3 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain_n(*(_QWORD *)(v1 + 16), 2);
  v10 = 0;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v10 << 6);
LABEL_25:
    v16 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v12);
    v17 = swift_retain(v16);
    v18 = Agent.pid.getter(v17);
    if ((v18 & 0x100000000) == 0 && (_DWORD)v18 == a1)
    {
      swift_release(v3);
      swift_bridgeObjectRelease(v3);
      return v16;
    }
    result = swift_release(v16);
  }
  v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v13 >= v8)
    goto LABEL_28;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  ++v10;
  if (v14)
    goto LABEL_24;
  v10 = v13 + 1;
  if (v13 + 1 >= v8)
    goto LABEL_28;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
    goto LABEL_24;
  v10 = v13 + 2;
  if (v13 + 2 >= v8)
    goto LABEL_28;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
    goto LABEL_24;
  v10 = v13 + 3;
  if (v13 + 3 >= v8)
    goto LABEL_28;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
    goto LABEL_24;
  v10 = v13 + 4;
  if (v13 + 4 >= v8)
    goto LABEL_28;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_24:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_25;
  }
  v15 = v13 + 5;
  if (v15 >= v8)
  {
LABEL_28:
    swift_release(v3);
    swift_bridgeObjectRelease(v3);
    v16 = type metadata accessor for AgentLocatingError(0);
    v19 = sub_100006618(&qword_10005FAC0, (uint64_t (*)(uint64_t))&type metadata accessor for AgentLocatingError, (uint64_t)&protocol conformance descriptor for AgentLocatingError);
    swift_allocError(v16, v19, 0, 0);
    *v20 = a1;
    v21 = swift_storeEnumTagMultiPayload(v20, v16, 0);
    swift_willThrow(v21);
    return v16;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      goto LABEL_28;
    v14 = *(_QWORD *)(v4 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100017440@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t updated;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  void (*v37)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v44[4];
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v52 = a2;
  v53 = a3;
  v58 = a4;
  v5 = sub_100006658(&qword_10005FB60);
  __chkstk_darwin(v5);
  v55 = &v44[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100006658(&qword_10005FB68);
  __chkstk_darwin(v7);
  v54 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for ContentIdentifier(0);
  __chkstk_darwin(v9);
  v50 = &v44[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for AgentUpdate.Context(0);
  v56 = *(_QWORD *)(v11 - 8);
  v57 = v11;
  __chkstk_darwin(v11);
  v51 = &v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  updated = type metadata accessor for UpdateSetupPayload(0);
  v48 = *(_QWORD *)(updated - 8);
  v49 = updated;
  __chkstk_darwin(updated);
  v15 = &v44[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = type metadata accessor for SceneInjector(0);
  __chkstk_darwin(v16);
  v18 = &v44[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = type metadata accessor for ServerFarm(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = &v44[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = type metadata accessor for AgentDescriptor.Bundle(0);
  __chkstk_darwin(v23);
  v25 = &v44[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = type metadata accessor for PreviewAgentConnector(0);
  v46 = *(_QWORD *)(v26 - 8);
  v47 = v26;
  v27 = __chkstk_darwin(v26);
  v45 = *a1;
  v28 = ShellUpdatePayload.pid.getter(v27);
  Agent.agentBundle.getter();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v20 + 16))(v22, v53 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_serverFarm, v19);
  SceneInjector.init(injectScene:)(sub_1000177CC, 0);
  v29 = PreviewAgentConnector.init(pid:agentBundle:serverFarm:sceneInjector:)(v28, v25, v22, v18);
  ShellUpdatePayload.setupPayload.getter(v29);
  v30 = UpdateSetupPayload.shellDidLoadStaticProducts.setter(v45);
  v31 = v50;
  v32 = ShellUpdatePayload.contentIdentifier.getter(v30);
  v33 = v54;
  ShellUpdatePayload.hostUpdateSeed.getter(v32);
  v35 = v48;
  v34 = v49;
  v36 = v55;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v48 + 16))(v55, v15, v49);
  v37 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v35 + 56);
  v38 = v35;
  v39 = v34;
  v37(v36, 0, 1, v34);
  v40 = v51;
  AgentUpdate.Context.init(contentIdentifier:updateSeed:setupPayload:)(v31, v33, v36);
  (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v15, v39);
  v41 = sub_100006658(&qword_10005FB18);
  v42 = v58 + *(int *)(v41 + 48);
  (*(void (**)(void))(v46 + 32))();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v56 + 32))(v42, v40, v57);
}

uint64_t sub_1000177CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002F5F0(a1, a2, a3);
}

uint64_t sub_1000177E0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t updated;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v17 = a1;
  v18 = a2;
  v4 = type metadata accessor for PreviewType(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PropertyList(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3[3];
  v13 = a3[4];
  sub_10000D648(a3, v12);
  updated = ShellUpdatePayload.contentPayload.getter();
  ShellUpdatePayload.previewType.getter(updated);
  v15 = dispatch thunk of NonUIContentProviderBox.performUpdate(using:updatePayload:previewType:agentContext:)(v17, v11, v7, v18, v12, v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

uint64_t sub_100017904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v36 = a5;
  v38 = a2;
  v35 = type metadata accessor for AgentUpdate.Context(0);
  v6 = *(_QWORD *)(v35 - 8);
  v37 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v35);
  v34 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = type metadata accessor for PreviewAgentConnector(0);
  v8 = *(_QWORD *)(v33 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v33);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PreviewType(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  ShellUpdatePayload.previewType.getter(v16);
  v36 = sub_100019FE0((uint64_t)v18, v36);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 1, 1, v19);
  v20 = a1;
  v21 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v20, v33);
  v22 = v34;
  v23 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v34, v38, v35);
  v24 = *(unsigned __int8 *)(v8 + 80);
  v25 = (v24 + 16) & ~v24;
  v26 = *(unsigned __int8 *)(v6 + 80);
  v27 = (v9 + v26 + v25) & ~v26;
  v28 = swift_allocObject(&unk_100052AA0, v27 + v37, v24 | v26 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v28 + v25, v10, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v28 + v27, v22, v23);
  v29 = sub_100006658(&qword_10005FB20);
  v30 = v36;
  v31 = Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 159, 31, "performUpdate(payload:)", 23, 2, v13, &unk_10005FB48, v28, v29);
  swift_release(v30);
  swift_release(v28);
  sub_10000D718((uint64_t)v13, &qword_10005FB38);
  return v31;
}

uint64_t sub_100017BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_100017BC0, 0, 0);
}

uint64_t sub_100017BC0()
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

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v5 = sub_100006658(&qword_10005FB20);
  v6 = v4 + *(int *)(v5 + 48);
  v7 = v4 + *(int *)(v5 + 64);
  v8 = type metadata accessor for PreviewAgentConnector(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, v1, v8);
  v9 = type metadata accessor for AgentUpdate.Context(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v6, v2, v9);
  sub_10000D66C(v3, v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100017C6C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t updated;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = a2;
  v22 = a6;
  v20 = a5;
  v9 = type metadata accessor for PropertyList(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a3[3];
  v13 = a3[4];
  sub_10000D648(a3, v14);
  updated = ShellUpdatePayload.contentPayload.getter();
  v16 = ShellUpdatePayload.controlStates.getter(updated);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 48))(a4, a1, v20, v22, v12, v16, v21, v14, v13);
  swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

uint64_t sub_100017D70(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _BYTE v38[24];
  void *v39;

  v4 = type metadata accessor for ExecutionLane(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DeviceType(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100017218(a1);
  if (!v2)
  {
    v12 = v11;
    v35 = v5;
    v36 = v4;
    swift_beginAccess(v1 + 24, v38, 0, 0);
    v37[0] = *(_QWORD *)(v1 + 24);
    v13 = __chkstk_darwin(v37[0]);
    swift_bridgeObjectRetain(v13);
    v14 = sub_100006658(&qword_10005FAD8);
    v33 = sub_10001AC64(&qword_10005FAE0, &qword_10005FAD8, (uint64_t)&protocol conformance descriptor for [A : B].Values);
    v31 = v14;
    v32 = (char *)&type metadata for () + 8;
    v30 = (uint64_t)&v30;
    v15 = ((uint64_t (*)(const mach_header_64 *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, const char *, uint64_t, __int16, uint64_t (*)(_QWORD *)))Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:))(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 179, 44, "tellProvidersToStop(for:)", 25, 2, sub_10001A7F4);
    swift_release(v15);
    v16 = swift_bridgeObjectRelease(v37[0]);
    Agent.deviceType.getter(v16);
    v17 = type metadata accessor for SimulatorDevicePayload(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v10, 1, v17) == 1)
    {
      if (qword_10005ECD0 != -1)
        swift_once(&qword_10005ECD0, sub_10001F594);
      v18 = qword_1000641A0;
      swift_beginAccess(qword_1000641A0 + 16, v37, 0, 0);
      v19 = *(_QWORD *)(v18 + 16);
      v20 = swift_bridgeObjectRetain(v19);
      v21 = (void *)sub_100014DC8(v20);
      v22 = swift_bridgeObjectRelease(v19);
    }
    else
    {
      if (qword_10005EC88 != -1)
        swift_once(&qword_10005EC88, sub_1000122CC);
      assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SimDisplaySceneRegistry.swift", 119, 2, 309, 26, "allCanvases", 11, 2);
      v22 = sub_10001B4DC((uint64_t)v10, (uint64_t (*)(_QWORD))&type metadata accessor for DeviceType);
      v21 = &_swiftEmptyArrayStorage;
    }
    v39 = v21;
    __chkstk_darwin(v22);
    v23 = sub_100006658(&qword_10005FAE8);
    v33 = sub_10001AC64(&qword_10005FAF0, &qword_10005FAE8, (uint64_t)&protocol conformance descriptor for [A]);
    v31 = v23;
    v32 = (char *)&type metadata for () + 8;
    v30 = (uint64_t)&v30;
    LOWORD(v28) = 2;
    v24 = ((uint64_t (*)(const mach_header_64 *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, uint64_t (*)(_QWORD *)))Sequence.traverse<A>(dsoHandle:file:line:column:function:andAccumulateErrors:_:))(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 189, 34, "tellProvidersToStop(for:)", 25, v28, sub_10001A800);
    swift_bridgeObjectRelease(v39);
    v25 = swift_allocObject(&unk_100052960, 32, 7);
    *(_DWORD *)(v25 + 16) = a1;
    *(_QWORD *)(v25 + 24) = v12;
    v26 = swift_retain(v12);
    static ExecutionLane.any.getter(v26);
    LOBYTE(v29) = 2;
    v1 = Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 190, 19, "tellProvidersToStop(for:)", 25, v29, v7, sub_10001A86C, v25, (char *)&type metadata for () + 8);
    swift_release(v12);
    swift_release(v24);
    swift_release(v25);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v36);
  }
  return v1;
}

uint64_t sub_1000181B8(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static Logger.uv.getter(v5);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 67240192;
    v15 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v11 + 4);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Canvases now stopped for %{public}d, killing process", v11, 8u);
    swift_slowDealloc(v11, -1, -1);
  }

  v12 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return Agent.kill()(v12);
}

uint64_t sub_1000182EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(unint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  char v45[24];

  v2 = v1;
  v4 = type metadata accessor for AgentDescriptor.Bundle(0);
  v41 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a1;
  v8 = PurgePayload.workspaceID.getter(v5);
  v10 = v9;
  if (qword_10005EC88 != -1)
    swift_once(&qword_10005EC88, sub_1000122CC);
  v11 = (uint64_t *)(v2 + 16);
  swift_beginAccess(v2 + 16, v45, 0, 0);
  v12 = swift_bridgeObjectRetain(*(_QWORD *)(v2 + 16));
  v13 = sub_10001A3B4(v12, v8, v10);
  swift_bridgeObjectRelease(v10);
  if (!((unint64_t)v13 >> 62))
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v13);
    if (v14)
      goto LABEL_5;
    return swift_bridgeObjectRelease_n(v13, 2);
  }
  if (v13 < 0)
    v35 = v13;
  else
    v35 = v13 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v13);
  result = _CocoaArrayWrapper.endIndex.getter(v35);
  v14 = result;
  if (!result)
    return swift_bridgeObjectRelease_n(v13, 2);
LABEL_5:
  if (v14 >= 1)
  {
    v16 = 0;
    v38 = v13 & 0xC000000000000001;
    v39 = v14;
    v40 = v4;
    do
    {
      if (v38)
      {
        v20 = specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v13);
      }
      else
      {
        v20 = *(_QWORD *)(v13 + 8 * v16 + 32);
        swift_retain(v20);
      }
      v21 = v13;
      v22 = PurgePayload.killAgents.getter();
      if ((v22 & 1) != 0)
      {
        v23 = Agent.kill()(v22);
        swift_release(v23);
      }
      v44[0] = v20;
      v24 = type metadata accessor for Agent(0);
      v25 = sub_100006618(&qword_10005FAD0, (uint64_t (*)(uint64_t))&type metadata accessor for Agent, (uint64_t)&protocol conformance descriptor for Agent);
      LOBYTE(v36) = 2;
      v26 = Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 213, 29, "purge(with:)", 12, v36, v24, v25);
      Agent.agentBundle.getter(v26);
      swift_beginAccess(v11, v44, 33, 0);
      v27 = *v11;
      swift_bridgeObjectRetain(*v11);
      v28 = sub_100007D58((uint64_t)v7);
      v30 = v29;
      swift_bridgeObjectRelease(v27);
      if ((v30 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v11);
        v32 = *v11;
        v43 = *v11;
        *v11 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_10000B338();
          v32 = v43;
        }
        v18 = v40;
        v19 = *(void (**)(unint64_t, uint64_t))(v41 + 8);
        v19(*(_QWORD *)(v32 + 48) + *(_QWORD *)(v41 + 72) * v28, v40);
        v33 = v43;
        v17 = *(_QWORD *)(*(_QWORD *)(v43 + 56) + 8 * v28);
        sub_100009FF0(v28, v43);
        v34 = *v11;
        *v11 = v33;
        swift_bridgeObjectRelease(v34);
      }
      else
      {
        v17 = 0;
        v18 = v40;
        v19 = *(void (**)(unint64_t, uint64_t))(v41 + 8);
      }
      v13 = v21;
      ++v16;
      v19((unint64_t)v7, v18);
      swift_endAccess(v44);
      swift_release(v20);
      swift_release(v17);
    }
    while (v39 != v16);
    return swift_bridgeObjectRelease_n(v13, 2);
  }
  __break(1u);
  return result;
}

uint64_t sub_100018608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void (*v13)(_BYTE *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _BYTE v19[24];

  v5 = type metadata accessor for AgentDescriptor.Bundle(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_bridgeObjectRetain(a2);
  AgentDescriptor.Bundle.init(bundleID:path:)(a1, a2, 0, 0);
  swift_beginAccess(v2 + 16, v19, 32, 0);
  v9 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v9 + 16) && (v10 = sub_100007D58((uint64_t)v8), (v11 & 1) != 0))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
    swift_endAccess(v19);
    v13 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
    swift_retain(v12);
    v13(v8, v5);
  }
  else
  {
    swift_endAccess(v19);
    v12 = type metadata accessor for AgentLocatingError(0);
    v14 = sub_100006618(&qword_10005FAC0, (uint64_t (*)(uint64_t))&type metadata accessor for AgentLocatingError, (uint64_t)&protocol conformance descriptor for AgentLocatingError);
    swift_allocError(v12, v14, 0, 0);
    *v15 = a1;
    v15[1] = a2;
    swift_storeEnumTagMultiPayload(v15, v12, 1);
    v16 = swift_bridgeObjectRetain(a2);
    swift_willThrow(v16);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v12;
}

uint64_t sub_100018780(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  void (*v12)(_BYTE *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v3 = type metadata accessor for AgentDescriptor.Bundle(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  AgentDescriptor.bundle.getter(v5);
  swift_beginAccess(v1 + 16, v20, 32, 0);
  v8 = *(_QWORD *)(v1 + 16);
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_100007D58((uint64_t)v7), (v10 & 1) != 0))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
    swift_endAccess(v20);
    v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
    swift_retain(v11);
    v12(v7, v3);
  }
  else
  {
    swift_endAccess(v20);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
    v11 = type metadata accessor for AgentLocatingError(0);
    v13 = sub_100006618(&qword_10005FAC0, (uint64_t (*)(uint64_t))&type metadata accessor for AgentLocatingError, (uint64_t)&protocol conformance descriptor for AgentLocatingError);
    swift_allocError(v11, v13, 0, 0);
    v15 = v14;
    v16 = type metadata accessor for AgentDescriptor(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v15, a1, v16);
    v17 = swift_storeEnumTagMultiPayload(v15, v11, 2);
    swift_willThrow(v17);
  }
  return v11;
}

uint64_t sub_1000188FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  if (qword_10005ECC8 != -1)
    swift_once(&qword_10005ECC8, sub_10001E410);
  v2 = qword_10005FDB8;
  if ((byte_10005FDC0 & 1) != 0)
  {
    v5 = qword_10005FDB8;
    swift_errorRetain(qword_10005FDB8);
    v3 = sub_100006658(&qword_10005EFF0);
    return swift_willThrowTypedImpl(&v5, v3, &protocol self-conformance witness table for Error);
  }
  else
  {
    a1[3] = type metadata accessor for StaticPreviewCanvas();
    a1[4] = sub_100006618(&qword_10005FB58, (uint64_t (*)(uint64_t))type metadata accessor for StaticPreviewCanvas, (uint64_t)&unk_10004154C);
    *a1 = v2;
    return swift_retain(v2);
  }
}

uint64_t sub_1000189D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = type metadata accessor for BatchIdentity(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005EC88 != -1)
    v2 = swift_once(&qword_10005EC88, sub_1000122CC);
  Agent.batchIdentity.getter(v2);
  assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SimDisplaySceneRegistry.swift", 119, 2, 319, 26, "canvas(for:in:)", 15, 2);
  v5 = sub_10001AF78();
  v6 = swift_allocError(&type metadata for SimDisplaySceneRegistry.UnsupportedOnDevice, v5, 0, 0);
  swift_willThrow(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_100018AC8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  int v42;
  _QWORD v43[2];
  uint64_t v44;
  _BYTE v45[24];

  v0 = type metadata accessor for ExecutionLane(0);
  v44 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v2 = (char *)v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DeviceType(0);
  __chkstk_darwin(v3);
  v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006658(&qword_10005FB98);
  __chkstk_darwin(v6);
  v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreviewCache.Replayable(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)v43 - v14;
  assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 327, 25, "loadCachedPreview()", 19, 2);
  if (qword_10005ECD8 != -1)
    swift_once(&qword_10005ECD8, sub_100024A64);
  v16 = qword_1000641B8;
  if (qword_1000641B8)
  {
    v43[0] = v0;
    v17 = qword_1000641B8 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
    swift_beginAccess(qword_1000641B8 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, v45, 0, 0);
    sub_10001B2F4(v17, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      swift_retain(v16);
      sub_10000D718((uint64_t)v8, &qword_10005FB98);
      sub_100006658(&qword_10005F000);
      v18 = sub_10001B2B0();
      v19 = swift_allocError(&type metadata for PreviewShellService.ReloadError, v18, 0, 0);
      *v20 = 1;
      v21 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 338, 27, "loadCachedPreview()", 19, 2, v19);
      swift_errorRelease(v19);
      swift_release(v16);
    }
    else
    {
      v27 = (uint64_t)v15;
      sub_10001B33C((uint64_t)v8, (uint64_t)v15);
      v28 = type metadata accessor for SimulatorDevicePayload(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v5, 1, 1, v28);
      swift_retain(v16);
      v29 = (uint64_t)v15;
      v30 = v43[1];
      v31 = sub_100015828(v29, (uint64_t)v5);
      v32 = sub_10001B4DC((uint64_t)v5, (uint64_t (*)(_QWORD))&type metadata accessor for DeviceType);
      static ExecutionLane.main.getter(v32);
      sub_10001B380(v27, (uint64_t)v13, type metadata accessor for PreviewCache.Replayable);
      v33 = *(unsigned __int8 *)(v10 + 80);
      v34 = (v33 + 16) & ~v33;
      v35 = (v11 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
      v36 = swift_allocObject(&unk_100052AF0, v35 + 8, v33 | 7);
      sub_10001B33C((uint64_t)v13, v36 + v34);
      *(_QWORD *)(v36 + v35) = v30;
      v37 = type metadata accessor for PropertyList(0);
      swift_retain(v30);
      v38 = Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 342, 21, "loadCachedPreview()", 19, 2, v2, sub_10001B478, v36, v37);
      swift_release(v31);
      swift_release(v36);
      v39 = *(uint64_t (**)(char *, uint64_t))(v44 + 8);
      v40 = v43[0];
      v41 = v39(v2, v43[0]);
      static ExecutionLane.main.getter(v41);
      swift_retain(v16);
      Future.observeFailure(on:_:)(v2, sub_10001B4D4, v16);
      swift_release(v16);
      v39(v2, v40);
      LOBYTE(v42) = 2;
      v21 = Future.ignoringValue(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 362, 36, "loadCachedPreview()", 19, v42);
      swift_release(v16);
      swift_release(v38);
      sub_10001B4DC(v27, type metadata accessor for PreviewCache.Replayable);
    }
    return v21;
  }
  else
  {
    sub_100006658(&qword_10005F000);
    v22 = sub_10001B2B0();
    v23 = swift_allocError(&type metadata for PreviewShellService.ReloadError, v22, 0, 0);
    *v24 = 0;
    v25 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 335, 27, "loadCachedPreview()", 19, 2, v23);
    swift_errorRelease(v23);
    return v25;
  }
}

char *sub_100018FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t updated;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v46;
  char *v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char v55[36];

  v54 = a3;
  v49 = a2;
  updated = type metadata accessor for UpdateSetupPayload(0);
  __chkstk_darwin(updated);
  v53 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PropertyList(0);
  __chkstk_darwin(v6);
  v52 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006658(&qword_10005FB08);
  __chkstk_darwin(v8);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ContentCategory(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ContentIdentifier(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for PreviewType(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100006658(&qword_10005FB68);
  __chkstk_darwin(v21);
  v23 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = v23;
  v24 = type metadata accessor for ShellUpdatePayload(0);
  v50 = *(_QWORD *)(v24 - 8);
  v51 = v24;
  __chkstk_darwin(v24);
  v26 = (char *)&v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_10001B560(a1, (uint64_t)v55);
  v48 = ProcessID.pid.getter(v27);
  v28 = type metadata accessor for HostUpdateSeed(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v23, 1, 1, v28);
  v29 = enum case for PreviewType.HostLocation.mainScene(_:);
  v30 = type metadata accessor for PreviewType.HostLocation(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v20, v29, v30);
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, enum case for PreviewType.hosted(_:), v17);
  v31 = type metadata accessor for PreviewCache.Replayable(0);
  v32 = v16;
  v33 = ShellUpdatePayload.contentIdentifier.getter(v31);
  v34 = v13;
  v35 = ShellUpdatePayload.contentCategory.getter(v33);
  v36 = v10;
  v37 = ShellUpdatePayload.contentOverride.getter(v35);
  v38 = v52;
  v39 = ShellUpdatePayload.contentPayload.getter(v37);
  v40 = ShellUpdatePayload.staticProducts.getter(v39);
  v41 = v53;
  v42 = ShellUpdatePayload.setupPayload.getter(v40);
  v43 = ShellUpdatePayload.controlStates.getter(v42);
  ShellUpdatePayload.init(pid:hostUpdateSeed:previewType:contentIdentifier:contentCategory:contentOverride:contentPayload:staticProducts:setupPayload:controlStates:)(v48, v47, v20, v32, v34, v36, v38, v40, v41, v43);
  v44 = sub_1000167B0((uint64_t)v26);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v26, v51);
  return v44;
}

uint64_t sub_100019328(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_100006658(&qword_10005FB98);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  swift_beginAccess(a2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, v10, 33, 0);
  sub_10001B518((uint64_t)v5, v7);
  swift_endAccess(v10);
  return sub_100024D28();
}

uint64_t sub_1000193EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  v1 = v0 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_serverFarm;
  v2 = type metadata accessor for ServerFarm(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_pluginRegistry;
  v4 = type metadata accessor for PreviewShellPluginRegistry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10001947C()
{
  return type metadata accessor for PreviewShellService(0);
}

uint64_t type metadata accessor for PreviewShellService(uint64_t a1)
{
  uint64_t result;

  result = qword_10005FA18;
  if (!qword_10005FA18)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PreviewShellService);
  return result;
}

uint64_t sub_1000194C0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[5];

  v5[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v5[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v5[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for ServerFarm(319);
  if (v3 <= 0x3F)
  {
    v5[3] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for PreviewShellPluginRegistry(319);
    if (v4 <= 0x3F)
    {
      v5[4] = *(_QWORD *)(result - 8) + 64;
      result = swift_updateClassMetadata2(a1, 256, 5, v5, a1 + 80);
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_100019568()
{
  return PreviewShellPluginRegistry.providers.getter();
}

uint64_t sub_100019594@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC12PreviewShell19PreviewShellService_serverFarm;
  v4 = type metadata accessor for ServerFarm(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1000195DC(uint64_t a1, uint64_t a2)
{
  return sub_100015828(a1, a2);
}

uint64_t sub_1000195FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for AgentDescriptor(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  PrepareToRelaunchPayload.agentDescriptor.getter(v2);
  v5 = sub_100015428((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v5;
}

char *sub_100019698(uint64_t a1)
{
  return sub_1000167B0(a1);
}

uint64_t sub_1000196B8(int a1)
{
  return sub_100017D70(a1);
}

uint64_t sub_1000196D8()
{
  char v1;

  sub_100006658(&qword_10005F000);
  v1 = 2;
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 200, 19, "performKill(payload:)", 21, v1);
}

uint64_t sub_100019748(uint64_t a1)
{
  return sub_1000182EC(a1);
}

uint64_t sub_100019768()
{
  char v0;

  v0 = static JITCapabilities.userDefaultSupportsJITLinking.getter();
  JITCapabilities.init(supportsJITLinking:supportsLoadCommands:)(v0 & 1, 1);
  return OSCapabilities.init(supportsExecutionPoints:supportsPreviewVariants:supportsContentOverrides:supportsScreenshotRequests:supportsNSPreviewHostableMacPreviews:supportsNSPreviewHostableCatalystPreviews:supportsPerUpdateMessageStreams:supportsRegistryPreviews:supportsExternalRegistries:jitCapabilities:)(1, 1, 1, 1, 0, 0, 1, 1, 1);
}

uint64_t sub_1000197D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = AgentDescriptor.Bundle.bundleID.getter(a1);
  v3 = v2;
  sub_10001BC20(v1, v2);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_100019818(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  v3 = result;
  if (qword_10005ECD8 != -1)
    result = swift_once(&qword_10005ECD8, sub_100024A64);
  if (qword_1000641B8)
    return sub_1000246A0(v3, a2);
  return result;
}

uint64_t sub_100019880(uint64_t a1)
{
  return sub_100018780(a1);
}

uint64_t sub_1000198A0(int a1)
{
  return sub_100017218(a1);
}

BOOL sub_1000198C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000198D8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001991C()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100019944(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void *sub_100019984(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_100019A18@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100019A40(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100019A78(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100019A5C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100019BE4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100019A78(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100006658(&qword_10005FBB0);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100019BE4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100006658(&qword_10005FAF8);
    v11 = (_QWORD *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v13 = (unint64_t)(v11 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 40 * v8)
      memmove(v11 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v14 >= v13 + 40 * v8 || v13 >= v14 + 40 * v8)
  {
    sub_100006658(&qword_10005FB00);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100019D84(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_100019E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = type metadata accessor for DeviceType(0);
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  BatchIdentity.deviceType.getter(v1);
  v4 = type metadata accessor for SimulatorDevicePayload(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4) == 1)
  {
    sub_100006658(&qword_10005F000);
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 299, 30, "prepareDisplay(for:)", 20, 2);
  }
  else
  {
    sub_10001B4DC((uint64_t)v3, (uint64_t (*)(_QWORD))&type metadata accessor for DeviceType);
    if (qword_10005EC88 != -1)
      swift_once(&qword_10005EC88, sub_1000122CC);
    assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SimDisplaySceneRegistry.swift", 119, 2, 324, 26, "prepareForLaunch(_:devicePayload:)", 34, 2);
    sub_100006658(&qword_10005F000);
    v6 = sub_10001AF78();
    v7 = swift_allocError(&type metadata for SimDisplaySceneRegistry.UnsupportedOnDevice, v6, 0, 0);
    v5 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SimDisplaySceneRegistry.swift", 119, 2, 325, 23, "prepareForLaunch(_:devicePayload:)", 34, 2, v7);
    swift_errorRelease(v7);
  }
  return v5;
}

uint64_t sub_100019FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char *v27;
  Swift::String v28;
  void *object;
  int v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  unint64_t v36;

  v4 = type metadata accessor for PreviewType.HostLocation(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PreviewType(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v34 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v33 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v33 - v15;
  v17 = type metadata accessor for DeviceType(0);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  Agent.deviceType.getter(v18);
  v21 = type metadata accessor for SimulatorDevicePayload(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v20, 1, v21) != 1)
  {
    v25 = sub_100006658(&qword_10005FB50);
    __chkstk_darwin(v25);
    v32 = a2;
    v31 = &v30;
    LOBYTE(v30) = 2;
    v24 = ((uint64_t (*)(const mach_header_64 *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, uint64_t (*)()))static Future.completed(dsoHandle:file:line:column:function:_:))(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 318, 31, "previewCanvas(for:in:)", 22, v30, sub_10001AF60);
    sub_10001B4DC((uint64_t)v20, (uint64_t (*)(_QWORD))&type metadata accessor for DeviceType);
    return v24;
  }
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v22(v16, a1, v8);
  v23 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v16, v8);
  if (v23 == enum case for PreviewType.hosted(_:))
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v16, v8);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v16, v4);
    if (qword_10005ECD0 != -1)
      swift_once(&qword_10005ECD0, sub_10001F594);
    v24 = sub_10001EEFC((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v24;
  }
  if (v23 == enum case for PreviewType.static(_:))
  {
    sub_100006658(&qword_10005FB50);
    LOBYTE(v30) = 2;
    return static Future.completed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewShellService.swift", 115, 2, 310, 35, "previewCanvas(for:in:)", 22, v30, sub_1000188FC, 0, v32);
  }
  v22(v14, a1, v8);
  v35 = 0;
  v36 = 0xE000000000000000;
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease(v36);
  v35 = 0xD000000000000015;
  v36 = 0x8000000100046BB0;
  v27 = v34;
  v22(v34, (uint64_t)v14, v8);
  v28._countAndFlagsBits = String.init<A>(describing:)(v27, v8);
  object = v28._object;
  String.append(_:)(v28);
  swift_bridgeObjectRelease(object);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v35, v36, "PreviewShell/PreviewShellService.swift", 38, 2, 315, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001A3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  v6 = type metadata accessor for BatchIdentity(0);
  v34 = *(_QWORD *)(v6 - 8);
  v35 = v6;
  result = __chkstk_darwin();
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v36 = &_swiftEmptyArrayStorage;
  v11 = a1;
  v12 = *(_QWORD *)(a1 + 64);
  v32 = a1 + 64;
  v13 = 1 << *(_BYTE *)(a1 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v33 = (unint64_t)(v13 + 63) >> 6;
  if ((v14 & v12) != 0)
    goto LABEL_7;
LABEL_8:
  while (2)
  {
    v21 = v10 + 1;
    if (!__OFADD__(v10, 1))
    {
      if (v21 < v33)
      {
        v22 = *(_QWORD *)(v32 + 8 * v21);
        ++v10;
        if (v22)
          goto LABEL_23;
        v10 = v21 + 1;
        if (v21 + 1 >= v33)
          goto LABEL_29;
        v22 = *(_QWORD *)(v32 + 8 * v10);
        if (v22)
          goto LABEL_23;
        v10 = v21 + 2;
        if (v21 + 2 >= v33)
          goto LABEL_29;
        v22 = *(_QWORD *)(v32 + 8 * v10);
        if (v22)
          goto LABEL_23;
        v10 = v21 + 3;
        if (v21 + 3 >= v33)
          goto LABEL_29;
        v22 = *(_QWORD *)(v32 + 8 * v10);
        if (v22)
        {
LABEL_23:
          v15 = (v22 - 1) & v22;
          for (i = __clz(__rbit64(v22)) + (v10 << 6); ; i = v19 | (v10 << 6))
          {
            v24 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * i);
            v25 = swift_retain(v24);
            v26 = Agent.batchIdentity.getter(v25);
            v27 = BatchIdentity.workspaceID.getter(v26);
            v29 = v28;
            (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v35);
            if (v27 == a2 && v29 == a3)
              break;
            v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v29, a2, a3, 0);
            v16 = swift_bridgeObjectRelease(v29);
            if ((v30 & 1) != 0)
              goto LABEL_6;
            result = swift_release(v24);
            if (!v15)
              goto LABEL_8;
LABEL_7:
            v19 = __clz(__rbit64(v15));
            v15 &= v15 - 1;
          }
          v16 = swift_bridgeObjectRelease(a3);
LABEL_6:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v16);
          v17 = v36[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
          v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v24);
          result = specialized ContiguousArray._endMutation()(v18);
          if (!v15)
            continue;
          goto LABEL_7;
        }
        v23 = v21 + 4;
        if (v23 < v33)
        {
          v22 = *(_QWORD *)(v32 + 8 * v23);
          if (v22)
          {
            v10 = v23;
            goto LABEL_23;
          }
          while (1)
          {
            v10 = v23 + 1;
            if (__OFADD__(v23, 1))
              goto LABEL_31;
            if (v10 >= v33)
              break;
            v22 = *(_QWORD *)(v32 + 8 * v10);
            ++v23;
            if (v22)
              goto LABEL_23;
          }
        }
      }
LABEL_29:
      swift_release(v11);
      return (uint64_t)v36;
    }
    break;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_10001A648(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[24];

  v2 = sub_100006658(&qword_10005FAC8);
  __chkstk_darwin(v2);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for AgentDescriptor.Bundle(0);
  __chkstk_darwin(v5);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = type metadata accessor for AgentDescriptor(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin(v8);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005ECD8 != -1)
    result = swift_once(&qword_10005ECD8, sub_100024A64);
  v13 = qword_1000641B8;
  if (qword_1000641B8)
  {
    v14 = LaunchPayload.agentDescriptor.getter();
    AgentDescriptor.bundle.getter(v14);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
    v15 = type metadata accessor for LaunchPayload(0);
    v16 = *(_QWORD *)(v15 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16))(v4, a1, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v4, 0, 1, v15);
    swift_beginAccess(v13 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_launches, v18, 33, 0);
    sub_100014C3C((uint64_t)v4, (uint64_t)v7);
    return swift_endAccess(v18);
  }
  return result;
}

uint64_t sub_10001A7F4(_QWORD *a1)
{
  return sub_10001AFC8(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of NonUIContentProviderBox.stop(of:));
}

uint64_t sub_10001A800(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(unsigned int *)(v1 + 16);
  v3 = a1[3];
  v4 = a1[4];
  sub_10000D648(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(v2, v3, v4);
}

uint64_t sub_10001A848()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001A86C(uint64_t a1)
{
  uint64_t v1;

  return sub_1000181B8(a1, *(_DWORD *)(v1 + 16));
}

uint64_t sub_10001A878()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  updated = type metadata accessor for ShellUpdatePayload(0);
  v2 = *(_QWORD *)(updated - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  swift_release(*(_QWORD *)(v0 + v6));
  swift_release(*(_QWORD *)(v0 + v7));
  return swift_deallocObject(v0, v7 + 8, v5);
}

uint64_t sub_10001A904@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t updated;
  unint64_t v6;

  updated = type metadata accessor for ShellUpdatePayload(0);
  v6 = (*(_QWORD *)(*(_QWORD *)(updated - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(updated - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(updated - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_100017440(a1, *(_QWORD *)(v2 + v6), *(_QWORD *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_10001A970(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_10001A978()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  updated = type metadata accessor for ShellUpdatePayload(0);
  v2 = *(_QWORD *)(updated - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10001AA08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for ShellUpdatePayload(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_100017904(a1, a2, *(_QWORD *)(v2 + 16), v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10001AA70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t updated;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for ContentKey(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  updated = type metadata accessor for ShellUpdatePayload(0);
  v7 = *(_QWORD *)(updated - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v5 + v8 + 16) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v5 + 8));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, updated);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_10001AB3C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v7 = *(_QWORD *)(type metadata accessor for ContentKey(0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  type metadata accessor for ShellUpdatePayload(0);
  return sub_100017C6C(a1, a2, a3, v3 + v8, *(_QWORD *)(v3 + v9), *(_QWORD *)(v3 + v9 + 8));
}

uint64_t sub_10001ABD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v4 = sub_100006658(&qword_10005FB20);
  return v3(a1, a1 + *(int *)(v4 + 48), a1 + *(int *)(v4 + 64));
}

uint64_t sub_10001AC1C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_10001AC34(a1, a2);
  return a1;
}

uint64_t sub_10001AC34(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t sub_10001AC3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001AC64(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000066E4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001ACA4()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  updated = type metadata accessor for ShellUpdatePayload(0);
  v2 = *(_QWORD *)(updated - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  sub_10000D6B0((_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001AD18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  type metadata accessor for ShellUpdatePayload(0);
  return sub_1000177E0(a1, a2, (_QWORD *)(v2 + 16));
}

uint64_t sub_10001AD68(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  v4 = sub_100006658(&qword_10005FB18);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_10001ADAC()
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
  uint64_t v11;

  v1 = type metadata accessor for PreviewAgentConnector(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for AgentUpdate.Context(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_10001AE60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v6 = *(_QWORD *)(type metadata accessor for PreviewAgentConnector(0) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AgentUpdate.Context(0) - 8) + 80);
  v10 = v7 + v8 + v9;
  v11 = v2 + v7;
  v12 = v2 + (v10 & ~v9);
  v13 = (_QWORD *)swift_task_alloc(dword_10005FB44);
  *(_QWORD *)(v3 + 16) = v13;
  *v13 = v3;
  v13[1] = sub_10001AF18;
  v13[4] = v11;
  v13[5] = v12;
  v13[2] = a1;
  v13[3] = a2;
  return swift_task_switch(sub_100017BC0, 0, 0);
}

uint64_t sub_10001AF18()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001AF60()
{
  return sub_1000189D0();
}

unint64_t sub_10001AF78()
{
  unint64_t result;

  result = qword_10005FCC0;
  if (!qword_10005FCC0)
  {
    result = swift_getWitnessTable(&unk_1000403B4, &type metadata for SimDisplaySceneRegistry.UnsupportedOnDevice);
    atomic_store(result, (unint64_t *)&qword_10005FCC0);
  }
  return result;
}

uint64_t sub_10001AFBC(_QWORD *a1)
{
  return sub_10001AFC8(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of NonUIContentProviderBox.prepareForRelaunch(of:));
}

uint64_t sub_10001AFC8(_QWORD *a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(unsigned int *)(v2 + 16);
  v5 = a1[3];
  v6 = a1[4];
  sub_10000D648(a1, v5);
  return a2(v4, v5, v6);
}

uint64_t sub_10001B014(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(unsigned int *)(v1 + 16);
  v3 = a1[3];
  v4 = a1[4];
  sub_10000D648(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v3, v4);
}

uint64_t sub_10001B05C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = type metadata accessor for AgentDescriptor.Bundle(0);
  v1 = *(_QWORD *)(v18 - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = (*(_QWORD *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = v4;
  v17 = type metadata accessor for BatchIdentity(0);
  v5 = *(_QWORD *)(v17 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v4 + v6 + 40) & ~v6;
  v8 = (*(_QWORD *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = type metadata accessor for LaunchPayload(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v11 + v8 + 9) & ~v11;
  v16 = v12 + *(_QWORD *)(v10 + 64);
  v13 = v2 | v6 | v11 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v18);
  sub_10000D6B0((_QWORD *)(v0 + v15));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v17);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);
  return swift_deallocObject(v0, v16, v13);
}

uint64_t sub_10001B184(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(type metadata accessor for AgentDescriptor.Bundle(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(type metadata accessor for BatchIdentity(0) - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LaunchPayload(0) - 8) + 80);
  return sub_1000164BC(a1, *(_QWORD *)(v1 + 16), v1 + v4, v1 + v5, v1 + v7, *(_QWORD *)(v1 + v8), *(unsigned __int8 *)(v1 + v8 + 8), v1 + ((v9 + v8 + 9) & ~v9));
}

_BYTE *sub_10001B244@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unint64_t sub_10001B2B0()
{
  unint64_t result;

  result = qword_10005FBA0;
  if (!qword_10005FBA0)
  {
    result = swift_getWitnessTable(&unk_100040788, &type metadata for PreviewShellService.ReloadError);
    atomic_store(result, (unint64_t *)&qword_10005FBA0);
  }
  return result;
}

uint64_t sub_10001B2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B33C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B380(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001B3C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v1 = type metadata accessor for PreviewCache.Replayable(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = v0 + v4;
  v8 = type metadata accessor for LaunchPayload(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v7 + *(int *)(v1 + 20);
  updated = type metadata accessor for ShellUpdatePayload(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v9, updated);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

char *sub_10001B478(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for PreviewCache.Replayable(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100018FDC(a1, v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10001B4D4(uint64_t a1)
{
  uint64_t v1;

  return sub_100019328(a1, v1);
}

uint64_t sub_10001B4DC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001B518(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B560(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for ProcessID - 1) + 32))(a2, a1);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for PreviewShellService.ReloadError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewShellService.ReloadError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewShellService.ReloadError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001B684 + 4 * byte_100040635[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001B6B8 + 4 * byte_100040630[v4]))();
}

uint64_t sub_10001B6B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B6C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001B6C8);
  return result;
}

uint64_t sub_10001B6D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001B6DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001B6E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B6E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B6F4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10001B700(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewShellService.ReloadError()
{
  return &type metadata for PreviewShellService.ReloadError;
}

unint64_t sub_10001B720()
{
  unint64_t result;

  result = qword_10005FBA8;
  if (!qword_10005FBA8)
  {
    result = swift_getWitnessTable(&unk_100040760, &type metadata for PreviewShellService.ReloadError);
    atomic_store(result, (unint64_t *)&qword_10005FBA8);
  }
  return result;
}

id sub_10001B770(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v5;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = v5;
  v17.super_class = (Class)swift_getObjectType(v5);
  v11 = objc_msgSendSuper2(&v17, "initWithWindowScene:", a1);
  objc_msgSend(v11, "setWindowLevel:", UIWindowLevelStatusBar);
  objc_allocWithZone((Class)type metadata accessor for ExclusionView());
  v12 = v11;
  v13 = sub_10001B980(a2, a3, a4, a5);
  v14 = objc_allocWithZone((Class)type metadata accessor for CounterRotationViewController(0));
  v15 = (void *)CounterRotationViewController.init(contentView:contentOrientation:)(v13, 1);
  objc_msgSend(v12, "setRootViewController:", v15);

  objc_msgSend(v12, "setUserInteractionEnabled:", 0);
  return v12;
}

uint64_t type metadata accessor for ExclusionWindow()
{
  return objc_opt_self(_TtC12PreviewShell15ExclusionWindow);
}

id sub_10001B980(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  void *v4;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v20;
  CGRect v21;

  v20.receiver = v4;
  v20.super_class = (Class)swift_getObjectType(v4);
  v9 = objc_msgSendSuper2(&v20, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v10 = objc_allocWithZone((Class)UIView);
  v11 = v9;
  v12 = objc_msgSend(v10, "init");
  v13 = (void *)objc_opt_self(UIColor);
  v14 = objc_msgSend(v13, "blackColor");
  objc_msgSend(v12, "setBackgroundColor:", v14);

  objc_msgSend(v12, "setFrame:", a1, a2, a3, a4);
  v15 = objc_msgSend(v12, "layer");
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  objc_msgSend(v15, "setCornerRadius:", CGRectGetHeight(v21) * 0.5);

  v16 = objc_msgSend(v12, "layer");
  objc_msgSend(v16, "setCornerCurve:", kCACornerCurveContinuous);

  v17 = v11;
  v18 = objc_msgSend(v13, "clearColor");
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(v17, "addSubview:", v12);
  return v17;
}

void sub_10001BBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _swift_stdlib_reportUnimplementedInitializer(a3, a4, a5, a6, 0);
  __break(1u);
}

uint64_t type metadata accessor for ExclusionView()
{
  return objc_opt_self(_TtC12PreviewShellP33_F4033C2D03CA9FBC92D17B7689EBE6DA13ExclusionView);
}

uint64_t sub_10001BC20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[24];
  _QWORD v15[2];
  uint64_t v16;

  v15[0] = a1;
  v15[1] = a2;
  swift_beginAccess(v2 + OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts, v14, 33, 0);
  v5 = sub_100006658(&qword_10005FCB0);
  v6 = sub_10001CFE0();
  KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)(&v16, v15, sub_10001BF48, 0, v5, v6);
  result = swift_endAccess(v14);
  v8 = v16;
  if (!((unint64_t)v16 >> 62))
  {
    v9 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9)
      goto LABEL_3;
    return swift_bridgeObjectRelease(v8);
  }
  if (v16 < 0)
    v13 = v16;
  else
    v13 = v16 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v16);
  v9 = _CocoaArrayWrapper.endIndex.getter(v13);
  result = swift_bridgeObjectRelease(v8);
  if (!v9)
    return swift_bridgeObjectRelease(v8);
LABEL_3:
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0)
        v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v8);
      else
        v11 = *(id *)(v8 + 8 * i + 32);
      v12 = v11;
      sub_10001D02C(v11, a1, a2);

    }
    return swift_bridgeObjectRelease(v8);
  }
  __break(1u);
  return result;
}

id sub_10001BD68()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  NSString v16;
  id v17;
  objc_super v19;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts] = &_swiftEmptyDictionarySingleton;
  v7 = OBJC_IVAR____TtC12PreviewShell19UserAlertController_locationSim;
  v8 = objc_allocWithZone((Class)CLSimulationManager);
  v9 = v1;
  v10 = objc_msgSend(v8, "init");
  *(_QWORD *)&v1[v7] = v10;
  v11 = static Logger.uv.getter(v10);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "AlertService init", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v15 = objc_allocWithZone((Class)URTAlertService);
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v15, "initWithDomain:", v16);

  *(_QWORD *)&v9[OBJC_IVAR____TtC12PreviewShell19UserAlertController_underlying] = v17;
  v19.receiver = v9;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, "init");
}

void sub_10001BF48(_QWORD *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

uint64_t sub_10001BF58()
{
  void *v0;
  void *v1;
  Swift::String v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;
  Swift::String v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  Swift::String v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  Swift::String v29;
  Swift::String v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  Swift::String v38;
  Swift::String v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  Swift::String v46;
  Swift::String v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  Swift::String v54;
  Swift::String v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  Swift::String v61;
  Swift::String v62;

  v1 = v0;
  _StringGuts.grow(_:)(130);
  v2._countAndFlagsBits = 0x6669746E6564693CLL;
  v2._object = (void *)0xED0000203A726569;
  String.append(_:)(v2);
  v3 = objc_msgSend(v0, "identifier");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v6);
  v8._countAndFlagsBits = 0x3A656C746974202CLL;
  v8._object = (void *)0xEA00000000002720;
  String.append(_:)(v8);
  v9 = objc_msgSend(v1, "title");
  if (v9)
  {
    v10 = v9;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = sub_100006658((uint64_t *)&unk_10005FCD0);
  v16 = Optional.log.getter(v14, v15);
  v18 = v17;
  swift_bridgeObjectRelease(v13);
  v19._countAndFlagsBits = v16;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  v20._countAndFlagsBits = 0x617373656D202C27;
  v20._object = (void *)0xED000027203A6567;
  String.append(_:)(v20);
  v21 = objc_msgSend(v1, "message", v11, v13);
  if (v21)
  {
    v23 = v21;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v25 = v24;

  }
  else
  {
    v25 = 0;
  }
  v26 = Optional.log.getter(v14, v22);
  v28 = v27;
  swift_bridgeObjectRelease(v25);
  v29._countAndFlagsBits = v26;
  v29._object = v28;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v28);
  v30._countAndFlagsBits = 0xD000000000000020;
  v30._object = (void *)0x8000000100046ED0;
  String.append(_:)(v30);
  v31 = objc_msgSend(v1, "allowedApplicationBundleIDs");
  if (v31)
  {
    v32 = v31;
    v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v31, &type metadata for String);

    v34 = Array.description.getter(v33, &type metadata for String);
    v36 = v35;
    swift_bridgeObjectRelease(v33);
  }
  else
  {
    v36 = (void *)0xE200000000000000;
    v34 = 23899;
  }
  v37 = 7104878;
  v38._countAndFlagsBits = v34;
  v38._object = v36;
  String.append(_:)(v38);
  swift_bridgeObjectRelease(v36);
  v39._object = (void *)0x8000000100046F00;
  v39._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v39);
  v40 = objc_msgSend(v1, "defaultAction");
  if (v40)
  {
    v41 = v40;
    v42 = objc_msgSend(v40, "title");

    v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
    v45 = v44;

  }
  else
  {
    v45 = (void *)0xE300000000000000;
    v43 = 7104878;
  }
  v46._countAndFlagsBits = v43;
  v46._object = v45;
  String.append(_:)(v46);
  swift_bridgeObjectRelease(v45);
  v47._countAndFlagsBits = 0x65636E6163202C27;
  v47._object = (void *)0xEC00000027203A6CLL;
  String.append(_:)(v47);
  v48 = objc_msgSend(v1, "cancelAction");
  if (v48)
  {
    v49 = v48;
    v50 = objc_msgSend(v48, "title");

    v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
    v53 = v52;

  }
  else
  {
    v53 = (void *)0xE300000000000000;
    v51 = 7104878;
  }
  v54._countAndFlagsBits = v51;
  v54._object = v53;
  String.append(_:)(v54);
  swift_bridgeObjectRelease(v53);
  v55._countAndFlagsBits = 0x726568746F202C27;
  v55._object = (void *)0xEB0000000027203ALL;
  String.append(_:)(v55);
  v56 = objc_msgSend(v1, "otherAction");
  if (v56)
  {
    v57 = v56;
    v58 = objc_msgSend(v56, "title");

    v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    v60 = v59;

  }
  else
  {
    v60 = (void *)0xE300000000000000;
  }
  v61._countAndFlagsBits = v37;
  v61._object = v60;
  String.append(_:)(v61);
  swift_bridgeObjectRelease(v60);
  v62._countAndFlagsBits = 4087079;
  v62._object = (void *)0xE300000000000000;
  String.append(_:)(v62);
  return 0;
}

uint64_t sub_10001C3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[12] = a4;
  v5[13] = a5;
  v6 = type metadata accessor for Logger(0);
  v5[14] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[15] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[16] = swift_task_alloc(v8);
  v5[17] = swift_task_alloc(v8);
  v9 = type metadata accessor for MainActor(0);
  v5[18] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001C474, v10, v11);
}

uint64_t sub_10001C474()
{
  uint64_t v0;
  void *v1;
  id *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8_t *v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t result;
  char v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id *v58;
  id *v59;
  id *v60;
  void **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id *v66;
  uint64_t v67;
  _QWORD *v68;

  v2 = (id *)(v0 + 96);
  v1 = *(void **)(v0 + 96);
  v3 = swift_release(*(_QWORD *)(v0 + 144));
  static Logger.uv.getter(v3);
  v4 = Logger.logObject.getter(v1);
  v5 = static os_log_type_t.default.getter();
  v61 = (void **)(v0 + 96);
  v62 = v0;
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 120);
    v63 = *(_QWORD *)(v0 + 112);
    v65 = *(_QWORD *)(v0 + 136);
    v7 = *(void **)(v0 + 96);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v68 = (_QWORD *)v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_10001BF58();
    v12 = v11;
    *(_QWORD *)(v0 + 88) = sub_100010F78(v10, v11, (uint64_t *)&v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v61, v8 + 4);
    swift_bridgeObjectRelease(v12);

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "AlertService present %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    v13 = v8;
    v2 = (id *)(v0 + 96);
    swift_slowDealloc(v13, -1, -1);

    v14 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v14(v65, v63);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 112);
    v17 = *(_QWORD *)(v0 + 120);
    v18 = *(void **)(v0 + 96);

    v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v14(v15, v16);
  }
  v19 = objc_msgSend(*v2, "allowedApplicationBundleIDs");
  if (!v19)
  {
    v49 = static Logger.uv.getter(0);
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "AlertService ignoring system alert", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }
    v53 = *(_QWORD *)(v0 + 128);
    v54 = *(_QWORD *)(v0 + 112);

    v14(v53, v54);
LABEL_28:
    v56 = *(_QWORD *)(v0 + 128);
    swift_task_dealloc(*(_QWORD *)(v0 + 136));
    swift_task_dealloc(v56);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v20 = v19;
  v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);

  v22 = *(_QWORD *)(v21 + 16);
  if (!v22)
  {
    v55 = v21;
LABEL_27:
    swift_bridgeObjectRelease(v55);
    goto LABEL_28;
  }
  v66 = v2 - 7;
  v59 = v2 - 4;
  v60 = v2 - 10;
  v57 = v21;
  v58 = v2 - 2;
  v23 = (_QWORD *)(*(_QWORD *)(v0 + 104) + OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts);
  v24 = (uint64_t *)(v21 + 40);
  while (1)
  {
    v64 = v22;
    v28 = *(void **)(v0 + 96);
    v30 = *(v24 - 1);
    v29 = *v24;
    *(_QWORD *)(v0 + 64) = v30;
    *(_QWORD *)(v0 + 72) = v29;
    swift_beginAccess(v23, v60, 33, 0);
    swift_bridgeObjectRetain(v29);
    v31 = sub_100006658(&qword_10005FCB0);
    v32 = sub_10001CFE0();
    KeyValueMap.guaranteedValue(for:creatingIfNecessaryWith:)(v58, v59, sub_10001BF48, 0, v31, v32);
    swift_endAccess(v60);
    v67 = *(_QWORD *)(v0 + 80);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v28);
    v34 = *(_QWORD *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v33 = *(_QWORD *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v34 >= v33 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
    v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, *v2);
    specialized Array._endMutation()(v35);
    swift_beginAccess(v23, v66, 33, 0);
    swift_bridgeObjectRetain(v29);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v23);
    v68 = (_QWORD *)*v23;
    v37 = v68;
    *v23 = 0x8000000000000000;
    v39 = sub_100007C5C(v30, v29);
    v40 = v37[2];
    v41 = (v38 & 1) == 0;
    result = v40 + v41;
    if (__OFADD__(v40, v41))
      break;
    v43 = v38;
    if (v37[3] >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v38 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        result = (uint64_t)sub_10000BA0C();
        v37 = v68;
        if ((v43 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_100009528(result, isUniquelyReferenced_nonNull_native);
      v37 = v68;
      result = sub_100007C5C(v30, v29);
      if ((v43 & 1) != (v44 & 1))
        return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      v39 = result;
      if ((v43 & 1) != 0)
      {
LABEL_7:
        v25 = v37[7];
        swift_bridgeObjectRelease(*(_QWORD *)(v25 + 8 * v39));
        *(_QWORD *)(v25 + 8 * v39) = v67;
        goto LABEL_8;
      }
    }
    v37[(v39 >> 6) + 8] |= 1 << v39;
    v45 = (uint64_t *)(v37[6] + 16 * v39);
    *v45 = v30;
    v45[1] = v29;
    *(_QWORD *)(v37[7] + 8 * v39) = v67;
    v46 = v37[2];
    v47 = __OFADD__(v46, 1);
    v48 = v46 + 1;
    if (v47)
      goto LABEL_31;
    v37[2] = v48;
    swift_bridgeObjectRetain(v29);
LABEL_8:
    v2 = v61;
    v26 = *v61;
    v27 = *v23;
    *v23 = v37;
    swift_bridgeObjectRelease(v27);
    swift_bridgeObjectRelease(v29);
    swift_endAccess(v66);
    sub_10001D02C(v26, v30, v29);
    swift_bridgeObjectRelease(v29);
    v24 += 2;
    v0 = v62;
    v22 = v64 - 1;
    if (v64 == 1)
    {
      v55 = v57;
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_10001CAC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[6] = a4;
  v5[7] = a5;
  v6 = type metadata accessor for Logger(0);
  v5[8] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[9] = v7;
  v5[10] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v5[11] = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001CB5C, v9, v10);
}

uint64_t sub_10001CB5C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = *(void **)(v0 + 48);
  v2 = swift_release(*(_QWORD *)(v0 + 88));
  static Logger.uv.getter(v2);
  v3 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v32 = *(_QWORD *)(v0 + 72);
    v33 = *(_QWORD *)(v0 + 64);
    v34 = *(_QWORD *)(v0 + 80);
    v5 = *(void **)(v0 + 48);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v35 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = sub_10001BF58();
    v10 = v9;
    *(_QWORD *)(v0 + 40) = sub_100010F78(v8, v9, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v6 + 4);
    swift_bridgeObjectRelease(v10);

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "AlertService dismiss %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 72);
    v11 = *(_QWORD *)(v0 + 80);
    v13 = *(_QWORD *)(v0 + 64);
    v14 = *(void **)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v15 = objc_msgSend(*(id *)(v0 + 48), "allowedApplicationBundleIDs");
  if (v15)
  {
    v16 = v15;
    v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, &type metadata for String);

    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v19 = (uint64_t *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts);
      v20 = (uint64_t *)(v17 + 40);
      do
      {
        v22 = *(v20 - 1);
        v23 = *v20;
        swift_beginAccess(v19, v0 + 16, 33, 0);
        v24 = *v19;
        swift_bridgeObjectRetain(v23);
        swift_bridgeObjectRetain(v24);
        v25 = sub_100007C5C(v22, v23);
        LOBYTE(v22) = v26;
        swift_bridgeObjectRelease(v24);
        if ((v22 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v19);
          v28 = *v19;
          v35 = *v19;
          *v19 = 0x8000000000000000;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10000BA0C();
            v28 = v35;
          }
          swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v28 + 48) + 16 * v25 + 8));
          v29 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v25);
          sub_100009E1C(v25, v28);
          v30 = *v19;
          *v19 = v28;
          swift_bridgeObjectRelease(v30);
          swift_bridgeObjectRelease(v23);
          v21 = v29;
        }
        else
        {
          v21 = v23;
        }
        swift_bridgeObjectRelease(v21);
        swift_endAccess(v0 + 16);
        v20 += 2;
        --v18;
      }
      while (v18);
    }
    swift_bridgeObjectRelease(v17);
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for UserAlertController()
{
  return objc_opt_self(_TtC12PreviewShell19UserAlertController);
}

unint64_t sub_10001CFE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005FCB8;
  if (!qword_10005FCB8)
  {
    v1 = sub_1000066E4(&qword_10005FCB0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_10005FCB8);
  }
  return result;
}

uint64_t sub_10001D02C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint8_t *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[2];

  v6 = type metadata accessor for BatchIdentity(0);
  v46 = *(_QWORD *)(v6 - 8);
  v47 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v49 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v43 - v13;
  if (qword_10005EC98 != -1)
    swift_once(&qword_10005EC98, sub_10001501C);
  v15 = sub_100018608(a2, a3);
  v45 = a1;
  static Logger.uv.getter(v15);
  v16 = swift_retain_n(v15, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(12, -1);
    v48 = v9;
    v20 = (uint8_t *)v19;
    v44 = swift_slowAlloc(32, -1);
    v50 = v15;
    v51[0] = v44;
    *(_DWORD *)v20 = 136315138;
    v43 = v20 + 4;
    v21 = type metadata accessor for Agent(0);
    v22 = sub_10001D4C0();
    v23 = dispatch thunk of CustomStringConvertible.description.getter(v21, v22);
    v25 = v24;
    v50 = sub_100010F78(v23, v24, v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v43);
    swift_release_n(v15, 2);
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "AlertService found agent to handle alert: %s", v20, 0xCu);
    v26 = v44;
    swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    v27 = v20;
    v9 = v48;
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_release_n(v15, 2);
  }
  v28 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v14, v9);
  v29 = v45;
  if (qword_10005EC88 != -1)
    v28 = swift_once(&qword_10005EC88, sub_1000122CC);
  Agent.batchIdentity.getter(v28);
  assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SimDisplaySceneRegistry.swift", 119, 2, 319, 26, "canvas(for:in:)", 15, 2);
  v30 = sub_10001AF78();
  v31 = swift_allocError(&type metadata for SimDisplaySceneRegistry.UnsupportedOnDevice, v30, 0, 0);
  swift_willThrow(v31);
  swift_release(v15);
  v32 = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v8, v47);
  static Logger.uv.getter(v32);
  v33 = v29;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc(12, -1);
    v48 = v9;
    v37 = (uint8_t *)v36;
    v38 = swift_slowAlloc(32, -1);
    v51[0] = v38;
    *(_DWORD *)v37 = 136315138;
    v39 = sub_10001BF58();
    v41 = v40;
    v50 = sub_100010F78(v39, v40, v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v37 + 4);

    swift_bridgeObjectRelease(v41);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "AlertService was unable to present alert: %s", v37, 0xCu);
    swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v37, -1, -1);
    swift_errorRelease(v31);

    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v12, v48);
  }
  else
  {

    swift_errorRelease(v31);
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v12, v9);
  }
}

unint64_t sub_10001D4C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005FCC8;
  if (!qword_10005FCC8)
  {
    v1 = type metadata accessor for Agent(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Agent, v1);
    atomic_store(result, (unint64_t *)&qword_10005FCC8);
  }
  return result;
}

uint64_t sub_10001D50C(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10005FCE4);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10001AF18;
  return sub_10001CAC8(a1, v4, v5, v7, v6);
}

uint64_t sub_10001D588()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001D5BC(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10005FCF4);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10001D634;
  return sub_10001C3D0(a1, v4, v5, v7, v6);
}

unint64_t sub_10001D638(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = sub_100006658(&qword_10005FDA0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = _swiftEmptyDictionarySingleton;
LABEL_9:
    v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }
  sub_100006658(&qword_10005FDA8);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10001E3C8(v13, (uint64_t)v5);
    result = sub_100007E70((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for ContentCategory(0);
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    v20 = v8[7];
    v21 = type metadata accessor for EntryPointCategory(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v17, v10, v21);
    v22 = v8[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_12;
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v25 = v27;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10001D7E4()
{
  uint64_t v0;
  unint64_t v1;

  v0 = type metadata accessor for PreviewShellPluginRegistry(0);
  sub_10001D848(v0, qword_100064188);
  sub_10000C53C(v0, (uint64_t)qword_100064188);
  v1 = sub_10001D888();
  return static PreviewShellPluginRegistry.load<A>(using:location:)(&type metadata for BuiltinPlugin, 0, &type metadata for BuiltinPlugin, v1);
}

uint64_t *sub_10001D848(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

unint64_t sub_10001D888()
{
  unint64_t result;

  result = qword_10005FD20;
  if (!qword_10005FD20)
  {
    result = swift_getWitnessTable(&unk_10004088C, &type metadata for BuiltinPlugin);
    atomic_store(result, (unint64_t *)&qword_10005FD20);
  }
  return result;
}

ValueMetadata *type metadata accessor for BuiltinPlugin()
{
  return &type metadata for BuiltinPlugin;
}

unint64_t sub_10001D8DC()
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
  uint64_t v11;
  unint64_t result;

  v0 = sub_100006658(&qword_10005FD98);
  v1 = *(_QWORD *)(sub_100006658(&qword_10005FDA0) - 8);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ 5 * *(_QWORD *)(v1 + 72), *(unsigned __int8 *)(v1 + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100040830;
  v3 = static ContentCategory.previewProvider.getter();
  v4 = static EntryPointCategory.previewProvider.getter(v3);
  v5 = static ContentCategory.previewPreflight.getter(v4);
  v6 = static EntryPointCategory.previewPreflight.getter(v5);
  v7 = static ContentCategory.cFunction.getter(v6);
  v8 = static EntryPointCategory.cFunction.getter(v7);
  v9 = static ContentCategory.registryPreflight.getter(v8);
  v10 = static EntryPointCategory.registryPreflight.getter(v9);
  v11 = static ContentCategory.registryExecution.getter(v10);
  static EntryPointCategory.registryExecution.getter(v11);
  result = sub_10001D638(v2);
  qword_10005FD00 = result;
  return result;
}

uint64_t sub_10001D9FC(uint64_t a1, uint64_t a2)
{
  return sub_10001DB78(a1, a2, &qword_10005ECA8, &qword_10005FD00, (uint64_t)sub_10001D8DC);
}

unint64_t sub_10001DA18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(char *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  uint64_t v12;

  v0 = type metadata accessor for PreviewSourceContentCategory(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006658(&qword_10005FD98);
  v5 = *(_QWORD *)(sub_100006658(&qword_10005FDA0) - 8);
  v6 = swift_allocObject(v4, ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ 2 * *(_QWORD *)(v5 + 72), *(unsigned __int8 *)(v5 + 80) | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100040840;
  static PreviewSourceContentCategory.swiftUIView.getter();
  static ContentCategory.source(_:)(v3);
  v7 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v8 = v7(v3, v0);
  v9 = static EntryPointCategory.previewInstance.getter(v8);
  static PreviewSourceContentCategory.uiKitView.getter(v9);
  static ContentCategory.source(_:)(v3);
  v10 = v7(v3, v0);
  static EntryPointCategory.previewInstance.getter(v10);
  result = sub_10001D638(v6);
  qword_10005FD08 = result;
  return result;
}

uint64_t sub_10001DB5C(uint64_t a1, uint64_t a2)
{
  return sub_10001DB78(a1, a2, &qword_10005ECB0, &qword_10005FD08, (uint64_t)sub_10001DA18);
}

uint64_t sub_10001DB78(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  if (*a3 != -1)
    swift_once(a3, a5);
  return swift_bridgeObjectRetain(*a4);
}

unint64_t sub_10001DBB4(uint64_t a1)
{
  return sub_10001DD0C(a1, (uint64_t (*)(void))&static ContentCategory.applicationMainPreview.getter, (void (*)(uint64_t))&static EntryPointCategory.mainPreview.getter, &qword_10005FD10);
}

void sub_10001DBD0(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(PSSceneSpecification), "previewSceneSpecification");
  static AgentSceneConfiguration.previewSceneConfiguration(in:specification:)(a1, a2, v4);

}

uint64_t sub_10001DC40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_100006658(&qword_10005FDB0);
  v1 = *(_QWORD *)(type metadata accessor for PreviewVariantGroup(0) - 8);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ 3 * *(_QWORD *)(v1 + 72), *(unsigned __int8 *)(v1 + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100040850;
  v3 = static PreviewVariantGroup.colorSchemeVariantGroup.getter();
  v4 = static PreviewVariantGroup.orientationVariantGroup.getter(v3);
  static PreviewVariantGroup.dynamicTypeVariantGroup.getter(v4);
  return v2;
}

uint64_t sub_10001DCD4(uint64_t a1, uint64_t a2)
{
  return sub_10001DB78(a1, a2, &qword_10005ECB8, &qword_10005FD10, (uint64_t)sub_10001DBB4);
}

unint64_t sub_10001DCF0(uint64_t a1)
{
  return sub_10001DD0C(a1, (uint64_t (*)(void))&static ContentCategory.runningAppPreview.getter, (void (*)(uint64_t))&static EntryPointCategory.runningApp.getter, &qword_10005FD18);
}

unint64_t sub_10001DD0C(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t), unint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;

  v7 = sub_100006658(&qword_10005FD98);
  v8 = *(_QWORD *)(sub_100006658(&qword_10005FDA0) - 8);
  v9 = swift_allocObject(v7, ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72), *(unsigned __int8 *)(v8 + 80) | 7);
  *(_OWORD *)(v9 + 16) = xmmword_100040860;
  v10 = a2();
  a3(v10);
  result = sub_10001D638(v9);
  *a4 = result;
  return result;
}

void *sub_10001DDBC()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10001DDC8(uint64_t a1, uint64_t a2)
{
  return sub_10001DB78(a1, a2, &qword_10005ECC0, &qword_10005FD18, (uint64_t)sub_10001DCF0);
}

uint64_t sub_10001DDE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v6[5];

  v0 = type metadata accessor for ProcessType(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[3] = &type metadata for ApplicationLauncher;
  v6[4] = sub_10001DEA8();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for ProcessType.application(_:), v0);
  PreviewAgentLauncherRegistry.registerLauncher(_:for:)(v6, v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10000D6B0(v6);
}

unint64_t sub_10001DEA8()
{
  unint64_t result;

  result = qword_10005FD28;
  if (!qword_10005FD28)
  {
    result = swift_getWitnessTable(&unk_10003FE94, &type metadata for ApplicationLauncher);
    atomic_store(result, (unint64_t *)&qword_10005FD28);
  }
  return result;
}

uint64_t sub_10001DEEC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v0 = sub_100006658(&qword_10005FB08);
  __chkstk_darwin(v0);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006658(&qword_10005FD30);
  sub_10001E1CC();
  v4 = static CategoryMap.contentCategories.getter();
  v5 = type metadata accessor for ContentOverride(0);
  v6 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v2, 1, 1, v5);
  v7 = sub_10001AC64(&qword_10005FD40, &qword_10005FD30, (uint64_t)&protocol conformance descriptor for PassThroughProvider<A>);
  ContentProviderRegistry.register<A>(provider:for:override:)(v3, v4, v2, v3, v7);
  swift_bridgeObjectRelease(v4);
  sub_10001E210((uint64_t)v2);
  v8 = sub_100006658(&qword_10005FD48);
  sub_10001E250();
  v9 = static CategoryMap.contentCategories.getter();
  v6(v2, 1, 1, v5);
  v10 = sub_10001AC64(&qword_10005FD58, &qword_10005FD48, (uint64_t)&unk_1000410D0);
  ContentProviderRegistry.register<A>(provider:for:override:)(v8, v9, v2, v8, v10);
  swift_bridgeObjectRelease(v9);
  sub_10001E210((uint64_t)v2);
  v11 = sub_100006658(&qword_10005FD60);
  sub_10001E294();
  v12 = static CategoryMap.contentCategories.getter();
  v6(v2, 1, 1, v5);
  v13 = sub_10001AC64(&qword_10005FD70, &qword_10005FD60, (uint64_t)&unk_1000410D0);
  ContentProviderRegistry.register<A>(provider:for:override:)(v11, v12, v2, v11, v13);
  swift_bridgeObjectRelease(v12);
  sub_10001E210((uint64_t)v2);
  v14 = sub_100006658(&qword_10005FD78);
  v15 = sub_100006658(&qword_10005FD80);
  v16 = type metadata accessor for ContentCategory(0);
  v17 = swift_allocObject(v15, ((*(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80) | 7);
  *(_OWORD *)(v17 + 16) = xmmword_100040860;
  static ContentCategory.runningAppPreview.getter();
  v6(v2, 1, 1, v5);
  v18 = sub_10001AC64(&qword_10005FD88, &qword_10005FD78, (uint64_t)&unk_1000410D0);
  ContentProviderRegistry.register<A>(provider:for:override:)(v14, v17, v2, v14, v18);
  swift_bridgeObjectRelease(v17);
  return sub_10001E210((uint64_t)v2);
}

unint64_t sub_10001E1CC()
{
  unint64_t result;

  result = qword_10005FD38;
  if (!qword_10005FD38)
  {
    result = swift_getWitnessTable(&unk_1000409C8, &type metadata for BuiltinPlugin.NonUIMap);
    atomic_store(result, (unint64_t *)&qword_10005FD38);
  }
  return result;
}

uint64_t sub_10001E210(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_10005FB08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001E250()
{
  unint64_t result;

  result = qword_10005FD50;
  if (!qword_10005FD50)
  {
    result = swift_getWitnessTable(&unk_1000409A0, &type metadata for BuiltinPlugin.PreviewMap);
    atomic_store(result, (unint64_t *)&qword_10005FD50);
  }
  return result;
}

unint64_t sub_10001E294()
{
  unint64_t result;

  result = qword_10005FD68;
  if (!qword_10005FD68)
  {
    result = swift_getWitnessTable(&unk_100040978, &type metadata for BuiltinPlugin.MainPreviewMap);
    atomic_store(result, (unint64_t *)&qword_10005FD68);
  }
  return result;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.RunningApp()
{
  return &type metadata for BuiltinPlugin.RunningApp;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.MainPreviewMap()
{
  return &type metadata for BuiltinPlugin.MainPreviewMap;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.PreviewMap()
{
  return &type metadata for BuiltinPlugin.PreviewMap;
}

ValueMetadata *type metadata accessor for BuiltinPlugin.NonUIMap()
{
  return &type metadata for BuiltinPlugin.NonUIMap;
}

unint64_t sub_10001E318(uint64_t a1)
{
  unint64_t result;

  result = sub_10001E250();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001E33C(uint64_t a1)
{
  unint64_t result;

  result = sub_10001E294();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001E360(uint64_t a1)
{
  unint64_t result;

  result = sub_10001E384();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001E384()
{
  unint64_t result;

  result = qword_10005FD90;
  if (!qword_10005FD90)
  {
    result = swift_getWitnessTable(&unk_100040934, &type metadata for BuiltinPlugin.RunningApp);
    atomic_store(result, (unint64_t *)&qword_10005FD90);
  }
  return result;
}

uint64_t sub_10001E3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005FDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10001E410()
{
  uint64_t v0;
  uint64_t *v1;

  assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/LocalStaticSceneRegistry.swift", 120, 2, 23, 25, "LocalStaticSceneRegistry", 24, 2);
  sub_10001E494(&v0, &v1);
  qword_10005FDB8 = (uint64_t)v1;
  byte_10005FDC0 = 0;
}

void sub_10001E494(uint64_t *a1@<X0>, uint64_t **a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjectType;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t **v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46[8];
  _QWORD v47[5];
  _QWORD v48[2];
  char v49;
  ValueMetadata *v50;
  _UNKNOWN **v51;
  uint64_t v52;

  v4 = v2;
  sub_100007298();
  v50 = &type metadata for MainDisplay;
  v51 = &off_100052478;
  v48[0] = v6;
  v48[1] = v7;
  v49 = v8 & 1;
  v47[3] = &type metadata for LocalStaticPersonality;
  v47[4] = sub_10001EB24();
  sub_100024164(0xD000000000000012, 0x8000000100047040, 0, 0, (uint64_t)v48, (uint64_t)v47, v46);
  v52 = v46[0];
  v9 = v46[2];
  v10 = v46[3];
  v12 = (void *)v46[4];
  v11 = v46[5];
  v14 = v46[6];
  v13 = v46[7];
  sub_10000D6B0(v47);
  sub_10000D6B0(v48);
  if (v2)
    goto LABEL_2;
  v42 = (void *)v11;
  v43 = (void *)v13;
  v41 = a2;
  v44 = (void *)v10;
  v45 = v9;
  v15 = type metadata accessor for LocalStaticScene(0);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  v16 = swift_retain(v52);
  v17 = sub_1000386B8(v16);
  v18 = type metadata accessor for StaticPreviewCanvas();
  v19 = (uint64_t *)swift_allocObject(v18, 72, 7);
  v20 = swift_retain(v17);
  v21 = sub_10001EB68(v20, v19);
  swift_release(v17);
  objc_msgSend(v12, "setRootViewController:", v21[3]);
  v22 = type metadata accessor for LocalSceneDelegate();
  v23 = swift_dynamicCastClass(v14, v22);
  v24 = v12;
  v25 = v14;
  if (!v23)
  {
    v36 = type metadata accessor for Unreachable(0);
    v37 = sub_100006618((unint64_t *)&qword_10005F130, (uint64_t (*)(uint64_t))&type metadata accessor for Unreachable, (uint64_t)&protocol conformance descriptor for Unreachable);
    v4 = swift_allocError(v36, v37, 0, 0);
    v38 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000042, 0x8000000100047060, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/LocalStaticSceneRegistry.swift", 120, 2, 38, 34, "LocalStaticSceneRegistry", 24, 2);
    swift_willThrow(v38);
    swift_release(v52);
    swift_unknownObjectRelease(v14);

    swift_bridgeObjectRelease(v9);
    swift_release(v17);
    swift_release(v21);

LABEL_2:
    *a1 = v4;
    return;
  }
  v26 = v23;
  v27 = v52;
  v40 = v21;
  v28 = sub_100006618(&qword_10005FDF0, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041BF0);
  v29 = (uint64_t *)(v26 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  v30 = *(_QWORD *)(v26 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  *v29 = v17;
  v29[1] = v28;
  swift_retain_n(v17, 2);
  swift_unknownObjectRetain(v14);
  swift_unknownObjectRelease(v30);
  v31 = *(void **)(v26 + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings);
  if (v31 && (v32 = *v29) != 0)
  {
    v33 = v29[1];
    ObjectType = swift_getObjectType(v32);
    v39 = *(_QWORD *)(v33 + 8);
    v35 = v31;
    swift_unknownObjectRetain(v32);
    sub_100034640((uint64_t)v35, 0, ObjectType, v39);
    swift_release(v27);
    swift_release(v17);

    swift_unknownObjectRelease(v32);
  }
  else
  {
    swift_release(v27);
    swift_release(v17);
  }

  swift_bridgeObjectRelease(v45);
  swift_unknownObjectRelease_n(v25, 2);
  swift_release(v17);

  *v41 = v40;
}

uint64_t type metadata accessor for LocalSceneSpecification()
{
  return objc_opt_self(_TtC12PreviewShell23LocalSceneSpecification);
}

uint64_t sub_10001E8DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  unsigned int *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t *, uint64_t, uint64_t);
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  v2 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v27 - v8;
  v10 = PreviewPreferences.preferredSize.getter(v7);
  if ((v12 & 1) == 0)
  {
    *a1 = v10;
    a1[1] = v11;
    v13 = enum case for SceneLayout.custom(_:);
    v14 = type metadata accessor for SceneLayout(0);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(a1, v13, v14);
  }
  PreviewPreferences.preferredOrientation.getter(v10);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v9, v2);
  v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v16 == enum case for PreviewPreferences.InterfaceOrientation.portrait(_:))
  {
    v17 = (unsigned int *)&enum case for PreviewTraits.Orientation.portrait(_:);
LABEL_9:
    v19 = *v17;
    v20 = type metadata accessor for PreviewTraits.Orientation(0);
    v21 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104);
    v22 = a1;
    v23 = v19;
    goto LABEL_10;
  }
  v18 = v16;
  if (v16 == enum case for PreviewPreferences.InterfaceOrientation.portraitUpsideDown(_:))
  {
    v17 = (unsigned int *)&enum case for PreviewTraits.Orientation.portraitUpsideDown(_:);
    goto LABEL_9;
  }
  if (v16 == enum case for PreviewPreferences.InterfaceOrientation.landscapeLeft(_:))
  {
    v17 = (unsigned int *)&enum case for PreviewTraits.Orientation.landscapeLeft(_:);
    goto LABEL_9;
  }
  v26 = enum case for PreviewPreferences.InterfaceOrientation.landscapeRight(_:);
  v20 = type metadata accessor for PreviewTraits.Orientation(0);
  v21 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104);
  if (v18 != v26)
  {
    v21(a1, enum case for PreviewTraits.Orientation.portrait(_:), v20);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_11;
  }
  v23 = enum case for PreviewTraits.Orientation.landscapeRight(_:);
  v22 = a1;
LABEL_10:
  v21(v22, v23, v20);
LABEL_11:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  v24 = enum case for SceneLayout.device(_:);
  v25 = type metadata accessor for SceneLayout(0);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(a1, v24, v25);
}

uint64_t sub_10001EB10()
{
  return 0x636974617453;
}

unint64_t sub_10001EB24()
{
  unint64_t result;

  result = qword_100060140;
  if (!qword_100060140)
  {
    result = swift_getWitnessTable(&unk_100040A60, &type metadata for LocalStaticPersonality);
    atomic_store(result, (unint64_t *)&qword_100060140);
  }
  return result;
}

uint64_t *sub_10001EB68(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[6];
  objc_super v33;

  v29 = *a2;
  v4 = type metadata accessor for ExecutionLane(0);
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006618(&qword_10005FDF8, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041BD4);
  v8 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v26 = 2;
  v9 = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 15, 48, "StaticPreviewCanvas", 19, v26, 0, 0);
  a2[2] = v9;
  static ExecutionLane.main.getter(v9);
  v10 = type metadata accessor for FutureSerialQueue(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  a2[6] = FutureSerialQueue.init(on:)(v6);
  a2[8] = 0;
  ObjectType = swift_getObjectType(a1);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(v12 + 88);
  v14 = *(_QWORD *)(v12 + 96);
  v15 = (objc_class *)type metadata accessor for CanvasViewController(0);
  v16 = (char *)objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active] = 0;
  *(_QWORD *)&v16[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating] = 0;
  v17 = &v16[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
  v18 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  *(_QWORD *)&v16[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = 0;
  v19 = &v16[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
  *(_QWORD *)v19 = v13;
  *((_QWORD *)v19 + 1) = v14;
  v33.receiver = v16;
  v33.super_class = v15;
  swift_bridgeObjectRetain(v14);
  a2[3] = (uint64_t)objc_msgSendSuper2(&v33, "initWithNibName:bundle:", 0, 0);
  v20 = type metadata accessor for CanvasUpdater();
  v21 = (_QWORD *)swift_allocObject(v20, 48, 7);
  v21[2] = 0;
  v21[3] = a1;
  v21[4] = v7;
  v21[5] = &_swiftEmptyDictionarySingleton;
  a2[7] = (uint64_t)v21;
  a2[4] = a1;
  a2[5] = v7;
  v32[3] = ObjectType;
  v32[4] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 8) + 8) + 8);
  v32[5] = a2;
  v32[0] = a1;
  v22 = sub_100006618(&qword_10005FE00, (uint64_t (*)(uint64_t))type metadata accessor for StaticPreviewCanvas, (uint64_t)&unk_100041524);
  swift_retain_n(a1, 3);
  v23 = v29;
  LOBYTE(v27) = 2;
  Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 27, 31, "init(scene:)", 12, v27, v32, v29, v22);
  v24 = sub_10000D6B0(v32);
  v32[0] = a2;
  static ExecutionLane.main.getter(v24);
  swift_retain(a2);
  Invalidatable.onInvalidation(on:_:)(v6, sub_10001EE7C, a2, v23, v22);
  swift_release(a2);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
  return a2;
}

uint64_t sub_10001EE7C()
{
  return sub_10002E85C();
}

ValueMetadata *type metadata accessor for LocalStaticPersonality()
{
  return &type metadata for LocalStaticPersonality;
}

unint64_t sub_10001EE94(uint64_t a1)
{
  unint64_t result;

  result = sub_10001EEB8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001EEB8()
{
  unint64_t result;

  result = qword_10005FE08;
  if (!qword_10005FE08)
  {
    result = swift_getWitnessTable(&unk_100040A38, &type metadata for LocalStaticPersonality);
    atomic_store(result, (unint64_t *)&qword_10005FE08);
  }
  return result;
}

uint64_t sub_10001EEFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  uint64_t v51;
  uint64_t v52;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PreviewType.HostLocation(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (uint64_t *)((char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v9 + 88))(v11, v8) == enum case for PreviewType.HostLocation.injectedScene(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v11, v8);
    v13 = *v11;
    v12 = v11[1];
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
    v13 = 0;
    v12 = 0;
  }
  swift_beginAccess(v2 + 16, &v49, 32, 0);
  v14 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v14 + 16))
  {
    swift_bridgeObjectRetain(v12);
    v15 = sub_100007DF0(v13, v12);
    if ((v16 & 1) != 0)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
      swift_endAccess(&v49);
      swift_retain(v17);
      swift_bridgeObjectRelease_n(v12, 2);
      sub_100006658(&qword_10005FB50);
      v50[2] = type metadata accessor for HostedPreviewCanvas();
      v50[3] = sub_10001F830();
      v49 = v17;
      v18 = static Future.succeeded(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 77, 30, "canvas(for:)", 12, 2, &v49);
      sub_10000D6B0(&v49);
      return v18;
    }
    swift_bridgeObjectRelease(v12);
  }
  v19 = swift_endAccess(&v49);
  static Logger.uv.getter(v19);
  v20 = swift_bridgeObjectRetain_n(v12, 2);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc(12, -1);
    v47 = v4;
    v24 = (uint8_t *)v23;
    v25 = swift_slowAlloc(32, -1);
    v48 = v13;
    v26 = v25;
    v52 = v25;
    v46 = v5;
    *(_DWORD *)v24 = 136446210;
    v49 = v48;
    v50[0] = v12;
    swift_bridgeObjectRetain(v12);
    v27 = String.init<A>(describing:)(&v49, &type metadata for InjectedSceneIdentity);
    v29 = v28;
    v49 = sub_100010F78(v27, v28, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v24 + 4);
    swift_bridgeObjectRelease_n(v12, 2);
    swift_bridgeObjectRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "InjectedSceneRegistry waiting for injected scene '%{public}s'", v24, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    v30 = v26;
    v13 = v48;
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
  }
  else
  {

    swift_bridgeObjectRelease_n(v12, 2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100006658(&qword_10005FB50);
  v18 = static Future.create(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 82, 61, "canvas(for:)", 12, 2);
  v32 = v31;
  v33 = (_QWORD *)(v2 + 24);
  swift_beginAccess(v2 + 24, &v49, 32, 0);
  v34 = *(_QWORD *)(v2 + 24);
  if (!*(_QWORD *)(v34 + 16))
    goto LABEL_15;
  swift_bridgeObjectRetain(v12);
  v35 = sub_100007DF0(v13, v12);
  if ((v36 & 1) == 0)
  {
    swift_bridgeObjectRelease(v12);
LABEL_15:
    swift_endAccess(&v49);
    v37 = &_swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  v37 = *(void **)(*(_QWORD *)(v34 + 56) + 8 * v35);
  swift_endAccess(&v49);
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRelease(v12);
LABEL_16:
  v52 = (uint64_t)v37;
  v38 = swift_retain(v32);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v38);
  v40 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v39 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v40 >= v39 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1);
  v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v32);
  specialized Array._endMutation()(v41);
  v42 = v52;
  swift_beginAccess(v33, &v49, 33, 0);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v33);
  v51 = *v33;
  *v33 = 0x8000000000000000;
  sub_10000ABF4(v42, v13, v12, isUniquelyReferenced_nonNull_native);
  v44 = *v33;
  *v33 = v51;
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v44);
  swift_endAccess(&v49);
  swift_release(v32);
  return v18;
}

Swift::Int sub_10001F410()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[9];

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)(v4, 0);
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v4, v1, v2);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

void sub_10001F47C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[1];
  if (v3)
  {
    v4 = *v1;
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(a1, v4, v3);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

Swift::Int sub_10001F4E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v2 = *v1;
  v3 = v1[1];
  Hasher.init(_seed:)(v5, a1);
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v5, v2, v3);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

uint64_t sub_10001F548(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1[1];
  v4 = a2[1];
  if (!v3)
    return v4 == 0;
  if (!v4)
    return 0;
  v5 = *a1;
  if (v5 == *a2 && v3 == v4)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(v5, v3, *a2, v4, 0);
}

uint64_t sub_10001F594()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for InjectedSceneRegistry();
  result = swift_allocObject(v0, 32, 7);
  *(_QWORD *)(result + 16) = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)(result + 24) = &_swiftEmptyDictionarySingleton;
  qword_1000641A0 = result;
  return result;
}

uint64_t sub_10001F5C8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(a1);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a2 + 32))(0, ObjectType, a2);
}

uint64_t sub_10001F600()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for InjectedSceneRegistry()
{
  return objc_opt_self(_TtC12PreviewShell21InjectedSceneRegistry);
}

_QWORD *initializeBufferWithCopyOfBuffer for InjectedSceneIdentity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for InjectedSceneIdentity(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for InjectedSceneIdentity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for InjectedSceneIdentity(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for InjectedSceneIdentity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedSceneIdentity(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InjectedSceneIdentity(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_10001F7A0(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_10001F7B8(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedSceneIdentity()
{
  return &type metadata for InjectedSceneIdentity;
}

unint64_t sub_10001F7EC()
{
  unint64_t result;

  result = qword_10005FEB8;
  if (!qword_10005FEB8)
  {
    result = swift_getWitnessTable(&unk_100040AD8, &type metadata for InjectedSceneIdentity);
    atomic_store(result, (unint64_t *)&qword_10005FEB8);
  }
  return result;
}

unint64_t sub_10001F830()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100060C10;
  if (!qword_100060C10)
  {
    v1 = type metadata accessor for HostedPreviewCanvas();
    result = swift_getWitnessTable(&unk_10004019C, v1);
    atomic_store(result, (unint64_t *)&qword_100060C10);
  }
  return result;
}

unint64_t UIDeviceOrientation.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD000000000000012;
  switch(a1)
  {
    case 0:
      result = 0x6E776F6E6B6E75;
      break;
    case 1:
      result = 0x7469617274726F70;
      break;
    case 2:
      return result;
    case 3:
    case 4:
      result = 0x70616373646E616CLL;
      break;
    case 5:
      result = 0x705565636166;
      break;
    case 6:
      result = 0x6E776F4465636166;
      break;
    default:
      result = 0x446E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_10001F970()
{
  uint64_t *v0;

  return UIDeviceOrientation.description.getter(*v0);
}

uint64_t sub_10001F978(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10001F9B4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10001F9E0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

BOOL sub_10001FA00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001FA14()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE v21[24];
  char v22[24];

  v1 = v0;
  v2 = sub_100006658(&qword_10005F3B0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_100006658(&qword_10005F3B8);
  __chkstk_darwin(v6);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for CancellationToken(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (uint64_t)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver];
  swift_beginAccess(&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver], v22, 0, 0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v13, 1, v9))
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
    CancellationToken.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 41, 35, "previewCanvas", 13, 2);
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  }
  v14 = *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas];
  if (v14)
  {
    v15 = swift_retain(*(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas]);
    EventStream.Sink.eventStream.getter(v15);
    swift_release(v14);
    v16 = swift_allocObject(&unk_100053198, 24, 7);
    *(_QWORD *)(v16 + 16) = v1;
    v17 = swift_allocObject(&unk_1000531C0, 32, 7);
    *(_QWORD *)(v17 + 16) = sub_100022C08;
    *(_QWORD *)(v17 + 24) = v16;
    v18 = v1;
    EventStream.observe(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 43, 26, "previewCanvas", 13, 2, sub_10000D800, v17, v2);
    swift_release(v17);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v19, 1, v9);
  swift_beginAccess(v13, v21, 33, 0);
  sub_100022C54((uint64_t)v8, v13);
  return swift_endAccess(v21);
}

void sub_10001FCC4(char a1, int a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _BYTE *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _BYTE *v34;
  id v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;

  LODWORD(v3) = a2;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter(v7);
  v10 = v2;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  v13 = &qword_10005F000;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc(22, -1);
    v37 = v3;
    v3 = v14;
    v15 = swift_slowAlloc(64, -1);
    v39 = v15;
    *(_DWORD *)v3 = 136315394;
    LOBYTE(v38) = v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_state];
    v16 = String.init<A>(describing:)(&v38, &type metadata for MainViewController.State);
    v36 = v5;
    v18 = v17;
    v38 = sub_100010F78(v16, v17, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v3 + 4);
    swift_bridgeObjectRelease(v18);

    *(_WORD *)(v3 + 12) = 2080;
    LOBYTE(v38) = a1;
    v19 = String.init<A>(describing:)(&v38, &type metadata for MainViewController.State);
    v21 = v20;
    v38 = sub_100010F78(v19, v20, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v3 + 14);
    v22 = v21;
    v13 = &qword_10005F000;
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Main view controller: transition from '%s' to '%s'", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    v23 = v3;
    LOBYTE(v3) = v37;
    swift_slowDealloc(v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  v10[v13[473]] = a1;
  if (a1)
  {
    if (a1 == 1)
    {
      v24 = OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController;
      v25 = *(void **)&v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController];
      if (v25)
      {
        v26 = *(id *)&v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController];
      }
      else
      {
        v29 = objc_allocWithZone((Class)type metadata accessor for ConnectViewController(0));
        v30 = (void *)ConnectViewController.init()();
        v31 = *(void **)&v10[v24];
        *(_QWORD *)&v10[v24] = v30;
        v26 = v30;

        v25 = 0;
      }
      v32 = v25;
      goto LABEL_14;
    }
    v28 = *(_QWORD *)&v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas];
    if (!v28)
    {
      assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 129, 41, "transition(to:animated:)", 24, 2);
      return;
    }
    v27 = *(id *)(v28 + 24);
  }
  else
  {
    v27 = sub_100021660();
  }
  v26 = v27;
LABEL_14:
  v33 = *(id *)&v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild];
  if (v33 && v26 == v33)
  {

  }
  else
  {
    v34 = v10;
    v35 = v26;
    sub_1000223D0(v35, v3 & 1, v34, v34, v35, v3 & 1);

  }
}

char *sub_100020008()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD v44[3];
  objc_super v45;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v2);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006658(&qword_10005FF80);
  v43 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006658(&qword_10005F3B8);
  __chkstk_darwin(v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OBJC_IVAR____TtC12PreviewShell18MainViewController_invalidationHandle;
  v12 = type metadata accessor for ConcurrentInvalidationHandle(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = v0;
  *(_QWORD *)&v0[v11] = ConcurrentInvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 25, 58, "MainViewController", 18, 2, 0, 0);
  v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_state] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController] = 0;
  v14 = &v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver];
  v15 = type metadata accessor for CancellationToken(0);
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation] = 0;
  v16(&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver], 1, 1, v15);
  v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas] = 0;

  v45.receiver = v13;
  v45.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v45, "initWithNibName:bundle:", 0, 0);
  v18 = qword_10005ECD8;
  v19 = v17;
  if (v18 != -1)
    swift_once(&qword_10005ECD8, sub_100024A64);
  v20 = qword_1000641B8;
  if (qword_1000641B8)
  {
    v42 = v4;
    v21 = *(_QWORD *)(qword_1000641B8 + 16);
    swift_retain(qword_1000641B8);
    v22 = swift_retain(v21);
    EventStreamObservable.projectedValue.getter(v22);
    swift_release(v21);
    v23 = swift_allocObject(&unk_100053238, 24, 7);
    *(_QWORD *)(v23 + 16) = v19;
    v24 = (char *)v19;
    LOBYTE(v40) = 2;
    EventStream.observe(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 53, 70, "init()", 6, v40, sub_100022F20, v23, v5);
    swift_release(v23);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v5);
    v16(v10, 0, 1, v15);
    v25 = (uint64_t)&v24[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver];
    swift_beginAccess(&v24[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver], v44, 33, 0);
    sub_100022C54((uint64_t)v10, v25);
    swift_endAccess(v44);
    v26 = *(_QWORD *)(v20 + 16);
    v27 = swift_retain(v26);
    EventStreamObservable.wrappedValue.getter(v44, v27);
    swift_release(v26);
    if ((v44[0] & 1) == 0)
    {
      swift_retain(v20);
      sub_100024B28((uint64_t)sub_100022F28, v20);
      swift_release(v20);
    }
    swift_release(v20);
    v4 = v42;
  }
  v28 = type metadata accessor for TaskPriority(0);
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v29(v4, 1, 1, v28);
  type metadata accessor for MainActor(0);
  v30 = (char *)v19;
  v31 = static MainActor.shared.getter();
  v32 = (_QWORD *)swift_allocObject(&unk_1000531E8, 40, 7);
  v32[2] = v31;
  v32[3] = &protocol witness table for MainActor;
  v32[4] = v30;
  v33 = sub_1000273B0((uint64_t)v4, (uint64_t)&unk_10005FF90, (uint64_t)v32);
  v34 = *(_QWORD *)&v30[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation];
  *(_QWORD *)&v30[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation] = v33;
  swift_release(v34);
  v29(v4, 1, 1, v28);
  v35 = v30;
  v36 = static MainActor.shared.getter();
  v37 = (_QWORD *)swift_allocObject(&unk_100053210, 40, 7);
  v37[2] = v36;
  v37[3] = &protocol witness table for MainActor;
  v37[4] = v35;
  v38 = sub_1000273B0((uint64_t)v4, (uint64_t)&unk_10005FFA0, (uint64_t)v37);

  swift_release(v38);
  return v35;
}

uint64_t sub_1000204DC(_BYTE *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v4 = type metadata accessor for ExecutionLane(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  static ExecutionLane.main.getter(v6);
  v9 = swift_allocObject(&unk_100053260, 32, 7);
  *(_BYTE *)(v9 + 16) = (_BYTE)a1;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = a2;
  ExecutionLane.execute(_:)(sub_100022F54, v9);
  swift_release(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_1000205A4()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  _BYTE v21[15];
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for ExecutionLane(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_100006658(&qword_10005FF70);
  v7 = *(_QWORD *)(v6 - 8);
  result = __chkstk_darwin(v6);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] == 1)
  {
    if (qword_10005EC98 != -1)
      swift_once(&qword_10005EC98, sub_10001501C);
    v11 = ServerFarm.serviceHubServer.getter();
    AggregatingHostServer.connectionMonitor.getter();
    swift_release(v11);
    v12 = AggregatingHostServer.ConnectionMonitor.status.getter(v6) & 1;
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
    v13 = type metadata accessor for ServiceHubService(0);
    v14 = sub_100006618(&qword_10005FF78, (uint64_t (*)(uint64_t))&type metadata accessor for ServiceHubService, (uint64_t)&protocol conformance descriptor for ServiceHubService);
    result = static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)(v12, 1, v13, v14);
    if ((result & 1) != 0
      && !*(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer])
    {
      if (qword_10005ECD8 != -1)
        result = swift_once(&qword_10005ECD8, sub_100024A64);
      v15 = qword_1000641B8;
      if (!qword_1000641B8
        || (v16 = *(_QWORD *)(qword_1000641B8 + 16),
            swift_retain(qword_1000641B8),
            v17 = swift_retain(v16),
            EventStreamObservable.wrappedValue.getter(&v22, v17),
            swift_release(v16),
            result = swift_release(v15),
            v22 == 1))
      {
        if (v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_state] - 1 >= 2)
        {
          v18 = sub_100018AC8();
          static ExecutionLane.main.getter(v18);
          v19 = swift_allocObject(&unk_100053170, 24, 7);
          *(_QWORD *)(v19 + 16) = v1;
          v20 = v1;
          Future.observeFailure(on:_:)(v5, sub_100022FC0, v19);
          swift_release(v19);
          swift_release(v18);
          return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100020828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
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

  v4[2] = a4;
  v5 = type metadata accessor for ExecutionLane(0);
  v4[3] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[4] = v6;
  v4[5] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006658(&qword_10005FFA8);
  v4[6] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[7] = v8;
  v4[8] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006658(&qword_10005FF70);
  v4[9] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v4[10] = v10;
  v4[11] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006658((uint64_t *)&unk_10005FFB0);
  v4[12] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[13] = v12;
  v4[14] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MainActor(0);
  v4[15] = v13;
  v4[16] = static MainActor.shared.getter(v13);
  v14 = dispatch thunk of Actor.unownedExecutor.getter(v13, &protocol witness table for MainActor);
  v4[17] = v14;
  v4[18] = v15;
  return swift_task_switch(sub_100020944, v14, v15);
}

uint64_t sub_100020944(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  if (qword_10005EC98 != -1)
    a1 = swift_once(&qword_10005EC98, sub_10001501C);
  v3 = v1[10];
  v2 = v1[11];
  v5 = v1[8];
  v4 = v1[9];
  v6 = v1[6];
  v7 = v1[7];
  v8 = ServerFarm.serviceHubServer.getter(a1);
  AggregatingHostServer.connectionMonitor.getter();
  swift_release(v8);
  AggregatingHostServer.ConnectionMonitor.$status.getter(v4);
  v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v1[19] = v9;
  v9(v2, v4);
  AsyncStream.makeAsyncIterator()(v6);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v11 = OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground;
  v1[20] = OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer;
  v1[21] = v11;
  v1[22] = OBJC_IVAR____TtC12PreviewShell18MainViewController_state;
  v12 = static MainActor.shared.getter(v10);
  v1[23] = v12;
  v13 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v1[24] = v13;
  *v13 = v1;
  v13[1] = sub_100020AA8;
  return AsyncStream.Iterator.next(isolation:)(v1 + 25, v12, &protocol witness table for MainActor, v1[12]);
}

uint64_t sub_100020AA8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 184);
  swift_task_dealloc(*(_QWORD *)(*v0 + 192));
  swift_release(v2);
  return swift_task_switch(sub_100020AFC, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144));
}

uint64_t sub_100020AFC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;

  v1 = *(unsigned __int8 *)(v0 + 200);
  if (v1 == 2)
  {
    v2 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 40);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(v3, *(_QWORD *)(v0 + 96));
    swift_release(v2);
    swift_task_dealloc(v3);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    swift_task_dealloc(v6);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = v1 & 1;
    v9 = type metadata accessor for ServiceHubService(0);
    v10 = sub_100006618(&qword_10005FF78, (uint64_t (*)(uint64_t))&type metadata accessor for ServiceHubService, (uint64_t)&protocol conformance descriptor for ServiceHubService);
    v11 = static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)(v8, 0, v9, v10);
    if ((v11 & 1) != 0)
    {
      v12 = *(_QWORD *)(v0 + 160);
      v13 = *(_QWORD *)(v0 + 16);
      v14 = *(_QWORD *)(v13 + v12);
      if (v14)
      {
        swift_retain(*(_QWORD *)(v13 + v12));
        DelayedInvocation.cancel()();
        swift_release(v14);
        v15 = *(_QWORD *)(v13 + v12);
        v12 = *(_QWORD *)(v0 + 160);
        v13 = *(_QWORD *)(v0 + 16);
      }
      else
      {
        v15 = 0;
      }
      *(_QWORD *)(v13 + v12) = 0;
      v11 = swift_release(v15);
    }
    if (*(_BYTE *)(*(_QWORD *)(v0 + 16) + *(_QWORD *)(v0 + 168)) == 1)
    {
      v16 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
      v17 = *(_QWORD *)(v0 + 88);
      v18 = *(_QWORD *)(v0 + 72);
      v19 = ServerFarm.serviceHubServer.getter(v11);
      AggregatingHostServer.connectionMonitor.getter();
      swift_release(v19);
      v20 = AggregatingHostServer.ConnectionMonitor.status.getter(v18) & 1;
      v16(v17, v18);
      if ((static AggregatingHostServer.ConnectionMonitor.Status.== infix(_:_:)(v20, 1, v9, v10) & 1) != 0
        && !*(_QWORD *)(*(_QWORD *)(v0 + 16) + *(_QWORD *)(v0 + 160)))
      {
        if (qword_10005ECD8 != -1)
          swift_once(&qword_10005ECD8, sub_100024A64);
        v23 = qword_1000641B8;
        if (!qword_1000641B8
          || (v24 = *(_QWORD *)(qword_1000641B8 + 16),
              swift_retain(qword_1000641B8),
              v25 = swift_retain(v24),
              EventStreamObservable.wrappedValue.getter((_QWORD *)(v0 + 201), v25),
              swift_release(v23),
              swift_release(v24),
              *(_BYTE *)(v0 + 201) == 1))
        {
          v26 = *(unsigned __int8 **)(v0 + 16);
          if (v26[*(_QWORD *)(v0 + 176)] - 1 >= 2)
          {
            v28 = *(_QWORD *)(v0 + 32);
            v27 = *(_QWORD *)(v0 + 40);
            v29 = *(_QWORD *)(v0 + 24);
            v30 = sub_100018AC8();
            static ExecutionLane.main.getter(v30);
            v31 = swift_allocObject(&unk_100053288, 24, 7);
            *(_QWORD *)(v31 + 16) = v26;
            v32 = v26;
            Future.observeFailure(on:_:)(v27, sub_100022FC0, v31);
            swift_release(v30);
            swift_release(v31);
            (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
          }
        }
      }
    }
    v21 = static MainActor.shared.getter();
    *(_QWORD *)(v0 + 184) = v21;
    v22 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
    *(_QWORD *)(v0 + 192) = v22;
    *v22 = v0;
    v22[1] = sub_100020AA8;
    return AsyncStream.Iterator.next(isolation:)(v0 + 200, v21, &protocol witness table for MainActor, *(_QWORD *)(v0 + 96));
  }
}

uint64_t sub_100020E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v4[15] = a4;
  ObjectType = swift_getObjectType(a4);
  v7 = sub_100006658(&qword_10005F3B8);
  v4[16] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CancellationToken(0);
  v4[17] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v4[18] = v9;
  v4[19] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  v4[20] = v10;
  v4[21] = static MainActor.shared.getter(v10);
  v4[14] = a4;
  v11 = (_QWORD *)swift_task_alloc(async function pointer to ConcurrentInvalidatable.invalidation.getter[1]);
  v4[22] = v11;
  v12 = sub_100006618(&qword_10005FF68, type metadata accessor for MainViewController, (uint64_t)&unk_100040CB8);
  *v11 = v4;
  v11[1] = sub_100020F10;
  return ConcurrentInvalidatable.invalidation.getter(ObjectType, v12);
}

uint64_t sub_100020F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 160);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 176));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100020F80, v2, v3);
}

uint64_t sub_100020F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  int v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  swift_release(*(_QWORD *)(v0 + 168));
  v4 = v3 + OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver;
  swift_beginAccess(v4, v0 + 16, 0, 0);
  v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (!v5(v4, 1, v1))
  {
    v7 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 152);
    v8 = *(_QWORD *)(v0 + 136);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v4, v8);
    CancellationToken.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 75, 40, "init()", 6, 2);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  v9 = *(_QWORD *)(v0 + 120);
  v10 = OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation;
  v11 = *(_QWORD *)(v9 + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation);
  v12 = v9;
  if (v11)
  {
    swift_retain(*(_QWORD *)(v9 + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation));
    Task.cancel()();
    swift_release(v11);
    v12 = *(_QWORD *)(v0 + 120);
  }
  v13 = *(_QWORD *)(v0 + 136);
  v14 = v12 + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver;
  swift_beginAccess(v12 + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver, v0 + 40, 0, 0);
  if (!v5(v14, 1, v13))
  {
    v16 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 152);
    v17 = *(_QWORD *)(v0 + 136);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v14, v17);
    LOBYTE(v23) = 2;
    CancellationToken.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 77, 46, "init()", 6, v23);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  v24 = *(_QWORD *)(v0 + 152);
  v18 = *(_QWORD *)(v0 + 136);
  v19 = *(_QWORD *)(v0 + 128);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 144) + 56);
  v20(v19, 1, 1, v18);
  swift_beginAccess(v4, v0 + 64, 33, 0);
  sub_100022C54(v19, v4);
  swift_endAccess(v0 + 64);
  v21 = *(_QWORD *)(v9 + v10);
  *(_QWORD *)(v9 + v10) = 0;
  swift_release(v21);
  v20(v19, 1, 1, v18);
  swift_beginAccess(v14, v0 + 88, 33, 0);
  sub_100022C54(v19, v14);
  swift_endAccess(v0 + 88);
  swift_task_dealloc(v24);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000212BC()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;

  v40.receiver = v0;
  v40.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v40, "viewDidLayoutSubviews");
  v1 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController];
  if (v1)
  {
    v2 = objc_msgSend(v1, "view");
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v0, "view");
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, "bounds");
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;

        objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  v14 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController];
  if (!v14)
    goto LABEL_9;
  v15 = objc_msgSend(v14, "view");
  if (!v15)
    goto LABEL_16;
  v16 = v15;
  v17 = objc_msgSend(v0, "view");
  if (!v17)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18 = v17;
  objc_msgSend(v17, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(v16, "setFrame:", v20, v22, v24, v26);
LABEL_9:
  v27 = *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas];
  if (!v27)
    return;
  v28 = objc_msgSend(*(id *)(v27 + 24), "view");
  if (!v28)
    goto LABEL_18;
  v29 = v28;
  v30 = objc_msgSend(v0, "view");
  if (!v30)
  {
LABEL_19:
    __break(1u);
    return;
  }
  v31 = v30;
  objc_msgSend(v30, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v29, "setFrame:", v33, v35, v37, v39);
}

uint64_t sub_1000214F4(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  double v18;
  uint64_t v19;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static Logger.uv.getter(v6);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v12 = 134217984;
    v18 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v12 + 4);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Timed out after %f seconds waiting for any incoming Xcode connection", v12, 0xCu);
    swift_slowDealloc(v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v13 = OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer;
  v14 = *(_QWORD *)(a1 + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer);
  if (v14)
  {
    swift_retain(*(_QWORD *)(a1 + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer));
    DelayedInvocation.cancel()();
    swift_release(v14);
    v15 = *(_QWORD *)(a1 + v13);
  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)(a1 + v13) = 0;
  swift_release(v15);
  return sub_1000205A4();
}

id sub_100021660()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  NSString v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController);
  }
  else
  {
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend((id)objc_opt_self(UIStoryboard), "storyboardWithName:bundle:", v4, 0);

    v6 = objc_msgSend(v5, "instantiateInitialViewController");
    if (!v6)
      v6 = objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");

    v7 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

void sub_100021750(char *a1, void *a2, char a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  char *v35;
  id v36;
  char v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void **aBlock;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;

  objc_msgSend(a1, "addChildViewController:", a2);
  v6 = objc_msgSend(a1, "view");
  if (!v6)
  {
    __break(1u);
    goto LABEL_20;
  }
  v7 = v6;
  v8 = objc_msgSend(a2, "view");
  if (!v8)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = v8;
  objc_msgSend(v7, "insertSubview:atIndex:", v8, 0);

  v10 = objc_msgSend(a2, "view");
  if (!v10)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v11 = v10;
  v12 = objc_msgSend(a1, "view");
  if (!v12)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v13 = v12;
  objc_msgSend(v12, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v11, "setFrame:", v15, v17, v19, v21);
  v22 = objc_msgSend(a2, "view");
  if (!v22)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v23 = v22;
  objc_msgSend(v22, "setAlpha:", 1.0);

  objc_msgSend(a2, "didMoveToParentViewController:", a1);
  v24 = *(void **)&a1[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild];
  *(_QWORD *)&a1[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild] = a2;
  v43 = v24;
  if (v24 && (a3 & 1) != 0)
  {
    v25 = (void *)objc_opt_self(UIView);
    v26 = swift_allocObject(&unk_1000530D0, 24, 7);
    *(_QWORD *)(v26 + 16) = v43;
    v48 = sub_100022BCC;
    v49 = v26;
    aBlock = _NSConcreteStackBlock;
    v45 = 1107296256;
    v46 = sub_10001F9B4;
    v47 = &unk_1000530E8;
    v27 = _Block_copy(&aBlock);
    v28 = v49;
    v29 = v43;
    v30 = a2;
    swift_release(v28);
    v31 = swift_allocObject(&unk_100053120, 32, 7);
    *(_QWORD *)(v31 + 16) = a1;
    *(_QWORD *)(v31 + 24) = v29;
    v48 = sub_100022C00;
    v49 = v31;
    aBlock = _NSConcreteStackBlock;
    v45 = 1107296256;
    v46 = sub_10001F978;
    v47 = &unk_100053138;
    v32 = _Block_copy(&aBlock);
    v33 = v49;
    v34 = v29;
    v35 = a1;
    swift_release(v33);
    objc_msgSend(v25, "animateWithDuration:animations:completion:", v27, v32, 0.3);

    _Block_release(v32);
    _Block_release(v27);

    return;
  }
  if (v24)
  {
    if (a2)
    {
      sub_100022B90();
      v42 = v43;
      v36 = a2;
      v37 = static NSObject.== infix(_:_:)(v42, v36);

      if ((v37 & 1) != 0)
      {
        v38 = v42;
LABEL_18:

        return;
      }
    }
    objc_msgSend(v43, "willMoveToParentViewController:", 0, v42);
    v39 = objc_msgSend(v43, "view");
    if (v39)
    {
      v40 = v39;
      objc_msgSend(v39, "removeFromSuperview");

LABEL_17:
      objc_msgSend(v43, "removeFromParentViewController");
      v38 = v43;
      goto LABEL_18;
    }
LABEL_24:
    __break(1u);
    return;
  }
  v41 = a2;
  if (a2)
    goto LABEL_17;
}

void sub_100021B10(void *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(a1, "view");
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "setAlpha:", 0.0);

  }
  else
  {
    __break(1u);
  }
}

void sub_100021B5C(int a1, uint64_t a2, id a3)
{
  void *v4;
  id v5;
  id v6;
  char v7;
  id v8;
  void *v9;

  v4 = *(void **)(a2 + OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild);
  if (!v4
    || (sub_100022B90(),
        v5 = v4,
        v6 = a3,
        v7 = static NSObject.== infix(_:_:)(),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_msgSend(a3, "willMoveToParentViewController:", 0);
    v8 = objc_msgSend(a3, "view");
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "removeFromSuperview");

      objc_msgSend(a3, "removeFromParentViewController");
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100021C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter(v6);
  swift_errorRetain(a1);
  v9 = swift_errorRetain(a1);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v19[1] = a2;
    v12 = swift_slowAlloc(12, -1);
    v19[0] = v4;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc(32, -1);
    v20 = a1;
    v21 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_errorRetain(a1);
    v15 = sub_100006658(&qword_10005EFF0);
    v16 = String.init<A>(describing:)(&v20, v15);
    v18 = v17;
    v20 = sub_100010F78(v16, v17, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v13 + 4);
    swift_bridgeObjectRelease(v18);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "failed to load cached preview: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    (*(void (**)(char *, _QWORD))(v5 + 8))(v8, v19[0]);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  sub_10001FCC4(1, 1);
}

uint64_t sub_100021F28()
{
  return type metadata accessor for MainViewController(0);
}

uint64_t type metadata accessor for MainViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10005FF38;
  if (!qword_10005FF38)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MainViewController);
  return result;
}

void sub_100021F6C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = &unk_100040BD8;
  v4[2] = &unk_100040BF0;
  v4[3] = &unk_100040BF0;
  v4[4] = &unk_100040BF0;
  sub_100022010(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(v2 - 8) + 64;
    v6 = &unk_100040BF0;
    v7 = v5;
    v8 = &unk_100040C08;
    v9 = &unk_100040BF0;
    v10 = &unk_100040BF0;
    swift_updateClassMetadata2(a1, 256, 11, v4, a1 + 80);
  }
}

void sub_100022010(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10005FF48)
  {
    v2 = type metadata accessor for CancellationToken(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10005FF48);
  }
}

uint64_t getEnumTagSinglePayload for MainViewController.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MainViewController.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100022140 + 4 * byte_100040BA5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100022174 + 4 * byte_100040BA0[v4]))();
}

uint64_t sub_100022174(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002217C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100022184);
  return result;
}

uint64_t sub_100022190(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100022198);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10002219C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000221A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000221B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MainViewController.State()
{
  return &type metadata for MainViewController.State;
}

unint64_t sub_1000221CC()
{
  unint64_t result;

  result = qword_10005FF50;
  if (!qword_10005FF50)
  {
    result = swift_getWitnessTable(&unk_100040C68, &type metadata for MainViewController.State);
    atomic_store(result, (unint64_t *)&qword_10005FF50);
  }
  return result;
}

uint64_t sub_100022210()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;

  v1 = type metadata accessor for ExecutionLane(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  if (qword_10005EC98 != -1)
    swift_once(&qword_10005EC98, sub_10001501C);
  v6 = sub_100018AC8();
  static ExecutionLane.main.getter(v6);
  v7 = swift_allocObject(&unk_100052FE0, 24, 7);
  *(_QWORD *)(v7 + 16) = v5;
  v8 = v5;
  Future.observeFailure(on:_:)(v4, sub_1000223C8, v7);
  swift_release(v6);
  swift_release(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10002230C()
{
  _QWORD *v0;

  return swift_retain(*(_QWORD *)(*v0 + OBJC_IVAR____TtC12PreviewShell18MainViewController_invalidationHandle));
}

uint64_t sub_100022320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_100006618(&qword_10005FF68, type metadata accessor for MainViewController, (uint64_t)&unk_100040CB8);
  return ConcurrentInvalidatable.invalidate(callsite:trace:)(a1, a2, a3, v6);
}

uint64_t sub_100022378()
{
  return sub_100006618(&qword_10005FF58, type metadata accessor for MainViewController, (uint64_t)&unk_100040C90);
}

uint64_t sub_1000223A4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000223C8(uint64_t a1)
{
  uint64_t v1;

  sub_100021C28(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1000223D0(void *a1, int a2, void *a3, void *a4, void *a5, char a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  os_log_t v37;
  void **v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  void **v52;
  int v53;
  os_log_t v54;
  id v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  void **aBlock;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;

  v57 = a2;
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_allocObject(&unk_100053008, 33, 7);
  *(_QWORD *)(v15 + 16) = a4;
  *(_QWORD *)(v15 + 24) = a5;
  *(_BYTE *)(v15 + 32) = a6;
  v16 = a4;
  v17 = a5;
  v18 = (uint64_t)objc_msgSend(a1, "supportedInterfaceOrientations");
  v19 = objc_msgSend(a3, "view");
  if (!v19)
  {

    __break(1u);
    JUMPOUT(0x100022AB8);
  }
  v20 = v19;
  v21 = objc_msgSend(v19, "window");

  if (!v21)
    goto LABEL_9;
  v22 = objc_msgSend(v21, "windowScene");

  if (!v22)
    goto LABEL_9;
  v23 = objc_msgSend(v22, "interfaceOrientation");
  if (sub_100022B20((uint64_t)v23) && (v18 & 0x18) == 0x18 || sub_100022B30((uint64_t)v23) && (v18 & 2) != 0)
  {

LABEL_9:
    sub_100021750((char *)v16, v17, a6 & 1);
    return swift_release(v15);
  }
  v56 = sub_10003ADA8(v18);
  static Logger.uv.getter(v56);
  v25 = v22;
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, (os_log_type_t)v27))
  {
    v53 = v27;
    v54 = v26;
    v28 = swift_slowAlloc(22, -1);
    v52 = (void **)swift_slowAlloc(64, -1);
    aBlock = v52;
    *(_DWORD *)v28 = 136315394;
    v29 = objc_msgSend(v25, "interfaceOrientation");
    v55 = v25;
    v51 = (unint64_t)"swift";
    v30 = 0x8000000100047240;
    v32 = v29;
    v31 = 0xD000000000000012;
    switch((unint64_t)v32)
    {
      case 0uLL:
        v30 = 0xE700000000000000;
        v31 = 0x6E776F6E6B6E75;
        break;
      case 1uLL:
        v30 = 0xE800000000000000;
        v31 = 0x7469617274726F70;
        break;
      case 2uLL:
        break;
      case 3uLL:
        v30 = 0xEE00746867695265;
        goto LABEL_18;
      case 4uLL:
        v30 = 0xED00007466654C65;
LABEL_18:
        v31 = 0x70616373646E616CLL;
        break;
      default:
        v30 = 0xEE00746C75616665;
        v31 = 0x446E776F6E6B6E75;
        break;
    }
    v58 = sub_100010F78(v31, v30, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &aBlock, v28 + 4);
    swift_bridgeObjectRelease(v30);
    v34 = v55;

    *(_WORD *)(v28 + 12) = 2080;
    v35 = v51 | 0x8000000000000000;
    v36 = 0xD000000000000012;
    switch(v56)
    {
      case 0:
        v35 = 0xE700000000000000;
        v36 = 0x6E776F6E6B6E75;
        break;
      case 1:
        v35 = 0xE800000000000000;
        v36 = 0x7469617274726F70;
        break;
      case 2:
        break;
      case 3:
        v35 = 0xED00007466654C65;
        goto LABEL_25;
      case 4:
        v35 = 0xEE00746867695265;
LABEL_25:
        v36 = 0x70616373646E616CLL;
        break;
      case 5:
        v35 = 0xE600000000000000;
        v36 = 0x705565636166;
        break;
      case 6:
        v35 = 0xE800000000000000;
        v36 = 0x6E776F4465636166;
        break;
      default:
        v35 = 0xEE00746C75616665;
        v36 = 0x446E776F6E6B6E75;
        break;
    }
    v58 = sub_100010F78(v36, v35, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &aBlock, v28 + 14);
    swift_bridgeObjectRelease(v35);
    v37 = v54;
    _os_log_impl((void *)&_mh_execute_header, v54, (os_log_type_t)v53, "adjusting device orientation from %s -> %s", (uint8_t *)v28, 0x16u);
    v38 = v52;
    swift_arrayDestroy(v52, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v33 = v57;
    v25 = v55;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v33 = v57;
  }
  v39 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v40 = swift_allocObject(&unk_100053030, 32, 7);
  v41 = v56;
  *(_QWORD *)(v40 + 16) = v39;
  *(_QWORD *)(v40 + 24) = v41;
  v42 = v39;
  v43 = v42;
  if ((v33 & 1) != 0)
  {
    if (objc_msgSend(v42, "userInterfaceIdiom"))
      v44 = 0.4;
    else
      v44 = 0.3;
    v45 = (void *)objc_opt_self(UIView);
    v63 = sub_100022B64;
    v64 = v40;
    aBlock = _NSConcreteStackBlock;
    v60 = 1107296256;
    v61 = sub_10001F9B4;
    v62 = &unk_100053048;
    v46 = _Block_copy(&aBlock);
    v47 = v64;
    swift_retain(v40);
    swift_release(v47);
    v48 = swift_allocObject(&unk_100053080, 32, 7);
    *(_QWORD *)(v48 + 16) = sub_100022B14;
    *(_QWORD *)(v48 + 24) = v15;
    v63 = sub_10000D800;
    v64 = v48;
    aBlock = _NSConcreteStackBlock;
    v60 = 1107296256;
    v61 = sub_10001F978;
    v62 = &unk_100053098;
    v49 = _Block_copy(&aBlock);
    v50 = v64;
    swift_retain(v15);
    swift_release(v50);
    objc_msgSend(v45, "animateWithDuration:animations:completion:", v46, v49, v44);

    swift_release(v40);
    _Block_release(v49);
    _Block_release(v46);
  }
  else
  {
    objc_msgSend(v42, "setOrientation:animated:", v41, 0);
    sub_100021750((char *)v16, v17, a6 & 1);

    swift_release(v40);
  }
  return swift_release(v15);
}

uint64_t sub_100022AE8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 33, 7);
}

void sub_100022B14()
{
  uint64_t v0;

  sub_100021750(*(char **)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
}

BOOL sub_100022B20(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL sub_100022B30(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t sub_100022B40()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_100022B64()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "setOrientation:animated:", *(_QWORD *)(v0 + 24), 0);
}

uint64_t sub_100022B78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100022B88(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100022B90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005FF60;
  if (!qword_10005FF60)
  {
    v1 = objc_opt_self(UIViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005FF60);
  }
  return result;
}

void sub_100022BCC()
{
  uint64_t v0;

  sub_100021B10(*(void **)(v0 + 16));
}

uint64_t sub_100022BD4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100022C00(int a1)
{
  uint64_t v1;

  sub_100021B5C(a1, *(_QWORD *)(v1 + 16), *(id *)(v1 + 24));
}

void sub_100022C08()
{
  sub_10001FCC4(2, 1);
}

uint64_t sub_100022C30()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022C54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005F3B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100022C9C()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t, uint64_t);
  char v7;

  v1 = v0;
  v2 = OBJC_IVAR____TtC12PreviewShell18MainViewController_invalidationHandle;
  v3 = type metadata accessor for ConcurrentInvalidationHandle(0);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  v7 = 2;
  *(_QWORD *)&v0[v2] = ConcurrentInvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/MainViewController.swift", 114, 2, 25, 58, "MainViewController", 18, v7, 0, 0);
  v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_state] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController] = 0;
  v4 = &v0[OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver];
  v5 = type metadata accessor for CancellationToken(0);
  v6 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation] = 0;
  v6(&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver], 1, 1, v5);
  v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000467E0, "PreviewShell/MainViewController.swift", 37, 2, 85, 0);
  __break(1u);
}

uint64_t sub_100022E18(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10005FF8C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001AF18;
  return sub_100020828(a1, v4, v5, v6);
}

uint64_t sub_100022E88()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100022EB4(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10005FF9C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001D634;
  return sub_100020E18(a1, v4, v5, v6);
}

uint64_t sub_100022F20(_BYTE *a1)
{
  uint64_t v1;

  return sub_1000204DC(a1, *(void **)(v1 + 16));
}

uint64_t sub_100022F28(uint64_t a1)
{
  uint64_t v1;

  return sub_100024AA0(a1, v1);
}

uint64_t sub_100022F30()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022F54()
{
  uint64_t v0;
  uint64_t result;

  if (*(_BYTE *)(v0 + 16) == 1)
    return sub_1000205A4();
  return result;
}

uint64_t sub_100022F80(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_10005F3B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100022FF4(uint64_t a1)
{
  void *v2;
  id v3;
  NSString v4;

  v2 = *(void **)(a1 + 24);
  objc_msgSend(v2, "setRootViewController:", 0);
  objc_msgSend(v2, "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 16), "_invalidate");
  v3 = objc_msgSend((id)objc_opt_self(FBSceneManager), "sharedInstance");
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "destroyScene:withTransitionContext:", v4, 0);

}

uint64_t sub_1000230B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t updated;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _QWORD *v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, uint64_t, void (*)(_QWORD, _QWORD));
  void (*v36)(char *, uint64_t *, uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  void (*v70)(char *);
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  char v78;
  void (*v79)(char *, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  void (*v86)(uint64_t *, uint64_t);
  uint64_t v88;
  id v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(uint64_t *, uint64_t);
  uint64_t *v114;
  __int128 v115;
  _OWORD v116[3];
  uint64_t v117;

  v2 = v1;
  v99 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v99);
  v93 = (uint64_t)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateTiming(0);
  v106 = *(_QWORD *)(updated - 8);
  v107 = updated;
  v6 = __chkstk_darwin(updated);
  v97 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v98 = (char *)&v90 - v9;
  __chkstk_darwin(v8);
  v105 = (char *)&v90 - v10;
  v11 = type metadata accessor for SceneUpdateHandshake(0);
  v112 = *(_QWORD *)(v11 - 8);
  v113 = (void (*)(uint64_t *, uint64_t))v11;
  __chkstk_darwin(v11);
  v108 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = type metadata accessor for Logger(0);
  v102 = *(_QWORD *)(v103 - 8);
  __chkstk_darwin(v103);
  v14 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PreviewPreferences(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for SceneLayout(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = __chkstk_darwin(v19);
  v96 = (char *)&v90 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v90 - v24;
  __chkstk_darwin(v23);
  v27 = (uint64_t *)((char *)&v90 - v26);
  v28 = *(_QWORD *)(v2 + 64);
  v94 = (_QWORD *)(v2 + 40);
  v29 = sub_10000D648((_QWORD *)(v2 + 40), v28);
  SceneUpdateHandshake.preferences.getter(v29);
  sub_10001E8DC(v27);
  v30 = *(void (**)(char *, uint64_t))(v16 + 8);
  v31 = v108;
  v95 = v15;
  v32 = v15;
  v33 = v30;
  v34 = ((uint64_t (*)(char *, uint64_t))v30)(v18, v32);
  static Logger.uv.getter(v34);
  v35 = *(void (**)(char *, uint64_t, void (*)(_QWORD, _QWORD)))(v112 + 16);
  v104 = a1;
  v35(v31, a1, (void (*)(_QWORD, _QWORD))v113);
  v110 = v20;
  v36 = *(void (**)(char *, uint64_t *, uint64_t))(v20 + 16);
  v100 = v25;
  v114 = v27;
  v36(v25, v27, v19);
  v37 = swift_retain_n(v2, 2);
  v101 = v14;
  v38 = Logger.logObject.getter(v37);
  v39 = static os_log_type_t.debug.getter();
  v40 = v39;
  v41 = os_log_type_enabled(v38, v39);
  v109 = v19;
  if (v41)
  {
    v42 = swift_slowAlloc(32, -1);
    v111 = v2;
    v43 = v42;
    v44 = swift_slowAlloc(96, -1);
    v92 = v44;
    *(_QWORD *)&v116[0] = v44;
    *(_DWORD *)v43 = 136315650;
    v90 = v43 + 4;
    v91 = v40;
    SceneUpdateHandshake.preferences.getter(v44);
    v45 = sub_100006618((unint64_t *)&unk_100060160, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewPreferences, (uint64_t)&protocol conformance descriptor for PreviewPreferences);
    v46 = v95;
    v47 = dispatch thunk of CustomStringConvertible.description.getter(v95, v45);
    v48 = v31;
    v50 = v49;
    v33(v18, v46);
    *(_QWORD *)&v115 = sub_100010F78(v47, v50, (uint64_t *)v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8, v90);
    swift_bridgeObjectRelease(v50);
    (*(void (**)(char *, _QWORD))(v112 + 8))(v48, v113);
    *(_WORD *)(v43 + 12) = 2080;
    v51 = *(_QWORD *)(v111 + 64);
    v52 = *(_QWORD *)(v111 + 72);
    sub_10000D648(v94, v51);
    v53 = dispatch thunk of CustomStringConvertible.description.getter(v51, *(_QWORD *)(v52 + 8));
    v55 = v54;
    *(_QWORD *)&v115 = sub_100010F78(v53, v54, (uint64_t *)v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8, v43 + 14);
    swift_release_n(v111, 2);
    swift_bridgeObjectRelease(v55);
    *(_WORD *)(v43 + 22) = 2080;
    v56 = v96;
    v57 = v100;
    v36(v96, (uint64_t *)v100, v19);
    v58 = String.init<A>(describing:)(v56, v19);
    v60 = v59;
    *(_QWORD *)&v115 = sub_100010F78(v58, v59, (uint64_t *)v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, (char *)&v115 + 8, v43 + 24);
    swift_bridgeObjectRelease(v60);
    v61 = v110;
    v62 = *(void (**)(char *, uint64_t))(v110 + 8);
    v62(v57, v19);
    _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v91, "Resolved preferences for %s using %s personality, new layout is %s", (uint8_t *)v43, 0x20u);
    v63 = v92;
    swift_arrayDestroy(v92, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v63, -1, -1);
    v64 = v43;
    v2 = v111;
    swift_slowDealloc(v64, -1, -1);
  }
  else
  {
    (*(void (**)(char *, _QWORD))(v112 + 8))(v31, v113);
    swift_release_n(v2, 2);
    v61 = v110;
    v62 = *(void (**)(char *, uint64_t))(v110 + 8);
    v62(v100, v19);
  }

  v65 = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v101, v103);
  v67 = v106;
  v66 = v107;
  v68 = v105;
  v69 = SceneUpdateHandshake.fenceHandle.getter(v65);
  v70 = *(void (**)(char *))(v67 + 104);
  v113 = (void (*)(uint64_t *, uint64_t))v62;
  if (!v69)
  {
    LODWORD(v112) = enum case for SceneUpdateTiming.async(_:);
    v70(v98);
    v72 = enum case for SceneUpdateTiming.fenced(_:);
    ((void (*)(char *, _QWORD, uint64_t))v70)(v97, enum case for SceneUpdateTiming.fenced(_:), v66);
    v74 = sub_100006618((unint64_t *)&unk_100060150, (uint64_t (*)(uint64_t))&type metadata accessor for SceneUpdateTiming, (uint64_t)&protocol conformance descriptor for SceneUpdateTiming);
    dispatch thunk of RawRepresentable.rawValue.getter(v116, v66, v74);
    dispatch thunk of RawRepresentable.rawValue.getter(&v115, v66, v74);
    v75 = *((_QWORD *)&v116[0] + 1);
    v76 = *((_QWORD *)&v115 + 1);
    if (v116[0] == v115)
    {
      swift_bridgeObjectRelease_n(*((_QWORD *)&v116[0] + 1), 2);
      v77 = *(void (**)(char *, uint64_t))(v67 + 8);
      v77(v97, v66);
      v77(v98, v66);
      v73 = v99;
    }
    else
    {
      v78 = _stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)&v116[0], *((_QWORD *)&v116[0] + 1), v115, *((_QWORD *)&v115 + 1), 0);
      swift_bridgeObjectRelease(v75);
      swift_bridgeObjectRelease(v76);
      v79 = *(void (**)(char *, uint64_t))(v67 + 8);
      v79(v97, v66);
      v79(v98, v66);
      v73 = v99;
      if ((v78 & 1) == 0)
      {
        v71 = 0;
        v72 = v112;
        goto LABEL_11;
      }
    }
    v71 = objc_msgSend((id)objc_opt_self(UVFenceHandle), "createForScene:", *(_QWORD *)(v2 + 104));
LABEL_11:
    v61 = v110;
    goto LABEL_12;
  }
  v71 = (id)v69;
  v72 = enum case for SceneUpdateTiming.fenced(_:);
  v73 = v99;
LABEL_12:
  ((void (*)(char *, uint64_t, uint64_t))v70)(v68, v72, v66);
  v80 = v2 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator;
  swift_beginAccess(v2 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator, v116, 33, 0);
  v81 = v109;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v61 + 24))(v80 + *(int *)(v73 + 24), v114, v109);
  v82 = swift_endAccess(v116);
  __chkstk_darwin(v82);
  v88 = v2;
  v89 = v71;
  sub_100031000((uint64_t)sub_100024698, (uint64_t)(&v90 - 4));
  v83 = v93;
  sub_100024570(v80, v93);
  v84 = *(_OWORD *)(v2 + 104);
  v116[0] = *(_OWORD *)(v2 + 88);
  v116[1] = v84;
  v116[2] = *(_OWORD *)(v2 + 120);
  v117 = *(_QWORD *)(v2 + 136);
  sub_100030D9C((uint64_t)v116);
  sub_100024534(v83);
  sub_100006658(&qword_10005F120);
  LOBYTE(v88) = 2;
  v85 = static Future.succeeded(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/LocalSceneHost.swift", 110, 2, 131, 30, "resolveHandshake(_:)", 20, v88, v68);
  v86 = v113;
  objc_msgSend(v71, "invalidate");

  (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v66);
  v86(v114, v81);
  return v85;
}

void sub_1000239C4(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  _BYTE v15[24];

  v8 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v8);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = a3 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator;
  swift_beginAccess(v11, v15, 0, 0);
  sub_100024570(v11, (uint64_t)v10);
  v12 = a4;
  sub_1000307AC(a1);
  sub_100024534((uint64_t)v10);
  if (a4)
    v13 = objc_msgSend(v12, "underlying");
  else
    v13 = 0;
  objc_msgSend(a2, "setAnimationFence:", v13);

}

uint64_t sub_100023AC4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE v11[24];

  v5 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v5);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = a3 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator;
  swift_beginAccess(v8, v11, 0, 0);
  sub_100024570(v8, (uint64_t)v7);
  sub_1000307AC(a1);
  return sub_100024534((uint64_t)v7);
}

uint64_t sub_100023B68()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  sub_10000D6B0((_QWORD *)(v0 + 40));

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void **)(v0 + 104);
  v3 = *(void **)(v0 + 112);
  v4 = *(void **)(v0 + 120);
  v5 = *(void **)(v0 + 136);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 128));

  swift_bridgeObjectRelease(v1);
  sub_100024534(v0 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100023BF8()
{
  return type metadata accessor for LocalSceneHost(0);
}

uint64_t type metadata accessor for LocalSceneHost(uint64_t a1)
{
  uint64_t result;

  result = qword_10005FFE8;
  if (!qword_10005FFE8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocalSceneHost);
  return result;
}

uint64_t sub_100023C3C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = &unk_100040D58;
  v4[2] = &unk_100040D70;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[4] = &unk_100040D88;
  result = type metadata accessor for SceneConfigurator(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void destroy for LocalSceneHost.Client(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));

  swift_unknownObjectRelease(*(_QWORD *)(a1 + 40));
}

_QWORD *initializeWithCopy for LocalSceneHost.Client(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  v7 = (void *)a2[4];
  v6 = a2[5];
  a1[4] = v7;
  a1[5] = v6;
  v8 = (void *)a2[6];
  a1[6] = v8;
  swift_bridgeObjectRetain(v3);
  v9 = v4;
  v10 = v5;
  v11 = v7;
  swift_unknownObjectRetain(v6);
  v12 = v8;
  return a1;
}

_QWORD *assignWithCopy for LocalSceneHost.Client(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = (void *)a2[2];
  v7 = (void *)a1[2];
  a1[2] = v6;
  v8 = v6;

  v9 = (void *)a2[3];
  v10 = (void *)a1[3];
  a1[3] = v9;
  v11 = v9;

  v12 = (void *)a2[4];
  v13 = (void *)a1[4];
  a1[4] = v12;
  v14 = v12;

  v15 = a2[5];
  v16 = a1[5];
  a1[5] = v15;
  swift_unknownObjectRetain(v15);
  swift_unknownObjectRelease(v16);
  v17 = (void *)a1[6];
  v18 = (void *)a2[6];
  a1[6] = v18;
  v19 = v18;

  return a1;
}

__n128 initializeWithTake for LocalSceneHost.Client(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for LocalSceneHost.Client(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  swift_unknownObjectRelease(*(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for LocalSceneHost.Client(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalSceneHost.Client(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalSceneHost.Client()
{
  return &type metadata for LocalSceneHost.Client;
}

uint64_t sub_100023F80(uint64_t a1)
{
  return sub_1000230B0(a1);
}

id sub_100023FA0(int a1, id a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t sub_100023FB0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char v20;
  _QWORD v21[5];

  v21[3] = &type metadata for LocalStaticPersonality;
  v21[4] = sub_10001EB24();
  v12 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v20 = 2;
  *(_QWORD *)(a6 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/LocalSceneHost.swift", 110, 2, 35, 48, "LocalSceneHost", 14, v20, 0, 0);
  *(_QWORD *)(a6 + 24) = a1;
  *(_QWORD *)(a6 + 32) = a2;
  sub_10000D66C((uint64_t)v21, a6 + 40);
  sub_100024570(a3, a6 + OBJC_IVAR____TtC12PreviewShell14LocalSceneHost_configurator);
  *(_QWORD *)(a6 + 80) = a4;
  v13 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(a6 + 88) = *(_OWORD *)a5;
  *(_OWORD *)(a6 + 104) = v13;
  *(_OWORD *)(a6 + 120) = *(_OWORD *)(a5 + 32);
  *(_QWORD *)(a6 + 136) = *(_QWORD *)(a5 + 48);
  v14 = swift_allocObject(&unk_1000533C8, 80, 7);
  v15 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a5;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(a5 + 32);
  *(_QWORD *)(v14 + 64) = *(_QWORD *)(a5 + 48);
  *(_QWORD *)(v14 + 72) = a6;
  sub_10002463C(a5);
  sub_10002463C(a5);
  v16 = type metadata accessor for LocalSceneHost(0);
  v17 = sub_100006618(&qword_100060148, type metadata accessor for LocalSceneHost, (uint64_t)&unk_100040DC8);
  v18 = a4;
  swift_retain(a6);
  Invalidatable.onInvalidation(_:)(sub_100024630, v14, v16, v17);
  swift_release(v14);
  sub_100024534(a3);
  sub_10000D6B0(v21);
  return a6;
}

uint64_t sub_100024164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  _QWORD v57[5];
  __int128 v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _QWORD v65[7];
  uint64_t v66;

  v8 = v7;
  v56 = a7;
  v15 = type metadata accessor for SceneConfigurator(0);
  v16 = __chkstk_darwin(v15);
  v66 = (uint64_t)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)&v44 - v18;
  sub_10000D66C(a5, (uint64_t)&v58);
  *((_QWORD *)v19 + 5) = 0;
  *((_QWORD *)v19 + 6) = 0;
  v20 = &v19[*(int *)(v15 + 24)];
  v21 = qword_10005ECF8;
  swift_bridgeObjectRetain(a4);
  if (v21 != -1)
    swift_once(&qword_10005ECF8, sub_100031938);
  v22 = type metadata accessor for SceneLayout(0);
  v23 = sub_10000C53C(v22, (uint64_t)qword_1000641D8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v23, v22);
  sub_10000C5DC(&v58, (uint64_t)v19);
  swift_bridgeObjectRelease(*((_QWORD *)v19 + 6));
  *((_QWORD *)v19 + 5) = a3;
  *((_QWORD *)v19 + 6) = a4;
  sub_100031248(a1, a2, a6, &v58);
  if (v8)
    return sub_100024534((uint64_t)v19);
  v55 = *((_QWORD *)&v58 + 1);
  v53 = (void *)v58;
  v25 = v60;
  v49 = v59;
  v26 = v62;
  v50 = v61;
  v27 = v64;
  v52 = v63;
  v65[0] = *((_QWORD *)&v58 + 1);
  v65[1] = v59;
  v65[2] = v60;
  v65[3] = v61;
  v65[4] = v62;
  v65[5] = v63;
  v65[6] = v64;
  v47 = (uint64_t)v64;
  sub_10000D66C(a6, (uint64_t)&v58);
  sub_100024570((uint64_t)v19, v66);
  v28 = a2;
  v51 = a1;
  v29 = sub_1000245B4((uint64_t)&v58, (uint64_t)v60);
  v54 = &v44;
  __chkstk_darwin(v29);
  (*(void (**)(void))(v30 + 16))();
  v57[3] = &type metadata for LocalStaticPersonality;
  v57[4] = sub_10001EB24();
  v31 = type metadata accessor for LocalSceneHost(0);
  v46 = swift_allocObject(v31, *(unsigned int *)(v31 + 48), *(unsigned __int16 *)(v31 + 52));
  v32 = sub_1000245B4((uint64_t)v57, (uint64_t)&type metadata for LocalStaticPersonality);
  v48 = &v44;
  __chkstk_darwin(v32);
  (*(void (**)(void))(v33 + 16))();
  v45 = v27;
  swift_bridgeObjectRetain(a2);
  v34 = v49;
  swift_bridgeObjectRetain(v49);
  v35 = v25;
  v36 = v50;
  v37 = v26;
  v38 = v52;
  swift_unknownObjectRetain(v52);
  v39 = v53;
  v40 = sub_100023FB0(v51, v28, v66, v53, (uint64_t)v65, v46);

  swift_unknownObjectRelease(v38);
  swift_bridgeObjectRelease(v34);
  sub_10000D6B0(v57);
  sub_10000D6B0(&v58);
  result = sub_100024534((uint64_t)v19);
  v41 = v56;
  v42 = v55;
  *v56 = v40;
  v41[1] = v42;
  v41[2] = v34;
  v41[3] = (uint64_t)v35;
  v41[4] = (uint64_t)v36;
  v41[5] = (uint64_t)v37;
  v43 = v47;
  v41[6] = v38;
  v41[7] = v43;
  return result;
}

uint64_t sub_100024534(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SceneConfigurator(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024570(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SceneConfigurator(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000245B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000245DC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 80, 7);
}

void sub_100024630()
{
  uint64_t v0;

  sub_100022FF4(v0 + 16);
}

uint64_t sub_10002463C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  swift_bridgeObjectRetain(v2);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  swift_unknownObjectRetain(v6);
  return a1;
}

void sub_100024698(void *a1, void *a2)
{
  uint64_t v2;

  sub_1000239C4(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1000246A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t updated;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[24];

  v42 = a1;
  v4 = type metadata accessor for Logger(0);
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006658(&qword_10005FB98);
  __chkstk_darwin(v7);
  v40 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreviewType(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LaunchPayload(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v40 - v18;
  v41 = v2;
  v20 = (uint64_t *)(v2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_launches);
  swift_beginAccess(v20, v45, 32, 0);
  v21 = *v20;
  if (*(_QWORD *)(v21 + 16) && (v22 = sub_100007D58(a2), (v23 & 1) != 0))
  {
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v24(v17, *(_QWORD *)(v21 + 56) + *(_QWORD *)(v14 + 72) * v22, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v17, v13);
    v25 = swift_endAccess(v45);
    v26 = v42;
    ShellUpdatePayload.previewType.getter(v25);
    if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v12, v9) == enum case for PreviewType.hosted(_:))
    {
      (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
      v27 = type metadata accessor for PreviewType.HostLocation(0);
      v28 = *(_QWORD *)(v27 - 8);
      if ((*(unsigned int (**)(char *, uint64_t))(v28 + 88))(v12, v27) == enum case for PreviewType.HostLocation.mainScene(_:))
      {
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v27);
        v29 = (uint64_t)v40;
        v24(v40, (unint64_t)v19, v13);
        v30 = type metadata accessor for PreviewCache.Replayable(0);
        v31 = v29 + *(int *)(v30 + 20);
        updated = type metadata accessor for ShellUpdatePayload(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 16))(v31, v26, updated);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 0, 1, v30);
        v33 = v41 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
        swift_beginAccess(v41 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, v45, 33, 0);
        sub_10001B518(v29, v33);
        swift_endAccess(v45);
        sub_100024D28();
        return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
        return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v27);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
  }
  else
  {
    v35 = swift_endAccess(v45);
    v36 = static Logger.uv.getter(v35);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "PreviewCache: ignoring update with no previously stored launch", v39, 2u);
      swift_slowDealloc(v39, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v6, v44);
  }
}

uint64_t sub_100024A64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for PreviewCache(0);
  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_1000261F0();
  qword_1000641B8 = v1;
  return result;
}

uint64_t sub_100024AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v4 = a2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  swift_beginAccess(a2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, v7, 33, 0);
  sub_10002729C(a1, v4);
  swift_endAccess(v7);
  v5 = *(_QWORD *)(a2 + 16);
  v7[0] = 1;
  swift_retain(v5);
  EventStreamObservable.wrappedValue.setter(v7);
  return swift_release(v5);
}

uint64_t sub_100024B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  _QWORD aBlock[5];
  _QWORD *v23;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistQueue);
  v13 = (_QWORD *)swift_allocObject(&unk_100053438, 40, 7);
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_10002712C;
  v23 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001F9B4;
  aBlock[3] = &unk_100053450;
  v14 = _Block_copy(aBlock);
  swift_retain(v2);
  v15 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v15);
  v21 = &_swiftEmptyArrayStorage;
  v16 = sub_100006618(&qword_10005EF78, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v17 = sub_100006658(&qword_10005EF80);
  v18 = sub_100027150((unint64_t *)&qword_10005EF88, &qword_10005EF80);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v17, v18, v5, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release(v23);
}

uint64_t sub_100024D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v24[24];
  char v25[24];
  char v26[24];

  v1 = v0;
  v2 = type metadata accessor for DispatchScheduler(0);
  __chkstk_darwin(v2);
  v4 = &v24[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = sub_100006658(&qword_10005FB98);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = __chkstk_darwin(v5);
  v9 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v11 = &v24[-v10 - 8];
  v12 = v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  swift_beginAccess(v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, v26, 0, 0);
  sub_100027080(v12, (uint64_t)v11, &qword_10005FB98);
  v13 = (uint64_t *)(v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistTimer);
  swift_beginAccess(v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistTimer, v25, 1, 0);
  v14 = *v13;
  if (*v13)
  {
    swift_retain(*v13);
    DelayedInvocation.cancel()();
    swift_release(v14);
  }
  DispatchScheduler.init(queue:)(*(id *)(v1 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistQueue));
  sub_100027080((uint64_t)v11, (uint64_t)v9, &qword_10005FB98);
  v15 = *(unsigned __int8 *)(v6 + 80);
  v16 = (v15 + 24) & ~v15;
  v17 = swift_allocObject(&unk_100053410, v16 + v7, v15 | 7);
  *(_QWORD *)(v17 + 16) = v1;
  sub_1000265B4((uint64_t)v9, v17 + v16);
  v18 = type metadata accessor for DelayedInvocation(0);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  swift_retain(v1);
  v19 = DelayedInvocation.init<A>(scheduler:callback:)(v4, sub_1000265FC, v17, v2, &protocol witness table for DispatchScheduler);
  v20 = *v13;
  *v13 = v19;
  swift_release(v20);
  swift_beginAccess(v13, v24, 32, 0);
  v21 = *v13;
  if (*v13)
  {
    swift_endAccess(v24);
    swift_retain(v21);
    DelayedInvocation.schedule(delay:)(1.0);
    swift_release(v21);
    return sub_10000D718((uint64_t)v11, &qword_10005FB98);
  }
  else
  {
    sub_10000D718((uint64_t)v11, &qword_10005FB98);
    return swift_endAccess(v24);
  }
}

uint64_t sub_100024F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[5];
  uint64_t v35;

  v29 = a2;
  v30 = a3;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v33 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006658(&qword_10005FB98);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v28 - v14;
  sub_100025220((uint64_t)&v28 - v14);
  sub_100006598();
  v16 = (void *)static OS_dispatch_queue.main.getter();
  sub_100027080((uint64_t)v15, (uint64_t)v13, &qword_10005FB98);
  v17 = *(unsigned __int8 *)(v10 + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = swift_allocObject(&unk_100053488, v18 + v11, v17 | 7);
  v20 = v30;
  *(_QWORD *)(v19 + 16) = v29;
  *(_QWORD *)(v19 + 24) = v20;
  sub_1000265B4((uint64_t)v13, v19 + v18);
  aBlock[4] = sub_100027258;
  v35 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001F9B4;
  aBlock[3] = &unk_1000534A0;
  v21 = _Block_copy(aBlock);
  v22 = v35;
  swift_retain(v20);
  v23 = swift_release(v22);
  static DispatchQoS.unspecified.getter(v23);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v24 = sub_100006618(&qword_10005EF78, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v25 = sub_100006658(&qword_10005EF80);
  v26 = sub_100027150((unint64_t *)&qword_10005EF88, &qword_10005EF80);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v3, v24);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
  return sub_10000D718((uint64_t)v15, &qword_10005FB98);
}

uint64_t sub_100025220@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  id v25;
  NSURL *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  NSURL *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t updated;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v54 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for ShellUpdatePayload(0);
  v49 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v51 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LaunchPayload(0);
  v50 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006658(&qword_100060308);
  __chkstk_darwin(v9);
  v11 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URL(0);
  v55 = *(_QWORD *)(v12 - 8);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)v48 - v16;
  if (qword_10005ECE0 != -1)
    swift_once(&qword_10005ECE0, sub_100025874);
  v18 = sub_10000C53C(v9, (uint64_t)qword_100060170);
  sub_100027080(v18, (uint64_t)v11, &qword_100060308);
  v19 = sub_100006658(&qword_100060310);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v11, 1, v19) == 1)
  {
    sub_10000D718((uint64_t)v11, &qword_100060308);
    v20 = type metadata accessor for PreviewCache.Replayable(0);
    v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
    v22 = a1;
  }
  else
  {
    v48[1] = v2;
    v48[2] = v3;
    v53 = a1;
    v23 = &v11[*(int *)(v19 + 48)];
    v24 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v24(v17, v11, v12);
    v24(v15, v23, v12);
    v25 = objc_allocWithZone((Class)NSDictionary);
    URL._bridgeToObjectiveC()(v26);
    v28 = v27;
    v29 = objc_msgSend(v25, "initWithContentsOfURL:", v27);

    if (v29
      && (v56 = 0,
          static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(v29, &v56, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String), v29, (v30 = v56) != 0))
    {
      v31 = objc_allocWithZone((Class)NSDictionary);
      URL._bridgeToObjectiveC()(v32);
      v34 = v33;
      v35 = objc_msgSend(v31, "initWithContentsOfURL:", v33);

      if (v35)
      {
        v56 = 0;
        static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(v35, &v56, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

        v36 = v56;
        v37 = v53;
        if (v56)
        {
          v38 = sub_100006618(&qword_100060318, (uint64_t (*)(uint64_t))&type metadata accessor for LaunchPayload, (uint64_t)&protocol conformance descriptor for LaunchPayload);
          PropertyListRepresentable.init(serializableDictionary:)(v30, v6, v38);
          v40 = sub_100006618(&qword_100060320, (uint64_t (*)(uint64_t))&type metadata accessor for ShellUpdatePayload, (uint64_t)&protocol conformance descriptor for ShellUpdatePayload);
          v41 = v51;
          v42 = v36;
          v43 = updated;
          PropertyListRepresentable.init(serializableDictionary:)(v42, updated, v40);
          v45 = *(void (**)(char *, uint64_t))(v55 + 8);
          v45(v15, v12);
          v45(v17, v12);
          (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(v37, v8, v6);
          v46 = type metadata accessor for PreviewCache.Replayable(0);
          (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v37 + *(int *)(v46 + 20), v41, v43);
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v37, 0, 1, v46);
        }
      }
      else
      {
        v37 = v53;
      }
      swift_bridgeObjectRelease(v30);
      v44 = *(void (**)(char *, uint64_t))(v55 + 8);
      v44(v15, v12);
      v44(v17, v12);
      v20 = type metadata accessor for PreviewCache.Replayable(0);
      v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
      v22 = v37;
    }
    else
    {
      v39 = *(void (**)(char *, uint64_t))(v55 + 8);
      v39(v15, v12);
      v39(v17, v12);
      v20 = type metadata accessor for PreviewCache.Replayable(0);
      v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
      v22 = v53;
    }
  }
  return v21(v22, 1, 1, v20);
}

uint64_t sub_100025874()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006658(&qword_100060308);
  sub_10001D848(v0, qword_100060170);
  v1 = sub_10000C53C(v0, (uint64_t)qword_100060170);
  return sub_1000258C0(v1);
}

uint64_t sub_1000258C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a1;
  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006658(&qword_10005F9E8);
  __chkstk_darwin(v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v13 = 1;
  v14 = objc_msgSend(v12, "URLsForDirectory:inDomains:", 9, 1);

  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v8);
  if (*(_QWORD *)(v15 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v7, v15 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v8);
    v13 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v13, 1, v8);
  swift_bridgeObjectRelease(v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    v16 = sub_10000D718((uint64_t)v7, &qword_10005F9E8);
    v17 = static Logger.uv.getter(v16);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "unable to locate documents directory for preview cache", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v21 = sub_100006658(&qword_100060310);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v26, 1, 1, v21);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v23 = v26;
    URL.appendingPathComponent(_:)(0x612E68636E75614CLL, 0xEE00657669686372);
    v24 = sub_100006658(&qword_100060310);
    URL.appendingPathComponent(_:)(0x612E657461647055, 0xEE00657669686372);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
}

uint64_t sub_100025BDC()
{
  _QWORD *v0;

  swift_release(v0[2]);
  sub_10000D718((uint64_t)v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable, &qword_10005FB98);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_launches));
  swift_release(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistTimer));

  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_100025C4C()
{
  return type metadata accessor for PreviewCache(0);
}

uint64_t type metadata accessor for PreviewCache(uint64_t a1)
{
  return sub_100011A7C(a1, (uint64_t *)&unk_1000601C8, (uint64_t)&nominal type descriptor for PreviewCache);
}

void sub_100025C68(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  sub_100025D08(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[3] = "\b";
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
  }
}

void sub_100025D08(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000601D8)
  {
    v2 = type metadata accessor for PreviewCache.Replayable(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000601D8);
  }
}

uint64_t type metadata accessor for PreviewCache.Replayable(uint64_t a1)
{
  return sub_100011A7C(a1, qword_1000602D0, (uint64_t)&nominal type descriptor for PreviewCache.Replayable);
}

uint64_t *sub_100025D70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t updated;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = type metadata accessor for LaunchPayload(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    updated = type metadata accessor for ShellUpdatePayload(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(updated - 8) + 16))(v9, v10, updated);
  }
  return a1;
}

uint64_t sub_100025E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t updated;

  v4 = type metadata accessor for LaunchPayload(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  updated = type metadata accessor for ShellUpdatePayload(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v5, updated);
}

uint64_t sub_100025E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for LaunchPayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for ShellUpdatePayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 16))(v8, v9, updated);
  return a1;
}

uint64_t sub_100025EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for LaunchPayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for ShellUpdatePayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 24))(v8, v9, updated);
  return a1;
}

uint64_t sub_100025F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for LaunchPayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for ShellUpdatePayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 32))(v8, v9, updated);
  return a1;
}

uint64_t sub_100025FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;

  v6 = type metadata accessor for LaunchPayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  updated = type metadata accessor for ShellUpdatePayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 40))(v8, v9, updated);
  return a1;
}

uint64_t sub_100026064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026070);
}

uint64_t sub_100026070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t updated;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for LaunchPayload(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    updated = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    updated = type metadata accessor for ShellUpdatePayload(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 48);
  }
  return v9(v10, a2, updated);
}

uint64_t sub_1000260E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000260F0);
}

uint64_t sub_1000260F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for LaunchPayload(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    updated = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    updated = type metadata accessor for ShellUpdatePayload(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 56);
  }
  return v11(v12, a2, a2, updated);
}

uint64_t sub_10002616C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[2];

  result = type metadata accessor for LaunchPayload(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for ShellUpdatePayload(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000261F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v20 = *(_QWORD *)(v2 - 8);
  v21 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = 0;
  v11 = sub_100006658(&qword_100060328);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  *(_QWORD *)(v0 + 16) = EventStreamObservable.init(wrappedValue:emitsInitialValue:)(&v23, 1);
  v12 = v0 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_replayable;
  v13 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_launches) = _swiftEmptyDictionarySingleton;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistTimer) = 0;
  v14 = OBJC_IVAR____TtC12PreviewShell12PreviewCache_persistQueue;
  v15 = sub_100006598();
  static DispatchQoS.unspecified.getter(v15);
  v22 = &_swiftEmptyArrayStorage;
  v16 = sub_100006618(&qword_100060330, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v17 = sub_100006658(&qword_100060338);
  v18 = sub_100027150(&qword_100060340, &qword_100060338);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v17, v18, v5, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v21);
  *(_QWORD *)(v1 + v14) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000018, 0x8000000100047620, v10, v7, v4, 0);
  return v1;
}

void sub_10002643C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1;
  v9 = *a1 + 8;
  if (v6)
    v11 = v6;
  else
    v11 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8);
  *a1 = v9;
  v10 = *a2;
  if (*a2)
  {
    *v10 = v7;
    *a2 = v10 + 1;
  }
  else
  {

  }
}

uint64_t sub_1000264EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t updated;

  v1 = *(_QWORD *)(sub_100006658(&qword_10005FB98) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  swift_release(*(_QWORD *)(v0 + 16));
  v5 = type metadata accessor for PreviewCache.Replayable(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    v6 = type metadata accessor for LaunchPayload(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v3, v6);
    v7 = v0 + v3 + *(int *)(v5 + 20);
    updated = type metadata accessor for ShellUpdatePayload(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v7, updated);
  }
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000265B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000265FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_100006658(&qword_10005FB98) - 8) + 80);
  return sub_100026A8C(v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_10002662C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  void *v18;
  id v19;
  NSURL *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  id v26;
  NSURL *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void (*v31)(char *, uint64_t);
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint8_t *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;

  v0 = type metadata accessor for Logger(0);
  v52 = *(_QWORD *)(v0 - 8);
  v53 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006658(&qword_100060308);
  __chkstk_darwin(v3);
  v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v47 - v11;
  if (qword_10005ECE0 != -1)
    swift_once(&qword_10005ECE0, sub_100025874);
  v13 = sub_10000C53C(v3, (uint64_t)qword_100060170);
  sub_100027080(v13, (uint64_t)v5, &qword_100060308);
  v14 = sub_100006658(&qword_100060310);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v5, 1, v14) == 1)
    return sub_10000D718((uint64_t)v5, &qword_100060308);
  v16 = &v5[*(int *)(v14 + 48)];
  v50 = v7;
  v17 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v17(v12, v5, v6);
  v17(v10, v16, v6);
  v18 = (void *)objc_opt_self(NSFileManager);
  v19 = objc_msgSend(v18, "defaultManager");
  v51 = v12;
  URL._bridgeToObjectiveC()(v20);
  v22 = v21;
  v54 = 0;
  v23 = objc_msgSend(v19, "removeItemAtURL:error:", v21, &v54);

  v24 = v54;
  if (!v23)
    goto LABEL_8;
  v25 = v54;
  v26 = objc_msgSend(v18, "defaultManager");
  URL._bridgeToObjectiveC()(v27);
  v29 = v28;
  v54 = 0;
  v30 = objc_msgSend(v26, "removeItemAtURL:error:", v28, &v54);

  v24 = v54;
  if (v30)
  {
    v31 = *(void (**)(char *, uint64_t))(v50 + 8);
    v32 = v54;
    v31(v10, v6);
    return ((uint64_t (*)(char *, uint64_t))v31)(v51, v6);
  }
  else
  {
LABEL_8:
    v49 = v10;
    v33 = v24;
    v34 = _convertNSErrorToError(_:)(v24);

    v36 = swift_willThrow(v35);
    static Logger.uv.getter(v36);
    swift_errorRetain(v34);
    v37 = swift_errorRetain(v34);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v40 = 138412290;
      v48 = v40 + 4;
      swift_errorRetain(v34);
      v42 = (void *)_swift_stdlib_bridgeErrorToNSError(v34);
      v54 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v48);
      *v41 = v42;
      swift_errorRelease(v34);
      swift_errorRelease(v34);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Failed to clear persisted cache: %@", v40, 0xCu);
      v43 = sub_100006658(&qword_10005F2A8);
      swift_arrayDestroy(v41, 1, v43);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);

    }
    else
    {

      swift_errorRelease(v34);
      swift_errorRelease(v34);
    }
    v44 = v50;
    v45 = v51;
    swift_errorRelease(v34);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v2, v53);
    v46 = *(void (**)(char *, uint64_t))(v44 + 8);
    v46(v49, v6);
    return ((uint64_t (*)(char *, uint64_t))v46)(v45, v6);
  }
}

uint64_t sub_100026A8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Class isa;
  NSURL *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  uint64_t updated;
  uint64_t v38;
  id v39;
  uint64_t v40;
  Class v41;
  NSURL *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void (*v46)(char *, uint64_t);
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD *v57;
  void *v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint8_t *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;

  v2 = type metadata accessor for Logger(0);
  v63 = *(_QWORD *)(v2 - 8);
  v64 = v2;
  __chkstk_darwin(v2);
  v66 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006658(&qword_100060308);
  __chkstk_darwin(v4);
  v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = type metadata accessor for URL(0);
  v67 = *(_QWORD *)(v65 - 8);
  v7 = __chkstk_darwin(v65);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v61 - v10;
  v12 = sub_100006658(&qword_10005FB98);
  __chkstk_darwin(v12);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PreviewCache.Replayable(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027080(a1, (uint64_t)v14, &qword_10005FB98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_10000D718((uint64_t)v14, &qword_10005FB98);
    return sub_10002662C();
  }
  else
  {
    sub_10001B33C((uint64_t)v14, (uint64_t)v18);
    if (qword_10005ECE0 != -1)
      swift_once(&qword_10005ECE0, sub_100025874);
    v20 = sub_10000C53C(v4, (uint64_t)qword_100060170);
    sub_100027080(v20, (uint64_t)v6, &qword_100060308);
    v21 = sub_100006658(&qword_100060310);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v6, 1, v21) == 1)
    {
      sub_1000270C4((uint64_t)v18);
      return sub_10000D718((uint64_t)v6, &qword_100060308);
    }
    else
    {
      v22 = v9;
      v23 = &v6[*(int *)(v21 + 48)];
      v24 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
      v25 = v11;
      v26 = v11;
      v27 = v65;
      v24(v26, v6, v65);
      v24(v22, v23, v27);
      v28 = type metadata accessor for LaunchPayload(0);
      v29 = sub_100006618(&qword_100060318, (uint64_t (*)(uint64_t))&type metadata accessor for LaunchPayload, (uint64_t)&protocol conformance descriptor for LaunchPayload);
      v30 = PropertyListRepresentable.serializableDictionary.getter(v28, v29);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v30);
      URL._bridgeToObjectiveC()(v32);
      v34 = v33;
      v68 = 0;
      v35 = -[objc_class writeToURL:error:](isa, "writeToURL:error:", v33, &v68);

      v36 = v68;
      if (!v35)
        goto LABEL_10;
      updated = type metadata accessor for ShellUpdatePayload(0);
      v38 = sub_100006618(&qword_100060320, (uint64_t (*)(uint64_t))&type metadata accessor for ShellUpdatePayload, (uint64_t)&protocol conformance descriptor for ShellUpdatePayload);
      v39 = v36;
      v40 = PropertyListRepresentable.serializableDictionary.getter(updated, v38);
      v41 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v40);
      URL._bridgeToObjectiveC()(v42);
      v44 = v43;
      v68 = 0;
      v45 = -[objc_class writeToURL:error:](v41, "writeToURL:error:", v43, &v68);

      v36 = v68;
      if (v45)
      {
        v46 = *(void (**)(char *, uint64_t))(v67 + 8);
        v47 = v68;
        v46(v22, v27);
        v46(v25, v27);
        v48 = (uint64_t)v18;
      }
      else
      {
LABEL_10:
        v62 = v18;
        v49 = v36;
        v50 = _convertNSErrorToError(_:)(v36);

        v52 = swift_willThrow(v51);
        static Logger.uv.getter(v52);
        swift_errorRetain(v50);
        v53 = swift_errorRetain(v50);
        v54 = Logger.logObject.getter(v53);
        v55 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc(12, -1);
          v57 = (_QWORD *)swift_slowAlloc(8, -1);
          *(_DWORD *)v56 = 138412290;
          v61 = v56 + 4;
          swift_errorRetain(v50);
          v58 = (void *)_swift_stdlib_bridgeErrorToNSError(v50);
          v68 = v58;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v61);
          *v57 = v58;
          swift_errorRelease(v50);
          swift_errorRelease(v50);
          _os_log_impl((void *)&_mh_execute_header, v54, v55, "Failed to persist preview cache: %@", v56, 0xCu);
          v59 = sub_100006658(&qword_10005F2A8);
          swift_arrayDestroy(v57, 1, v59);
          swift_slowDealloc(v57, -1, -1);
          swift_slowDealloc(v56, -1, -1);
        }
        else
        {
          swift_errorRelease(v50);
          swift_errorRelease(v50);
        }

        (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v64);
        sub_10002662C();
        swift_errorRelease(v50);
        v60 = *(void (**)(char *, uint64_t))(v67 + 8);
        v60(v22, v27);
        v60(v25, v27);
        v48 = (uint64_t)v62;
      }
      return sub_1000270C4(v48);
    }
  }
}

uint64_t sub_100027080(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006658(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000270C4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreviewCache.Replayable(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100027100()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002712C()
{
  uint64_t *v0;

  return sub_100024F84(v0[2], v0[3], v0[4]);
}

uint64_t sub_100027138(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100027148(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100027150(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1000066E4(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100027190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t updated;

  v1 = *(_QWORD *)(sub_100006658(&qword_10005FB98) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  swift_release(*(_QWORD *)(v0 + 24));
  v5 = type metadata accessor for PreviewCache.Replayable(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    v6 = type metadata accessor for LaunchPayload(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v3, v6);
    v7 = v0 + v3 + *(int *)(v5 + 20);
    updated = type metadata accessor for ShellUpdatePayload(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v7, updated);
  }
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100027258()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_100006658(&qword_10005FB98) - 8) + 80);
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_10002729C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_10005FB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000272F0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[8];

  v5[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  result = type metadata accessor for PreviewAgentConnector(319);
  if (v3 <= 0x3F)
  {
    v5[1] = *(_QWORD *)(result - 8) + 64;
    v5[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[3] = &unk_100040F08;
    v5[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = type metadata accessor for EntryPointCategory(319);
    if (v4 <= 0x3F)
    {
      v5[5] = *(_QWORD *)(result - 8) + 64;
      v5[6] = &unk_100040F20;
      v5[7] = &unk_100040F38;
      return swift_initClassMetadata2(a1, 0, 8, v5, a1 + 112);
    }
  }
  return result;
}

uint64_t sub_1000273B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000D718(a1, &qword_10005FB38);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000536F0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100060508, v16);
}

BOOL sub_1000274FC(char a1, char a2)
{
  return a1 == a2;
}

void sub_10002750C(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int sub_100027530(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL sub_100027574(char *a1, char *a2)
{
  return sub_1000274FC(*a1, *a2);
}

Swift::Int sub_10002758C()
{
  unsigned __int8 *v0;

  return sub_100027530(*v0);
}

void sub_10002759C(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_10002750C(a1, *v1);
}

Swift::Int sub_1000275AC(uint64_t a1)
{
  unsigned __int8 *v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  sub_10002750C((uint64_t)v3, *v1);
  return Hasher._finalize()();
}

uint64_t sub_1000275F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  v6 = type metadata accessor for PreviewAgentConnector(0);
  v5[12] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[13] = v7;
  v5[14] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AgentSceneConfiguration(0);
  v5[15] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[16] = v9;
  v5[17] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006658(&qword_100060490);
  v5[18] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for EntryPointCategory(0);
  v5[19] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[20] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[21] = swift_task_alloc(v13);
  v5[22] = swift_task_alloc(v13);
  v14 = type metadata accessor for MainActor(0);
  v5[23] = static MainActor.shared.getter(v14);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  v5[24] = v15;
  v5[25] = v16;
  return swift_task_switch(sub_100027714, v15, v16);
}

uint64_t sub_100027714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 96);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = dispatch thunk of static CategoryMap.entryPoints.getter(v2, v4);
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_100007E70(*(_QWORD *)(v0 + 56)), (v7 & 1) != 0))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 160) + 16))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v5 + 56) + *(_QWORD *)(*(_QWORD *)(v0 + 160) + 72) * v6, *(_QWORD *)(v0 + 152));
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v9 = *(_QWORD *)(v0 + 152);
  v10 = *(_QWORD *)(v0 + 160);
  v11 = *(_QWORD *)(v0 + 144);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v11, v8, 1, v9);
  swift_bridgeObjectRelease(v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    v12 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 56);
    swift_release(*(_QWORD *)(v0 + 184));
    sub_10000D718(v12, &qword_100060490);
    static CategoryMap.unhandled(_:)(v13, v2, v4);
    v14 = *(_QWORD *)(v0 + 40);
    v15 = *(_QWORD *)(v0 + 48);
    v16 = sub_10000D648((_QWORD *)(v0 + 16), v14);
    v17 = *(_QWORD *)(v14 - 8);
    v18 = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(v17 + 16))(v18, v16, v14);
    v19 = *(_QWORD *)(*(_QWORD *)(v15 + 8) + 8);
    if (_getErrorEmbeddedNSError<A>(_:)(v18, v14, v19))
    {
      v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v18, v14);
    }
    else
    {
      swift_allocError(v14, v19, 0, 0);
      v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v25, v18, v14);
    }
    swift_willThrow(v20);
    swift_task_dealloc(v18);
    sub_10000D6B0((_QWORD *)(v0 + 16));
    v26 = *(_QWORD *)(v0 + 168);
    v28 = *(_QWORD *)(v0 + 136);
    v27 = *(_QWORD *)(v0 + 144);
    v29 = *(_QWORD *)(v0 + 112);
    swift_task_dealloc(*(_QWORD *)(v0 + 176));
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 72);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 32))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 16))(v22, v21, v2, v3);
    v23 = (_QWORD *)swift_task_alloc(async function pointer to PreviewAgentConnector.injectScene(configuration:)[1]);
    *(_QWORD *)(v0 + 208) = v23;
    *v23 = v0;
    v23[1] = sub_10002799C;
    return PreviewAgentConnector.injectScene(configuration:)(*(_QWORD *)(v0 + 136));
  }
}

uint64_t sub_10002799C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 208);
  *(_QWORD *)(*(_QWORD *)v2 + 216) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[24];
    v7 = v4[25];
    v8 = sub_100027BCC;
  }
  else
  {
    v4[28] = a1;
    v6 = v4[24];
    v7 = v4[25];
    v8 = sub_100027A10;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_100027A10()
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
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = *(_QWORD *)(v0 + 224);
  v29 = *(_QWORD *)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 80);
  v26 = *(_QWORD *)(v0 + 176);
  v27 = *(_QWORD *)(v0 + 72);
  v9 = *(_QWORD *)(v0 + 64);
  swift_release(*(_QWORD *)(v0 + 184));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v8, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v26, v3);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  swift_unknownObjectRetain(v9);
  v10 = sub_100027D10(v5, v28, v9, v27, v2);
  v11 = *(_QWORD *)(v0 + 176);
  if (v29)
  {
    v12 = *(_QWORD *)(v0 + 152);
    v13 = *(_QWORD *)(v0 + 160);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    v14 = *(_QWORD *)(v0 + 168);
    v16 = *(_QWORD *)(v0 + 136);
    v15 = *(_QWORD *)(v0 + 144);
    v17 = *(_QWORD *)(v0 + 112);
    swift_task_dealloc(*(_QWORD *)(v0 + 176));
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v19 = v10;
    v21 = *(_QWORD *)(v0 + 160);
    v20 = *(_QWORD *)(v0 + 168);
    v23 = *(_QWORD *)(v0 + 144);
    v22 = *(_QWORD *)(v0 + 152);
    v24 = *(_QWORD *)(v0 + 136);
    v25 = *(_QWORD *)(v0 + 112);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(v24, *(_QWORD *)(v0 + 120));
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v11, v22);
    swift_task_dealloc(v11);
    swift_task_dealloc(v20);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v19);
  }
}

uint64_t sub_100027BCC()
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

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 120);
  swift_release(*(_QWORD *)(v0 + 184));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v7 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 136);
  v8 = *(_QWORD *)(v0 + 144);
  v10 = *(_QWORD *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 176));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_100027C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  return sub_100027D10(a1, a2, a3, a4, a5);
}

uint64_t sub_100027CE4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 24))();
}

_QWORD *sub_100027D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[7];

  v6 = v5;
  v41 = *v5;
  v42 = a5;
  v11 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  v5[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 75, 48, "RemoteContentProvider", 21, 2, 0, 0);
  v14 = (char *)v5 + qword_100060370;
  *((_QWORD *)v14 + 4) = 0;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_BYTE *)v5 + qword_100060378) = 0;
  v15 = (char *)v5 + qword_100060348;
  v16 = type metadata accessor for PreviewAgentConnector(0);
  v40 = *(_QWORD *)(v16 - 8);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
  v43 = a1;
  v17(v15, a1, v16);
  v18 = qword_100060350;
  *(_QWORD *)((char *)v5 + qword_100060350) = a2;
  v19 = (_QWORD *)((char *)v5 + qword_100060358);
  *v19 = a3;
  v19[1] = a4;
  v20 = objc_allocWithZone((Class)type metadata accessor for RemoteContentViewController(0));
  swift_retain_n(a2, 2);
  swift_unknownObjectRetain_n(a3, 2);
  v21 = v39;
  v22 = sub_100012344(a2, a3, a4);
  if (v21)
  {
    swift_unknownObjectRelease(a3);
    swift_release(a2);
    v23 = type metadata accessor for EntryPointCategory(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v42, v23);
    v24 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v24(v43, v16);
    swift_release(v6[2]);
    v24((uint64_t)v15, v16);
    swift_release(*(_QWORD *)((char *)v6 + v18));
    swift_unknownObjectRelease(*v19);
    sub_10000D718((uint64_t)v6 + qword_100060370, &qword_100060498);
    swift_deallocPartialClassInstance(v6, v41, *(unsigned int *)(*v6 + 48), *(unsigned __int16 *)(*v6 + 52));
  }
  else
  {
    *(_QWORD *)((char *)v5 + qword_100060360) = v22;
    v25 = (char *)v5 + qword_100060368;
    v26 = type metadata accessor for EntryPointCategory(0);
    v39 = *(_QWORD *)(v26 - 8);
    v27 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v25, v42, v26);
    v44[6] = a2;
    v44[3] = v41;
    v44[4] = swift_getWitnessTable(&unk_100041000, v41);
    v44[0] = v6;
    v28 = type metadata accessor for PreviewSceneAgentProxy(0);
    v29 = sub_100006618(&qword_100060510, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewSceneAgentProxy, (uint64_t)&protocol conformance descriptor for PreviewSceneAgentProxy);
    swift_retain(v6);
    ConcurrentInvalidatable.trackInvalidation(of:)(v44, v28, v29);
    sub_10000D6B0(v44);
    v30 = type metadata accessor for TaskPriority(0);
    v31 = (uint64_t)v38;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v38, 1, 1, v30);
    type metadata accessor for MainActor(0);
    swift_retain(a2);
    v32 = swift_retain(v6);
    v33 = static MainActor.shared.getter(v32);
    v34 = (_QWORD *)swift_allocObject(&unk_100053718, 48, 7);
    v34[2] = v33;
    v34[3] = &protocol witness table for MainActor;
    v34[4] = a2;
    v34[5] = v6;
    v35 = sub_1000273B0(v31, (uint64_t)&unk_100060520, (uint64_t)v34);
    swift_release(v35);
    swift_unknownObjectRelease(a3);
    swift_release(a2);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v27, v26);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v43, v16);
  }
  return v6;
}

uint64_t sub_1000280DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v5[5] = a5;
  v5[6] = *a5;
  v7 = type metadata accessor for MainActor(0);
  v5[7] = v7;
  v5[8] = static MainActor.shared.getter(v7);
  v5[2] = a4;
  v8 = (_QWORD *)swift_task_alloc(async function pointer to ConcurrentInvalidatable.invalidation.getter[1]);
  v5[9] = v8;
  v9 = type metadata accessor for PreviewSceneAgentProxy(0);
  v10 = sub_100006618(&qword_100060510, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewSceneAgentProxy, (uint64_t)&protocol conformance descriptor for PreviewSceneAgentProxy);
  *v8 = v5;
  v8[1] = sub_100028190;
  return ConcurrentInvalidatable.invalidation.getter(v9, v10);
}

uint64_t sub_100028190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 72));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100028200, v2, v3);
}

uint64_t sub_100028200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t WitnessTable;
  uint64_t v4;
  char v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 64));
  *(_QWORD *)(v0 + 24) = v1;
  WitnessTable = swift_getWitnessTable(&unk_100041000, v2);
  if ((Invalidatable.isInvalidated.getter(v2, WitnessTable) & 1) == 0)
    sub_1000282B8();
  v4 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 40);
  v6 = 2;
  Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 106, 28, "init(connector:sceneAgent:shellScene:entryPointCategory:)", 57, v6, v4, WitnessTable);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000282B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  if (!*(_BYTE *)(v0 + qword_100060378))
  {
    *(_BYTE *)(v0 + qword_100060378) = 3;
    sub_10001387C();
    v1 = v0 + qword_100060370;
    swift_beginAccess(v1, v9, 0, 0);
    if (*(_QWORD *)(v1 + 24))
    {
      sub_10000D66C(v1, (uint64_t)v6);
      v2 = v7;
      v3 = v8;
      v4 = sub_10000D648(v6, v7);
      v5 = PreviewAgentConnector.pid.getter(v4);
      dispatch thunk of ProviderUpdateDelegate.notePreviewCrashed(pid:)(v5, v2, *(_QWORD *)(v3 + 8));
      sub_10000D6B0(v6);
    }
  }
}

uint64_t sub_100028384()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v1 = qword_100060378;
  if (*(_BYTE *)(v0 + qword_100060378))
  {
    sub_100006658(&qword_10005F000);
    v7 = 2;
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 120, 30, "stop()", 6, v7);
  }
  else
  {
    v3 = v0;
    sub_10001328C();
    v4 = v0 + qword_100060370;
    swift_beginAccess(v4, v11, 0, 0);
    if (*(_QWORD *)(v4 + 24))
    {
      sub_10000D66C(v4, (uint64_t)v8);
      v6 = v9;
      v5 = v10;
      sub_10000D648(v8, v9);
      dispatch thunk of ProviderUpdateDelegate.notePreviewStopped()(v6, *(_QWORD *)(v5 + 8));
      sub_10000D6B0(v8);
    }
    *(_BYTE *)(v3 + v1) = 2;
    sub_100011C2C();
    return static CATransaction.afterSynchronize()();
  }
}

uint64_t sub_100028490()
{
  uint64_t v0;
  uint64_t v1;
  char v3;

  v1 = qword_100060378;
  if (*(_BYTE *)(v0 + qword_100060378))
  {
    sub_100006658(&qword_10005F000);
    v3 = 2;
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 131, 30, "prepareForRelaunch()", 20, v3);
  }
  else
  {
    sub_1000131F4();
    *(_BYTE *)(v0 + v1) = 1;
    sub_100011C2C();
    return static CATransaction.afterSynchronize()();
  }
}

uint64_t sub_100028540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t AssociatedConformanceWitness;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  char v61;
  _QWORD v62[2];
  void (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t updated;
  uint64_t AssociatedTypeWitness;
  uint64_t v85;
  char *v86;
  _BYTE v87[24];
  __int128 v88;
  uint64_t v89;

  v6 = v5;
  v64 = a5;
  v68 = a4;
  v76 = a2;
  v77 = a3;
  v81 = a1;
  v8 = *v5;
  updated = type metadata accessor for SceneUpdateContext(0);
  v80 = *(_QWORD *)(updated - 8);
  v71 = *(_QWORD *)(v80 + 64);
  __chkstk_darwin(updated);
  v86 = (char *)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v8;
  v75 = *(_QWORD *)(v8 + 104);
  v89 = *(_QWORD *)(v8 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v75, v89, &unk_100049174, &unk_10004918C);
  v79 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v70 = *(_QWORD *)(v79 + 64);
  __chkstk_darwin(AssociatedTypeWitness);
  v82 = (char *)v62 - v10;
  v11 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v11);
  v85 = (uint64_t)v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = type metadata accessor for AgentUpdate.Context(0);
  v13 = *(_QWORD *)(v74 - 8);
  v69 = *(_QWORD *)(v13 + 64);
  v65 = v13;
  __chkstk_darwin(v74);
  v73 = (char *)v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PropertyList(0);
  __chkstk_darwin(v15);
  v17 = (char *)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for EntryPointCategory(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = type metadata accessor for AgentUpdate(0);
  v66 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v23 = (char *)v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D66C(a5, (uint64_t)&v88);
  v24 = (uint64_t)v6 + qword_100060370;
  swift_beginAccess((char *)v6 + qword_100060370, v87, 33, 0);
  sub_10002C5A8((uint64_t)&v88, v24);
  swift_endAccess(v87);
  v78 = v6;
  v62[1] = *(_QWORD *)((char *)v6 + qword_100060350);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, (uint64_t)v6 + qword_100060368, v18);
  v25 = v75;
  v26 = v89;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v75 + 48))(v81, v76, v89, v75);
  v63 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v27 = v73;
  v28 = v74;
  v63(v73, v77, v74);
  AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)(v21, v17, 0, 0, v27);
  v29 = swift_getAssociatedTypeWitness(0, v25, v26, &unk_100049174, &unk_100049194);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v25, v26, v29, &unk_100049174, &unk_10004917C);
  v31 = v68;
  v32 = v64;
  v33 = PreviewSceneAgentProxy.perform<A>(update:with:delegate:expecting:)(v23, v68, v64, v29, v29, AssociatedConformanceWitness);
  v76 = v33;
  (*(void (**)(char *, uint64_t))(v66 + 8))(v23, v67);
  v67 = type metadata accessor for TaskPriority(0);
  v66 = *(_QWORD *)(*(_QWORD *)(v67 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v66)(v85, 1, 1, v67);
  v63(v27, v77, v28);
  v34 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v82, v81, AssociatedTypeWitness);
  v35 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v86, v31, updated);
  sub_10000D66C(v32, (uint64_t)&v88);
  type metadata accessor for MainActor(0);
  swift_retain(v33);
  v36 = swift_retain(v78);
  v37 = static MainActor.shared.getter(v36);
  v38 = v65;
  v39 = *(unsigned __int8 *)(v65 + 80);
  v40 = (v39 + 72) & ~v39;
  v41 = (v69 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = *(unsigned __int8 *)(v34 + 80);
  v43 = (v42 + v41 + 8) & ~v42;
  v44 = *(unsigned __int8 *)(v35 + 80);
  v45 = (v70 + v44 + v43) & ~v44;
  v46 = (v71 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
  v47 = (char *)swift_allocObject(&unk_100053600, v46 + 40, v39 | v44 | v42 | 7);
  *((_QWORD *)v47 + 2) = v37;
  *((_QWORD *)v47 + 3) = &protocol witness table for MainActor;
  v48 = v72;
  v81 = *(_QWORD *)(v72 + 80);
  v49 = v89;
  *((_QWORD *)v47 + 4) = v81;
  *((_QWORD *)v47 + 5) = v49;
  v77 = *(_QWORD *)(v48 + 96);
  v50 = v74;
  v51 = v75;
  *((_QWORD *)v47 + 6) = v77;
  *((_QWORD *)v47 + 7) = v51;
  *((_QWORD *)v47 + 8) = v76;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v47[v40], v73, v50);
  *(_QWORD *)&v47[v41] = v78;
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(&v47[v43], v82, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(&v47[v45], v86, updated);
  sub_10000C5DC(&v88, (uint64_t)&v47[v46]);
  v52 = type metadata accessor for RenderPayload(255);
  v53 = v89;
  v54 = swift_getAssociatedTypeWitness(255, v51, v89, &unk_100049174, &unk_10004919C);
  v55 = type metadata accessor for CanvasUpdateResult(0, (char *)&type metadata for () + 8, v52, v54);
  v56 = v85;
  v57 = sub_100029C38(v85, (uint64_t)&unk_1000604A8, (uint64_t)v47, v55);
  type metadata accessor for Future(0, v55);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v66)(v56, 1, 1, v67);
  v58 = (_QWORD *)swift_allocObject(&unk_100053628, 56, 7);
  v58[2] = v81;
  v58[3] = v53;
  v58[4] = v77;
  v58[5] = v51;
  v58[6] = v57;
  swift_retain(v57);
  v61 = 2;
  v59 = Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 212, 23, "performUpdate(updatePayload:controlStates:agentContext:sceneContext:delegate:)", 78, v61, v56, &unk_1000604B8, v58);
  swift_release(v76);
  swift_release(v57);
  return v59;
}

uint64_t sub_100028C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t updated;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t AssociatedTypeWitness;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v36;

  v8[11] = a8;
  v8[12] = v36;
  v8[9] = a6;
  v8[10] = a7;
  v8[7] = a1;
  v8[8] = a5;
  v10 = *a6;
  v8[13] = *a6;
  v11 = ((uint64_t (*)(_QWORD))type metadata accessor for ChromeType)(0);
  v8[14] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v8[15] = v12;
  v8[16] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateContext(0);
  v8[17] = updated;
  v14 = *(_QWORD *)(updated - 8);
  v8[18] = v14;
  v15 = *(_QWORD *)(v14 + 64);
  v8[19] = v15;
  v8[20] = swift_task_alloc((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v10 + 104);
  v8[21] = v16;
  v17 = *(_QWORD *)(v10 + 88);
  v8[22] = v17;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v16, v17, &unk_100049174, &unk_10004918C);
  v8[23] = AssociatedTypeWitness;
  v19 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[24] = v19;
  v20 = *(_QWORD *)(v19 + 64);
  v8[25] = v20;
  v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[26] = swift_task_alloc(v21);
  v8[27] = swift_task_alloc(v21);
  v22 = swift_getAssociatedTypeWitness(0, v16, v17, &unk_100049174, &unk_10004919C);
  v8[28] = v22;
  v23 = *(_QWORD *)(v22 - 8);
  v8[29] = v23;
  v24 = (*(_QWORD *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[30] = swift_task_alloc(v24);
  v8[31] = swift_task_alloc(v24);
  v25 = ((uint64_t (*)(_QWORD, uint64_t))type metadata accessor for CanvasControlConfiguration)(0, v22);
  v8[32] = v25;
  v26 = *(_QWORD *)(v25 - 8);
  v8[33] = v26;
  v27 = (*(_QWORD *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[34] = swift_task_alloc(v27);
  v8[35] = swift_task_alloc(v27);
  v28 = sub_100006658(&qword_10005FB60);
  v8[36] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v28 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = swift_getAssociatedTypeWitness(0, v16, v17, &unk_100049174, &unk_100049194);
  v8[37] = v29;
  v30 = *(_QWORD *)(v29 - 8);
  v8[38] = v30;
  v31 = swift_task_alloc((*(_QWORD *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[39] = v31;
  v32 = type metadata accessor for MainActor(0);
  v8[40] = v32;
  v8[41] = static MainActor.shared.getter(v32);
  v33 = (_QWORD *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  v8[42] = v33;
  v34 = sub_100006658(&qword_10005EFF0);
  *v33 = v8;
  v33[1] = sub_100028E80;
  return Task.value.getter(v31, a4, v29, v34, &protocol self-conformance witness table for Error);
}

uint64_t sub_100028E80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 336);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 320);
  *(_QWORD *)(*(_QWORD *)v1 + 344) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_1000293CC;
  else
    v6 = sub_100028F08;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_100028F08()
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
  uint64_t updated;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>), char *, uint64_t (*)(uint64_t), char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v63 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 288);
  v55 = *(_QWORD *)(v0 + 304);
  v56 = *(_QWORD *)(v0 + 296);
  v61 = *(_QWORD *)(v0 + 280);
  v51 = *(_QWORD *)(v0 + 272);
  v62 = *(_QWORD *)(v0 + 264);
  v52 = *(_QWORD *)(v0 + 256);
  v44 = *(_QWORD *)(v0 + 248);
  v54 = *(_QWORD *)(v0 + 240);
  v50 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 216);
  v53 = *(_QWORD *)(v0 + 224);
  v66 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 192);
  v38 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v65 = *(_QWORD *)(v0 + 176);
  v58 = *(_QWORD *)(v0 + 168);
  v60 = *(_QWORD *)(v0 + 160);
  v42 = *(_QWORD *)(v0 + 152);
  v57 = *(_QWORD *)(v0 + 144);
  v59 = *(_QWORD *)(v0 + 136);
  v46 = *(_QWORD *)(v0 + 120);
  v47 = *(_QWORD *)(v0 + 128);
  v48 = *(_QWORD *)(v0 + 112);
  v36 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  v40 = *(_QWORD *)(v0 + 88);
  v41 = *(_QWORD *)(v0 + 96);
  v30 = v5;
  v7 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 72);
  swift_release(*(_QWORD *)(v0 + 328));
  v8 = type metadata accessor for AgentUpdate.Context(0);
  v64 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v9, v7, v8);
  updated = type metadata accessor for UpdateSetupPayload(0);
  v49 = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 56))(v1, 1, 1, updated);
  AgentUpdate.Context.setupPayload.setter(v1);
  v43 = v6 + qword_100060348;
  v11 = v6;
  v35 = v6;
  v12 = v3;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v45 = v2;
  v14 = v4;
  v32 = v4;
  v13(v2, v5, v4);
  v15 = *(unsigned __int8 *)(v12 + 80);
  v16 = v12;
  v17 = (v15 + 56) & ~v15;
  v31 = v15 | 7;
  v33 = v38 + 7;
  v18 = (v17 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (char *)swift_allocObject(&unk_100053650, v18 + 8, v15 | 7);
  v34 = *(_QWORD *)(v36 + 80);
  *((_QWORD *)v19 + 2) = v34;
  *((_QWORD *)v19 + 3) = v65;
  v37 = *(_QWORD *)(v36 + 96);
  *((_QWORD *)v19 + 4) = v37;
  *((_QWORD *)v19 + 5) = v58;
  *((_QWORD *)v19 + 6) = v11;
  v39 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
  v39(&v19[v17], v2, v14);
  *(_QWORD *)&v19[v18] = v64;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v60, v40, v59);
  v13(v66, v30, v14);
  sub_10000D66C(v41, v0 + 16);
  v20 = *(unsigned __int8 *)(v57 + 80);
  v21 = (v20 + 48) & ~v20;
  v22 = (v42 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v15 + v22 + 8) & ~v15;
  v24 = (v23 + v33) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject(&unk_100053678, v25 + 40, v31 | v20);
  *((_QWORD *)v26 + 2) = v34;
  *((_QWORD *)v26 + 3) = v65;
  *((_QWORD *)v26 + 4) = v37;
  *((_QWORD *)v26 + 5) = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(&v26[v21], v60, v59);
  *(_QWORD *)&v26[v22] = v35;
  v39(&v26[v23], v66, v32);
  *(_QWORD *)&v26[v24] = v64;
  sub_10000C5DC((__int128 *)(v0 + 16), (uint64_t)&v26[v25]);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>), char *, uint64_t (*)(uint64_t), char *, uint64_t, uint64_t))(v58 + 56);
  swift_retain_n(v35, 2);
  swift_retain_n(v64, 2);
  v27(v61, v44, v43, v63, sub_10002C9D4, v19, sub_10002CB64, v26, v65, v58);
  swift_release(v26);
  swift_release(v19);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v46 + 104))(v47, enum case for ChromeType.unspecified(_:), v48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v51, v61, v52);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v54, v44, v53);
  v28 = type metadata accessor for RenderPayload(0);
  swift_retain(v35);
  CanvasUpdateResult.init<>(staticChromeType:makeStaticOutput:controlConfiguration:controlStates:)(v47, sub_10002CC24, v35, v51, v54, v28, v53);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v44, v53);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v52);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v63, v56);
  swift_release(v64);
  swift_task_dealloc(v63);
  swift_task_dealloc(v49);
  swift_task_dealloc(v61);
  swift_task_dealloc(v51);
  swift_task_dealloc(v44);
  swift_task_dealloc(v54);
  swift_task_dealloc(v45);
  swift_task_dealloc(v66);
  swift_task_dealloc(v60);
  swift_task_dealloc(v47);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000293CC()
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
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 248);
  v8 = *(_QWORD *)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 216);
  v9 = *(_QWORD *)(v0 + 160);
  v11 = *(_QWORD *)(v0 + 128);
  swift_release(*(_QWORD *)(v0 + 328));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100029490@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35[24];

  v29 = a1;
  v30 = a3;
  v28 = a2;
  v34 = a5;
  v6 = *a2;
  v7 = type metadata accessor for AgentUpdate.Context(0);
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  __chkstk_darwin(v7);
  v31 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v6 + 104);
  v10 = *(_QWORD *)(v6 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v9, v10, &unk_100049174, &unk_10004919C);
  v27 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v12 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v14 = (char *)&v26 - v13;
  v15 = type metadata accessor for PropertyList(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for EntryPointCategory(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = swift_projectBox(a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, (uint64_t)v28 + qword_100060368, v18);
  v23 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v14, v29, AssociatedTypeWitness);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v14, 0, 1, AssociatedTypeWitness);
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v9 + 48))(v30, v14, v10, v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v27);
  swift_beginAccess(v22, v35, 0, 0);
  v24 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v31, v22, v33);
  return AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)(v21, v17, 0, 0, v24);
}

uint64_t sub_1000296C4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t updated;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(char *, _QWORD, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  __int128 v49[2];
  _QWORD v50[3];
  uint64_t v51;
  uint64_t WitnessTable;
  char v53[32];

  v42 = a6;
  v47 = a3;
  v48 = a4;
  v44 = a2;
  v37 = a1;
  v7 = (_QWORD *)*a3;
  v41 = type metadata accessor for AgentUpdate.Context(0);
  v36 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v38 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v7[13];
  v39 = v7[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v40, v39, &unk_100049174, &unk_10004919C);
  v10 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v45 = *(_QWORD *)(v10 - 8);
  v46 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v36 - v11;
  updated = type metadata accessor for SceneUpdateTiming(0);
  v14 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for SceneUpdateContext(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = swift_projectBox(a5);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v23 = v44;
  v43 = v18;
  v44 = v17;
  v22(v20, v23, v17);
  v24 = *(void (**)(char *, _QWORD, uint64_t))(v14 + 104);
  v25 = v36;
  v24(v16, enum case for SceneUpdateTiming.fenced(_:), updated);
  SceneUpdateContext.timing.setter(v16);
  v26 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v12, v37, AssociatedTypeWitness);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v12, 0, 1, AssociatedTypeWitness);
  swift_beginAccess(v21, v53, 0, 0);
  v27 = (uint64_t)v38;
  v28 = v21;
  v29 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v38, v28, v41);
  sub_10000D66C(v42, (uint64_t)v49);
  v31 = v7[12];
  v32 = v39;
  v50[0] = v7[10];
  v30 = v50[0];
  v50[1] = v39;
  v33 = v40;
  v50[2] = v31;
  v51 = v40;
  v51 = type metadata accessor for RemoteContentProvider.ControlInteractionUpdateDelegate(0, (uint64_t)v50);
  WitnessTable = swift_getWitnessTable(&unk_100041328, v51);
  v50[0] = swift_allocObject(&unk_1000536A0, 56, 7);
  sub_1000299F8(v49, v30, v32, v31, v33, v50[0] + 16);
  v34 = sub_100028540(v48, (uint64_t)v12, v27, (uint64_t)v20, (uint64_t)v50);
  swift_release(v34);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v46);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v20, v44);
  return sub_10000D6B0(v50);
}

uint64_t sub_1000299F8@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t updated;
  uint64_t v14;
  __int128 v16[2];
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20[2];
  uint64_t v21;

  sub_10000D66C((uint64_t)a1, (uint64_t)v16);
  v12 = sub_100006658(&qword_1000604E8);
  *(_QWORD *)&v17 = a2;
  *((_QWORD *)&v17 + 1) = a3;
  *(_QWORD *)&v18 = a4;
  *((_QWORD *)&v18 + 1) = a5;
  updated = type metadata accessor for RemoteContentProvider.ControlInteractionUpdateDelegate(0, (uint64_t)&v17);
  if ((swift_dynamicCast(v20, v16, v12, updated, 6) & 1) != 0)
  {
    sub_10000D66C((uint64_t)v20, (uint64_t)&v17);
    (*(void (**)(__int128 *, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v20, updated);
  }
  else
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    v14 = type metadata accessor for Optional(0, updated);
    (*(void (**)(__int128 *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v20, v14);
    v17 = 0u;
    v18 = 0u;
    v19 = 0;
  }
  sub_10000C5DC(a1, (uint64_t)v16);
  if (*((_QWORD *)&v18 + 1))
  {
    sub_10000D6B0(v16);
    sub_10000C5DC(&v17, (uint64_t)v20);
  }
  else
  {
    sub_10000C5DC(v16, (uint64_t)v20);
    sub_10000D718((uint64_t)&v17, &qword_100060498);
  }
  return sub_10000C5DC(v20, a6);
}

uint64_t sub_100029B44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char v6;
  uint64_t v7;

  v1 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006658(&qword_1000604C0);
  v4 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  swift_retain(v0);
  v6 = 2;
  return Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 294, 16, "makeRenderPayload()", 19, v6, v3, &unk_1000604D0, v0);
}

uint64_t sub_100029C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unsigned __int8 v18;
  _QWORD v20[4];

  v8 = type metadata accessor for TaskPriority(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) == 1)
  {
    sub_10000D718(a1, &qword_10005FB38);
    v10 = 7168;
    v11 = *(_QWORD *)(a3 + 16);
    if (!v11)
    {
LABEL_6:
      v17 = 0;
      return swift_task_create(v10, v17, a4, a2, a3);
    }
  }
  else
  {
    v18 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    v10 = v18 | 0x1C00;
    v11 = *(_QWORD *)(a3 + 16);
    if (!v11)
      goto LABEL_6;
  }
  v12 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v11);
  swift_unknownObjectRetain(v11);
  v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
  v16 = v15;
  swift_unknownObjectRelease(v11);
  if (!(v16 | v14))
    goto LABEL_6;
  v20[0] = 0;
  v20[1] = 0;
  v17 = v20;
  v20[2] = v14;
  v20[3] = v16;
  return swift_task_create(v10, v17, a4, a2, a3);
}

uint64_t sub_100029D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t updated;
  uint64_t v15;

  v11 = (_QWORD *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  *(_QWORD *)(v6 + 16) = v11;
  v12 = type metadata accessor for RenderPayload(255);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a6, a4, &unk_100049174, &unk_10004919C);
  updated = type metadata accessor for CanvasUpdateResult(0, (char *)&type metadata for () + 8, v12, AssociatedTypeWitness);
  v15 = sub_100006658(&qword_10005EFF0);
  *v11 = v6;
  v11[1] = sub_10001AF18;
  return Task.value.getter(a1, a2, updated, v15, &protocol self-conformance witness table for Error);
}

uint64_t sub_100029E44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v1 = type metadata accessor for PreviewPreferences(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = SceneUpdateHandshake.fenceHandle.getter(v3);
  if (result)
  {
    v7 = (void *)result;
    v8 = v0[3];
    v9 = v0[4];
    v10 = sub_10000D648(v0, v8);
    SceneUpdateHandshake.preferences.getter(v10);
    dispatch thunk of CanvasUpdateDelegate.adjust(preferences:fenceHandle:)(v5, v7, v8, v9);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return result;
}

uint64_t sub_100029F0C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[3];
  v6 = v2[4];
  sub_10000D648(v2, v5);
  return dispatch thunk of CanvasUpdateDelegate.adjust(preferences:fenceHandle:)(a1, a2, v5, v6);
}

uint64_t sub_100029F64(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2[3];
  v5 = v2[4];
  sub_10000D648(v2, v4);
  return a2(v4, v5);
}

uint64_t sub_100029FA8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[3];
  v4 = v1[4];
  sub_10000D648(v1, v3);
  return dispatch thunk of CanvasUpdateDelegate.notePreviewSuppressed(presentation:)(a1, v3, v4);
}

uint64_t sub_100029FF0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000D648(v1, v2);
  return dispatch thunk of ProviderUpdateDelegate.notePreviewStopped()(v2, *(_QWORD *)(v3 + 8));
}

uint64_t sub_10002A028(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[3];
  v4 = v1[4];
  sub_10000D648(v1, v3);
  return dispatch thunk of ProviderUpdateDelegate.notePreviewCrashed(pid:)(a1, v3, *(_QWORD *)(v4 + 8));
}

uint64_t sub_10002A078(uint64_t a1)
{
  return sub_100029F64(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasUpdateDelegate.notePreviewRequestedKeyStatus());
}

uint64_t sub_10002A094(uint64_t a1)
{
  return sub_100029F64(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CanvasUpdateDelegate.notePreviewRequestedZoom());
}

uint64_t sub_10002A0BC()
{
  _QWORD *v0;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t WitnessTable;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  _OWORD v10[2];

  if (*((unsigned __int8 *)v0 + qword_100060378) - 2 >= 2)
  {
    if (*((_BYTE *)v0 + qword_100060378))
    {
      v2 = *v0;
      sub_100006658(&qword_10005F000);
      v3 = *(_OWORD *)(v2 + 96);
      v10[0] = *(_OWORD *)(v2 + 80);
      v10[1] = v3;
      v4 = type metadata accessor for RemoteContentProvider.CannotResizeWhileRelaunching(0, (uint64_t)v10);
      WitnessTable = swift_getWitnessTable(&unk_1000412E8, v4);
      v6 = swift_allocError(v4, WitnessTable, 0, 0);
      v9 = 2;
      v7 = static Future.failed(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 267, 27, "confirmReadyForDisplayAfterAsyncResize()", 40, v9, v6);
      swift_errorRelease(v6);
      return v7;
    }
    else
    {
      return PreviewSceneAgentProxy.sendCommitPostSynchronize()();
    }
  }
  else
  {
    sub_100006658(&qword_10005F000);
    v8 = 2;
    return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/RemoteContentProvider.swift", 117, 2, 270, 30, "confirmReadyForDisplayAfterAsyncResize()", 40, v8);
  }
}

uint64_t sub_10002A1F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = sub_100006658(&qword_10005FB38);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + qword_100060350);
  v6 = (void *)PreviewSceneAgentProxy.scene.getter(v2);
  v7 = objc_msgSend(v6, "scene");

  sub_10003001C(1, v7);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = swift_retain(v5);
  v10 = static MainActor.shared.getter(v9);
  v11 = (_QWORD *)swift_allocObject(&unk_1000536C8, 40, 7);
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v5;
  v12 = sub_1000273B0((uint64_t)v4, (uint64_t)&unk_1000604F8, (uint64_t)v11);
  return swift_release(v12);
}

void sub_10002A314(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = (void *)PreviewSceneAgentProxy.scene.getter(a1);
  v2 = objc_msgSend(v1, "scene");

  sub_10003001C(0, v2);
}

uint64_t sub_10002A374(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_1000604DC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10001D634;
  return sub_10002A3C8(a1);
}

uint64_t sub_10002A3C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[2] = a1;
  v2[3] = v1;
  v3 = type metadata accessor for GeometryPayload(0);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PreviewSnapshot(0);
  v2[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[8] = v6;
  v2[9] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v2[10] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v2[11] = v8;
  v2[12] = v9;
  return swift_task_switch(sub_10002A484, v8, v9);
}

uint64_t sub_10002A484()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = (uint64_t *)(v0[3] + qword_100060358);
  v2 = *v1;
  v0[13] = *v1;
  v0[14] = v1[1];
  v0[15] = swift_getObjectType(v2);
  v0[16] = dispatch thunk of PreviewShellScene.takeSnapshot()();
  v3 = v0[4];
  v4 = v0[3] + qword_100060368;
  v5 = sub_100006618(&qword_1000604E0, (uint64_t (*)(uint64_t))&type metadata accessor for GeometryPayload, (uint64_t)&protocol conformance descriptor for GeometryPayload);
  v6 = PreviewSceneAgentProxy.generateStaticOutput<A>(for:expecting:)(v4, v3, v3, v5);
  v0[17] = v6;
  v7 = (_QWORD *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  v0[18] = v7;
  v8 = sub_100006658(&qword_10005EFF0);
  *v7 = v0;
  v7[1] = sub_10002A5C8;
  return Task.value.getter(v0[6], v6, v0[4], v8, &protocol self-conformance witness table for Error);
}

uint64_t sub_10002A5C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 144);
  *(_QWORD *)(*v1 + 152) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10002A778;
  else
    v4 = sub_10002A628;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96));
}

uint64_t sub_10002A628()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 128);
  v19 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v17 = *(_QWORD *)(v0 + 64);
  v18 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 40);
  v8 = swift_release(*(_QWORD *)(v0 + 80));
  GeometryPayload.selectableRegions.getter(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v9 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter(v2, v3);
  v10 = objc_msgSend(v9, "screen");

  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = v1;
  v14 = PreviewSnapshot.init(image:selectableRegions:cornerRadius:scaleFactor:)(0.0, v12);
  PreviewSnapshot.makeRenderPayload()(v14);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v4, v18);

  swift_release(v19);
  v15 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  swift_task_dealloc(v15);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002A778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 80);

  swift_release(v1);
  swift_release(v2);
  v3 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_10002A7D4()
{
  return 0xD000000000000023;
}

uint64_t sub_10002A7F0()
{
  return 0;
}

uint64_t sub_10002A7F8(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100041250, a1);
  return HumanReadableError.errorDescription.getter(a1, WitnessTable);
}

uint64_t sub_10002A82C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100041250, a1);
  return HumanReadableError.description.getter(a1, WitnessTable);
}

uint64_t sub_10002A860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release(*(_QWORD *)(v0 + 16));
  v1 = v0 + qword_100060348;
  v2 = type metadata accessor for PreviewAgentConnector(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release(*(_QWORD *)(v0 + qword_100060350));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + qword_100060358));

  v3 = v0 + qword_100060368;
  v4 = type metadata accessor for EntryPointCategory(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10000D718(v0 + qword_100060370, &qword_100060498);
  return v0;
}

uint64_t sub_10002A91C()
{
  uint64_t v0;

  sub_10002A860();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t type metadata accessor for RemoteContentProvider(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider);
}

uint64_t sub_10002A94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_10002A954(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_10002A9E4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10002AA30 + 4 * byte_100040E55[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10002AA64 + 4 * asc_100040E50[v4]))();
}

uint64_t sub_10002AA64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002AA6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002AA74);
  return result;
}

uint64_t sub_10002AA80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002AA88);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10002AA8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002AA94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t type metadata accessor for RemoteContentProvider.ProcessState(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider.ProcessState);
}

uint64_t sub_10002AAAC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100040FD8, a1);
}

uint64_t sub_10002AABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return static CanvasContentProvider<>.encode(hostedOutput:)(v3, a3);
}

uint64_t sub_10002AAC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100028540(a1, a2, a3, a4, a5);
}

uint64_t sub_10002AAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;

  *(_QWORD *)(v5 + 16) = a1;
  v10 = (_QWORD *)swift_task_alloc(dword_10006048C);
  *(_QWORD *)(v5 + 24) = v10;
  *v10 = v5;
  v10[1] = sub_10002AB60;
  return sub_1000275F4(a2, a3, a4, a5);
}

uint64_t sub_10002AB60(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_10002ABC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  v6 = *(_QWORD *)(a2 + 104);
  v7 = *(_QWORD *)(a2 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v6, v7, &unk_100049174, &unk_10004918C);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v6, v7, AssociatedTypeWitness, &unk_100049174, &unk_100049184);
  return static ContentProvider<>.decode(updatePayload:)(a1, v3, a3, AssociatedConformanceWitness);
}

uint64_t sub_10002AC68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = sub_100006618(&qword_1000604F0, (uint64_t (*)(uint64_t))&type metadata accessor for RenderPayload, (uint64_t)&protocol conformance descriptor for RenderPayload);
  return static ContentProvider<>.encode(staticOutput:)(a1, v3, a3, v6);
}

id sub_10002ACC4()
{
  return (id)sub_10002CE60();
}

uint64_t sub_10002ACE8()
{
  return sub_100028384();
}

uint64_t sub_10002AD08()
{
  return sub_100028490();
}

uint64_t sub_10002AD28()
{
  return sub_10002A0BC();
}

uint64_t sub_10002AD48()
{
  return sub_10002A1F8();
}

void sub_10002AD68(uint64_t a1)
{
  sub_10002A314(a1);
}

uint64_t sub_10002AD88(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100041000, a1);
}

uint64_t sub_10002AD98(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100041028, a1);
}

uint64_t sub_10002ADA8(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100041078, a1);
}

uint64_t sub_10002ADB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = a1;
  v23 = a2;
  v24 = a3;
  v3 = sub_100006658(&qword_100060738);
  __chkstk_darwin(v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006658(&qword_1000606B8);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PreviewPayload(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for RefinedPreviewPayload(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v22, v10);
  sub_10002D598(v23, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v18 = type metadata accessor for GridIndex(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
  }
  else
  {
    sub_10002D3D4((uint64_t)v5, (uint64_t)v9);
  }
  RefinedPreviewPayload.init(previewPayload:requestedGroupIndex:)(v13, v9);
  v19 = sub_100006618(&qword_100060740, (uint64_t (*)(uint64_t))&type metadata accessor for RefinedPreviewPayload, (uint64_t)&protocol conformance descriptor for RefinedPreviewPayload);
  PropertyListRepresentable.propertyList.getter(v14, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_10002AFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[16];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v38 = a7;
  v39 = a8;
  v37 = a6;
  v40 = a1;
  v41 = a2;
  v11 = type metadata accessor for PreviewStructure(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006658(&qword_1000606B8);
  __chkstk_darwin(v15);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100006658(&qword_1000606C0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = a4;
  v44 = a3;
  v45 = a5;
  v46 = v37;
  v47 = v38;
  v48 = v39;
  v22 = v15;
  v24 = v23;
  CanvasControlConfiguration.init(build:)(sub_10002D3C4, v42, v22);
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v40, v21, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a4, v11);
  v25 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v25 == enum case for PreviewStructure.previewGroup(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
    v26 = &v14[*(int *)(sub_100006658(&qword_1000606C8) + 48)];
    v27 = type metadata accessor for GridIndex(0);
    v28 = *(_QWORD *)(v27 - 8);
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v17, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v17, 0, 1, v27);
    v29 = type metadata accessor for PreviewGroupMetadata(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v14, v29);
  }
  else
  {
    v30 = v25;
    v31 = enum case for PreviewStructure.singlePreview(_:);
    v32 = enum case for PreviewStructure.emptyPreviewGroup(_:);
    v33 = type metadata accessor for GridIndex(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v17, 1, 1, v33);
    if (v30 != v31 && v30 != v32)
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  sub_10002D3D4((uint64_t)v17, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v24);
}

uint64_t sub_10002B220@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v69 = a4;
  v70 = a5;
  v62 = a2;
  v63 = a3;
  v64 = a1;
  v75 = a6;
  v6 = sub_100006658(&qword_1000606D0);
  __chkstk_darwin(v6);
  v61 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006658(&qword_1000606D8);
  __chkstk_darwin(v8);
  v65 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CanvasGridControl(0);
  v67 = *(_QWORD *)(v10 - 8);
  v68 = v10;
  __chkstk_darwin(v10);
  v66 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006658(&qword_1000606E0);
  v73 = *(_QWORD *)(v12 - 8);
  v74 = v12;
  __chkstk_darwin(v12);
  v71 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100006658(&qword_1000606E8);
  __chkstk_darwin(v14);
  v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100006658(&qword_1000606F0);
  __chkstk_darwin(v17);
  v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = __chkstk_darwin(v20);
  v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v26 = (char *)&v58 - v25;
  v27 = sub_100006658(&qword_1000606F8);
  v72 = *(_QWORD *)(v27 - 8);
  v28 = __chkstk_darwin(v27);
  v30 = (char *)&v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v32 = (char *)&v58 - v31;
  sub_10002B7AC((uint64_t)v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_10000D718((uint64_t)v19, &qword_1000606F0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))(v16, 1, 1, v74);
    v33 = type metadata accessor for GridIndex(0);
    v34 = sub_100006618(&qword_100060700, (uint64_t (*)(uint64_t))&type metadata accessor for GridIndex, (uint64_t)&protocol conformance descriptor for GridIndex);
    static CanvasControlConfigurationBuilder.buildOptional<A>(_:)(v16, v33, v34);
    sub_10000D718((uint64_t)v16, &qword_1000606E8);
  }
  else
  {
    v35 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    v60 = v26;
    v35(v26, v19, v20);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
    v36 = type metadata accessor for ThumbnailGeometry(0);
    v37 = (uint64_t)v61;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v61, 1, 1, v36);
    v38 = swift_allocObject(&unk_1000537D8, 32, 7);
    v39 = v63;
    *(_QWORD *)(v38 + 16) = v62;
    *(_QWORD *)(v38 + 24) = v39;
    v40 = type metadata accessor for GridIndex(0);
    v59 = v24;
    v41 = v32;
    v42 = v30;
    v43 = v40;
    v62 = v40;
    swift_retain(v39);
    v44 = v65;
    v45 = v43;
    v30 = v42;
    v32 = v41;
    static ThumbnailHostFactory.remoteHostFactory(expectedGeometry:previewAgentConnector:makeUpdate:validateReply:)(v37, v64, sub_10002D41C, v38, sub_10002BAC4, 0, v45);
    swift_release(v38);
    sub_10000D718(v37, &qword_1000606D0);
    v46 = swift_allocObject(&unk_100053800, 32, 7);
    *(_QWORD *)(v46 + 16) = v69;
    v47 = v70;
    *(_QWORD *)(v46 + 24) = v70;
    swift_retain(v47);
    v48 = v66;
    CanvasGridControl.init(configuration:thumbnailHostFactory:action:)(v59, v44, sub_10002D434, v46);
    v49 = sub_100006618(&qword_100060700, (uint64_t (*)(uint64_t))&type metadata accessor for GridIndex, (uint64_t)&protocol conformance descriptor for GridIndex);
    v50 = v71;
    v51 = v68;
    static CanvasControlConfigurationBuilder.buildExpression<A>(_:)(v48, v68, &protocol witness table for CanvasGridControl, v49);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v51);
    v52 = sub_10001AC64(&qword_100060710, &qword_1000606E0, (uint64_t)&protocol conformance descriptor for CanvasControlConfigurationBuilder.One<A>);
    v53 = v74;
    static CanvasControlConfigurationBuilder.buildBlock<A>(_:)(v50, v74, v52);
    v54 = v73;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v73 + 56))(v16, 0, 1, v53);
    static CanvasControlConfigurationBuilder.buildOptional<A>(_:)(v16, v62, v49);
    sub_10000D718((uint64_t)v16, &qword_1000606E8);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v50, v53);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v60, v20);
  }
  v55 = sub_10001AC64(&qword_100060708, &qword_1000606F8, (uint64_t)&protocol conformance descriptor for CanvasControlConfigurationBuilder.One<A>.Optional);
  static CanvasControlConfigurationBuilder.buildBlock<A>(_:)(v32, v27, v55);
  static CanvasControlConfigurationBuilder.buildFinalResult<A>(_:)(v30, v27, v55);
  v56 = *(void (**)(char *, uint64_t))(v72 + 8);
  v56(v30, v27);
  return ((uint64_t (*)(char *, uint64_t))v56)(v32, v27);
}

uint64_t sub_10002B7AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = v1;
  v4 = type metadata accessor for PreviewStructure(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for PreviewStructure.previewGroup(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v4);
    v9 = &v7[*(int *)(sub_100006658(&qword_1000606C8) + 48)];
    v10 = type metadata accessor for PreviewGroupMetadata(0);
    v11 = *(_QWORD *)(v10 - 8);
    __chkstk_darwin(v10);
    v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v7, v10);
    sub_10002BE0C(a1);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v14 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
    v15 = type metadata accessor for GridIndex(0);
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v9, v15);
  }
  else if (v8 == enum case for PreviewStructure.singlePreview(_:))
  {
    v17 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 1, 1, v17);
  }
  else if (v8 == enum case for PreviewStructure.emptyPreviewGroup(_:))
  {
    CanvasControlDescription.ControlType.GridConfiguration.init(sections:)(&_swiftEmptyArrayStorage);
    v18 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration(0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a1, 0, 1, v18);
  }
  else
  {
    v19 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a1, 1, 1, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10002B9E0(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_100006658(&qword_1000606B8);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for GridIndex(0);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  a2(v6);
  return sub_10000D718((uint64_t)v6, &qword_1000606B8);
}

double sub_10002BAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v31 = a2;
  v4 = type metadata accessor for GridIndex(0);
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PropertyList(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviewStructure(0);
  v34 = *(_QWORD *)(v11 - 8);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v30 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v17 = sub_100006618(&qword_100060628, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewStructure, (uint64_t)&protocol conformance descriptor for PreviewStructure);
  PropertyListRepresentable.init(propertyList:)(v10, v11, v17);
  if (!v2)
  {
    v19 = v32;
    v18 = v33;
    v20 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v14, v16, v11);
    if ((*(unsigned int (**)(char *, uint64_t))(v20 + 88))(v14, v11) == enum case for PreviewStructure.previewGroup(_:))
    {
      (*(void (**)(char *, uint64_t))(v20 + 96))(v14, v11);
      v21 = sub_100006658(&qword_1000606C8);
      v22 = v19;
      v23 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
      v24 = v18;
      v23(v6, &v14[*(int *)(v21 + 48)], v18);
      v25 = type metadata accessor for PreviewGroupMetadata(0);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v14, v25);
      v26 = static GridIndex.== infix(_:_:)(v6, v31);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v24);
      if ((v26 & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v11);
    }
    v27 = sub_10002D43C();
    v28 = swift_allocError(&type metadata for PreviewUpdateBehavior.ThumbnailDisplayError, v27, 0, 0);
    swift_willThrow(v28);
LABEL_7:
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v11);
  }
  return 0.0;
}

uint64_t sub_10002BD38(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_100006658(&qword_1000606B8);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for GridIndex(0);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  a2(v6);
  return sub_10000D718((uint64_t)v6, &qword_1000606B8);
}

uint64_t sub_10002BE0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(char *);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;

  v51 = a1;
  v1 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Item(0);
  v52 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006658(&qword_100060720);
  __chkstk_darwin(v4);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section(0);
  v7 = *(_QWORD *)(v56 - 8);
  v8 = __chkstk_darwin(v56);
  v65 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v53 = (char *)&v49 - v10;
  v11 = sub_100006658(&qword_100060728);
  v12 = type metadata accessor for PreviewGroupMetadata.Section(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = (v14 + 32) & ~v14;
  v64 = *(_QWORD *)(v13 + 72);
  v16 = swift_allocObject(v11, v15 + v64, v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_100040860;
  v17 = PreviewGroupMetadata.firstSection.getter();
  v18 = PreviewGroupMetadata.moreSections.getter(v17);
  v69 = v16;
  sub_10002CCDC(v18);
  v63 = *(_QWORD *)(v69 + 16);
  if (v63)
  {
    v59 = v69 + v15;
    v19 = *(_QWORD *)(v13 + 64);
    v57 = *(uint64_t (**)(char *))(v13 + 16);
    v58 = v19;
    v50 = v69;
    v20 = swift_bridgeObjectRetain(v69);
    v21 = 0;
    v66 = &_swiftEmptyArrayStorage;
    v22 = v52;
    v23 = v56;
    v54 = v6;
    v55 = v1;
    v61 = v12;
    v62 = v7;
    v60 = v13;
    while (1)
    {
      v67 = &v49;
      v68 = v21;
      __chkstk_darwin(v20);
      v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
      v26 = v57(v25);
      v27 = PreviewGroupMetadata.Section.title.getter(v26);
      v29 = v28;
      v30 = CanvasControlDescription.ControlType.GridConfiguration.Item.init(title:)(0, 0);
      v31 = PreviewGroupMetadata.Section.previewCount.getter(v30);
      if (v31 < 0)
        break;
      v32 = v31;
      if (v31)
      {
        v33 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(v31, v1);
        *((_QWORD *)v33 + 2) = v32;
        v34 = v1;
        v35 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
        v36 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
        v36(&v33[v35], v3, v34);
        v37 = v32 - 1;
        if (v32 == 1)
        {
          v1 = v55;
        }
        else
        {
          v38 = *(_QWORD *)(v22 + 72);
          v39 = &v33[v38 + v35];
          v1 = v55;
          do
          {
            v36(v39, v3, v1);
            v39 += v38;
            --v37;
          }
          while (v37);
          v22 = v52;
        }
        v6 = v54;
        v23 = v56;
      }
      else
      {
        v33 = (char *)&_swiftEmptyArrayStorage;
      }
      (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v1);
      CanvasControlDescription.ControlType.GridConfiguration.Section.init(title:items:)(v27, v29, v33);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v61);
      v40 = v62;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v6, 1, v23) == 1)
      {
        v20 = sub_10000D718((uint64_t)v6, &qword_100060720);
      }
      else
      {
        v41 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
        v42 = v53;
        v41(v53, v6, v23);
        v41(v65, v42, v23);
        if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) != 0)
          v43 = (unint64_t)v66;
        else
          v43 = sub_10002C39C(0, v66[2] + 1, 1, (unint64_t)v66, &qword_100060730, (uint64_t (*)(_QWORD))&type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section);
        v45 = *(_QWORD *)(v43 + 16);
        v44 = *(_QWORD *)(v43 + 24);
        if (v45 >= v44 >> 1)
          v43 = sub_10002C39C(v44 > 1, v45 + 1, 1, v43, &qword_100060730, (uint64_t (*)(_QWORD))&type metadata accessor for CanvasControlDescription.ControlType.GridConfiguration.Section);
        *(_QWORD *)(v43 + 16) = v45 + 1;
        v46 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
        v66 = (_QWORD *)v43;
        v20 = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(v43 + v46 + *(_QWORD *)(v40 + 72) * v45, v65, v23);
      }
      v21 = v68 + 1;
      if (v68 + 1 == v63)
      {
        swift_bridgeObjectRelease_n(v50, 2);
        v47 = v66;
        return CanvasControlDescription.ControlType.GridConfiguration.init(sections:)(v47);
      }
    }
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease(v69);
    v47 = &_swiftEmptyArrayStorage;
    return CanvasControlDescription.ControlType.GridConfiguration.init(sections:)(v47);
  }
  return result;
}

uint64_t sub_10002C2A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for PropertyList(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_10002C2E4()
{
  return static CanvasControlConfiguration<A>.empty.getter();
}

uint64_t sub_10002C2EC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10002C350;
  return v6(a1);
}

uint64_t sub_10002C350()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10002C39C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100006658(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
    goto LABEL_29;
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(_QWORD *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }
    else if (v18 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002D480(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_10002C5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_100060498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C5F0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t updated;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t AssociatedTypeWitness;
  uint64_t v20;

  v1 = *((_QWORD *)v0 + 5);
  v2 = *((_QWORD *)v0 + 7);
  v20 = type metadata accessor for AgentUpdate.Context(0);
  v3 = *(_QWORD *)(v20 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 72) & ~v4;
  v6 = (*(_QWORD *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = v6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v2, v1, &unk_100049174, &unk_10004918C);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v6 + v8 + 8) & ~v8;
  v10 = *(_QWORD *)(v7 + 64);
  updated = type metadata accessor for SceneUpdateContext(0);
  v12 = *(_QWORD *)(updated - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = (v9 + v10 + v13) & ~v13;
  v18 = v4 | v13 | v8 | 7;
  v15 = (*(_QWORD *)(v12 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*((_QWORD *)v0 + 2));
  swift_release(*((_QWORD *)v0 + 8));
  (*(void (**)(char *, uint64_t))(v3 + 8))(&v0[v5], v20);
  swift_release(*(_QWORD *)&v0[v17]);
  (*(void (**)(char *, uint64_t))(v7 + 8))(&v0[v9], AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(&v0[v14], updated);
  sub_10000D6B0(&v0[v15]);
  return swift_deallocObject(v0, v15 + 40, v18);
}

uint64_t sub_10002C748(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = v1[5];
  v5 = v1[7];
  v6 = *(_QWORD *)(type metadata accessor for AgentUpdate.Context(0) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)(swift_getAssociatedTypeWitness(0, v5, v4, &unk_100049174, &unk_10004918C) - 8);
  v10 = (v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 64);
  v12 = *(_QWORD *)(type metadata accessor for SceneUpdateContext(0) - 8);
  v13 = (v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = v1[2];
  v15 = v1[3];
  v16 = v1[8];
  v17 = *(uint64_t **)((char *)v1 + v8);
  v18 = (uint64_t)v1 + v13;
  v19 = (_QWORD *)swift_task_alloc(dword_1000604A4);
  *(_QWORD *)(v2 + 16) = v19;
  *v19 = v2;
  v19[1] = sub_10001AF18;
  return sub_100028C18(a1, v14, v15, v16, (uint64_t)v1 + v7, v17, (uint64_t)v1 + v10, v18);
}

uint64_t sub_10002C888()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002C8AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_1000604B4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_10001D634;
  return sub_100029D68(a1, v8, v4, v5, v6, v7);
}

uint64_t sub_10002C92C()
{
  char *v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *((_QWORD *)v0 + 5), *((_QWORD *)v0 + 3), &unk_100049174, &unk_10004918C);
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*((_QWORD *)v0 + 6));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v4], AssociatedTypeWitness);
  swift_release(*(_QWORD *)&v0[v6]);
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10002C9D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(swift_getAssociatedTypeWitness(0, *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 24), &unk_100049174, &unk_10004918C)- 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_100029490(a1, *(_QWORD **)(v2 + 48), v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_10002CA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t updated;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 40);
  updated = type metadata accessor for SceneUpdateContext(0);
  v4 = *(_QWORD *)(updated - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 48) & ~v5;
  v7 = (*(_QWORD *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v2, v1, &unk_100049174, &unk_10004918C);
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (v7 + v10 + 8) & ~v10;
  v12 = v5 | v10 | 7;
  v13 = (*(_QWORD *)(v9 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF8;
  v16 = v12;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v6, updated);
  swift_release(*(_QWORD *)(v0 + v7));
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, AssociatedTypeWitness);
  swift_release(*(_QWORD *)(v0 + v13));
  sub_10000D6B0((_QWORD *)(v0 + v14));
  return swift_deallocObject(v0, v14 + 40, v16);
}

uint64_t sub_10002CB64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(type metadata accessor for SceneUpdateContext(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness(0, v4, v3, &unk_100049174, &unk_10004918C) - 8);
  v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = (*(_QWORD *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1000296C4(a1, v1 + v6, *(_QWORD **)(v1 + v7), v1 + v9, *(_QWORD *)(v1 + v10), v1 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t sub_10002CC24()
{
  return sub_100029B44();
}

uint64_t sub_10002CC38(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)swift_task_alloc(dword_1000604CC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10001D634;
  v4 = (_QWORD *)swift_task_alloc(dword_1000604DC);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10001D634;
  return sub_10002A3C8(a1);
}

uint64_t type metadata accessor for RemoteContentProvider.ControlInteractionUpdateDelegate(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider.ControlInteractionUpdateDelegate);
}

uint64_t sub_10002CCB8()
{
  uint64_t v0;

  sub_10000D6B0((_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002CCDC(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;
  char v26;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_10002C39C(isUniquelyReferenced_nonNull_native, v24, 1, v3, &qword_100060728, (uint64_t (*)(_QWORD))&type metadata accessor for PreviewGroupMetadata.Section);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for PreviewGroupMetadata.Section(0);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy(v15);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v26, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10002CE60()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_100060360);
}

uint64_t sub_10002CE70()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002CE9C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (uint64_t *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_1000609A4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001D634;
  return sub_10002F9EC(a1, v4, v5, v6);
}

uint64_t sub_10002CF08()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CF2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100060504);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001D634;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100060500 + dword_100060500))(a1, v4);
}

uint64_t type metadata accessor for RemoteContentProvider.CannotResizeWhileRelaunching(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for RemoteContentProvider.CannotResizeWhileRelaunching);
}

uint64_t sub_10002CFA8()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002CFDC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = (_QWORD *)v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10006051C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10001AF18;
  return sub_1000280DC(a1, v4, v5, v7, v6);
}

uint64_t sub_10002D054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_10002D060(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

_QWORD *sub_10002D098(_QWORD *a1, _QWORD *a2)
{
  sub_10002D0BC(a1, a2);
  return a1;
}

_QWORD *sub_10002D0BC(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

__n128 sub_10002D224(uint64_t a1, uint64_t a2)
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

uint64_t sub_10002D238(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  sub_10000D6B0((_QWORD *)a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t sub_10002D270(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_10002D2B8(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_10002D300(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000412E8, a1);
}

uint64_t sub_10002D310(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100041208, a1);
}

uint64_t sub_10002D320(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000411E0, a1);
}

uint64_t sub_10002D330(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000411B0, a1);
}

ValueMetadata *type metadata accessor for PassThroughUpdateBehavior()
{
  return &type metadata for PassThroughUpdateBehavior;
}

ValueMetadata *type metadata accessor for PreviewUpdateBehavior()
{
  return &type metadata for PreviewUpdateBehavior;
}

uint64_t sub_10002D360()
{
  return sub_100006618(&qword_100060628, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewStructure, (uint64_t)&protocol conformance descriptor for PreviewStructure);
}

uint64_t sub_10002D38C()
{
  return sub_100006618(&qword_100060630, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewPayload, (uint64_t)&protocol conformance descriptor for PreviewPayload);
}

void *sub_10002D3B8()
{
  return &protocol witness table for PropertyList;
}

uint64_t sub_10002D3C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_10002B220(v1[3], v1[4], v1[5], v1[6], v1[7], a1);
}

uint64_t sub_10002D3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_1000606B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002D41C(uint64_t a1)
{
  uint64_t v1;

  return sub_10002B9E0(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_10002D434(uint64_t a1)
{
  uint64_t v1;

  return sub_10002BD38(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t sub_10002D43C()
{
  unint64_t result;

  result = qword_100060718;
  if (!qword_100060718)
  {
    result = swift_getWitnessTable(&unk_100041408, &type metadata for PreviewUpdateBehavior.ThumbnailDisplayError);
    atomic_store(result, (unint64_t *)&qword_100060718);
  }
  return result;
}

uint64_t sub_10002D480(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002D598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_100060738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for PreviewUpdateBehavior.ThumbnailDisplayError()
{
  return &type metadata for PreviewUpdateBehavior.ThumbnailDisplayError;
}

void sub_10002D5F8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;

  v2 = v1;
  v3 = a1[3];
  v4 = a1[4];
  sub_10000D648(a1, v3);
  v5 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
  sub_10002D990(v5);

  v6 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
  v7 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating;
  v8 = *(void **)(v2 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating);

  if (v8)
    v9 = v6 == v8;
  else
    v9 = 0;
  if (!v9)
  {
    v10 = *(void **)(v2 + v7);
    v17 = v10;
    v11 = dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
    v12 = *(void **)(v2 + v7);
    *(_QWORD *)(v2 + v7) = v11;

    if (v10)
    {
      v13 = *(id *)(v2 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active);
      v14 = v17;
      if (v13)
        v15 = v17 == v13;
      else
        v15 = 0;
      if (!v15)
      {
        v16 = v17;
        sub_10002DB74(v16);

        v14 = v17;
      }

    }
  }
}

void sub_10002D714(_QWORD *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;

  v2 = v1;
  v3 = a1[3];
  v4 = a1[4];
  sub_10000D648(a1, v3);
  v5 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
  sub_10002D990(v5);

  v6 = objc_msgSend(v1, "view");
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6;
  v8 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
  v9 = objc_msgSend(v8, "view");

  if (!v9)
  {
LABEL_15:
    __break(1u);
    return;
  }
  objc_msgSend(v7, "bringSubviewToFront:", v9);

  v10 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay;
  v11 = *(void **)&v2[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay];
  if (v11)
  {
    v12 = v11;
    PreviewDebugOverlay.bringToFront()();

    v13 = *(void **)&v2[v10];
    if (v13)
    {
      v14 = v13;
      PreviewDebugOverlay.contentsUpdated()();

    }
  }
  v15 = (void *)dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
  v16 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active;
  v17 = *(void **)&v2[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active];

  if (!v17 || v15 != v17)
  {
    v18 = *(void **)&v2[v16];
    v24 = v18;
    v19 = dispatch thunk of CanvasContentHost.viewController.getter(v3, v4);
    v20 = *(void **)&v2[v16];
    *(_QWORD *)&v2[v16] = v19;

    if (v18)
    {
      v21 = *(id *)&v2[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating];
      v22 = v24;
      if (!v21 || v24 != v21)
      {
        v23 = v24;
        sub_10002DB74(v23);

        v22 = v24;
      }

    }
  }
}

void sub_10002D990(void *a1)
{
  id v1;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v3 = objc_msgSend(a1, "parentViewController");
  if (!v3 || (v4 = v3, v3, v4 != v1))
  {
    objc_msgSend(v1, "addChildViewController:", a1);
    v5 = objc_msgSend(v1, "view");
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(a1, "view");
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v6, "addSubview:", v7);

        v9 = objc_msgSend(v1, "view");
        if (v9)
        {
          v10 = v9;
          v11 = objc_msgSend(a1, "view");
          if (v11)
          {
            v12 = v11;
            objc_msgSend(v10, "sendSubviewToBack:", v11);

            v13 = objc_msgSend(a1, "view");
            if (v13)
            {
              v14 = v13;
              v15 = objc_msgSend(v1, "view");
              if (v15)
              {
                v16 = v15;
                objc_msgSend(v15, "bounds");
                v18 = v17;
                v20 = v19;
                v22 = v21;
                v24 = v23;

                objc_msgSend(v14, "setFrame:", v18, v20, v22, v24);
                objc_msgSend(a1, "didMoveToParentViewController:", v1);
                return;
              }
              goto LABEL_16;
            }
LABEL_15:
            __break(1u);
LABEL_16:
            __break(1u);
            return;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
}

void sub_10002DB74(void *a1)
{
  id v1;
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_msgSend(a1, "parentViewController");
  if (v3)
  {
    v4 = v3;

    if (v4 == v1)
    {
      objc_msgSend(a1, "willMoveToParentViewController:", 0);
      v5 = objc_msgSend(a1, "view");
      if (v5)
      {
        v6 = v5;
        objc_msgSend(v5, "removeFromSuperview");

        objc_msgSend(a1, "removeFromParentViewController");
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_10002DC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  int v11;
  _BYTE v14[24];

  v1 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v3);
  v7 = &v14[-v6 - 8];
  v8 = v0 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation;
  swift_beginAccess(v0 + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation, v14, 0, 0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1))
  {
    v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    v10(v7, v8, v1);
    v10(v5, (uint64_t)v7, v1);
    v11 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v1);
    if (v11 != enum case for PreviewPreferences.InterfaceOrientation.portrait(_:))
    {
      if (v11 == enum case for PreviewPreferences.InterfaceOrientation.portraitUpsideDown(_:))
      {
        v9 = 4;
        goto LABEL_11;
      }
      if (v11 == enum case for PreviewPreferences.InterfaceOrientation.landscapeLeft(_:))
      {
        v9 = 16;
        goto LABEL_11;
      }
      if (v11 == enum case for PreviewPreferences.InterfaceOrientation.landscapeRight(_:))
      {
        v9 = 8;
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    }
    v9 = 30;
LABEL_11:
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    return v9;
  }
  return 30;
}

void sub_10002DDE0()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  objc_super v18;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  v3 = type metadata accessor for PreviewDebugOverlay.AlignmentEdge(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18.receiver = v1;
  v18.super_class = ObjectType;
  objc_msgSendSuper2(&v18, "viewDidLoad");
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for PreviewDebugOverlay.AlignmentEdge.bottom(_:), v3);
  v7 = objc_msgSend(v1, "view");
  if (v7)
  {
    v8 = v7;
    v9 = objc_allocWithZone((Class)type metadata accessor for PreviewDebugOverlay(0));
    v10 = PreviewDebugOverlay.init(edge:parent:)(v6, v8);
    v11 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay;
    v12 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay];
    *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = v10;

    v13 = *(void **)&v1[v11];
    if (v13)
    {
      v14 = &v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
      v15 = *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
      v16 = *((_QWORD *)v14 + 1);
      v17 = v13;
      swift_bridgeObjectRetain(v16);
      PreviewDebugOverlay.identifier.setter(v15, v16);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10002DF50()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  objc_super v39;

  v1 = v0;
  v39.receiver = v0;
  v39.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v39, "viewWillLayoutSubviews");
  v2 = *(void **)&v0[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating];
  if (v2)
  {
    v3 = objc_msgSend(v2, "view");
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v1, "view");
      if (v5)
      {
        v6 = v5;
        objc_msgSend(v5, "bounds");
        v8 = v7;
        v10 = v9;
        v12 = v11;
        v14 = v13;

        objc_msgSend(v4, "setFrame:", v8, v10, v12, v14);
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  v15 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active];
  if (!v15)
    goto LABEL_9;
  v16 = objc_msgSend(v15, "view");
  if (!v16)
    goto LABEL_16;
  v17 = v16;
  v18 = objc_msgSend(v1, "view");
  if (!v18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v19 = v18;
  objc_msgSend(v18, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(v17, "setFrame:", v21, v23, v25, v27);
LABEL_9:
  v28 = OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay;
  v29 = *(void **)&v1[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay];
  if (!v29)
    return;
  v30 = v29;
  v31 = objc_msgSend(v1, "view");
  if (!v31)
  {
LABEL_18:
    __break(1u);
    return;
  }
  v32 = v31;
  objc_msgSend(v31, "bounds");
  v34 = v33;
  v36 = v35;

  PreviewDebugOverlay.size.setter(v34, v36);
  v37 = *(void **)&v1[v28];
  if (v37)
  {
    v38 = v37;
    PreviewDebugOverlay.bringToFront()();

  }
}

uint64_t sub_10002E210()
{
  return type metadata accessor for CanvasViewController(0);
}

uint64_t type metadata accessor for CanvasViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100060788;
  if (!qword_100060788)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CanvasViewController);
  return result;
}

void sub_10002E254(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = &unk_100041478;
  v4[1] = &unk_100041490;
  v4[2] = &unk_100041490;
  sub_10002E2D8(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = &unk_100041490;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
  }
}

void sub_10002E2D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100060798)
  {
    v2 = type metadata accessor for PreviewPreferences.InterfaceOrientation(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100060798);
  }
}

uint64_t sub_10002E32C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658((uint64_t *)&unk_1000607A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10002E534()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  objc_class *v5;
  NSString *v6;

  v5 = (objc_class *)type metadata accessor for AppDelegate();
  v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC12PreviewShell11AppDelegate);
}

id sub_10002E5DC(void *a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t ObjCClassFromMetadata;
  NSString v20;
  id v21;
  id v22;

  v2 = objc_msgSend(a1, "role");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  if (v3 == 0xD000000000000017)
  {
    v6 = 0x8000000100047150;
    if (v5 == 0x8000000100047150)
      goto LABEL_5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017, 0x8000000100047150, v3, v5, 0) & 1) != 0)
  {
    v6 = v5;
LABEL_5:
    swift_bridgeObjectRelease(v6);
    v7 = objc_msgSend(a1, "role");
    v8 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v7);

    v9 = type metadata accessor for LocalSceneDelegate();
    goto LABEL_6;
  }
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(UVInjectedSceneSessionRole);
  if (v11 == v3 && v12 == v5)
  {
    swift_bridgeObjectRelease_n(v5, 2);
  }
  else
  {
    v14 = v12;
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v12, v3, v5, 0);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v14);
    if ((v15 & 1) == 0)
    {
      v16 = objc_msgSend(a1, "role");
      v17 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v16);

      v18 = type metadata accessor for DeviceMainSceneDelegate();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v18);
      v8 = v17;
      objc_msgSend(v8, "setDelegateClass:", ObjCClassFromMetadata);
      v20 = String._bridgeToObjectiveC()();
      v21 = objc_msgSend((id)objc_opt_self(UIStoryboard), "storyboardWithName:bundle:", v20, 0);

      objc_msgSend(v8, "setStoryboard:", v21);
      return v8;
    }
  }
  v22 = objc_msgSend(a1, "role");
  v8 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v22);

  v9 = type metadata accessor for InjectedSceneDelegate();
LABEL_6:
  objc_msgSend(v8, "setDelegateClass:", swift_getObjCClassFromMetadata(v9));
  return v8;
}

uint64_t sub_10002E85C()
{
  return sub_10000EE88();
}

uint64_t sub_10002E87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;

  v48 = a5;
  v49 = a7;
  v53 = a4;
  v54 = a6;
  v52 = a3;
  v47 = a2;
  v44 = a1;
  v58 = type metadata accessor for AgentUpdate.Context(0);
  v56 = *(_QWORD *)(v58 - 8);
  v50 = *(_QWORD *)(v56 + 64);
  __chkstk_darwin(v58);
  v57 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PropertyList(0);
  v55 = *(_QWORD *)(v9 - 8);
  v45 = v9;
  v10 = *(_QWORD *)(v55 + 64);
  __chkstk_darwin(v9);
  v46 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviewAgentConnector(0);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  v43 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ContentKey(0);
  v15 = *(_QWORD *)(v14 - 8);
  v40 = v14;
  v16 = *(_QWORD *)(v15 + 64);
  __chkstk_darwin(v14);
  v41 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = *(_QWORD *)(v7 + 48);
  (*(void (**)(void))(v15 + 16))();
  v38 = v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v47, v11);
  v17 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))((char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v48, v9);
  v18 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v57, v49, v58);
  v19 = *(unsigned __int8 *)(v15 + 80);
  v20 = (v19 + 24) & ~v19;
  v21 = *(unsigned __int8 *)(v12 + 80);
  v22 = (v16 + v21 + v20) & ~v21;
  v23 = (v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = *(unsigned __int8 *)(v17 + 80);
  v25 = (v24 + v23 + 16) & ~v24;
  v26 = (v10 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = *(unsigned __int8 *)(v18 + 80);
  v28 = (v27 + v26 + 8) & ~v27;
  v29 = swift_allocObject(&unk_100053AD8, v28 + v50, v19 | v21 | v24 | v27 | 7);
  v31 = v39;
  v30 = v40;
  *(_QWORD *)(v29 + 16) = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v29 + v20, v41, v30);
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v29 + v22, v43, v42);
  v32 = (_QWORD *)(v29 + v23);
  v33 = v53;
  *v32 = v52;
  v32[1] = v33;
  v34 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 32))(v29 + v25, v46, v45);
  v35 = v54;
  *(_QWORD *)(v29 + v26) = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 32))(v29 + v28, v57, v58);
  swift_bridgeObjectRetain(v35);
  swift_retain(v31);
  swift_retain(v33);
  v36 = FutureSerialQueue.enqueue<A>(priority:makeFuture:)(1, sub_10002F400, v29, v34);
  swift_release(v29);
  return v36;
}

uint64_t sub_10002EB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v16 = type metadata accessor for ExecutionLane(0);
  v25 = *(_QWORD *)(v16 - 8);
  v26 = v16;
  __chkstk_darwin(v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain_n(a1, 2);
  v19 = sub_10000F0E4(a2, a3, a4, a5, a6, a7, a8, (uint64_t)sub_10002F4D8, a1, (uint64_t)sub_10002F524, a1);
  v20 = swift_release_n(a1, 2);
  static ExecutionLane.main.getter(v20);
  v21 = type metadata accessor for PropertyList(0);
  v24 = 2;
  v22 = Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 66, 25, "performUpdate(for:using:makeProviderBox:updatePayload:controlStates:agentContext:)", 82, v24, v18, sub_10002ECD8, 0, v21);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v26);
  return v22;
}

char *sub_10002ECD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t updated;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = type metadata accessor for ExecutionLane(0);
  v27 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v26 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for CanvasUpdateOutput(0);
  v5 = *(_QWORD *)(updated - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = __chkstk_darwin(updated);
  v8 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v26 - v9;
  v11 = type metadata accessor for CanvasUpdater.UpdateResult(0);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13 = v12(v10, a1 + *(int *)(v11 + 20), updated);
  v14 = (uint64_t (*)(void))CanvasUpdateOutput.makeStaticOutput.getter(v13);
  v16 = v15;
  v17 = v14();
  if (v1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, updated);
    swift_release(v16);
  }
  else
  {
    v18 = v17;
    swift_release(v16);
    v12(v8, (uint64_t)v10, updated);
    v19 = *(unsigned __int8 *)(v5 + 80);
    v20 = (v19 + 16) & ~v19;
    v21 = swift_allocObject(&unk_100053B00, v20 + v6, v19 | 7);
    v22 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v21 + v20, v8, updated);
    v23 = v26;
    static ExecutionLane.any.getter(v22);
    v24 = type metadata accessor for PropertyList(0);
    v8 = (char *)Future.mapSuccess<A>(dsoHandle:file:line:column:function:on:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 69, 37, "performUpdate(for:using:makeProviderBox:updatePayload:controlStates:agentContext:)", 82, 2, v23, sub_10002F5A4, v21, v24);
    swift_release(v18);
    swift_release(v21);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v23, v28);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, updated);
  }
  return v8;
}

uint64_t sub_10002EF08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t updated;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];

  v20[1] = a2;
  v3 = type metadata accessor for PropertyList(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ChromeType(0);
  __chkstk_darwin(v7);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for StaticPreviewReply(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = CanvasUpdateOutput.staticChromeType.getter(v12);
  v16 = CanvasUpdateOutput.controlDescriptions.getter(updated);
  v17 = CanvasUpdateOutput.controlStates.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  StaticPreviewReply.init(chromeType:controlDescriptions:controlStates:contentPayload:)(v9, v16, v17, v6);
  v18 = sub_10000D608(&qword_100060978, 255, (uint64_t (*)(uint64_t))&type metadata accessor for StaticPreviewReply, (uint64_t)&protocol conformance descriptor for StaticPreviewReply);
  PropertyListRepresentable.propertyList.getter(v10, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

void sub_10002F080(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  sub_10002D714(a3);
}

uint64_t sub_10002F0A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  if (v1)
  {
    v0 = *(_QWORD *)(v0 + 64);
  }
  else
  {
    *(_QWORD *)(v0 + 64) = v0;
    swift_retain_n(v0, 2);
    v1 = 0;
  }
  swift_retain(v1);
  return v0;
}

uint64_t sub_10002F0E8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for StaticPreviewCanvas()
{
  return objc_opt_self(_TtC12PreviewShell19StaticPreviewCanvas);
}

uint64_t sub_10002F154()
{
  char v1;

  sub_100006658(&qword_10005F000);
  v1 = 2;
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 34, 19, "prepareForRelaunch(of:)", 23, v1);
}

uint64_t sub_10002F1BC()
{
  char v1;

  sub_100006658(&qword_10005F000);
  v1 = 2;
  return static Future<A>.succeeded(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 38, 19, "stop(pid:)", 10, v1);
}

uint64_t sub_10002F224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_10002E87C(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10002F244(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_10000D608(&qword_10005FE00, a2, (uint64_t (*)(uint64_t))type metadata accessor for StaticPreviewCanvas, (uint64_t)&unk_100041524);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10002F280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = type metadata accessor for ContentKey(0);
  v1 = *(_QWORD *)(v25 - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v19 = (v2 + 24) & ~v2;
  v3 = *(_QWORD *)(v1 + 64);
  v24 = type metadata accessor for PreviewAgentConnector(0);
  v4 = *(_QWORD *)(v24 - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v20 = (v19 + v3 + v5) & ~v5;
  v6 = (*(_QWORD *)(v4 + 64) + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = v6;
  v23 = type metadata accessor for PropertyList(0);
  v7 = *(_QWORD *)(v23 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v6 + v8 + 16) & ~v8;
  v10 = (*(_QWORD *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = v10;
  v11 = type metadata accessor for AgentUpdate.Context(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = (v13 + v10 + 8) & ~v13;
  v21 = v14 + *(_QWORD *)(v12 + 64);
  v22 = v11;
  v15 = v2 | v5 | v8 | v13 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v19, v25);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v20, v24);
  swift_release(*(_QWORD *)(v0 + v18 + 8));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v23);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v17));
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0 + v14, v22);
  return swift_deallocObject(v0, v21, v15);
}

uint64_t sub_10002F400()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(type metadata accessor for ContentKey(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(type metadata accessor for PreviewAgentConnector(0) - 8);
  v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(type metadata accessor for PropertyList(0) - 8);
  v8 = (v6 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AgentUpdate.Context(0) - 8) + 80);
  return sub_10002EB60(*(_QWORD *)(v0 + 16), v0 + v2, v0 + v5, *(_QWORD *)(v0 + v6), *(_QWORD *)(v0 + v6 + 8), v0 + v8, *(_QWORD **)(v0 + v9), v0 + ((v10 + v9 + 8) & ~v10));
}

uint64_t sub_10002F4D8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t updated;

  sub_10002D5F8(a1);
  v3 = enum case for SceneUpdateTiming.async(_:);
  updated = type metadata accessor for SceneUpdateTiming(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 104))(a2, v3, updated);
}

void sub_10002F524(_QWORD *a1)
{
  sub_10002D714(a1);
}

uint64_t sub_10002F544()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  updated = type metadata accessor for CanvasUpdateOutput(0);
  v2 = *(_QWORD *)(updated - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002F5A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CanvasUpdateOutput(0);
  return sub_10002EF08(a1, a2);
}

uint64_t sub_10002F5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  int v26;
  int v27;
  uint64_t ObjectType;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSString v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;

  v6 = type metadata accessor for SceneSettingsPolicy(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (void **)((char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/PreviewSceneAgent+Shell.swift", 119, 2, 69, 25, "injectScene(into:using:policy:)", 31, 2);
  v10 = static ProcessUtilities.processHandle(for:)(a1);
  if (v10 && (v11 = (void *)v10, v12 = (void *)RBSProcessHandle.applicationProcess.getter(), v11, v12))
  {
    v48 = v12;
    v47 = objc_msgSend(v12, "identity");
    v13 = (void *)AgentSceneConfiguration.sceneSpecification.getter();
    v14 = objc_msgSend(v13, "specification");

    v15 = (void *)objc_opt_self(FBSMutableSceneParameters);
    v46 = v14;
    v45 = objc_msgSend(v15, "parametersForSpecification:", v14);
    v16 = AgentSceneConfiguration.previewShellScene.getter();
    v18 = v17;
    (*(void (**)(void **, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    v19 = (*(uint64_t (**)(void **, uint64_t))(v7 + 88))(v9, v6);
    if (v19 == enum case for SceneSettingsPolicy.custom(_:))
    {
      (*(void (**)(void **, uint64_t))(v7 + 96))(v9, v6);
      v20 = *v9;
    }
    else
    {
      v26 = v19;
      v44 = v3;
      v27 = enum case for SceneSettingsPolicy.mirrorParent(_:);
      ObjectType = swift_getObjectType(v16);
      v20 = (void *)dispatch thunk of PreviewShellScene.sceneSettings.getter(ObjectType, v18);
      if (v26 != v27)
        (*(void (**)(void **, uint64_t))(v7 + 8))(v9, v6);
    }
    v29 = v48;
    swift_unknownObjectRelease(v16);
    v30 = objc_msgSend(v20, "settings");

    v31 = objc_msgSend(v30, "copyResettingInterruptionPolicy");
    v32 = v45;
    objc_msgSend(v45, "setSettings:", v31);

    v33 = objc_msgSend(objc_allocWithZone((Class)FBSMutableSceneDefinition), "init");
    AgentSceneConfiguration.sceneIdentifier.getter();
    v35 = v34;
    v36 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v35);
    v37 = objc_msgSend((id)objc_opt_self(FBSSceneIdentity), "identityForIdentifier:", v36);

    objc_msgSend(v33, "setIdentity:", v37);
    v38 = (void *)objc_opt_self(FBSSceneClientIdentity);
    v39 = v47;
    v40 = objc_msgSend(v38, "identityForProcessIdentity:", v47);
    objc_msgSend(v33, "setClientIdentity:", v40);

    v41 = v46;
    objc_msgSend(v33, "setSpecification:", v46);
    v42 = objc_msgSend((id)objc_opt_self(FBSceneManager), "sharedInstance");
    v43 = objc_msgSend(v42, "createSceneWithDefinition:initialParameters:", v33, v32);

    return (uint64_t)v43;
  }
  else
  {
    v21 = type metadata accessor for ProcessError(0);
    v22 = sub_100006618(&qword_10005EFE0, (uint64_t (*)(uint64_t))&type metadata accessor for ProcessError, (uint64_t)&protocol conformance descriptor for ProcessError);
    swift_allocError(v21, v22, 0, 0);
    *v23 = a1;
    v24 = (*(uint64_t (**)(_DWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, enum case for ProcessError.noProcessForPid(_:), v21);
    return swift_willThrow(v24);
  }
}

uint64_t sub_10002F9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v4[3] = a4;
  v6 = *a4;
  v7 = type metadata accessor for MainActor(0);
  v4[4] = v7;
  v4[5] = static MainActor.shared.getter(v7);
  v4[2] = a4;
  v8 = (_QWORD *)swift_task_alloc(async function pointer to ConcurrentInvalidatable.invalidation.getter[1]);
  v4[6] = v8;
  v9 = sub_100006618(&qword_100060510, (uint64_t (*)(uint64_t))&type metadata accessor for PreviewSceneAgentProxy, (uint64_t)&protocol conformance descriptor for PreviewSceneAgentProxy);
  *v8 = v4;
  v8[1] = sub_10002FA90;
  return ConcurrentInvalidatable.invalidation.getter(v6, v9);
}

uint64_t sub_10002FA90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 48));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10002FB00, v2, v3);
}

uint64_t sub_10002FB00()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = swift_release(*(_QWORD *)(v0 + 40));
  v2 = (void *)PreviewSceneAgentProxy.scene.getter(v1);
  v3 = objc_msgSend(v2, "scene");

  sub_10003001C(0, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10002FB68()
{
  off_100060980 = &_swiftEmptyDictionarySingleton;
}

id sub_10002FB7C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)SBSKeyboardFocusService), "init");
  qword_100060988 = (uint64_t)result;
  return result;
}

Swift::Int sub_10002FBAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100006658(&qword_100060998);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v27 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v27 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v28, *(_QWORD *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      result = Hasher._finalize()();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = v16[1];
        v18 = *v16 == v8 && v17 == v7;
        if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }
        v19 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v19;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v20 = (_QWORD *)(v15 + 16 * v11);
          v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0);
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v23 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v23 = v8;
      v23[1] = v7;
      v24 = *(_QWORD *)(v3 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

id sub_10002FD4C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t inited;
  Swift::Int v19;
  Class isa;
  NSString v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[48];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter(v6);
  v9 = swift_bridgeObjectRetain_n(a2, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  v12 = os_log_type_enabled(v10, v11);
  v25 = a1;
  if (v12)
  {
    v13 = swift_slowAlloc(12, -1);
    v24 = v4;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc(32, -1);
    v27 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain(a2);
    v26 = sub_100010F78(a1, a2, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v14 + 4);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Allowing keyboard focus for %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  if (qword_10005ECF0 != -1)
    swift_once(&qword_10005ECF0, sub_10002FB7C);
  v16 = (void *)qword_100060988;
  v17 = sub_100006658(&qword_100060990);
  inited = swift_initStackObject(v17, v28);
  *(_OWORD *)(inited + 16) = xmmword_100040860;
  *(_QWORD *)(inited + 32) = v25;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain(a2);
  v19 = sub_10002FBAC(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1, &type metadata for String);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  v21 = String._bridgeToObjectiveC()();
  v22 = objc_msgSend(v16, "setExternalSceneIdentities:forReason:", isa, v21);

  return v22;
}

uint64_t sub_10003001C(char a1, id a2)
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  void *v13;
  id v14;
  char isUniquelyReferenced_nonNull_native;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[24];

  v3 = objc_msgSend(a2, "identityToken");
  v4 = objc_msgSend(v3, "stringRepresentation");

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  if ((a1 & 1) != 0)
  {
    if (qword_10005ECE8 != -1)
      swift_once(&qword_10005ECE8, sub_10002FB68);
    swift_beginAccess(&off_100060980, v20, 32, 0);
    if (*((_QWORD *)off_100060980 + 2))
    {
      swift_bridgeObjectRetain(v7);
      sub_100007C5C(v5, v7);
      if ((v8 & 1) != 0)
      {
        swift_endAccess(v20);
        return swift_bridgeObjectRelease_n(v7, 2);
      }
      swift_bridgeObjectRelease(v7);
    }
    swift_endAccess(v20);
    v14 = sub_10002FD4C(v5, v7);
    swift_beginAccess(&off_100060980, v20, 33, 0);
    if (v14)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(off_100060980);
      v19 = off_100060980;
      off_100060980 = (_UNKNOWN *)0x8000000000000000;
      sub_10000A904((uint64_t)v14, v5, v7, isUniquelyReferenced_nonNull_native);
      v16 = off_100060980;
      off_100060980 = v19;
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      v18 = sub_1000083E0(v5, v7);
      swift_bridgeObjectRelease(v7);
      swift_unknownObjectRelease(v18);
    }
    return swift_endAccess(v20);
  }
  else
  {
    if (qword_10005ECE8 != -1)
      swift_once(&qword_10005ECE8, sub_10002FB68);
    swift_beginAccess(&off_100060980, v20, 32, 0);
    v10 = off_100060980;
    if (*((_QWORD *)off_100060980 + 2))
    {
      swift_bridgeObjectRetain(v7);
      v11 = sub_100007C5C(v5, v7);
      if ((v12 & 1) != 0)
      {
        v13 = *(void **)(v10[7] + 8 * v11);
        swift_endAccess(v20);
        swift_unknownObjectRetain(v13);
        swift_bridgeObjectRelease(v7);
        objc_msgSend(v13, "invalidate");
        swift_unknownObjectRelease(v13);
      }
      else
      {
        swift_endAccess(v20);
        swift_bridgeObjectRelease(v7);
      }
    }
    else
    {
      swift_endAccess(v20);
    }
    swift_beginAccess(&off_100060980, v20, 33, 0);
    v17 = sub_1000083E0(v5, v7);
    swift_endAccess(v20);
    swift_bridgeObjectRelease(v7);
    return swift_unknownObjectRelease(v17);
  }
}

_QWORD *sub_1000302E0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = a2[6];
    v4[5] = a2[5];
    v4[6] = v8;
    v9 = *(int *)(a3 + 24);
    v10 = (char *)v4 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = type metadata accessor for SceneLayout(0);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain(v8);
    v13(v10, v11, v12);
  }
  return v4;
}

uint64_t sub_1000303A4(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  sub_10000D6B0(a1);
  swift_bridgeObjectRelease(a1[6]);
  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for SceneLayout(0);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1000303F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for SceneLayout(0);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain(v7);
  v12(v9, v10, v11);
  return a1;
}

_QWORD *sub_100030480(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  sub_10002D0BC(a1, a2);
  a1[5] = a2[5];
  v6 = a2[6];
  v7 = a1[6];
  a1[6] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for SceneLayout(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

uint64_t sub_100030500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_10003056C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_10000D6B0((_QWORD *)a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for SceneLayout(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000305EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000305F8);
}

uint64_t sub_1000305F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for SceneLayout(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_100030674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100030680);
}

uint64_t sub_100030680(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for SceneLayout(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SceneConfigurator(uint64_t a1)
{
  uint64_t result;

  result = qword_100060A08;
  if (!qword_100060A08)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SceneConfigurator);
  return result;
}

uint64_t sub_100030730(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = "(";
  v4[1] = &unk_1000415B0;
  result = type metadata accessor for SceneLayout(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

void sub_1000307AC(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54[3];
  uint64_t v55;
  uint64_t v56;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "setInterfaceOrientation:", sub_100031F20());
  sub_100032308();
  objc_msgSend(a1, "setFrame:", 0.0, 0.0, v8, v9);
  objc_msgSend(a1, "setInterfaceOrientationMode:", 2);
  objc_msgSend(a1, "setDeviceOrientation:", sub_100031F20());
  v10 = v1[3];
  v11 = v2[4];
  sub_10000D648(v2, v10);
  objc_msgSend(a1, "setPreviewMaximumSize:", sub_100006C30(v10, v11));
  v12 = (char *)v2 + *(int *)(type metadata accessor for SceneConfigurator(0) + 24);
  objc_msgSend(a1, "setPreviewSceneLayout:", sub_10003254C());
  sub_10003272C(a1);
  if (qword_10005ECA0 != -1)
    swift_once(&qword_10005ECA0, sub_10001D7E4);
  v13 = type metadata accessor for PreviewShellPluginRegistry(0);
  v14 = sub_10000C53C(v13, (uint64_t)qword_100064188);
  v15 = swift_beginAccess(v14, v54, 32, 0);
  PreviewShellPluginRegistry.sceneConfigurator.getter(&v52, v15);
  swift_endAccess(v54);
  if (v53)
  {
    sub_10000C5DC(&v52, (uint64_t)v54);
    v16 = v55;
    v17 = v56;
    sub_10000D648(v54, v55);
    v18 = objc_msgSend(objc_allocWithZone((Class)PSMutableSceneSettings), "initWithSettings:", a1);
    dispatch thunk of PreviewShellSceneConfigurator.configure(sceneSettings:for:)(v18, v12, v16, v17);

    v19 = sub_10000D6B0(v54);
  }
  else
  {
    v19 = sub_1000334B0((uint64_t)&v52);
  }
  static Logger.uv.getter(v19);
  v20 = a1;
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v21, (os_log_type_t)v22))
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  HIDWORD(v48) = v22;
  v50 = v5;
  v51 = v4;
  v23 = swift_slowAlloc(52, -1);
  v49 = swift_slowAlloc(160, -1);
  v54[0] = v49;
  *(_DWORD *)v23 = 136316162;
  v24 = objc_msgSend(v20, "persistenceIdentifier");
  if (v24)
  {
    v25 = v24;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v28 = v27;

    *(_QWORD *)&v52 = sub_100010F78(v26, v28, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, (char *)&v52 + 8, v23 + 4);

    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v23 + 12) = 2080;
    v29 = (id)BSInterfaceOrientationDescription(objc_msgSend(v20, "interfaceOrientation"));
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
    v32 = v31;

    *(_QWORD *)&v52 = sub_100010F78(v30, v32, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, (char *)&v52 + 8, v23 + 14);

    swift_bridgeObjectRelease(v32);
    *(_WORD *)(v23 + 22) = 2080;
    v33 = (id)BSStringFromCGRect(objc_msgSend(v20, "frame"));
    if (v33)
    {
      v34 = v33;
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
      v37 = v36;

      *(_QWORD *)&v52 = sub_100010F78(v35, v37, v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, (char *)&v52 + 8, v23 + 24);

      swift_bridgeObjectRelease(v37);
      *(_WORD *)(v23 + 32) = 2080;
      v38 = (id)BSStringFromCGSize(objc_msgSend(v20, "previewMaximumSize"));
      if (v38)
      {
        v39 = v38;
        v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v42 = v41;

        *(_QWORD *)&v52 = sub_100010F78(v40, v42, v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, (char *)&v52 + 8, v23 + 34);

        swift_bridgeObjectRelease(v42);
        *(_WORD *)(v23 + 42) = 2080;
        v43 = (id)UVPreviewSceneLayoutDescription(objc_msgSend(v20, "previewSceneLayout"));
        v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
        v46 = v45;

        *(_QWORD *)&v52 = sub_100010F78(v44, v46, v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, (char *)&v52 + 8, v23 + 44);

        swift_bridgeObjectRelease(v46);
        _os_log_impl((void *)&_mh_execute_header, v21, BYTE4(v48), "Configuring scene %s with orientation:%s, frame:%s, maxSize:%s, layout:%s", (uint8_t *)v23, 0x34u);
        v47 = v49;
        swift_arrayDestroy(v49, 5, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v47, -1, -1);
        swift_slowDealloc(v23, -1, -1);

        (*(void (**)(char *, uint64_t))(v50 + 8))(v7, v51);
        return;
      }
      goto LABEL_14;
    }
  }
  else
  {

    __break(1u);
  }

  __break(1u);
LABEL_14:

  __break(1u);
}

id sub_100030D9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  int v14;
  uint64_t v15;
  id result;
  Swift::String v17;
  void *object;
  uint64_t v19;
  id v20;
  unint64_t v21;
  _BYTE v22[8];

  v3 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SceneLayout(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v19 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v19 - v11, v1 + *(int *)(v3 + 24), v6);
  v14 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v12, v6);
  if (v14 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v12, v6);
    sub_100031ED8(a1 + 48, (uint64_t)v22);
    sub_100031ED8((uint64_t)v22, (uint64_t)&v20);
    if (v20)
      objc_msgSend(v20, "setHidden:", 0);
    v15 = type metadata accessor for PreviewTraits.Orientation(0);
    return (id)(*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v12, v15);
  }
  else if (v14 == enum case for SceneLayout.custom(_:))
  {
    sub_100031ED8(a1 + 48, (uint64_t)v22);
    sub_100031ED8((uint64_t)v22, (uint64_t)&v20);
    result = v20;
    if (v20)
      return objc_msgSend(v20, "setHidden:", 1);
  }
  else
  {
    sub_100024570(v1, (uint64_t)v5);
    v20 = 0;
    v21 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease(v21);
    v20 = (id)0xD000000000000015;
    v21 = 0x8000000100047D20;
    v13(v10, (uint64_t)&v5[*(int *)(v3 + 24)], v6);
    v17._countAndFlagsBits = String.init<A>(describing:)(v10, v6);
    object = v17._object;
    String.append(_:)(v17);
    swift_bridgeObjectRelease(object);
    result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v20, v21, "PreviewShell/SceneConfigurator.swift", 36, 2, 94, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_100031000(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t result;
  id v11;
  uint64_t ObjectType;
  Swift::String v13;
  void *object;
  void **v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void **aBlock;
  unint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  uint64_t (*v24)();
  uint64_t v25;
  char v26;

  v3 = v2;
  v26 = 0;
  v6 = (_QWORD *)swift_allocObject(&unk_100053BB8, 40, 7);
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v26;
  v7 = swift_allocObject(&unk_100053BE0, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_10003353C;
  *(_QWORD *)(v7 + 24) = v6;
  v24 = sub_10000D800;
  v25 = v7;
  aBlock = _NSConcreteStackBlock;
  v21 = 1107296256;
  v22 = sub_10003345C;
  v23 = &unk_100053BF8;
  v8 = _Block_copy(&aBlock);
  v9 = v25;
  swift_retain(v7);
  swift_release(v9);
  objc_msgSend(v3, "performUpdate:", v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation(v7, "", 113, 279, 23, 1);
  result = swift_release(v7);
  if ((v8 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((v26 & 1) == 0)
    {
      aBlock = 0;
      v21 = 0xE000000000000000;
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease(v21);
      aBlock = (void **)0xD000000000000026;
      v21 = 0x8000000100047D40;
      v11 = objc_msgSend(v3, "settings");
      ObjectType = swift_getObjectType(v11);

      v13._countAndFlagsBits = _typeName(_:qualified:)(ObjectType, 0);
      object = v13._object;
      String.append(_:)(v13);
      swift_bridgeObjectRelease(object);
      v15 = aBlock;
      v16 = v21;
      v17 = type metadata accessor for Unreachable(0);
      v18 = sub_100031D24();
      swift_allocError(v17, v18, 0, 0);
      v19 = Unreachable.init(_:diagnostics:file:line:column:function:)(v15, v16, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneConfigurator.swift", 113, 2, 287, 30, "updatePreviewSettings(_:)", 25, 2);
      swift_willThrow(v19);
    }
    return swift_release(v6);
  }
  return result;
}

void sub_100031248(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  id v9;
  NSString v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  id v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  _QWORD *v64;
  void *v65;
  char v67[16];
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[8];
  uint64_t v73;

  v9 = objc_msgSend(objc_allocWithZone((Class)FBSMutableSceneDefinition), "init");
  swift_bridgeObjectRetain(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v11 = objc_msgSend((id)objc_opt_self(FBSSceneIdentity), "identityForIdentifier:", v10);

  objc_msgSend(v9, "setIdentity:", v11);
  v12 = objc_msgSend((id)objc_opt_self(FBSSceneClientIdentity), "localIdentity");
  objc_msgSend(v9, "setClientIdentity:", v12);

  v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalSceneSpecification()), "init");
  objc_msgSend(v9, "setSpecification:", v13);

  v14 = objc_msgSend(v9, "specification");
  v15 = objc_msgSend((id)objc_opt_self(FBSMutableSceneParameters), "parametersForSpecification:", v14);

  v68 = v4;
  v69 = a3;
  v73 = a1;
  v70 = a1;
  v71 = a2;
  sub_100031AE0((uint64_t)sub_100031AD4, (uint64_t)v67);
  if (v5)
  {

    v16 = v15;
LABEL_3:

    return;
  }
  v64 = v4;
  v17 = objc_msgSend((id)objc_opt_self(FBSceneManager), "sharedInstance");
  v18 = objc_msgSend(v17, "createSceneWithDefinition:initialParameters:", v9, v15);

  if (qword_10005EC80 != -1)
    swift_once(&qword_10005EC80, sub_10000C450);
  v19 = qword_10005F1C8;
  v20 = qword_10005F1D0;
  sub_10000D648(qword_10005F1B0, qword_10005F1C8);
  v65 = v18;
  v21 = objc_msgSend(objc_allocWithZone((Class)PSScene), "initWithScene:", v18);
  dispatch thunk of PreviewShellSceneBinder.bind(scene:)(v21, v19, v20);

  v22 = objc_msgSend((id)objc_opt_self(FBLocalSynchronousSceneClientProvider), "sharedInstance");
  v23 = objc_msgSend(v22, "fbsSceneForScene:", v65);

  if (!v23)
  {
    v46 = type metadata accessor for Unreachable(0);
    v47 = sub_100031D24();
    swift_allocError(v46, v47, 0, 0);
    v48 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000021, 0x8000000100047B90, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneConfigurator.swift", 113, 2, 55, 30, "createLocalScene(with:using:)", 29, 2);
    swift_willThrow(v48);

    v16 = v65;
    goto LABEL_3;
  }
  v24 = objc_msgSend(v23, "windowScene");
  if (!v24)
  {
    v49 = type metadata accessor for Unreachable(0);
    v50 = sub_100031D24();
    swift_allocError(v49, v50, 0, 0);
    v51 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000041, 0x8000000100047C60, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneConfigurator.swift", 113, 2, 59, 30, "createLocalScene(with:using:)", 29, 2);
    swift_willThrow(v51);

    v16 = v23;
    goto LABEL_3;
  }
  v16 = v24;
  v25 = objc_msgSend(v24, "delegate");
  if (!v25)
  {
    v52 = type metadata accessor for Unreachable(0);
    v53 = sub_100031D24();
    swift_allocError(v52, v53, 0, 0);
    v54 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000034, 0x8000000100047CB0, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneConfigurator.swift", 113, 2, 63, 30, "createLocalScene(with:using:)", 29, 2);
    swift_willThrow(v54);

    goto LABEL_3;
  }
  v62 = v23;
  v63 = v25;
  v61 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v16);
  objc_msgSend(v61, "setHidden:", 0);
  v27 = v64[3];
  v26 = v64[4];
  sub_10000D648(v64, v27);
  v29 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v27, v26);
  v30 = v28;
  if ((v31 & 1) == 0)
    goto LABEL_17;
  v32 = objc_msgSend(v28, "exclusionArea");
  if (!v32)
    goto LABEL_17;
  v33 = v32;
  v34 = objc_opt_self(UISDisplaySingleRectShape);
  v35 = (void *)swift_dynamicCastObjCClass(v33, v34);
  if (!v35)
  {

LABEL_17:
    v45 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v35, "rect");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v44 = objc_allocWithZone((Class)type metadata accessor for ExclusionWindow());
  v45 = sub_10001B770(v16, v37, v39, v41, v43);
LABEL_18:
  v55 = sub_100031D6C();
  v72[0] = v73;
  v72[1] = a2;
  v72[2] = v16;
  v72[3] = v61;
  v72[4] = v55;
  v72[5] = v63;
  v72[6] = v45;
  v60 = v55;
  swift_bridgeObjectRetain(a2);
  v58 = v16;
  v59 = v45;
  swift_unknownObjectRetain(v63);
  v56 = v61;
  sub_100030D9C((uint64_t)v72);

  swift_unknownObjectRelease(v63);
  v57 = v73;
  *a4 = v65;
  a4[1] = v57;
  a4[2] = a2;
  a4[3] = v58;
  a4[4] = v56;
  a4[5] = v60;
  a4[6] = v63;
  a4[7] = v45;
}

uint64_t sub_100031938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = type metadata accessor for SceneLayout(0);
  sub_10001D848(v0, qword_1000641D8);
  v1 = sub_10000C53C(v0, (uint64_t)qword_1000641D8);
  v2 = enum case for PreviewTraits.Orientation.portrait(_:);
  v3 = type metadata accessor for PreviewTraits.Orientation(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v1, v2, v3);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, enum case for SceneLayout.device(_:), v0);
}

void sub_1000319CC(void *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSString v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2[3];
  v4 = a2[4];
  sub_10000D648(a2, v3);
  v5 = sub_100006C78(v3, v4);
  objc_msgSend(a1, "setDisplayConfiguration:", v5);

  objc_msgSend(a1, "setLevel:", 0.0);
  objc_msgSend(a1, "setForeground:", 1);
  v6 = String._bridgeToObjectiveC()();
  v7 = (id)UVSceneIdentifierToPersistenceIdentifier();

  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v9 = v8;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  objc_msgSend(a1, "setPersistenceIdentifier:", v7);

  sub_1000307AC(a1);
}

void sub_100031AD4(void *a1)
{
  uint64_t v1;

  sub_1000319CC(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_100031AE0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  Swift::String v12;
  void *object;
  void **v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void **aBlock;
  unint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  char v25;

  v3 = v2;
  v25 = 0;
  v6 = (_QWORD *)swift_allocObject(&unk_100053B40, 40, 7);
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v25;
  v7 = swift_allocObject(&unk_100053B68, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_1000333AC;
  *(_QWORD *)(v7 + 24) = v6;
  v23 = sub_10000D800;
  v24 = v7;
  aBlock = _NSConcreteStackBlock;
  v20 = 1107296256;
  v21 = sub_100012B14;
  v22 = &unk_100053B80;
  v8 = _Block_copy(&aBlock);
  v9 = v24;
  swift_retain(v7);
  swift_release(v9);
  objc_msgSend(v3, "updateSettingsWithBlock:", v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation(v7, "", 113, 254, 24, 1);
  result = swift_release(v7);
  if ((v8 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((v25 & 1) == 0)
    {
      aBlock = 0;
      v20 = 0xE000000000000000;
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease(v20);
      aBlock = (void **)0xD000000000000026;
      v20 = 0x8000000100047D40;

      v11 = sub_100006658(&qword_100060A50);
      v12._countAndFlagsBits = _typeName(_:qualified:)(v11, 0);
      object = v12._object;
      String.append(_:)(v12);
      swift_bridgeObjectRelease(object);
      v14 = aBlock;
      v15 = v20;
      v16 = type metadata accessor for Unreachable(0);
      v17 = sub_100031D24();
      swift_allocError(v16, v17, 0, 0);
      v18 = Unreachable.init(_:diagnostics:file:line:column:function:)(v14, v15, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneConfigurator.swift", 113, 2, 262, 30, "updatePreviewSettings(_:)", 25, 2);
      swift_willThrow(v18);
    }
    return swift_release(v6);
  }
  return result;
}

unint64_t sub_100031D24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005F130;
  if (!qword_10005F130)
  {
    v1 = type metadata accessor for Unreachable(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Unreachable, v1);
    atomic_store(result, (unint64_t *)&qword_10005F130);
  }
  return result;
}

uint64_t sub_100031D6C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  Swift::String v7;
  void *object;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;

  v1 = v0;
  v2 = objc_msgSend(v0, "settings");
  if (v2)
  {
    v3 = v2;
    v4 = objc_opt_self(UVPreviewSceneSettings);
    result = swift_dynamicCastObjCClass(v3, v4);
    if (result)
      return result;

  }
  _StringGuts.grow(_:)(40);
  swift_bridgeObjectRelease(0xE000000000000000);

  v6 = sub_100006658(&qword_100060A50);
  v7._countAndFlagsBits = _typeName(_:qualified:)(v6, 0);
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9 = type metadata accessor for Unreachable(0);
  v10 = sub_100031D24();
  swift_allocError(v9, v10, 0, 0);
  v12 = 2;
  v11 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000026, 0x8000000100047D40, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneConfigurator.swift", 113, 2, 268, 30, "previewSettings()", 17, v12);
  return swift_willThrow(v11);
}

uint64_t sub_100031ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_100060A48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100031F20()
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v27;
  Swift::String v28;
  void *v29;
  char *v30;
  char *v31;
  Swift::String v32;
  void *object;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  unint64_t v39;

  v1 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v1);
  v34 = (uint64_t)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for PreviewTraits.Orientation(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v37 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v36 = (char *)&v34 - v8;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v34 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v34 - v12;
  v14 = type metadata accessor for SceneLayout(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v34 - v19;
  v35 = v1;
  v21 = v0 + *(int *)(v1 + 24);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v22((char *)&v34 - v19, v21, v14);
  v23 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v20, v14);
  if (v23 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v20, v14);
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v20, v3);
    v20 = *(char **)(v4 + 16);
    ((void (*)(char *, char *, uint64_t))v20)(v11, v13, v3);
    v24 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v11, v3);
    if (v24 == enum case for PreviewTraits.Orientation.portrait(_:))
    {
      v25 = 1;
    }
    else if (v24 == enum case for PreviewTraits.Orientation.portraitUpsideDown(_:))
    {
      v25 = 2;
    }
    else if (v24 == enum case for PreviewTraits.Orientation.landscapeLeft(_:))
    {
      v25 = 4;
    }
    else
    {
      if (v24 != enum case for PreviewTraits.Orientation.landscapeRight(_:))
      {
        while (1)
        {
          v30 = v36;
          ((void (*)(char *, char *, uint64_t))v20)(v36, v13, v3);
          v38 = 0;
          v39 = 0xE000000000000000;
          _StringGuts.grow(_:)(23);
          swift_bridgeObjectRelease(v39);
          v38 = 0xD000000000000015;
          v39 = 0x8000000100047E10;
          v31 = v37;
          ((void (*)(char *, char *, uint64_t))v20)(v37, v30, v3);
          v32._countAndFlagsBits = String.init<A>(describing:)(v31, v3);
          object = v32._object;
          String.append(_:)(v32);
          swift_bridgeObjectRelease(object);
          _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v38, v39, "PreviewShell/Orientation+Shell.swift", 36, 2, 54, 0);
LABEL_15:
          __break(1u);
        }
      }
      v25 = 3;
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
  }
  else
  {
    if (v23 != enum case for SceneLayout.custom(_:))
    {
      v27 = v34;
      sub_100024570(v0, v34);
      v38 = 0;
      v39 = 0xE000000000000000;
      _StringGuts.grow(_:)(23);
      swift_bridgeObjectRelease(v39);
      v38 = 0xD000000000000015;
      v39 = 0x8000000100047D20;
      v22(v18, v27 + *(int *)(v35 + 24), v14);
      v28._countAndFlagsBits = String.init<A>(describing:)(v18, v14);
      v29 = v28._object;
      String.append(_:)(v28);
      swift_bridgeObjectRelease(v29);
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v38, v39, "PreviewShell/SceneConfigurator.swift", 36, 2, 216, 0);
      goto LABEL_15;
    }
    return 1;
  }
  return v25;
}

uint64_t sub_100032308()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  Swift::String v17;
  void *object;
  unint64_t v19;
  unint64_t v20;

  v1 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SceneLayout(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v19 - v9;
  v11 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v11((char *)&v19 - v9, &v0[*(int *)(v1 + 24)], v4);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v10, v4);
  if (v12 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    v13 = *((_QWORD *)v0 + 3);
    v14 = *((_QWORD *)v0 + 4);
    sub_10000D648(v0, v13);
    sub_100006C30(v13, v14);
    v15 = type metadata accessor for PreviewTraits.Orientation(0);
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v10, v15);
  }
  else if (v12 == enum case for SceneLayout.custom(_:))
  {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 96))(v10, v4);
  }
  else
  {
    sub_100024570((uint64_t)v0, (uint64_t)v3);
    v19 = 0;
    v20 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease(v20);
    v19 = 0xD000000000000015;
    v20 = 0x8000000100047D20;
    v11(v8, &v3[*(int *)(v1 + 24)], v4);
    v17._countAndFlagsBits = String.init<A>(describing:)(v8, v4);
    object = v17._object;
    String.append(_:)(v17);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v19, v20, "PreviewShell/SceneConfigurator.swift", 36, 2, 206, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_10003254C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  int v12;
  uint64_t v13;
  uint64_t result;
  Swift::String v15;
  void *object;
  unint64_t v17;
  unint64_t v18;

  v1 = type metadata accessor for SceneLayout(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v17 - v7;
  __chkstk_darwin(v6);
  v10 = (char *)&v17 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v11((char *)&v17 - v9, v0, v1);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v10, v1);
  if (v12 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v10, v1);
    v13 = type metadata accessor for PreviewTraits.Orientation(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v10, v13);
    return 0;
  }
  else if (v12 == enum case for SceneLayout.custom(_:))
  {
    return 1;
  }
  else
  {
    v11(v8, v0, v1);
    v17 = 0;
    v18 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease(v18);
    v17 = 0xD000000000000015;
    v18 = 0x8000000100047D20;
    v11(v5, (uint64_t)v8, v1);
    v15._countAndFlagsBits = String.init<A>(describing:)(v5, v1);
    object = v15._object;
    String.append(_:)(v15);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v17, v18, "PreviewShell/SceneConfigurator.swift", 36, 2, 244, 0);
    __break(1u);
  }
  return result;
}

void sub_10003272C(id a1)
{
  __objc2_ivar *v1;
  __objc2_ivar *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *type;
  NSString v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  char *v19;
  int v20;
  uint64_t v21;
  int32_t *offs;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  int32_t *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  unsigned int v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  int64_t v46;
  unint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  id v54;
  int32_t *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  char *v60;
  id v61;
  id v62;
  _QWORD *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  int64_t v68;
  int64_t v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  int64_t v73;
  unint64_t v74;
  int64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  int32_t *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  double v87;
  uint64_t v88;
  Swift::String v89;
  void *object;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  int64_t v95;
  id v96;
  unint64_t v97;
  unint64_t v98;

  v2 = v1;
  v4 = type metadata accessor for SceneConfigurator(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SceneLayout(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v91 = (char *)&v91 - v12;
  type = v1[1].type;
  if (type)
  {
    swift_bridgeObjectRetain(type);
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(type);
    v15 = objc_msgSend((id)objc_opt_self(LSApplicationProxy), "applicationProxyForIdentifier:", v14);

    if (v15)
    {
      v16 = objc_msgSend(v15, "appState");
      if (!v16)
      {
        __break(1u);
        goto LABEL_73;
      }
      v17 = v16;
      v18 = objc_msgSend(v16, "isValid");

      if (v18)
      {
        v94 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ApplicationInfo(0)), "initWithApplicationProxy:", v15);

        goto LABEL_8;
      }

    }
  }
  v94 = 0;
LABEL_8:
  v14 = *(NSString *)(v8 + 16);
  v19 = v91;
  ((void (*)(char *, char *, uint64_t))v14)(v91, (char *)v2 + *(int *)(v4 + 24), v7);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v19, v7);
  if (v20 == enum case for SceneLayout.device(_:))
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v19, v7);
    v21 = *(_QWORD *)&v2->align;
    offs = v2[1].offs;
    sub_10000D648(v2, v21);
    v23 = (void *)(*((uint64_t (**)(uint64_t, int32_t *))offs + 1))(v21, offs);
    v25 = v24;
    objc_msgSend(v23, "deviceInfoFloatValueForKey:", UISDeviceContextDeviceCornerRadiusKey);
    v27 = v26;

    v28 = objc_msgSend(objc_allocWithZone((Class)BSCornerRadiusConfiguration), "initWithCornerRadius:", v27);
    objc_msgSend(a1, "setCornerRadiusConfiguration:", v28);

    v29 = *(_QWORD *)&v2->align;
    v30 = v2[1].offs;
    sub_10000D648(v2, v29);
    v31 = (void *)(*((uint64_t (**)(uint64_t, int32_t *))v30 + 1))(v29, v30);
    v33 = v32;
    v34 = objc_msgSend(v32, "displayEdgeInfo");
    if (!v34)
      v34 = objc_msgSend(objc_allocWithZone((Class)UISApplicationSupportDisplayEdgeInfo), "init");

    sub_100033028(a1);
    v11 = v94;
    if (qword_10005ED00 != -1)
      goto LABEL_71;
    goto LABEL_12;
  }
  if (v20 != enum case for SceneLayout.custom(_:))
  {
LABEL_73:
    sub_100024570((uint64_t)v2, (uint64_t)v6);
    v97 = 0;
    v98 = 0xE000000000000000;
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease(v98);
    v97 = 0xD000000000000015;
    v98 = 0x8000000100047D20;
    ((void (*)(char *, char *, uint64_t))v14)(v11, &v6[*(int *)(v4 + 24)], v7);
    v89._countAndFlagsBits = String.init<A>(describing:)(v11, v7);
    object = v89._object;
    String.append(_:)(v89);
    swift_bridgeObjectRelease(object);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v97, v98, "PreviewShell/SceneConfigurator.swift", 36, 2, 155, 0);
    __break(1u);
    return;
  }
  v61 = objc_msgSend(objc_allocWithZone((Class)BSCornerRadiusConfiguration), "initWithCornerRadius:", 0.0);
  objc_msgSend(a1, "setCornerRadiusConfiguration:", v61);

  v62 = objc_msgSend(objc_allocWithZone((Class)UISApplicationSupportDisplayEdgeInfo), "init");
  sub_100033028(a1);

  if (qword_10005ED00 != -1)
    swift_once(&qword_10005ED00, sub_100033150);
  v63 = off_1000609A8;
  v64 = (char *)off_1000609A8 + 64;
  v65 = 1 << *((_BYTE *)off_1000609A8 + 32);
  v66 = -1;
  if (v65 < 64)
    v66 = ~(-1 << v65);
  v67 = v66 & *((_QWORD *)off_1000609A8 + 8);
  v68 = (unint64_t)(v65 + 63) >> 6;
  swift_bridgeObjectRetain(off_1000609A8);
  v69 = 0;
  v2 = &stru_10005D000;
  v70 = v94;
  while (1)
  {
    if (v67)
    {
      v71 = __clz(__rbit64(v67));
      v67 &= v67 - 1;
      v72 = v71 | (v69 << 6);
      goto LABEL_46;
    }
    v73 = v69 + 1;
    if (__OFADD__(v69, 1))
    {
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
    if (v73 >= v68)
      goto LABEL_66;
    v74 = *(_QWORD *)&v64[8 * v73];
    ++v69;
    if (!v74)
    {
      v69 = v73 + 1;
      if (v73 + 1 >= v68)
        goto LABEL_66;
      v74 = *(_QWORD *)&v64[8 * v69];
      if (!v74)
      {
        v69 = v73 + 2;
        if (v73 + 2 >= v68)
          goto LABEL_66;
        v74 = *(_QWORD *)&v64[8 * v69];
        if (!v74)
          break;
      }
    }
LABEL_61:
    v67 = (v74 - 1) & v74;
    v72 = __clz(__rbit64(v74)) + (v69 << 6);
LABEL_46:
    objc_msgSend(a1, "setDefaultStatusBarHeight:forOrientation:", *(_QWORD *)(v63[6] + 8 * v72), 0.0, v91);
  }
  v75 = v73 + 3;
  if (v75 >= v68)
  {
LABEL_66:
    swift_release(v63);
    objc_msgSend(a1, "setStatusBarHeight:", 0.0);

    return;
  }
  v74 = *(_QWORD *)&v64[8 * v75];
  if (v74)
  {
    v69 = v75;
    goto LABEL_61;
  }
  while (1)
  {
    v69 = v75 + 1;
    if (__OFADD__(v75, 1))
      break;
    if (v69 >= v68)
      goto LABEL_66;
    v74 = *(_QWORD *)&v64[8 * v69];
    ++v75;
    if (v74)
      goto LABEL_61;
  }
LABEL_70:
  __break(1u);
LABEL_71:
  swift_once(&qword_10005ED00, sub_100033150);
LABEL_12:
  v35 = off_1000609A8;
  v36 = *((_QWORD *)off_1000609A8 + 8);
  v93 = (char *)off_1000609A8 + 64;
  v37 = 1 << *((_BYTE *)off_1000609A8 + 32);
  v38 = -1;
  if (v37 < 64)
    v38 = ~(-1 << v37);
  v39 = v38 & v36;
  v95 = (unint64_t)(v37 + 63) >> 6;
  v92 = UISDeviceContextDeviceIdiomKey;
  swift_bridgeObjectRetain(off_1000609A8);
  v40 = 0;
  v96 = a1;
  while (2)
  {
    if (v39)
    {
      v44 = __clz(__rbit64(v39));
      v39 &= v39 - 1;
      v45 = v44 | (v40 << 6);
LABEL_36:
      v49 = 8 * v45;
      v50 = *(_QWORD *)(v35[6] + v49);
      v43 = *(double *)(v35[7] + v49);
      if (v11)
      {
        v51 = *(_QWORD *)&v2->align;
        v52 = (uint64_t)v2[1].offs;
        sub_10000D648(v2, v51);
        v53 = v11;
        v54 = sub_100006C78(v51, v52);
        v56 = *(_QWORD *)&v2->align;
        v55 = v2[1].offs;
        sub_10000D648(v2, v56);
        v57 = (void *)(*((uint64_t (**)(uint64_t, int32_t *))v55 + 1))(v56, v55);
        v59 = v58;
        v60 = (char *)objc_msgSend(v57, "deviceInfoIntegerValueForKey:", v92);

        if ((unint64_t)(v60 - 1) < 7)
          v41 = qword_1000415D0[(_QWORD)(v60 - 1)];
        else
          v41 = -1;

        v42 = objc_msgSend(v53, "statusBarForcedHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:", v50, v54, v41);
        if (v42)
          v43 = 0.0;
        v11 = v94;
      }
      a1 = v96;
      objc_msgSend(v96, "setDefaultStatusBarHeight:forOrientation:", v50, v43, v91);
      continue;
    }
    break;
  }
  v46 = v40 + 1;
  if (__OFADD__(v40, 1))
  {
    __break(1u);
    goto LABEL_68;
  }
  if (v46 >= v95)
    goto LABEL_62;
  v47 = *(_QWORD *)&v93[8 * v46];
  ++v40;
  if (v47)
    goto LABEL_35;
  v40 = v46 + 1;
  if (v46 + 1 >= v95)
    goto LABEL_62;
  v47 = *(_QWORD *)&v93[8 * v40];
  if (v47)
    goto LABEL_35;
  v40 = v46 + 2;
  if (v46 + 2 >= v95)
    goto LABEL_62;
  v47 = *(_QWORD *)&v93[8 * v40];
  if (v47)
  {
LABEL_35:
    v39 = (v47 - 1) & v47;
    v45 = __clz(__rbit64(v47)) + (v40 << 6);
    goto LABEL_36;
  }
  v48 = v46 + 3;
  if (v48 < v95)
  {
    v47 = *(_QWORD *)&v93[8 * v48];
    if (!v47)
    {
      while (1)
      {
        v40 = v48 + 1;
        if (__OFADD__(v48, 1))
          goto LABEL_69;
        if (v40 >= v95)
          goto LABEL_62;
        v47 = *(_QWORD *)&v93[8 * v40];
        ++v48;
        if (v47)
          goto LABEL_35;
      }
    }
    v40 = v48;
    goto LABEL_35;
  }
LABEL_62:
  swift_release(v35);
  if (!v11)
    goto LABEL_64;
  v76 = v11;
  v77 = sub_100031F20();
  v78 = *(_QWORD *)&v2->align;
  v79 = (uint64_t)v2[1].offs;
  sub_10000D648(v2, v78);
  v80 = sub_100006C78(v78, v79);
  v81 = *(_QWORD *)&v2->align;
  v82 = v2[1].offs;
  sub_10000D648(v2, v81);
  v83 = (*((uint64_t (**)(uint64_t, int32_t *))v82 + 1))(v81, v82);
  v85 = v84;
  v86 = sub_10000708C((void *)v83);

  LOBYTE(v83) = objc_msgSend(v76, "statusBarHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:", v77, v80, v86);
  v87 = 0.0;
  if ((v83 & 1) == 0)
LABEL_64:
    objc_msgSend(a1, "defaultStatusBarHeightForOrientation:", sub_100031F20());
  objc_msgSend(a1, "setStatusBarHeight:", v87, v91);

  v88 = type metadata accessor for PreviewTraits.Orientation(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v88 - 8) + 8))(v91, v88);
}

id sub_100033028(void *a1)
{
  void *v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;

  v3 = objc_msgSend(v1, "safeAreaInsetsPortrait");
  v4 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(a1, "setSafeAreaInsetsPortrait:", v4, v6, v8, v10);
  v11 = objc_msgSend(v1, "peripheryInsets");
  v12 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(a1, "setPeripheryInsets:", v12, v14, v16, v18);
  v19 = objc_msgSend(v1, "homeAffordanceOverlayAllowance");
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v19, "doubleValue");
    v22 = v21;

  }
  else
  {
    v22 = 0.0;
  }
  return objc_msgSend(a1, "setHomeAffordanceOverlayAllowance:", v22);
}

_QWORD *sub_100033150()
{
  _QWORD *result;

  result = sub_10003316C();
  off_1000609A8 = result;
  return result;
}

_QWORD *sub_10003316C()
{
  unint64_t v0;
  void *ObjCClassFromMetadata;
  unint64_t v2;
  Swift::UInt v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v7;
  unint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *result;
  uint64_t v20;

  v0 = sub_1000334F0();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v0);
  v2 = 0;
  while (v2 < 4)
  {
    v3 = (Swift::UInt)*(&off_100051E60 + v2 + 4);
    objc_msgSend(ObjCClassFromMetadata, "heightForStyle:orientation:", 0, v3);
    v5 = v4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
    v8 = sub_100007F08(v3);
    v9 = _swiftEmptyDictionarySingleton[2];
    v10 = (v7 & 1) == 0;
    v11 = v9 + v10;
    if (__OFADD__(v9, v10))
      goto LABEL_18;
    v12 = v7;
    if (_swiftEmptyDictionarySingleton[3] >= v11)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v7 & 1) != 0)
          goto LABEL_2;
      }
      else
      {
        sub_10000BD70();
        if ((v12 & 1) != 0)
          goto LABEL_2;
      }
    }
    else
    {
      sub_100009B4C(v11, isUniquelyReferenced_nonNull_native);
      v13 = sub_100007F08(v3);
      if ((v12 & 1) != (v14 & 1))
        goto LABEL_20;
      v8 = v13;
      if ((v12 & 1) != 0)
      {
LABEL_2:
        *(_QWORD *)(_swiftEmptyDictionarySingleton[7] + 8 * v8) = v5;
        goto LABEL_3;
      }
    }
    _swiftEmptyDictionarySingleton[(v8 >> 6) + 8] |= 1 << v8;
    v15 = 8 * v8;
    *(_QWORD *)(_swiftEmptyDictionarySingleton[6] + v15) = v3;
    *(_QWORD *)(_swiftEmptyDictionarySingleton[7] + v15) = v5;
    v16 = _swiftEmptyDictionarySingleton[2];
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (v17)
      goto LABEL_19;
    _swiftEmptyDictionarySingleton[2] = v18;
LABEL_3:
    ++v2;
    swift_bridgeObjectRelease(0x8000000000000000);
    if (v2 == 4)
      return _swiftEmptyDictionarySingleton;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  type metadata accessor for UIInterfaceOrientation(0);
  result = (_QWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v20);
  __break(1u);
  return result;
}

void sub_100033328(void *a1, void (*a2)(uint64_t), uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = objc_opt_self(UVMutablePreviewSceneSettings);
  v8 = swift_dynamicCastObjCClass(a1, v7);
  if (v8)
  {
    v9 = v8;
    v10 = a1;
    a2(v9);

    *a4 = 1;
  }
}

uint64_t sub_10003339C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_1000333AC(void *a1)
{
  uint64_t v1;

  sub_100033328(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE **)(v1 + 32));
}

uint64_t sub_1000333B8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000333C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000333D8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_1000333E0(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v9 = objc_opt_self(UVMutablePreviewSceneSettings);
  v10 = swift_dynamicCastObjCClass(a1, v9);
  if (v10)
  {
    v11 = v10;
    v12 = a1;
    a3(v11, a2);

    *a5 = 1;
  }
}

void sub_10003345C(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

uint64_t sub_1000334B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_100060A58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000334F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100060A60;
  if (!qword_100060A60)
  {
    v1 = objc_opt_self(UIStatusBar);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100060A60);
  }
  return result;
}

uint64_t sub_10003352C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_10003353C(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000333E0(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE **)(v2 + 32));
}

uint64_t sub_100033548()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000335E0(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  __int128 v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  result = __chkstk_darwin(v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
  if (v8)
    v9 = v8 == a1;
  else
    v9 = 0;
  if (v9)
  {
    static Logger.uv.getter(result);
    v10 = v1;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v32 = a1;
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      v36 = v31;
      *(_DWORD *)v13 = 136446210;
      v33 = v10;
      v14 = type metadata accessor for SceneDelegate();
      v30 = v10;
      v15 = sub_100006658(&qword_100060C40);
      if (!swift_dynamicCast(v34, &v33, v14, v15, 6))
      {

        goto LABEL_14;
      }
      v29 = v13 + 4;
      sub_10000C5DC(v34, (uint64_t)&v37);
      v17 = v39;
      v16 = v40;
      sub_10000D648(&v37, v39);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v17, v16);
      v20 = v19;
      sub_10000D6B0(&v37);
      v37 = sub_100010F78(v18, v20, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v29);
      v21 = v30;

      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s will enter foreground", v13, 0xCu);
      v22 = v31;
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      a1 = v32;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    v36 = (uint64_t)v10;
    v23 = type metadata accessor for SceneDelegate();
    v24 = v10;
    v25 = sub_100006658(&qword_100060C40);
    if (swift_dynamicCast(v34, &v36, v23, v25, 6))
    {
      sub_10000C5DC(v34, (uint64_t)&v37);
      v26 = v39;
      v27 = v40;
      sub_10000D648(&v37, v39);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 24))(a1, v26, v27);
      return sub_10000D6B0(&v37);
    }
LABEL_14:
    v35 = 0;
    memset(v34, 0, sizeof(v34));
    sub_1000378E8((uint64_t)v34);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000059, 0x8000000100048200, "PreviewShell/SceneDelegate.swift", 32, 2, 22, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_100033974(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  __int128 v25[2];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  result = __chkstk_darwin(v3);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
  if (v8)
    v9 = v8 == a1;
  else
    v9 = 0;
  if (v9)
  {
    static Logger.uv.getter(result);
    v10 = v1;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v32 = v24;
      *(_DWORD *)v13 = 136446210;
      v27 = v10;
      v14 = type metadata accessor for SceneDelegate();
      v23 = v10;
      v15 = sub_100006658(&qword_100060C40);
      if (!swift_dynamicCast(v25, &v27, v14, v15, 6))
      {

        v26 = 0;
        memset(v25, 0, sizeof(v25));
        sub_1000378E8((uint64_t)v25);
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000059, 0x8000000100048200, "PreviewShell/SceneDelegate.swift", 32, 2, 22, 0);
        __break(1u);
        return result;
      }
      sub_10000C5DC(v25, (uint64_t)&v28);
      v17 = v30;
      v16 = v31;
      sub_10000D648(&v28, v30);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v17, v16);
      v20 = v19;
      sub_10000D6B0(&v28);
      v28 = sub_100010F78(v18, v20, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v13 + 4);
      v21 = v23;

      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s did enter background", v13, 0xCu);
      v22 = v24;
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v13, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

uint64_t sub_100033C78(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  __int128 v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  result = __chkstk_darwin(v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&v1[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
  if (v8)
    v9 = v8 == a1;
  else
    v9 = 0;
  if (v9)
  {
    static Logger.uv.getter(result);
    v10 = v1;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v32 = a1;
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      v36 = v31;
      *(_DWORD *)v13 = 136446210;
      v33 = v10;
      v14 = type metadata accessor for SceneDelegate();
      v30 = v10;
      v15 = sub_100006658(&qword_100060C40);
      if (!swift_dynamicCast(v34, &v33, v14, v15, 6))
      {

        goto LABEL_14;
      }
      v29 = v13 + 4;
      sub_10000C5DC(v34, (uint64_t)&v37);
      v17 = v39;
      v16 = v40;
      sub_10000D648(&v37, v39);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v17, v16);
      v20 = v19;
      sub_10000D6B0(&v37);
      v37 = sub_100010F78(v18, v20, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v29);
      v21 = v30;

      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s did disconnect", v13, 0xCu);
      v22 = v31;
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      a1 = v32;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    v36 = (uint64_t)v10;
    v23 = type metadata accessor for SceneDelegate();
    v24 = v10;
    v25 = sub_100006658(&qword_100060C40);
    if (swift_dynamicCast(v34, &v36, v23, v25, 6))
    {
      sub_10000C5DC(v34, (uint64_t)&v37);
      v26 = v39;
      v27 = v40;
      sub_10000D648(&v37, v39);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 40))(a1, v26, v27);
      return sub_10000D6B0(&v37);
    }
LABEL_14:
    v35 = 0;
    memset(v34, 0, sizeof(v34));
    sub_1000378E8((uint64_t)v34);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000059, 0x8000000100048200, "PreviewShell/SceneDelegate.swift", 32, 2, 22, 0);
    __break(1u);
  }
  return result;
}

id sub_100034110()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC12PreviewShell13SceneDelegate);
}

uint64_t sub_1000341DC(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char *v23;
  uint64_t v24;
  _QWORD v26[5];

  v3 = v2;
  v6 = (objc_class *)type metadata accessor for MainViewController(0);
  v7 = objc_msgSend(objc_allocWithZone(v6), "init");
  v26[3] = v6;
  v26[4] = sub_100006618(&qword_100060BF8, type metadata accessor for MainViewController, (uint64_t)&unk_100040CE8);
  v26[0] = v7;
  v8 = type metadata accessor for MainScene(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v9 = a1;
  v10 = (char *)v7;
  v11 = a2;
  v12 = sub_10003A6B4(v9, (uint64_t)v26, (uint64_t)v11);

  if (qword_10005ECD0 != -1)
    swift_once(&qword_10005ECD0, sub_10001F594);
  v13 = qword_1000641A0;
  v14 = swift_retain(v12);
  v15 = sub_100035A78(v14, v13);
  swift_release(v12);
  v16 = *(_QWORD *)&v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas];
  *(_QWORD *)&v10[OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas] = v15;
  swift_retain_n(v15, 2);
  swift_release(v16);
  sub_10001FA14();
  swift_release(v15);
  v17 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v9);
  sub_100037928(0, &qword_100060C00, UIColor_ptr);
  v18 = v17;
  v19 = (void *)static UIColor.shellTintColor.getter();
  objc_msgSend(v18, "setTintColor:", v19);

  objc_msgSend(v18, "setRootViewController:", v10);
  objc_msgSend(v18, "makeKeyAndVisible");
  v20 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window) = v18;
  v21 = v18;

  v22 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController) = v10;
  v23 = v10;

  v24 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene) = v12;
  swift_retain(v12);
  swift_release(v24);
  if ((unint64_t)objc_msgSend(v9, "activationState") <= 1)
    sub_10003663C();
  swift_release(v12);

  return swift_release(v15);
}

void sub_10003445C(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v5 = type metadata accessor for SceneSettingsUpdate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a2, "animationFence");

  if (v9)
  {
    v10 = objc_msgSend(a2, "animationSettings");

    if (!v10 && a2 != 0)
    {
      v12 = objc_msgSend((id)objc_opt_self(BSAnimationSettings), "settingsWithDuration:", 0.3);
      objc_msgSend(a2, "setAnimationSettings:", v12);

    }
  }
  v13 = objc_msgSend(a1, "copyRemovingTargetOfEventDeferringEnvironments");
  v14 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene);
  if (v14)
  {
    v23 = v13;
    v15 = objc_allocWithZone((Class)PSSceneSettings);
    swift_retain(v14);
    v16 = objc_msgSend(v15, "initWithSettings:", v23);
    v17 = a2;
    v18 = SceneSettingsUpdate.init(sceneSettings:transitionContext:)(v16, a2);
    v19 = SceneSettingsUpdate.sceneSettings.getter(v18);
    v20 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v19;

    v21 = *(_QWORD *)(v14 + 24);
    swift_retain(v21);
    EventStream.Sink.send(_:)(v8);
    swift_release(v21);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_release(v14);

  }
  else
  {

  }
}

uint64_t sub_100034640(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v15;

  v8 = type metadata accessor for SceneSettingsUpdate(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(objc_allocWithZone((Class)PSSceneSettings), "initWithSettings:", a1);
  v13 = a2;
  SceneSettingsUpdate.init(sceneSettings:transitionContext:)(v12, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 40))(v11, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100034774()
{
  uint64_t v0;

  return swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene));
}

uint64_t type metadata accessor for DeviceMainSceneDelegate()
{
  return objc_opt_self(_TtC12PreviewShell23DeviceMainSceneDelegate);
}

unint64_t sub_100034818()
{
  return 0xD000000000000011;
}

uint64_t sub_100034834(void *a1, void *a2)
{
  return sub_1000341DC(a1, a2);
}

void sub_100034854()
{
  sub_10003663C();
}

void sub_100034874(void *a1, void *a2)
{
  sub_10003445C(a1, a2);
}

uint64_t sub_100034894()
{
  return sub_100037084();
}

void sub_1000348F8(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v3 = v2;
  v6 = type metadata accessor for MainScene(0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  v7 = a1;
  v8 = a2;
  v9 = sub_10003A6B4(v7, (uint64_t)&v18, (uint64_t)v8);

  if (qword_10005ECD0 != -1)
    swift_once(&qword_10005ECD0, sub_10001F594);
  v10 = qword_1000641A0;
  v11 = swift_retain(v9);
  v12 = sub_100035A78(v11, v10);
  swift_release(v9);
  v13 = objc_allocWithZone((Class)UIWindow);
  v14 = objc_msgSend(v13, "initWithWindowScene:", v7, v18, v19, v20);
  objc_msgSend(v14, "setRootViewController:", *(_QWORD *)(v12 + 24));
  v15 = v14;
  objc_msgSend(v15, "setHidden:", 0);

  swift_release(v12);
  v16 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene) = v9;
  swift_release(v16);
  v17 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window) = v15;

}

uint64_t sub_100034A4C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = type metadata accessor for SceneSettingsUpdate(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
  if (v10)
  {
    v11 = objc_allocWithZone((Class)PSSceneSettings);
    swift_retain(v10);
    v12 = objc_msgSend(v11, "initWithSettings:", a1);
    v13 = a2;
    v14 = SceneSettingsUpdate.init(sceneSettings:transitionContext:)(v12, a2);
    v15 = SceneSettingsUpdate.sceneSettings.getter(v14);
    v16 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v15;

    v17 = *(_QWORD *)(v10 + 24);
    swift_retain(v17);
    EventStream.Sink.send(_:)(v9);
    swift_release(v17);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return swift_release(v10);
  }
  return result;
}

uint64_t sub_100034B70()
{
  return sub_100035350(&OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window, &OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
}

uint64_t type metadata accessor for SimulatorMainSceneDelegate()
{
  return objc_opt_self(_TtC12PreviewShell26SimulatorMainSceneDelegate);
}

unint64_t sub_100034BB8()
{
  return 0xD000000000000014;
}

void sub_100034BD4(void *a1, void *a2)
{
  sub_1000348F8(a1, a2);
}

uint64_t sub_100034BF4(uint64_t a1, void *a2)
{
  return sub_100034A4C(a1, a2);
}

uint64_t sub_100034C14()
{
  return sub_100037414();
}

uint64_t sub_100034C80()
{
  uint64_t v0;

  return swift_unknownObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene));
}

uint64_t type metadata accessor for LocalSceneDelegate()
{
  return objc_opt_self(_TtC12PreviewShell18LocalSceneDelegate);
}

uint64_t sub_100034CC4(uint64_t result, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;

  v3 = (_QWORD *)(*v2 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  v4 = *v3;
  if (*v3)
  {
    v6 = result;
    v7 = v3[1];
    ObjectType = swift_getObjectType(*v3);
    v9 = *(_QWORD *)(v7 + 8);
    swift_unknownObjectRetain(v4);
    sub_100034640(v6, a2, ObjectType, v9);
    return swift_unknownObjectRelease(v4);
  }
  return result;
}

uint64_t sub_100034D54()
{
  return sub_100036F74();
}

void sub_100034DB8(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;

  v3 = v2;
  v6 = objc_msgSend(a1, "_sceneIdentifier");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  v10 = type metadata accessor for HostInjectedScene(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = a1;
  v12 = sub_100038C14(v7, v9, v11, a2);
  if (qword_10005ECD0 != -1)
    swift_once(&qword_10005ECD0, sub_10001F594);
  v13 = qword_1000641A0;
  v14 = swift_retain(v12);
  v15 = sub_100035490(v14, v13);
  swift_release(v12);
  v16 = objc_msgSend(objc_allocWithZone((Class)UVInjectedSceneWindow), "initWithWindowScene:", v11);
  objc_msgSend(v16, "setHidden:", 0);
  v17 = *(void **)(v15 + 24);
  v18 = v16;
  v19 = v17;
  objc_msgSend(v18, "setRootViewController:", v19);

  swift_release(v15);
  v20 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene) = v12;
  swift_release(v20);
  v21 = *(void **)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window) = v18;

}

uint64_t sub_100034F2C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = type metadata accessor for SceneSettingsUpdate(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene);
  if (v10)
  {
    v11 = objc_allocWithZone((Class)PSSceneSettings);
    swift_retain(v10);
    v12 = objc_msgSend(v11, "initWithSettings:", a1);
    v13 = a2;
    v14 = SceneSettingsUpdate.init(sceneSettings:transitionContext:)(v12, a2);
    v15 = SceneSettingsUpdate.sceneSettings.getter(v14);
    v16 = *(void **)(v10 + 56);
    *(_QWORD *)(v10 + 56) = v15;

    v17 = *(_QWORD *)(v10 + 24);
    swift_retain(v17);
    EventStream.Sink.send(_:)(v9);
    swift_release(v17);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return swift_release(v10);
  }
  return result;
}

uint64_t sub_10003503C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  _QWORD v26[3];

  v2 = v1;
  v4 = OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window;
  v5 = *(void **)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window);
  if (v5)
  {
    objc_msgSend(v5, "setHidden:", 1);
    v6 = *(void **)(v2 + v4);
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v2 + v4) = 0;

  v7 = OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene;
  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene))
  {
    v26[0] = *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene);
    v8 = type metadata accessor for HostInjectedScene(0);
    v9 = sub_100006618(&qword_100060C28, type metadata accessor for HostInjectedScene, (uint64_t)&unk_1000419BC);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneDelegate.swift", 109, 2, 316, 38, "handleSceneDisconnect(_:)", 25, 2, v8, v9);
    v10 = *(_QWORD *)(v2 + v7);
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(v2 + v7) = 0;
  swift_release(v10);
  if (qword_10005ECD0 != -1)
    swift_once(&qword_10005ECD0, sub_10001F594);
  v11 = qword_1000641A0;
  v12 = objc_msgSend(a1, "_sceneIdentifier");
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  v16 = v11 + 16;
  swift_beginAccess(v11 + 16, v26, 32, 0);
  v17 = *(_QWORD *)(v11 + 16);
  if (*(_QWORD *)(v17 + 16))
  {
    swift_bridgeObjectRetain(v15);
    v18 = sub_100007DF0(v13, v15);
    if ((v19 & 1) != 0)
    {
      v20 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v18);
      swift_endAccess(v26);
      swift_retain(v20);
      swift_bridgeObjectRelease(v15);
      v26[0] = v20;
      v21 = type metadata accessor for HostedPreviewCanvas();
      v22 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
      LOBYTE(v25) = 2;
      Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 68, 30, "unregister(identity:)", 21, v25, v21, v22);
      swift_beginAccess(v16, v26, 33, 0);
      swift_bridgeObjectRetain(v15);
      v23 = sub_1000086B4(v13, v15);
      swift_endAccess(v26);
      swift_release(v20);
      swift_bridgeObjectRelease_n(v15, 2);
      return swift_release(v23);
    }
    swift_bridgeObjectRelease(v15);
  }
  swift_endAccess(v26);
  return swift_bridgeObjectRelease(v15);
}

id sub_1000352E0(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  objc_class *ObjectType;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(a1);
  *(_QWORD *)&a1[*a3] = 0;
  *(_QWORD *)&a1[*a4] = 0;
  v9.receiver = a1;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_10003533C()
{
  return sub_100035350(&OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_window, &OBJC_IVAR____TtC12PreviewShell21InjectedSceneDelegate_previewShellScene);
}

uint64_t sub_100035350(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return swift_release(*(_QWORD *)(v2 + *a2));
}

uint64_t sub_100035394(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{

  return swift_release(*(_QWORD *)(a1 + *a4));
}

uint64_t type metadata accessor for InjectedSceneDelegate()
{
  return objc_opt_self(_TtC12PreviewShell21InjectedSceneDelegate);
}

void sub_1000353EC(void *a1, void *a2)
{
  sub_100034DB8(a1, a2);
}

uint64_t sub_10003540C(uint64_t a1, void *a2)
{
  return sub_100034F2C(a1, a2);
}

uint64_t sub_10003542C(void *a1)
{
  return sub_10003503C(a1);
}

uint64_t sub_10003544C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
    v2 = *(_QWORD *)(v0 + 32);
  else
    v2 = 1852399981;
  swift_bridgeObjectRetain(v1);
  return v2;
}

uint64_t sub_100035490(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  uint64_t v56;

  v4 = type metadata accessor for Logger(0);
  v53 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006618(&qword_100060C30, type metadata accessor for HostInjectedScene, (uint64_t)&unk_100041AC8);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  swift_beginAccess(a2 + 16, &v54, 32, 0);
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_QWORD *)(v10 + 16);
  swift_bridgeObjectRetain(v9);
  if (v11)
  {
    swift_bridgeObjectRetain(v9);
    v12 = sub_100007DF0(v8, v9);
    if ((v13 & 1) != 0)
    {
      v14 = *(uint64_t **)(*(_QWORD *)(v10 + 56) + 8 * v12);
      swift_endAccess(&v54);
      swift_retain(v14);
      swift_bridgeObjectRelease_n(v9, 2);
      assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 48, 30, "register(scene:)", 16, 2);
      return (uint64_t)v14;
    }
    swift_bridgeObjectRelease(v9);
  }
  v50 = v4;
  v51 = a2 + 16;
  v52 = v8;
  v15 = swift_endAccess(&v54);
  static Logger.uv.getter(v15);
  v16 = swift_bridgeObjectRetain_n(v9, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter(v17);
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(12, -1);
    v49 = v7;
    v20 = (uint8_t *)v19;
    v48 = swift_slowAlloc(32, -1);
    v56 = v48;
    *(_DWORD *)v20 = 136446210;
    v47 = v20 + 4;
    v21 = v52;
    v54 = v52;
    v55[0] = v9;
    swift_bridgeObjectRetain(v9);
    v22 = String.init<A>(describing:)(&v54, &type metadata for InjectedSceneIdentity);
    v24 = v23;
    v54 = sub_100010F78(v22, v23, &v56);
    v25 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v47);
    swift_bridgeObjectRelease_n(v9, 2);
    swift_bridgeObjectRelease(v24);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "registering injected scene '%{public}s'", v20, 0xCu);
    v26 = v48;
    swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    v27 = v20;
    v7 = v49;
    swift_slowDealloc(v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v6, v50);
  }
  else
  {

    swift_bridgeObjectRelease_n(v9, 2);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v6, v50);
    v25 = v52;
  }
  v28 = type metadata accessor for HostedPreviewCanvas();
  v29 = (uint64_t *)swift_allocObject(v28, 112, 7);
  v30 = swift_retain(a1);
  v14 = sub_100035FF4(v30, v29);
  swift_release(a1);
  swift_weakAssign(a1 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene_canvas, v14);
  v54 = (uint64_t)v14;
  v31 = swift_allocObject(&unk_100053D40, 32, 7);
  *(_QWORD *)(v31 + 16) = a1;
  *(_QWORD *)(v31 + 24) = v7;
  v32 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
  swift_retain(a1);
  Invalidatable.onInvalidation(_:)(sub_100037960, v31, v28, v32);
  swift_release(v31);
  swift_beginAccess(v51, &v54, 33, 0);
  swift_bridgeObjectRetain(v9);
  swift_retain(v14);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(a2 + 16));
  v56 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0x8000000000000000;
  sub_10000AED8((uint64_t)v14, v25, v9, isUniquelyReferenced_nonNull_native);
  v34 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v56;
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v34);
  swift_endAccess(&v54);
  v35 = a2 + 24;
  swift_beginAccess(a2 + 24, &v54, 32, 0);
  v36 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(v36 + 16))
  {
    swift_endAccess(&v54);
LABEL_26:
    swift_beginAccess(v35, &v54, 33, 0);
    v45 = sub_1000084AC(v25, v9);
    swift_endAccess(&v54);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v45);
    return (uint64_t)v14;
  }
  swift_bridgeObjectRetain(v9);
  v37 = sub_100007DF0(v25, v9);
  if ((v38 & 1) == 0)
  {
    swift_endAccess(&v54);
    swift_bridgeObjectRelease(v9);
    goto LABEL_26;
  }
  v39 = *(_QWORD *)(*(_QWORD *)(v36 + 56) + 8 * v37);
  swift_endAccess(&v54);
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRelease(v9);
  if (!((unint64_t)v39 >> 62))
  {
    v40 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v39);
    if (v40)
      goto LABEL_12;
    goto LABEL_25;
  }
  if (v39 < 0)
    v44 = v39;
  else
    v44 = v39 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v39);
  result = _CocoaArrayWrapper.endIndex.getter(v44);
  v40 = result;
  if (!result)
  {
LABEL_25:
    swift_bridgeObjectRelease_n(v39, 2);
    goto LABEL_26;
  }
LABEL_12:
  v51 = v35;
  v53 = v9;
  if (v40 >= 1)
  {
    v42 = 0;
    do
    {
      if ((v39 & 0xC000000000000001) != 0)
      {
        v43 = specialized _ArrayBuffer._getElementSlowPath(_:)(v42, v39);
      }
      else
      {
        v43 = *(_QWORD *)(v39 + 8 * v42 + 32);
        swift_retain(v43);
      }
      ++v42;
      v55[2] = v28;
      v55[3] = sub_100006618((unint64_t *)&qword_100060C10, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_10004019C);
      v54 = (uint64_t)v14;
      swift_retain(v14);
      Promise.succeed(with:)(&v54);
      sub_10000D6B0(&v54);
      swift_release(v43);
    }
    while (v40 != v42);
    swift_bridgeObjectRelease_n(v39, 2);
    v25 = v52;
    v9 = v53;
    v35 = v51;
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_100035A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  uint64_t v49;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006618(&qword_100060C08, type metadata accessor for MainScene, (uint64_t)&unk_1000419A0);
  v9 = a2 + 16;
  swift_beginAccess(a2 + 16, &v47, 32, 0);
  v10 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(v10 + 16))
  {
    v11 = sub_100007DF0(0, 0);
    if ((v12 & 1) != 0)
    {
      v13 = *(uint64_t **)(*(_QWORD *)(v10 + 56) + 8 * v11);
      swift_endAccess(&v47);
      swift_retain(v13);
      assertUnreachable(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 48, 30, "register(scene:)", 16, 2);
      return (uint64_t)v13;
    }
  }
  v14 = swift_endAccess(&v47);
  v15 = static Logger.uv.getter(v14);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v44 = v4;
    v18 = swift_slowAlloc(12, -1);
    v45 = v8;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc(32, -1);
    v49 = v20;
    v46 = a2 + 16;
    v47 = 0;
    *(_DWORD *)v19 = 136446210;
    v43 = v5;
    v48[0] = 0;
    v21 = String.init<A>(describing:)(&v47, &type metadata for InjectedSceneIdentity);
    v23 = v22;
    v47 = sub_100010F78(v21, v22, &v49);
    v9 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, v48, v19 + 4);
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "registering injected scene '%{public}s'", v19, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    v24 = v19;
    v8 = v45;
    swift_slowDealloc(v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v44);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v25 = type metadata accessor for HostedPreviewCanvas();
  v26 = (uint64_t *)swift_allocObject(v25, 112, 7);
  v27 = swift_retain(a1);
  v13 = sub_100036334(v27, v26);
  swift_release(a1);
  swift_weakAssign(a1 + OBJC_IVAR____TtC12PreviewShell9MainScene_canvas, v13);
  v47 = (uint64_t)v13;
  v28 = swift_allocObject(&unk_100053D18, 32, 7);
  *(_QWORD *)(v28 + 16) = a1;
  *(_QWORD *)(v28 + 24) = v8;
  v29 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
  swift_retain(a1);
  Invalidatable.onInvalidation(_:)(sub_100037404, v28, v25, v29);
  swift_release(v28);
  swift_beginAccess(v9, &v47, 33, 0);
  swift_retain(v13);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(a2 + 16));
  v49 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0x8000000000000000;
  sub_10000AED8((uint64_t)v13, 0, 0, isUniquelyReferenced_nonNull_native);
  v31 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v49;
  swift_bridgeObjectRelease(v31);
  swift_endAccess(&v47);
  v32 = a2 + 24;
  swift_beginAccess(a2 + 24, &v47, 32, 0);
  v33 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(v33 + 16) || (v34 = sub_100007DF0(0, 0), (v35 & 1) == 0))
  {
    swift_endAccess(&v47);
LABEL_24:
    swift_beginAccess(v32, &v47, 33, 0);
    v42 = sub_1000084AC(0, 0);
    swift_endAccess(&v47);
    swift_bridgeObjectRelease(v42);
    return (uint64_t)v13;
  }
  v36 = *(_QWORD *)(*(_QWORD *)(v33 + 56) + 8 * v34);
  swift_endAccess(&v47);
  if (!((unint64_t)v36 >> 62))
  {
    v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n(v36, 2);
    if (v37)
      goto LABEL_11;
    goto LABEL_23;
  }
  if (v36 < 0)
    v41 = v36;
  else
    v41 = v36 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n(v36, 2);
  result = _CocoaArrayWrapper.endIndex.getter(v41);
  v37 = result;
  if (!result)
  {
LABEL_23:
    swift_bridgeObjectRelease_n(v36, 2);
    goto LABEL_24;
  }
LABEL_11:
  v46 = v32;
  if (v37 >= 1)
  {
    v39 = 0;
    do
    {
      if ((v36 & 0xC000000000000001) != 0)
      {
        v40 = specialized _ArrayBuffer._getElementSlowPath(_:)(v39, v36);
      }
      else
      {
        v40 = *(_QWORD *)(v36 + 8 * v39 + 32);
        swift_retain(v40);
      }
      ++v39;
      v48[2] = v25;
      v48[3] = sub_100006618((unint64_t *)&qword_100060C10, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_10004019C);
      v47 = (uint64_t)v13;
      swift_retain(v13);
      Promise.succeed(with:)(&v47);
      sub_10000D6B0(&v47);
      swift_release(v40);
    }
    while (v37 != v39);
    swift_bridgeObjectRelease_n(v36, 2);
    v32 = v46;
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

uint64_t sub_100035FA0()
{
  return 1852399981;
}

uint64_t sub_100035FB0()
{
  return 0x6373206C61636F6CLL;
}

uint64_t sub_100035FD0()
{
  return 0x64657463656A6E69;
}

uint64_t *sub_100035FF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t ObjectType;
  objc_class *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[6];
  objc_super v30;

  v27 = *a2;
  v28 = type metadata accessor for ExecutionLane(0);
  v26 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v25 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006618(&qword_100060C38, type metadata accessor for HostInjectedScene, (uint64_t)&unk_100041AAC);
  v6 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  a2[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 17, 48, "HostedPreviewCanvas", 19, 2, 0, 0);
  *(_OWORD *)(a2 + 7) = 0u;
  *(_OWORD *)(a2 + 9) = 0u;
  *(_OWORD *)((char *)a2 + 84) = 0u;
  v7 = sub_100006658(&qword_100060C20);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  a2[13] = EventStream.Sink.init()();
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v10 = 0xE400000000000000;
    v9 = 1852399981;
  }
  ObjectType = swift_getObjectType(a1);
  v12 = (objc_class *)type metadata accessor for CanvasViewController(0);
  v13 = (char *)objc_allocWithZone(v12);
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating] = 0;
  v14 = &v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
  v15 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = 0;
  v16 = (uint64_t *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
  *v16 = v9;
  v16[1] = v10;
  v30.receiver = v13;
  v30.super_class = v12;
  swift_bridgeObjectRetain(v8);
  a2[3] = (uint64_t)objc_msgSendSuper2(&v30, "initWithNibName:bundle:", 0, 0);
  v17 = type metadata accessor for CanvasUpdater();
  v18 = (_QWORD *)swift_allocObject(v17, 48, 7);
  v18[2] = 0;
  v18[3] = a1;
  v18[4] = v5;
  v18[5] = _swiftEmptyDictionarySingleton;
  a2[5] = v5;
  a2[6] = (uint64_t)v18;
  a2[4] = a1;
  v29[3] = ObjectType;
  v29[4] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 8);
  v29[5] = a2;
  v29[0] = a1;
  v19 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
  swift_retain_n(a1, 3);
  v20 = v27;
  LOBYTE(v24) = 2;
  Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 35, 31, "init(scene:)", 12, v24, v29, v27, v19);
  v21 = sub_10000D6B0(v29);
  v29[0] = a2;
  v22 = v25;
  static ExecutionLane.main.getter(v21);
  swift_retain(a2);
  Invalidatable.onInvalidation(on:_:)(v22, sub_10003740C, a2, v20, v19);
  swift_release(a2);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
  return a2;
}

uint64_t *sub_100036334(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  objc_class *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[6];
  objc_super v27;

  v4 = *a2;
  v25 = type metadata accessor for ExecutionLane(0);
  v5 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006618(&qword_100060C18, type metadata accessor for MainScene, (uint64_t)&unk_100041974);
  v9 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  v22 = 2;
  a2[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 17, 48, "HostedPreviewCanvas", 19, v22, 0, 0);
  *(_OWORD *)(a2 + 7) = 0u;
  *(_OWORD *)(a2 + 9) = 0u;
  *(_OWORD *)((char *)a2 + 84) = 0u;
  v10 = sub_100006658(&qword_100060C20);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  a2[13] = EventStream.Sink.init()();
  ObjectType = swift_getObjectType(a1);
  v12 = (objc_class *)type metadata accessor for CanvasViewController(0);
  v13 = (char *)objc_allocWithZone(v12);
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating] = 0;
  v14 = &v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
  v15 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(_QWORD *)&v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay] = 0;
  v16 = &v13[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier];
  *(_QWORD *)v16 = 1852399981;
  *((_QWORD *)v16 + 1) = 0xE400000000000000;
  v27.receiver = v13;
  v27.super_class = v12;
  a2[3] = (uint64_t)objc_msgSendSuper2(&v27, "initWithNibName:bundle:", 0, 0);
  v17 = type metadata accessor for CanvasUpdater();
  v18 = (_QWORD *)swift_allocObject(v17, 48, 7);
  v18[2] = 0;
  v18[3] = a1;
  v18[4] = v8;
  v18[5] = _swiftEmptyDictionarySingleton;
  a2[5] = v8;
  a2[6] = (uint64_t)v18;
  a2[4] = a1;
  v26[3] = ObjectType;
  v26[4] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 8) + 8);
  v26[5] = a2;
  v26[0] = a1;
  v19 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
  swift_retain_n(a1, 3);
  LOBYTE(v23) = 2;
  Invalidatable.trackInvalidation(dsoHandle:file:line:column:function:of:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/HostedPreviewCanvas.swift", 115, 2, 35, 31, "init(scene:)", 12, v23, v26, v4, v19);
  v20 = sub_10000D6B0(v26);
  v26[0] = a2;
  static ExecutionLane.main.getter(v20);
  swift_retain(a2);
  Invalidatable.onInvalidation(on:_:)(v7, sub_10003740C, a2, v4, v19);
  swift_release(a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v25);
  return a2;
}

void sub_10003663C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  NSString v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  NSString v16;
  __CFNotificationCenter *v17;
  __CFNotificationCenter *v18;
  __CFString *v19;
  _BYTE *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[0] = type metadata accessor for DispatchScheduler(0);
  __chkstk_darwin(v28[0]);
  v1 = (char *)v28 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self(NSUserDefaults);
  v7 = objc_msgSend(v6, "standardUserDefaults");
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "BOOLForKey:", v8);

  if ((v9 & 1) == 0)
  {
    v11 = static Logger.uv.getter(v10);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter(v12);
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "MainSceneDelegate is coming foreground so make icon visible on the home screen", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v15 = objc_msgSend(v6, "standardUserDefaults", v28[0]);
    v16 = String._bridgeToObjectiveC()();
    objc_msgSend(v15, "setBool:forKey:", 1, v16);

    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    if (v17)
    {
      v18 = v17;
      v19 = (__CFString *)String._bridgeToObjectiveC()();
      CFNotificationCenterPostNotification(v18, v19, 0, 0, 1u);

    }
  }
  v20 = *(_BYTE **)(v28[1] + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
  if (v20)
  {
    if ((v20[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] & 1) == 0)
    {
      v20[OBJC_IVAR____TtC12PreviewShell18MainViewController_isForeground] = 1;
      sub_100037928(0, (unint64_t *)&qword_10005EF70, OS_dispatch_queue_ptr);
      v21 = v20;
      v22 = static OS_dispatch_queue.main.getter();
      DispatchScheduler.init(queue:)(v22);
      v23 = swift_allocObject(&unk_100053CF0, 32, 7);
      *(_QWORD *)(v23 + 16) = 0x4000000000000000;
      *(_QWORD *)(v23 + 24) = v21;
      v24 = type metadata accessor for DelayedInvocation(0);
      swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
      v25 = v21;
      v26 = DelayedInvocation.init<A>(scheduler:callback:)(v1, sub_1000373D4, v23, v28[0], &protocol witness table for DispatchScheduler);
      DelayedInvocation.schedule(delay:)(2.0);
      v27 = *(_QWORD *)&v25[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer];
      *(_QWORD *)&v25[OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer] = v26;

      swift_release(v27);
    }
  }
}

void sub_10003696C(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  os_log_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  Class isa;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  os_log_t v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  char *v70;
  __int128 v71[2];
  uint64_t v72;
  char *v73;
  uint64_t v74;
  _BYTE v75[16];
  uint64_t v76;
  uint64_t v77;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_opt_self(UIWindowScene);
  v10 = swift_dynamicCastObjCClass(a1, v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = a1;
    v13 = objc_msgSend(v12, "_FBSScene");
    v69 = objc_msgSend(v13, "settings");

    v14 = objc_opt_self(UIApplicationSceneSettings);
    v15 = swift_dynamicCastObjCClass(v69, v14);
    if (!v15)
    {

      return;
    }
    v16 = (void *)v15;
    static Logger.uv.getter(v15);
    v17 = v2;
    v18 = a2;
    v19 = (char *)v17;
    v20 = v18;
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, (os_log_type_t)v22))
    {
      v63 = v22;
      v64 = v5;
      v65 = v21;
      v23 = v20;
      v66 = v16;
      v67 = v12;
      v68 = v11;
      v24 = swift_slowAlloc(22, -1);
      v62 = swift_slowAlloc(64, -1);
      v73 = (char *)v62;
      *(_DWORD *)v24 = 136446466;
      v70 = v19;
      v25 = type metadata accessor for SceneDelegate();
      v26 = v19;
      v27 = sub_100006658(&qword_100060C40);
      if (!swift_dynamicCast(v71, &v70, v25, v27, 6))
      {

        goto LABEL_15;
      }
      sub_10000C5DC(v71, (uint64_t)&v74);
      v28 = v76;
      v29 = v77;
      sub_10000D648(&v74, v76);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v28, v29);
      v32 = v31;
      sub_10000D6B0(&v74);
      v74 = sub_100010F78(v30, v32, (uint64_t *)&v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, v75, v24 + 4);

      swift_bridgeObjectRelease(v32);
      *(_WORD *)(v24 + 12) = 2082;
      v33 = objc_msgSend(v23, "persistentIdentifier");
      v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
      v36 = v35;

      v74 = sub_100010F78(v34, v36, (uint64_t *)&v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, v75, v24 + 14);

      swift_bridgeObjectRelease(v36);
      v37 = v65;
      _os_log_impl((void *)&_mh_execute_header, v65, (os_log_type_t)v63, "%{public}s will connect to session %{public}s", (uint8_t *)v24, 0x16u);
      v38 = v62;
      swift_arrayDestroy(v62, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v64);
      v12 = v67;
      v11 = v68;
      v16 = v66;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    v39 = objc_opt_self(UVPreviewSceneSettings);
    v40 = swift_dynamicCastObjCClass(v16, v39);
    if (v40)
    {
      v41 = (id)v40;
      v42 = v69;
    }
    else
    {
      v43 = objc_msgSend(objc_allocWithZone((Class)UVMutablePreviewSceneSettings), "initWithSettings:", v16);
      objc_msgSend(v16, "frame");
      objc_msgSend(v43, "setPreviewMaximumSize:", v44, v45);
      v41 = objc_msgSend(objc_allocWithZone((Class)UVPreviewSceneSettings), "initWithSettings:", v43);

    }
    v46 = *(void **)&v19[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings];
    *(_QWORD *)&v19[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings] = v41;
    v47 = v41;

    v48 = *(void **)&v19[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene];
    *(_QWORD *)&v19[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene] = v11;
    v49 = v12;

    v73 = v19;
    v50 = type metadata accessor for SceneDelegate();
    v51 = v19;
    v52 = sub_100006658(&qword_100060C40);
    if ((swift_dynamicCast(v71, &v73, v50, v52, 6) & 1) != 0)
    {
      sub_10000C5DC(v71, (uint64_t)&v74);
      v53 = v76;
      v54 = v77;
      sub_10000D648(&v74, v76);
      (*(void (**)(void *, id, uint64_t, uint64_t))(v54 + 16))(v11, v47, v53, v54);
      sub_10000D6B0(&v74);
      v55 = sub_100006658(&qword_10005F448);
      v56 = swift_allocObject(v55, 40, 7);
      *(_OWORD *)(v56 + 16) = xmmword_1000401C0;
      *(_QWORD *)(v56 + 32) = v51;
      v74 = v56;
      specialized Array._endMutation()(v56);
      v57 = v74;
      v58 = v51;
      sub_100006658(&qword_100060C60);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v57);
      sub_100037928(0, &qword_100060C68, NSString_ptr);
      v60 = (void *)NSString.init(stringLiteral:)("PreviewShellSettingsObserver", 28, 2);
      objc_msgSend(v11, "_registerSettingsDiffActionArray:forKey:", isa, v60);

      return;
    }
LABEL_15:
    v72 = 0;
    memset(v71, 0, sizeof(v71));
    sub_1000378E8((uint64_t)v71);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000059, 0x8000000100048200, "PreviewShell/SceneDelegate.swift", 32, 2, 22, 0);
    __break(1u);
  }
}

uint64_t sub_100036F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v1 = v0;
  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  if (v3)
  {
    v4 = v2[1];
    ObjectType = swift_getObjectType(v3);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneDelegate.swift", 109, 2, 277, 38, "handleSceneDisconnect(_:)", 25, 2, ObjectType, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 8) + 8) + 8));
    v6 = *v2;
  }
  else
  {
    v6 = 0;
  }
  *v2 = 0;
  v2[1] = 0;
  result = swift_unknownObjectRelease(v6);
  v8 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings);
  if (v8)
  {
    v9 = *v2;
    if (*v2)
    {
      v10 = v2[1];
      v11 = swift_getObjectType(v9);
      v12 = *(_QWORD *)(v10 + 8);
      v13 = v8;
      swift_unknownObjectRetain(v9);
      sub_100034640((uint64_t)v13, 0, v11, v12);

      return swift_unknownObjectRelease(v9);
    }
  }
  return result;
}

uint64_t sub_100037084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  id v29[3];

  v1 = v0;
  v2 = type metadata accessor for InvalidationTrace(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v29[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005ECD0 != -1)
    swift_once(&qword_10005ECD0, sub_10001F594);
  v6 = qword_1000641A0;
  v7 = qword_1000641A0 + 16;
  swift_beginAccess(qword_1000641A0 + 16, v29, 32, 0);
  v8 = *(_QWORD *)(v6 + 16);
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_100007DF0(0, 0), (v10 & 1) != 0))
  {
    v11 = *(void **)(*(_QWORD *)(v8 + 56) + 8 * v9);
    swift_endAccess(v29);
    v29[0] = v11;
    v12 = type metadata accessor for HostedPreviewCanvas();
    v13 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
    swift_retain(v11);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 68, 30, "unregister(identity:)", 21, 2, v12, v13);
    swift_beginAccess(v7, v29, 33, 0);
    v14 = sub_1000086B4(0, 0);
    swift_endAccess(v29);
    swift_release(v11);
    swift_release(v14);
  }
  else
  {
    swift_endAccess(v29);
  }
  v15 = OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window;
  v16 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window);
  if (v16)
  {
    objc_msgSend(v16, "setHidden:", 1);
    v17 = *(void **)(v1 + v15);
  }
  else
  {
    v17 = 0;
  }
  *(_QWORD *)(v1 + v15) = 0;

  v18 = OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController;
  v19 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
  if (v19)
  {
    v29[0] = *(id *)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController);
    static InvalidationTrace.empty.getter(v19);
    v20 = type metadata accessor for MainViewController(0);
    v21 = sub_100006618(&qword_10005FF58, type metadata accessor for MainViewController, (uint64_t)&unk_100040C90);
    AnyInvalidatable.invalidate(file:line:column:function:trace:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneDelegate.swift", 109, 2, 204, 39, "handleSceneDisconnect(_:)", 25, 2, v5, v20, v21);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

    v19 = *(void **)(v1 + v18);
  }
  *(_QWORD *)(v1 + v18) = 0;

  v22 = OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene))
  {
    v29[0] = *(id *)(v1 + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene);
    v23 = type metadata accessor for MainScene(0);
    v24 = sub_100006618(&qword_100060BF0, type metadata accessor for MainScene, (uint64_t)&unk_100041884);
    LOBYTE(v27) = 2;
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneDelegate.swift", 109, 2, 207, 38, "handleSceneDisconnect(_:)", 25, v27, v23, v24);
    v25 = *(_QWORD *)(v1 + v22);
  }
  else
  {
    v25 = 0;
  }
  *(_QWORD *)(v1 + v22) = 0;
  return swift_release(v25);
}

uint64_t sub_1000373B0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000373D4()
{
  uint64_t v0;

  return sub_1000214F4(*(_QWORD *)(v0 + 24), *(double *)(v0 + 16));
}

uint64_t sub_1000373E0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100037404()
{
  uint64_t v0;

  return sub_10001F5C8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10003740C()
{
  return sub_10000C658();
}

uint64_t sub_100037414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  _QWORD v20[3];

  v1 = v0;
  if (qword_10005ECD0 != -1)
    swift_once(&qword_10005ECD0, sub_10001F594);
  v2 = qword_1000641A0;
  v3 = qword_1000641A0 + 16;
  swift_beginAccess(qword_1000641A0 + 16, v20, 32, 0);
  v4 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_100007DF0(0, 0), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_endAccess(v20);
    v20[0] = v7;
    v8 = type metadata accessor for HostedPreviewCanvas();
    v9 = sub_100006618(&qword_10005F388, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewCanvas, (uint64_t)&unk_100040174);
    swift_retain(v7);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/InjectedSceneRegistry.swift", 117, 2, 68, 30, "unregister(identity:)", 21, 2, v8, v9);
    swift_beginAccess(v3, v20, 33, 0);
    v10 = sub_1000086B4(0, 0);
    swift_endAccess(v20);
    swift_release(v7);
    swift_release(v10);
  }
  else
  {
    swift_endAccess(v20);
  }
  v11 = OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window;
  v12 = *(void **)(v1 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window);
  if (v12)
  {
    objc_msgSend(v12, "setHidden:", 1);
    v13 = *(void **)(v1 + v11);
  }
  else
  {
    v13 = 0;
  }
  *(_QWORD *)(v1 + v11) = 0;

  v14 = OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene))
  {
    v20[0] = *(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
    v15 = type metadata accessor for MainScene(0);
    v16 = sub_100006618(&qword_100060BF0, type metadata accessor for MainScene, (uint64_t)&unk_100041884);
    LOBYTE(v19) = 2;
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/SceneDelegate.swift", 109, 2, 249, 38, "handleSceneDisconnect(_:)", 25, v19, v15, v16);
    v17 = *(_QWORD *)(v1 + v14);
  }
  else
  {
    v17 = 0;
  }
  *(_QWORD *)(v1 + v14) = 0;
  return swift_release(v17);
}

void sub_100037644(void *a1, id a2)
{
  char *v2;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26[2];
  __int128 v27;
  uint64_t v28;
  char *v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  if (a2
    && (v4 = objc_msgSend(a2, "copy"),
        _bridgeAnyObjectToAny(_:)(v30),
        swift_unknownObjectRelease(v4),
        v5 = sub_100037928(0, (unint64_t *)&unk_100060C50, FBSSceneTransitionContext_ptr),
        (swift_dynamicCast(v26, v30, (char *)&type metadata for Any + 8, v5, 6) & 1) != 0))
  {
    v6 = v26[0];
    objc_msgSend(v26[0], "setActions:", 0);
    if (!a1)
      goto LABEL_11;
  }
  else
  {
    v6 = 0;
    if (!a1)
    {
LABEL_11:

      return;
    }
  }
  v7 = objc_msgSend(a1, "settings");
  if (!v7)
    goto LABEL_11;
  v8 = v7;
  v9 = objc_opt_self(UIApplicationSceneSettings);
  v10 = swift_dynamicCastObjCClass(v8, v9);
  if (!v10)
  {

    goto LABEL_11;
  }
  v11 = (void *)v10;
  v12 = objc_opt_self(UVPreviewSceneSettings);
  v13 = swift_dynamicCastObjCClass(v11, v12);
  if (v13)
  {
    v14 = (id)v13;
    v15 = v8;
  }
  else
  {
    v16 = objc_msgSend(objc_allocWithZone((Class)UVMutablePreviewSceneSettings), "initWithSettings:", v11);
    objc_msgSend(v11, "frame");
    objc_msgSend(v16, "setPreviewMaximumSize:", v17, v18);
    v14 = objc_msgSend(objc_allocWithZone((Class)UVPreviewSceneSettings), "initWithSettings:", v16);

  }
  v19 = *(void **)&v2[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings];
  *(_QWORD *)&v2[OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings] = v14;
  v20 = v14;

  v29 = v2;
  v21 = type metadata accessor for SceneDelegate();
  v22 = v2;
  v23 = sub_100006658(&qword_100060C40);
  if (swift_dynamicCast(v26, &v29, v21, v23, 6))
  {
    sub_10000C5DC((__int128 *)v26, (uint64_t)v30);
    v24 = v31;
    v25 = v32;
    sub_10000D648(v30, v31);
    (*(void (**)(id, id, uint64_t, uint64_t))(v25 + 32))(v20, v6, v24, v25);

    sub_10000D6B0(v30);
  }
  else
  {
    v28 = 0;
    *(_OWORD *)v26 = 0u;
    v27 = 0u;
    sub_1000378E8((uint64_t)v26);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000059, 0x8000000100048200, "PreviewShell/SceneDelegate.swift", 32, 2, 22, 0);
    __break(1u);
  }
}

uint64_t sub_1000378E8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_100060C48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100037928(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_100037968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = v0;
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = *(id *)(v7 + 80);
  static Logger.uv.getter(v8);
  v9 = v8;
  v10 = swift_retain(v2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, (os_log_type_t)v12))
  {
    v37 = v12;
    v38 = v4;
    v39 = v3;
    v40 = v1;
    v13 = swift_slowAlloc(32, -1);
    v36 = swift_slowAlloc(96, -1);
    v43 = v36;
    *(_DWORD *)v13 = 136315650;
    v14 = *(_QWORD *)(v7 + 24);
    v15 = *(_QWORD *)(v7 + 32);
    swift_bridgeObjectRetain(v15);
    v41 = sub_100010F78(v14, v15, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v13 + 4);
    swift_release(v2);
    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v13 + 12) = 2080;
    v16 = objc_msgSend(v9, "settings");
    v17 = objc_msgSend(v16, "interfaceOrientation");

    v18 = (id)BSInterfaceOrientationDescription(v17);
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

    v41 = sub_100010F78(v19, v21, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v13 + 14);

    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v13 + 22) = 2080;
    v22 = objc_msgSend(v9, "settings");
    objc_msgSend(v22, "frame");

    v24 = (id)BSStringFromCGRect(v23);
    if (!v24)
    {

      __break(1u);
      return;
    }
    v25 = v24;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v28 = v27;

    v41 = sub_100010F78(v26, v28, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v13 + 24);

    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v37, "Snapshotting scene %s with orientation:%s, frame:%s", (uint8_t *)v13, 0x20u);
    v29 = v36;
    swift_arrayDestroy(v36, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
  }
  else
  {

    swift_release(v2);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v30 = objc_msgSend(v9, "createSnapshot");
  if (v30
    && (v31 = v30, v32 = objc_msgSend(v30, "CGImage"), v31, v32))
  {

  }
  else
  {
    v33 = sub_10003AB6C();
    v34 = swift_allocError(&type metadata for SceneSnapshotError, v33, 0, 0);
    *v35 = v9;
    swift_willThrow(v34);
  }
}

unint64_t sub_100037D54(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;

  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease(0xE000000000000000);
  v2 = a1;
  v3 = objc_msgSend(v2, "description");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);

  swift_bridgeObjectRelease(v6);
  return 0xD000000000000020;
}

unint64_t sub_100037E08()
{
  return 0xD00000000000001FLL;
}

unint64_t sub_100037E24()
{
  void **v0;

  return sub_100037D54(*v0);
}

uint64_t sub_100037E2C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003AD50();
  return HumanReadableError.errorDescription.getter(a1, v2);
}

uint64_t sub_100037E54(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003AD50();
  return HumanReadableError.description.getter(a1, v2);
}

uint64_t sub_100037E7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _BYTE v17[24];

  v2 = v1;
  v4 = sub_100006658(&qword_1000610C8);
  v5 = __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v16[-v8];
  v10 = v2 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess(v2 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene____lazy_storage___thumbnailSceneCache, v17, 0, 0);
  sub_100027080(v10, (uint64_t)v9, &qword_1000610C8);
  v11 = type metadata accessor for ThumbnailSceneCache(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(a1, v9, v11);
  sub_10000D718((uint64_t)v9, &qword_1000610C8);
  v13 = sub_100006618(&qword_100061078, type metadata accessor for SimDisplayScene, (uint64_t)&unk_100041C34);
  v14 = swift_retain_n(v2, 2);
  ThumbnailSceneCache.init(in:makeHostingViewController:)(v14, v13, sub_10003AA74, v2);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess(v10, v16, 33, 0);
  sub_10003AAA4((uint64_t)v7, v10);
  return swift_endAccess(v16);
}

uint64_t sub_100038030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  v1 = v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_role;
  v2 = type metadata accessor for PreviewSceneRole(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettingsUpdateSink));

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_findStaticCanvas + 8));
  sub_10000D718(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene____lazy_storage___thumbnailSceneCache, &qword_1000610C8);
  return v0;
}

uint64_t sub_1000380E0()
{
  uint64_t v0;

  sub_100038030();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100038104()
{
  return type metadata accessor for SimDisplayScene(0);
}

uint64_t type metadata accessor for SimDisplayScene(uint64_t a1)
{
  return sub_100011A7C(a1, (uint64_t *)&unk_100060CB0, (uint64_t)&nominal type descriptor for SimDisplayScene);
}

void sub_100038120(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[8];

  v6[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v6[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2 = type metadata accessor for PreviewSceneRole(319);
  if (v3 <= 0x3F)
  {
    v6[2] = *(_QWORD *)(v2 - 8) + 64;
    v6[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v6[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[5] = (char *)&value witness table for () + 64;
    v6[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    sub_1000381D8(319);
    if (v5 <= 0x3F)
    {
      v6[7] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 8, v6, a1 + 80);
    }
  }
}

void sub_1000381D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100060CC0)
  {
    v2 = type metadata accessor for ThumbnailSceneCache(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100060CC0);
  }
}

uint64_t sub_100038230(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = v1;
  v4 = SceneSettingsUpdate.sceneSettings.getter(a1);
  v5 = *(void **)(v2 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettings);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettings) = v4;

  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettingsUpdateSink);
  swift_retain(v6);
  EventStream.Sink.send(_:)(a1);
  return swift_release(v6);
}

unint64_t sub_10003828C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t result;
  unint64_t v5;
  uint64_t v6;

  result = (*(uint64_t (**)(void))(v1 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_findStaticCanvas))();
  if (!v2)
  {
    v5 = result;
    v6 = sub_10002F0A4();
    swift_release(v5);
    a1[3] = (uint64_t)&type metadata for ShellThumbnailFactory;
    result = sub_10003AAEC();
    a1[4] = result;
    *a1 = v6;
  }
  return result;
}

id sub_100038304()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)(v0 + 24) + 104);
}

uint64_t sub_100038310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_role;
  v4 = type metadata accessor for PreviewSceneRole(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_100038354@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *a1 = *(_DWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_display)
                  + OBJC_IVAR____TtC12PreviewShell10SimDisplay_displayID);
  v3 = enum case for HostIdentity.simulator(_:);
  v4 = type metadata accessor for HostIdentity(0);
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a1, v3, v4);
}

id sub_1000383B8()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettings);
}

uint64_t sub_1000383C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_sceneSettingsUpdateSink);
  v2 = swift_retain(v1);
  EventStream.Sink.eventStream.getter(v2);
  return swift_release(v1);
}

uint64_t sub_100038404(uint64_t a1, uint64_t a2)
{
  return sub_1000389F4(a1, a2, (uint64_t)sub_10003ABB0);
}

uint64_t sub_100038410()
{
  _OWORD v1[2];
  uint64_t v2;

  v2 = 0;
  memset(v1, 0, sizeof(v1));
  return SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)(1, 1, v1);
}

uint64_t sub_100038444()
{
  return SceneStoppedStyle.init(snapshotStyle:)(1);
}

void sub_10003844C()
{
  sub_100037968();
}

void *sub_100038460()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_display)
                + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities);
  v2 = v1;
  return v1;
}

void *sub_10003849C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC12PreviewShell15SimDisplayScene_display)
                + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities
                + 8);
  v2 = v1;
  return v1;
}

uint64_t sub_1000384DC()
{
  unint64_t v0;

  v0 = sub_10003AB30();
  return static EventStream.empty.getter(v0);
}

uint64_t sub_100038504@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _BYTE v17[24];

  v2 = v1;
  v4 = sub_100006658(&qword_1000610C8);
  v5 = __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v16[-v8];
  v10 = v2 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess(v2 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache, v17, 0, 0);
  sub_100027080(v10, (uint64_t)v9, &qword_1000610C8);
  v11 = type metadata accessor for ThumbnailSceneCache(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(a1, v9, v11);
  sub_10000D718((uint64_t)v9, &qword_1000610C8);
  v13 = sub_100006618(&qword_100061060, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041B0C);
  v14 = swift_retain_n(v2, 2);
  ThumbnailSceneCache.init(in:makeHostingViewController:)(v14, v13, sub_10003ABB8, v2);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess(v10, v16, 33, 0);
  sub_10003AAA4((uint64_t)v7, v10);
  return swift_endAccess(v16);
}

uint64_t sub_1000386B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = v1;
  v4 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v9 = 2;
  *(_QWORD *)(v1 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellScenes.swift", 107, 2, 184, 48, "LocalStaticScene", 16, v9, 0, 0);
  v5 = sub_100006658(&qword_100061090);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  *(_QWORD *)(v1 + 32) = EventStream.Sink.init()();
  v6 = v1 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache;
  v7 = type metadata accessor for ThumbnailSceneCache(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 40) = objc_msgSend(objc_allocWithZone((Class)PSSceneSettings), "initWithSettings:", *(_QWORD *)(a1 + 120));
  return v2;
}

uint64_t sub_1000387C0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));

  sub_10000D718(v0 + OBJC_IVAR____TtC12PreviewShell16LocalStaticScene____lazy_storage___thumbnailSceneCache, &qword_1000610C8);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100038818()
{
  return type metadata accessor for LocalStaticScene(0);
}

uint64_t type metadata accessor for LocalStaticScene(uint64_t a1)
{
  return sub_100011A7C(a1, qword_100060DA8, (uint64_t)&nominal type descriptor for LocalStaticScene);
}

void sub_100038834(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_1000381D8(319);
  if (v3 <= 0x3F)
  {
    v4[4] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
  }
}

uint64_t sub_1000388C0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 24);
  a1[3] = type metadata accessor for LocalSceneHost(0);
  a1[4] = &off_1000533A0;
  *a1 = v3;
  return swift_retain(v3);
}

uint64_t sub_1000388FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = v1;
  v4 = SceneSettingsUpdate.sceneSettings.getter(a1);
  v5 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v4;

  v6 = *(_QWORD *)(v2 + 32);
  swift_retain(v6);
  EventStream.Sink.send(_:)(a1);
  return swift_release(v6);
}

unint64_t sub_100038948@<X0>(uint64_t *a1@<X8>)
{
  return sub_10003A0C8(a1);
}

uint64_t sub_100038960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 + 88);
  swift_bridgeObjectRetain(*(_QWORD *)(v1 + 96));
  return v2;
}

uint64_t sub_100038990@<X0>(uint64_t a1@<X8>)
{
  return sub_10003A1C4(&enum case for PreviewSceneRole.static(_:), (uint64_t (*)(_QWORD))&type metadata accessor for PreviewSceneRole, a1);
}

uint64_t sub_1000389A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10003A1C4(&enum case for HostIdentity.unknown(_:), (uint64_t (*)(_QWORD))&type metadata accessor for HostIdentity, a1);
}

id sub_1000389B8()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

uint64_t sub_1000389C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = swift_retain(v1);
  EventStream.Sink.eventStream.getter(v2);
  return swift_release(v1);
}

uint64_t sub_1000389F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(_QWORD *)(v3 + 24);
  swift_retain(v5);
  sub_100031000(a3, v5);
  return swift_release(v5);
}

uint64_t sub_100038A58()
{
  return 0;
}

uint64_t sub_100038A60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _BYTE v17[24];

  v2 = v1;
  v4 = sub_100006658(&qword_1000610C8);
  v5 = __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v16[-v8];
  v10 = v2 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess(v2 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache, v17, 0, 0);
  sub_100027080(v10, (uint64_t)v9, &qword_1000610C8);
  v11 = type metadata accessor for ThumbnailSceneCache(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(a1, v9, v11);
  sub_10000D718((uint64_t)v9, &qword_1000610C8);
  v13 = sub_100006618(&qword_100061048, type metadata accessor for HostInjectedScene, (uint64_t)&unk_1000419E4);
  v14 = swift_retain_n(v2, 2);
  ThumbnailSceneCache.init(in:makeHostingViewController:)(v14, v13, sub_10003ABF4, v2);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess(v10, v16, 33, 0);
  sub_10003AAA4((uint64_t)v7, v10);
  return swift_endAccess(v16);
}

_QWORD *sub_100038C14(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;

  v5 = v4;
  v10 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v25 = 2;
  v4[2] = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellScenes.swift", 107, 2, 258, 48, "HostInjectedScene", 17, v25, 0, 0);
  v11 = sub_100006658(&qword_100061090);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  v4[3] = EventStream.Sink.init()();
  v12 = sub_100006658(&qword_1000610A0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v4[10] = EventStream.Sink.init()();
  v13 = (char *)v4 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache;
  v14 = type metadata accessor for ThumbnailSceneCache(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  swift_weakInit((char *)v5 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene_canvas, 0);
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v15 = objc_allocWithZone((Class)PSSceneSettings);
  v16 = a3;
  v5[7] = objc_msgSend(v15, "initWithSettings:", a4);
  v17 = swift_allocObject(&unk_100053FB0, 24, 7);
  *(_QWORD *)(v17 + 16) = v16;
  v18 = sub_100006658(&qword_1000610A8);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  v19 = v16;
  v20 = SceneMessenger.init(actionSender:)(sub_10003A8A4, v17);
  v5[8] = v20;
  swift_retain(v20);
  UIScene.setPreviewSceneActionHandler(_:)(&j___s18PreviewsServicesUI14SceneMessengerC13receiveActionyyAA09UVPreviewdG0CF, v20);
  swift_release(v20);
  v21 = v5[8];
  v22 = type metadata accessor for HostPreferenceResolver();
  v23 = swift_allocObject(v22, 32, 7);
  *(_QWORD *)(v23 + 16) = v21;
  *(_QWORD *)(v23 + 24) = _swiftEmptyDictionarySingleton;
  v5[9] = v23;
  swift_retain_n(v21, 2);
  swift_retain(v5);
  SceneMessenger.messageReceiver.setter(sub_10003A8C8, v5);
  swift_release(v21);

  return v5;
}

void sub_100038E50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t updated;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  int EnumCaseMultiPayload;
  void *v21;
  void *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t Strong;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;

  v45 = a2;
  v3 = sub_100006658(&qword_1000610B0);
  v40 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v40 + 64);
  v5 = __chkstk_darwin(v3);
  v39 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v41 = (uint64_t)&v38 - v6;
  v7 = type metadata accessor for ExecutionLane(0);
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  __chkstk_darwin(v7);
  v42 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateTiming(0);
  v10 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SceneUpdateSeed(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for HostToShellMessage(0);
  __chkstk_darwin(v17);
  v19 = (void **)((char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10003A8CC(a1, (uint64_t)v19);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v19, v17);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v47 = *v19;
      v21 = v47;
      EventStream.Sink.send(_:)(&v47);

    }
    else
    {
      Strong = swift_weakLoadStrong(v46 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene_canvas);
      if (Strong)
      {
        v26 = Strong;
        v27 = sub_10000CF48();
        v28 = v42;
        static ExecutionLane.main.getter(v27);
        v29 = v41;
        sub_100027080(v45, v41, &qword_1000610B0);
        v30 = *(unsigned __int8 *)(v40 + 80);
        v31 = (v30 + 16) & ~v30;
        v32 = swift_allocObject(&unk_100053FD8, v31 + v4, v30 | 7);
        sub_10003A9EC(v29, v32 + v31);
        Future.observeCompletion(on:_:)(v28, sub_10003AA34, v32);
        swift_release(v26);
        swift_release(v27);
        swift_release(v32);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v44);
      }
      else
      {
        v33 = v39;
        sub_100027080(v45, v39, &qword_1000610B0);
        v34 = type metadata accessor for SceneMessageResponder(0);
        v35 = *(_QWORD *)(v34 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) == 1)
        {
          sub_10000D718(v33, &qword_1000610B0);
        }
        else
        {
          v36 = sub_10003A910();
          v37 = swift_allocError(&type metadata for HostInjectedScene.NoCanvasError, v36, 0, 0);
          SceneMessageResponder.reply(error:)();
          swift_errorRelease(v37);
          (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
        }
      }
    }
  }
  else
  {
    v22 = *(void **)((char *)v19 + *(int *)(sub_100006658(&qword_1000610C0) + 48));
    (*(void (**)(char *, void **, uint64_t))(v14 + 32))(v16, v19, v13);
    v23 = v46;
    v24 = (unsigned int *)&enum case for SceneUpdateTiming.async(_:);
    if (v22)
      v24 = (unsigned int *)&enum case for SceneUpdateTiming.fenced(_:);
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *v24, updated);
    sub_100007A0C((uint64_t)v16, (uint64_t)v12);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, updated);
    if (v22)
    {
      objc_msgSend(v22, "applyToScene:", *(_QWORD *)(v23 + 48));
      objc_msgSend(v22, "invalidate");

    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t sub_100039224(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = sub_100006658(&qword_1000610B0);
  __chkstk_darwin(v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v8 = *((unsigned __int8 *)a1 + 8);
  sub_100027080(a2, (uint64_t)v6, &qword_1000610B0);
  v9 = type metadata accessor for SceneMessageResponder(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
    return sub_10000D718((uint64_t)v6, &qword_1000610B0);
  SceneMessageResponder.reply(result:)(v7, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v9);
}

uint64_t sub_100039308()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  swift_release(*(_QWORD *)(v0 + 64));
  swift_release(*(_QWORD *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 80));
  sub_10000D718(v0 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene____lazy_storage___thumbnailSceneCache, &qword_1000610C8);
  swift_weakDestroy(v0 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene_canvas);
  return v0;
}

uint64_t sub_100039384()
{
  uint64_t v0;

  sub_100039308();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000393A8()
{
  return type metadata accessor for HostInjectedScene(0);
}

uint64_t type metadata accessor for HostInjectedScene(uint64_t a1)
{
  return sub_100011A7C(a1, qword_100060E80, (uint64_t)&nominal type descriptor for HostInjectedScene);
}

void sub_1000393C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[10];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = &unk_100041828;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[7] = (char *)&value witness table for Builtin.NativeObject + 64;
  sub_1000381D8(319);
  if (v3 <= 0x3F)
  {
    v4[8] = *(_QWORD *)(v2 - 8) + 64;
    v4[9] = &unk_100041840;
    swift_updateClassMetadata2(a1, 256, 10, v4, a1 + 80);
  }
}

uint64_t sub_100039468(uint64_t a1)
{
  uint64_t v1;

  swift_weakAssign(v1 + OBJC_IVAR____TtC12PreviewShell17HostInjectedScene_canvas, a1);
  return swift_release(a1);
}

uint64_t sub_10003949C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 72);
  a1[3] = type metadata accessor for HostPreferenceResolver();
  a1[4] = &off_100052498;
  *a1 = v3;
  return swift_retain(v3);
}

uint64_t sub_1000394D8(int a1)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for ShellToHostMessage(0);
  __chkstk_darwin(v2);
  v4 = (_DWORD *)((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v4 = a1;
  swift_storeEnumTagMultiPayload(v4, v5, 2);
  SceneMessenger.send(message:)(v4);
  return sub_100007C20((uint64_t)v4);
}

uint64_t sub_10003955C(uint64_t a1, uint64_t a2)
{
  return sub_1000395C0(a1, a2, 4);
}

uint64_t sub_100039564(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = v1;
  v4 = SceneSettingsUpdate.sceneSettings.getter(a1);
  v5 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = v4;

  v6 = *(_QWORD *)(v2 + 24);
  swift_retain(v6);
  EventStream.Sink.send(_:)(a1);
  return swift_release(v6);
}

uint64_t sub_1000395B0(uint64_t a1, uint64_t a2)
{
  return sub_1000395C0(a1, a2, 5);
}

uint64_t sub_1000395B8(uint64_t a1, uint64_t a2)
{
  return sub_1000395C0(a1, a2, 6);
}

uint64_t sub_1000395C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = type metadata accessor for ShellToHostMessage(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload(v6, v7, a3);
  SceneMessenger.send(message:)(v6);
  return sub_100007C20((uint64_t)v6);
}

uint64_t sub_100039640(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for ShellToHostMessage(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SuppressedPresentation(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v4, a1, v5);
  swift_storeEnumTagMultiPayload(v4, v2, 3);
  SceneMessenger.send(message:)(v4);
  return sub_100007C20((uint64_t)v4);
}

id sub_1000396EC()
{
  uint64_t v0;

  return *(id *)(v0 + 48);
}

uint64_t sub_1000396F4@<X0>(uint64_t a1@<X8>)
{
  return sub_10003A1C4((unsigned int *)&enum case for PreviewSceneRole.hosted(_:), (uint64_t (*)(_QWORD))&type metadata accessor for PreviewSceneRole, a1);
}

uint64_t sub_100039708@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v1 + 40);
  if (v3)
  {
    *a1 = *(_QWORD *)(v1 + 32);
    a1[1] = v3;
    v4 = (unsigned int *)&enum case for HostIdentity.injected(_:);
  }
  else
  {
    v4 = (unsigned int *)&enum case for HostIdentity.main(_:);
  }
  v5 = *v4;
  v6 = type metadata accessor for HostIdentity(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(a1, v5, v6);
  return swift_bridgeObjectRetain(v3);
}

id sub_100039778()
{
  uint64_t v0;

  return *(id *)(v0 + 56);
}

uint64_t sub_100039788()
{
  _OWORD v1[2];
  uint64_t v2;

  v2 = 0;
  memset(v1, 0, sizeof(v1));
  return SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)(2, 0, v1);
}

uint64_t sub_1000397BC()
{
  return SceneStoppedStyle.init(snapshotStyle:)(2);
}

uint64_t sub_1000397C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v4;

  v0 = type metadata accessor for Unreachable(0);
  v1 = sub_100006618((unint64_t *)&qword_10005F130, (uint64_t (*)(uint64_t))&type metadata accessor for Unreachable, (uint64_t)&protocol conformance descriptor for Unreachable);
  swift_allocError(v0, v1, 0, 0);
  v4 = 2;
  v2 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD000000000000039, 0x8000000100048490, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellScenes.swift", 107, 2, 235, 26, "takeSnapshot()", 14, v4);
  return swift_willThrow(v2);
}

uint64_t sub_100039890(uint64_t a1)
{
  return EventStream.Sink.eventStream.getter(a1);
}

uint64_t sub_1000398B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _BYTE v17[24];

  v2 = v1;
  v4 = sub_100006658(&qword_1000610C8);
  v5 = __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v16[-v8];
  v10 = v2 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache;
  swift_beginAccess(v2 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache, v17, 0, 0);
  sub_100027080(v10, (uint64_t)v9, &qword_1000610C8);
  v11 = type metadata accessor for ThumbnailSceneCache(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(a1, v9, v11);
  sub_10000D718((uint64_t)v9, &qword_1000610C8);
  v13 = sub_100006618(&qword_100061038, type metadata accessor for MainScene, (uint64_t)&unk_1000418AC);
  v14 = swift_retain_n(v2, 2);
  ThumbnailSceneCache.init(in:makeHostingViewController:)(v14, v13, sub_10003AC6C, v2);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess(v10, v16, 33, 0);
  sub_10003AAA4((uint64_t)v7, v10);
  return swift_endAccess(v16);
}

uint64_t sub_100039A64(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v7;
  id v8;

  v7 = sub_100006618(a3, a4, a5);
  v8 = objc_allocWithZone((Class)type metadata accessor for RemoteContentViewController(0));
  swift_retain(a1);
  swift_retain(a2);
  return sub_100012344(a1, a2, v7);
}

id sub_100039ADC()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v13;

  v2 = objc_msgSend(*(id *)(v0 + 32), "keyWindow");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "uv_createSnapshotImageFromIOSurface");
    if (v4)
    {
      v1 = v4;
    }
    else
    {
      v8 = type metadata accessor for LocalSnapshotError();
      v9 = sub_100006618(&qword_1000610E8, (uint64_t (*)(uint64_t))&type metadata accessor for LocalSnapshotError, (uint64_t)&protocol conformance descriptor for LocalSnapshotError);
      swift_allocError(v8, v9, 0, 0);
      v1 = v10;
      v3 = v3;
      v11 = LocalSnapshotError.init(window:)();
      swift_willThrow(v11);
    }

  }
  else
  {
    v5 = type metadata accessor for Unreachable(0);
    v6 = sub_100006618((unint64_t *)&qword_10005F130, (uint64_t (*)(uint64_t))&type metadata accessor for Unreachable, (uint64_t)&protocol conformance descriptor for Unreachable);
    swift_allocError(v5, v6, 0, 0);
    v13 = 2;
    v7 = Unreachable.init(_:diagnostics:file:line:column:function:)(0xD00000000000003BLL, 0x80000001000484E0, 0, 0, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellScenes.swift", 107, 2, 373, 30, "takeSnapshot()", 14, v13);
    swift_willThrow(v7);
  }
  return v1;
}

uint64_t sub_100039C50()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t Strong;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v22;
  _BYTE v24[24];

  updated = type metadata accessor for SceneUpdateTiming(0);
  v2 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v4 = &v24[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for PreviewPreferences(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = sub_100006658((uint64_t *)&unk_1000607A0);
  __chkstk_darwin(v9);
  v11 = &v24[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  Strong = swift_weakLoadStrong(v0 + OBJC_IVAR____TtC12PreviewShell9MainScene_canvas);
  if (Strong)
  {
    v13 = Strong;
    v14 = (char *)*(id *)(Strong + 24);
    v15 = swift_release(v13);
    v16 = SceneUpdateHandshake.preferences.getter(v15);
    PreviewPreferences.preferredOrientation.getter(v16);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v17 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 0, 1, v17);
    v18 = (uint64_t)&v14[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation];
    swift_beginAccess(&v14[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation], v24, 33, 0);
    sub_10003AC24((uint64_t)v11, v18);
    swift_endAccess(v24);
    objc_msgSend(v14, "setNeedsUpdateOfSupportedInterfaceOrientations");
    sub_10000D718((uint64_t)v11, (uint64_t *)&unk_1000607A0);

  }
  v19 = (void *)SceneUpdateHandshake.fenceHandle.getter(Strong);
  objc_msgSend(v19, "invalidate");

  sub_100006658(&qword_10005F120);
  SceneUpdateHandshake.timing.getter();
  v22 = 2;
  v20 = static Future.succeeded(dsoHandle:file:line:column:function:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellScenes.swift", 107, 2, 401, 26, "resolveHandshake(_:)", 20, v22, v4);
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, updated);
  return v20;
}

uint64_t sub_100039EA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  v1 = v0 + OBJC_IVAR____TtC12PreviewShell9MainScene_sceneCrashedStyle;
  v2 = type metadata accessor for SceneCrashedStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_10000D718(v0 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache, &qword_1000610C8);
  swift_weakDestroy(v0 + OBJC_IVAR____TtC12PreviewShell9MainScene_canvas);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100039F40()
{
  return type metadata accessor for MainScene(0);
}

uint64_t type metadata accessor for MainScene(uint64_t a1)
{
  return sub_100011A7C(a1, qword_100060F80, (uint64_t)&nominal type descriptor for MainScene);
}

void sub_100039F5C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[7];

  v6[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v6[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v6[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v6[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2 = type metadata accessor for SceneCrashedStyle(319);
  if (v3 <= 0x3F)
  {
    v6[4] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000381D8(319);
    if (v5 <= 0x3F)
    {
      v6[5] = *(_QWORD *)(v4 - 8) + 64;
      v6[6] = &unk_100041840;
      swift_updateClassMetadata2(a1, 256, 7, v6, a1 + 80);
    }
  }
}

uint64_t sub_10003A00C(uint64_t a1)
{
  uint64_t v1;

  swift_weakAssign(v1 + OBJC_IVAR____TtC12PreviewShell9MainScene_canvas, a1);
  return swift_release(a1);
}

uint64_t sub_10003A040()
{
  return sub_100039C50();
}

uint64_t sub_10003A060@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  a1[3] = *v1;
  a1[4] = &off_100053DC0;
  *a1 = v1;
  return swift_retain(v1);
}

uint64_t sub_10003A07C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = v1;
  v4 = SceneSettingsUpdate.sceneSettings.getter(a1);
  v5 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v4;

  v6 = *(_QWORD *)(v2 + 24);
  swift_retain(v6);
  EventStream.Sink.send(_:)(a1);
  return swift_release(v6);
}

unint64_t sub_10003A0C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (qword_10005ECC8 != -1)
    swift_once(&qword_10005ECC8, sub_10001E410);
  v2 = qword_10005FDB8;
  if ((byte_10005FDC0 & 1) != 0)
  {
    v6 = qword_10005FDB8;
    swift_errorRetain(qword_10005FDB8);
    v3 = sub_100006658(&qword_10005EFF0);
    return swift_willThrowTypedImpl(&v6, v3, &protocol self-conformance witness table for Error);
  }
  else
  {
    swift_retain(qword_10005FDB8);
    v5 = sub_10002F0A4();
    sub_10003ABE8(v2, 0);
    a1[3] = (uint64_t)&type metadata for ShellThumbnailFactory;
    result = sub_10003AAEC();
    a1[4] = result;
    *a1 = v5;
  }
  return result;
}

id sub_10003A1A8()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t sub_10003A1B0@<X0>(uint64_t a1@<X8>)
{
  return sub_10003A1C4((unsigned int *)&enum case for HostIdentity.main(_:), (uint64_t (*)(_QWORD))&type metadata accessor for HostIdentity, a1);
}

uint64_t sub_10003A1C4@<X0>(unsigned int *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a3, v4, v5);
}

uint64_t sub_10003A200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_retain(v1);
  EventStream.Sink.eventStream.getter(v2);
  return swift_release(v1);
}

uint64_t sub_10003A234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static Logger.uv.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Invalidating scene settings is no-op on injected preview shell scenes.", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_10003A31C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12PreviewShell9MainScene_sceneCrashedStyle;
  v4 = type metadata accessor for SceneCrashedStyle(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_10003A360()
{
  return sub_100039ADC();
}

uint64_t sub_10003A374()
{
  return sub_100006618(&qword_100060BF0, type metadata accessor for MainScene, (uint64_t)&unk_100041884);
}

uint64_t sub_10003A3A0()
{
  return sub_100006618(&qword_100061038, type metadata accessor for MainScene, (uint64_t)&unk_1000418AC);
}

uint64_t sub_10003A3CC(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100061040, type metadata accessor for MainScene, (uint64_t)&unk_10004193C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A408(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100060C18, type metadata accessor for MainScene, (uint64_t)&unk_100041974);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A444()
{
  return sub_100006618(&qword_100060C28, type metadata accessor for HostInjectedScene, (uint64_t)&unk_1000419BC);
}

uint64_t sub_10003A470()
{
  return sub_100006618(&qword_100061048, type metadata accessor for HostInjectedScene, (uint64_t)&unk_1000419E4);
}

uint64_t sub_10003A49C(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100061050, type metadata accessor for HostInjectedScene, (uint64_t)&unk_100041A74);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A4D8(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100060C38, type metadata accessor for HostInjectedScene, (uint64_t)&unk_100041AAC);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A514()
{
  return sub_100006618(&qword_100061058, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041AE4);
}

uint64_t sub_10003A540()
{
  return sub_100006618(&qword_100061060, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041B0C);
}

uint64_t sub_10003A56C(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100061068, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041B9C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A5A8(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_10005FDF8, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041BD4);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A5E4()
{
  return sub_100006618(&qword_100061070, type metadata accessor for SimDisplayScene, (uint64_t)&unk_100041C0C);
}

uint64_t sub_10003A610()
{
  return sub_100006618(&qword_100061078, type metadata accessor for SimDisplayScene, (uint64_t)&unk_100041C34);
}

uint64_t sub_10003A63C(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100061080, type metadata accessor for SimDisplayScene, (uint64_t)&unk_100041CC4);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A678(uint64_t a1)
{
  uint64_t result;

  result = sub_100006618(&qword_100061088, type metadata accessor for SimDisplayScene, (uint64_t)&unk_100041CFC);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10003A6B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  char v19;
  _BYTE v21[40];

  v4 = v3;
  v8 = type metadata accessor for SceneCrashedStyle(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = type metadata accessor for InvalidationHandle(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v19 = 2;
  *(_QWORD *)(v3 + 16) = InvalidationHandle.init(dsoHandle:file:line:column:function:name:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellScenes.swift", 107, 2, 348, 48, "MainScene", 9, v19, 0, 0);
  v13 = sub_100006658(&qword_100061090);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  *(_QWORD *)(v3 + 24) = EventStream.Sink.init()();
  v14 = v3 + OBJC_IVAR____TtC12PreviewShell9MainScene____lazy_storage___thumbnailSceneCache;
  v15 = type metadata accessor for ThumbnailSceneCache(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  swift_weakInit(v4 + OBJC_IVAR____TtC12PreviewShell9MainScene_canvas, 0);
  *(_QWORD *)(v4 + 32) = a1;
  sub_100027080(a2, (uint64_t)v21, &qword_100061098);
  v16 = a1;
  SceneCrashedStyle.init(snapshotStyle:redCrossVisible:reloadHandler:)(1, 1, v21);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 32))(v4 + OBJC_IVAR____TtC12PreviewShell9MainScene_sceneCrashedStyle, v11, v8);
  v17 = objc_msgSend(objc_allocWithZone((Class)PSSceneSettings), "initWithSettings:", a3);
  sub_10000D718(a2, &qword_100061098);
  *(_QWORD *)(v4 + 40) = v17;
  return v4;
}

uint64_t sub_10003A880()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003A8A4()
{
  return UIScene.sendPreviewSceneAction(_:)();
}

uint64_t sub_10003A8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HostToShellMessage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10003A910()
{
  unint64_t result;

  result = qword_1000610B8;
  if (!qword_1000610B8)
  {
    result = swift_getWitnessTable(&unk_100041EAC, &type metadata for HostInjectedScene.NoCanvasError);
    atomic_store(result, (unint64_t *)&qword_1000610B8);
  }
  return result;
}

uint64_t sub_10003A954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(sub_100006658(&qword_1000610B0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = type metadata accessor for SceneMessageResponder(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003A9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_1000610B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AA34(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_100006658(&qword_1000610B0) - 8) + 80);
  return sub_100039224(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_10003AA74(uint64_t a1)
{
  uint64_t v1;

  return sub_100039A64(a1, v1, &qword_100061078, type metadata accessor for SimDisplayScene, (uint64_t)&unk_100041C34);
}

uint64_t sub_10003AAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658(&qword_1000610C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10003AAEC()
{
  unint64_t result;

  result = qword_1000610D0;
  if (!qword_1000610D0)
  {
    result = swift_getWitnessTable(&unk_100041F58, &type metadata for ShellThumbnailFactory);
    atomic_store(result, (unint64_t *)&qword_1000610D0);
  }
  return result;
}

unint64_t sub_10003AB30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000610D8;
  if (!qword_1000610D8)
  {
    v1 = objc_opt_self(UVHardwareEvent);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000610D8);
  }
  return result;
}

unint64_t sub_10003AB6C()
{
  unint64_t result;

  result = qword_1000610E0;
  if (!qword_1000610E0)
  {
    result = swift_getWitnessTable(&unk_100041E6C, &type metadata for SceneSnapshotError);
    atomic_store(result, (unint64_t *)&qword_1000610E0);
  }
  return result;
}

uint64_t sub_10003ABB0(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100023AC4(a1, a2, v2);
}

uint64_t sub_10003ABB8(uint64_t a1)
{
  uint64_t v1;

  return sub_100039A64(a1, v1, &qword_100061060, type metadata accessor for LocalStaticScene, (uint64_t)&unk_100041B0C);
}

uint64_t sub_10003ABE8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_errorRelease(a1);
  else
    return swift_release(a1);
}

uint64_t sub_10003ABF4(uint64_t a1)
{
  uint64_t v1;

  return sub_100039A64(a1, v1, &qword_100061048, type metadata accessor for HostInjectedScene, (uint64_t)&unk_1000419E4);
}

uint64_t sub_10003AC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006658((uint64_t *)&unk_1000607A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AC6C(uint64_t a1)
{
  uint64_t v1;

  return sub_100039A64(a1, v1, &qword_100061038, type metadata accessor for MainScene, (uint64_t)&unk_1000418AC);
}

ValueMetadata *type metadata accessor for SceneSnapshotError()
{
  return &type metadata for SceneSnapshotError;
}

ValueMetadata *type metadata accessor for HostInjectedScene.NoCanvasError()
{
  return &type metadata for HostInjectedScene.NoCanvasError;
}

unint64_t sub_10003ACC4()
{
  unint64_t result;

  result = qword_1000610F0;
  if (!qword_1000610F0)
  {
    result = swift_getWitnessTable(&unk_100041D8C, &type metadata for SceneSnapshotError);
    atomic_store(result, (unint64_t *)&qword_1000610F0);
  }
  return result;
}

unint64_t sub_10003AD0C()
{
  unint64_t result;

  result = qword_1000610F8;
  if (!qword_1000610F8)
  {
    result = swift_getWitnessTable(&unk_100041D64, &type metadata for SceneSnapshotError);
    atomic_store(result, (unint64_t *)&qword_1000610F8);
  }
  return result;
}

unint64_t sub_10003AD50()
{
  unint64_t result;

  result = qword_100061100;
  if (!qword_100061100)
  {
    result = swift_getWitnessTable(&unk_100041DD4, &type metadata for SceneSnapshotError);
    atomic_store(result, (unint64_t *)&qword_100061100);
  }
  return result;
}

uint64_t sub_10003ADA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[4];
  uint64_t v7;
  char v8;

  v6[2] = a1;
  v6[3] = &off_100051E20;
  v1 = sub_100006658(&qword_100061108);
  type metadata accessor for UIInterfaceOrientation(0);
  v3 = v2;
  v4 = sub_10003AF78();
  Sequence.firstMap<A>(_:)(&v7, sub_10003AF70, v6, v1, v3, v4);
  if (v8)
    return 0;
  else
    return v7;
}

BOOL sub_10003AE30@<W0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _BOOL8 result;
  int v8;
  char v9;

  v5 = *a1;
  result = sub_100022B20(*a1);
  if (result && (a2 & 0x18) == 24)
  {
    v9 = 0;
  }
  else
  {
    result = sub_100022B30(v5);
    v8 = result && (a2 & 2) != 0;
    if (!v8)
      v5 = 0;
    v9 = v8 ^ 1;
  }
  *(_QWORD *)a3 = v5;
  *(_BYTE *)(a3 + 8) = v9 & 1;
  return result;
}

unint64_t UIInterfaceOrientation.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD000000000000012;
  switch(a1)
  {
    case 0:
      result = 0x6E776F6E6B6E75;
      break;
    case 1:
      result = 0x7469617274726F70;
      break;
    case 2:
      return result;
    case 3:
    case 4:
      result = 0x70616373646E616CLL;
      break;
    default:
      result = 0x446E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_10003AF68()
{
  uint64_t *v0;

  return UIInterfaceOrientation.description.getter(*v0);
}

BOOL sub_10003AF70@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_10003AE30(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_10003AF78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100061110;
  if (!qword_100061110)
  {
    v1 = sub_1000066E4(&qword_100061108);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100061110);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellThumbnailFactory()
{
  return &type metadata for ShellThumbnailFactory;
}

uint64_t sub_10003AFD4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t ObjectType;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t DynamicType;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t updated;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v7 = v6;
  v92 = a4;
  v101 = a3;
  v90 = a2;
  v11 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v11);
  v91 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PreviewSceneRole(0);
  __chkstk_darwin(v13);
  v89 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateTiming(0);
  v96 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v88 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = type metadata accessor for SceneUpdateSeed(0);
  v85 = *(_QWORD *)(v86 - 8);
  __chkstk_darwin(v86);
  v94 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for SceneUpdateContext(0);
  v103 = *(_QWORD *)(v17 - 8);
  v104 = v17;
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = v19;
  __chkstk_darwin(v18);
  v98 = (char *)&v81 - v21;
  v84 = type metadata accessor for Logger(0);
  v83 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v23 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  assertMainThread(file:line:column:function:)("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 166, 25, "update(using:timing:performUpdate:didUpdate:)", 45, 2);
  v109 = 0;
  v107 = 0u;
  v108 = 0u;
  v24 = v7[3];
  v25 = v7[4];
  v26 = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
  swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
  swift_unknownObjectRetain(v24);
  swift_retain(a6);
  v82 = v25;
  v27 = sub_100011810((uint64_t)&v107, v24, v25, a5, a6);
  swift_unknownObjectRelease(v24);
  swift_release(a6);
  v28 = v7[2];
  v100 = v26;
  if (v28)
  {
    *(_QWORD *)&v107 = v28;
    v29 = sub_10003D624(&qword_10005F688, (uint64_t)&unk_1000402E0);
    Invalidatable.invalidate(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 170, 42, "update(using:timing:performUpdate:didUpdate:)", 45, 2, v26, v29);
    v30 = v7[2];
  }
  else
  {
    v30 = 0;
  }
  v7[2] = v27;
  v99 = v27;
  swift_retain(v27);
  v31 = swift_release(v30);
  v32 = v23;
  static Logger.uv.getter(v31);
  sub_10000D66C((uint64_t)a1, (uint64_t)&v107);
  v33 = swift_retain_n(v7, 2);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.default.getter(v34);
  v36 = os_log_type_enabled(v34, v35);
  v102 = a1;
  v95 = v20;
  v93 = v7;
  if (v36)
  {
    v37 = swift_slowAlloc(22, -1);
    v81 = swift_slowAlloc(64, -1);
    v106 = v81;
    *(_DWORD *)v37 = 136446466;
    ObjectType = swift_getObjectType(v24);
    v39 = v82;
    v40 = dispatch thunk of PreviewShellScene.identifier.getter(ObjectType, *(_QWORD *)(*(_QWORD *)(v82 + 8) + 8));
    v42 = v41;
    v105 = sub_100010F78(v40, v41, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v37 + 4);
    swift_release_n(v7, 2);
    swift_bridgeObjectRelease(v42);
    *(_WORD *)(v37 + 12) = 2082;
    v43 = *((_QWORD *)&v108 + 1);
    v44 = sub_10000D648(&v107, *((uint64_t *)&v108 + 1));
    DynamicType = swift_getDynamicType(v44, v43, 1);
    v46 = _typeName(_:qualified:)(DynamicType, 0);
    v48 = v47;
    v105 = sub_100010F78(v46, v47, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v37 + 14);
    v49 = v48;
    v50 = v39;
    swift_bridgeObjectRelease(v49);
    sub_10000D6B0(&v107);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Canvas %{public}s performing custom update using %{public}s", (uint8_t *)v37, 0x16u);
    v51 = v81;
    swift_arrayDestroy(v81, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v83 + 8))(v32, v84);
    v52 = v91;
    v53 = v92;
    v54 = v90;
    v55 = v89;
    v56 = v88;
    v57 = updated;
    v58 = v86;
    v59 = v85;
  }
  else
  {
    swift_release_n(v7, 2);
    sub_10000D6B0(&v107);

    (*(void (**)(char *, uint64_t))(v83 + 8))(v23, v84);
    v52 = v91;
    v53 = v92;
    v54 = v90;
    v55 = v89;
    v56 = v88;
    v57 = updated;
    v58 = v86;
    v59 = v85;
    v50 = v82;
  }
  v60 = (uint64_t)v99;
  v61 = v94;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v94, (uint64_t)v99+ OBJC_IVAR____TtCC12PreviewShell13CanvasUpdaterP33_AD1F3764465B03D85C2D8A634FCA9F5714UpdateDelegate_seed, v58);
  (*(void (**)(char *, uint64_t, uint64_t))(v96 + 16))(v56, v54, v57);
  v62 = swift_getObjectType(v24);
  dispatch thunk of PreviewShellScene.role.getter(v62, *(_QWORD *)(*(_QWORD *)(v50 + 8) + 8));
  v63 = v98;
  SceneUpdateContext.init(seed:timing:role:)(v61, v56, v55);
  sub_100006658(&qword_100061188);
  v64 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v52, 1, 1, v64);
  v65 = v103;
  v66 = v104;
  v67 = v95;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v95, v63, v104);
  v68 = *(unsigned __int8 *)(v65 + 80);
  v69 = (v68 + 40) & ~v68;
  v70 = (char *)swift_allocObject(&unk_100054328, v69 + v97, v68 | 7);
  *((_QWORD *)v70 + 2) = v101;
  *((_QWORD *)v70 + 3) = v53;
  *((_QWORD *)v70 + 4) = v60;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(&v70[v69], v67, v66);
  swift_retain(v60);
  swift_retain(v53);
  LOBYTE(v79) = 2;
  v71 = Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 178, 35, "update(using:timing:performUpdate:didUpdate:)", 45, v79, v52, &unk_100061198, v70);
  v72 = v102[3];
  v73 = v102[4];
  v74 = sub_10000D648(v102, v72);
  v75 = sub_1000115C8(v60, (uint64_t)v74, (uint64_t)v93, v72, v73);
  sub_100006658(&qword_10005F000);
  LOBYTE(v80) = 2;
  v76 = static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 183, 38, "update(using:timing:performUpdate:didUpdate:)", 45, v80, v71, v75);
  *(_QWORD *)&v107 = v60;
  v77 = sub_10003D624(&qword_10005F688, (uint64_t)&unk_1000402E0);
  swift_retain(v76);
  Invalidatable.onInvalidation(_:)(sub_10003D5D4, v76, v100, v77);
  swift_release(v71);
  swift_release(v75);
  swift_release(v76);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v63, v66);
  swift_release(v60);
  return v76;
}

uint64_t sub_10003B7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  v5 = type metadata accessor for MainActor(0);
  v4[12] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[13] = v6;
  v4[14] = v7;
  return swift_task_switch(sub_10003B85C, v6, v7);
}

uint64_t sub_10003B85C()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  _QWORD *v4;
  int *v6;

  v1 = v0[10];
  v2 = (int *)v0[8];
  v0[5] = type metadata accessor for CanvasUpdater.UpdateDelegate(0);
  v0[6] = sub_10003D624(&qword_10005F698, (uint64_t)&unk_100040308);
  v0[2] = v1;
  v3 = v2[1];
  v6 = (int *)((char *)v2 + *v2);
  swift_retain(v1);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[15] = v4;
  *v4 = v0;
  v4[1] = sub_10003B914;
  return ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD))v6)(v0 + 7, v0 + 2, v0[11]);
}

uint64_t sub_10003B914()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[13];
    v5 = v2[14];
    v6 = sub_10003B9B8;
  }
  else
  {
    sub_10000D6B0(v2 + 2);
    v4 = v2[13];
    v5 = v2[14];
    v6 = sub_10003B980;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_10003B980()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 96));
  return (*(uint64_t (**)(double))(v0 + 8))(*(double *)(v0 + 56));
}

uint64_t sub_10003B9B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 96));
  sub_10000D6B0((_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003B9F8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t updated;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30[2];

  v28 = a5;
  v29 = a6;
  v10 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateTiming(0);
  v14 = *(_QWORD *)(updated - 8);
  __chkstk_darwin(updated);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002D5F8(a2);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, enum case for SceneUpdateTiming.async(_:), updated);
  sub_10000D66C((uint64_t)a2, (uint64_t)v30);
  v17 = swift_allocObject(&unk_1000542B0, 64, 7);
  *(_QWORD *)(v17 + 16) = a1;
  sub_10000C5DC(v30, v17 + 24);
  swift_retain(a1);
  v18 = sub_10003AFD4(a2, (uint64_t)v16, a3, a4, (uint64_t)sub_10003D174, v17);
  swift_release(v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, updated);
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v12, 1, 1, v19);
  v20 = swift_allocObject(&unk_1000542D8, 32, 7);
  v21 = v29;
  *(_QWORD *)(v20 + 16) = v28;
  *(_QWORD *)(v20 + 24) = v21;
  v22 = swift_allocObject(&unk_100054300, 32, 7);
  *(_QWORD *)(v22 + 16) = &unk_100061168;
  *(_QWORD *)(v22 + 24) = v20;
  v23 = type metadata accessor for PreviewSnapshot(0);
  swift_retain(v21);
  v26 = 2;
  v24 = Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/StaticPreviewCanvas.swift", 115, 2, 99, 23, "performCustomUpdate(priority:using:performUpdate:generateOutput:)", 65, v26, v12, &unk_100061178, v22, v23);
  swift_release(v18);
  swift_release(v22);
  sub_10003D3AC((uint64_t)v12);
  return v24;
}

uint64_t sub_10003BC4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v7 = a2 + *(int *)(sub_100006658(&qword_100061180) + 48);
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  v8 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_10001D634;
  return v10(a1, a2, v7);
}

uint64_t sub_10003BCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[25] = a4;
  v5[26] = a5;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  v6 = *(_QWORD *)(a5 - 8);
  v5[27] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v5[28] = v7;
  v5[29] = swift_task_alloc((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v5[30] = v8;
  v5[31] = static MainActor.shared.getter(v8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v5[32] = v9;
  v5[33] = v10;
  return swift_task_switch(sub_10003BD78, v9, v10);
}

uint64_t sub_10003BD78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int *v10;

  v2 = v0[25];
  v1 = v0[26];
  DefaultStringInterpolation.appendInterpolation<A>(_:)(v0[23], v1);
  v0[34] = 0;
  v0[35] = 0xE000000000000000;
  v3 = type metadata accessor for ThumbnailHostFactory(0, v1);
  v4 = (int *)ThumbnailHostFactory.makeHost.getter(v3);
  v0[36] = v5;
  v6 = *(_QWORD *)(v2 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
  v10 = (int *)((char *)v4 + *v4);
  v8 = (_QWORD *)swift_task_alloc(v4[1]);
  v0[37] = v8;
  *v8 = v0;
  v8[1] = sub_10003BE38;
  return ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v10)(v0 + 2, v6, v7);
}

uint64_t sub_10003BE38()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 296);
  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc(v3);
  v4 = v2[36];
  if (v0)
  {
    v5 = v2[35];
    swift_release(v4);
    swift_bridgeObjectRelease(v5);
    v6 = v2[32];
    v7 = v2[33];
    v8 = sub_10003C240;
  }
  else
  {
    swift_release(v4);
    v6 = v2[32];
    v7 = v2[33];
    v8 = sub_10003BEB4;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_10003BEB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = *(_QWORD *)(v0 + 272);
  v23 = *(_QWORD *)(v0 + 280);
  v1 = *(_QWORD *)(v0 + 216);
  v20 = *(_QWORD *)(v0 + 232);
  v21 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 208);
  v24 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = sub_10000D648((_QWORD *)(v0 + 16), v4);
  *(_QWORD *)(v0 + 80) = v4;
  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v5 + 8);
  v7 = sub_100011B40((_QWORD *)(v0 + 56));
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v7, v6, v4);
  sub_10000D66C(v0 + 16, v0 + 96);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v20, v3, v2);
  v8 = *(unsigned __int8 *)(v1 + 80);
  v9 = (v8 + 80) & ~v8;
  v10 = (char *)swift_allocObject(&unk_100054210, v9 + v21, v8 | 7);
  *((_QWORD *)v10 + 2) = v2;
  *((_QWORD *)v10 + 3) = v22;
  *((_QWORD *)v10 + 4) = v23;
  sub_10000C5DC((__int128 *)(v0 + 96), (uint64_t)(v10 + 40));
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v10[v9], v20, v2);
  v11 = (_QWORD *)swift_allocObject(&unk_100054238, 40, 7);
  v11[2] = v22;
  v11[3] = v23;
  v11[4] = v24;
  sub_10000D66C(v0 + 56, v0 + 136);
  v12 = (_QWORD *)swift_allocObject(&unk_100054260, 96, 7);
  v12[2] = v24;
  sub_10000C5DC((__int128 *)(v0 + 136), (uint64_t)(v12 + 3));
  v12[8] = &unk_100061130;
  v12[9] = v10;
  v12[10] = &unk_100061140;
  v12[11] = v11;
  v13 = type metadata accessor for PreviewSnapshot(0);
  swift_bridgeObjectRetain_n(v23, 2);
  swift_retain_n(v24, 2);
  swift_retain(v10);
  swift_retain(v11);
  v14 = FutureSerialQueue.enqueue<A>(priority:makeFuture:)(2, sub_10003D028, v12, v13);
  *(_QWORD *)(v0 + 312) = v14;
  swift_release(v12);
  swift_release(v11);
  swift_release(v10);
  sub_10000D6B0((_QWORD *)(v0 + 56));
  v15 = swift_allocObject(&unk_100054288, 32, 7);
  *(_QWORD *)(v15 + 16) = v22;
  *(_QWORD *)(v15 + 24) = v23;
  Future.observeCancelation(_:)(sub_10003D060, v15);
  v16 = swift_release(v15);
  v17 = static MainActor.shared.getter(v16);
  *(_QWORD *)(v0 + 320) = v17;
  v18 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to withTaskCancellationHandler<A>(operation:onCancel:isolation:)
                                   + 1));
  *(_QWORD *)(v0 + 328) = v18;
  *v18 = v0;
  v18[1] = sub_10003C174;
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)(*(_QWORD *)(v0 + 176), &unk_100061150, v14, sub_10003D0BC, v14, v17, &protocol witness table for MainActor, v13);
}

uint64_t sub_10003C174()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 328);
  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[32];
    v5 = v2[33];
    v6 = sub_10003C27C;
  }
  else
  {
    swift_release(v2[40]);
    v4 = v2[32];
    v5 = v2[33];
    v6 = sub_10003C1E0;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_10003C1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 232);
  swift_release(*(_QWORD *)(v0 + 248));
  swift_release(v1);
  sub_10000D6B0((_QWORD *)(v0 + 16));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003C240()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 248));
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003C27C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  swift_release(*(_QWORD *)(v0 + 248));
  swift_release(v1);
  swift_release(v2);
  sub_10000D6B0((_QWORD *)(v0 + 16));
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003C2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  v7[5] = a2;
  v7[6] = a3;
  v7[4] = a1;
  v8 = type metadata accessor for Logger(0);
  v7[11] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[12] = v9;
  v7[13] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  v7[14] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v7[15] = v11;
  v7[16] = v12;
  return swift_task_switch(sub_10003C380, v11, v12);
}

uint64_t sub_10003C380(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v3 = v1[8];
  static Logger.uv.getter(a1);
  v4 = swift_bridgeObjectRetain_n(v3, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v23 = v1[12];
    v24 = v1[11];
    v25 = v1[13];
    v8 = v1[7];
    v7 = v1[8];
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(64, -1);
    v26 = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = sub_10003D10C();
    v12 = _typeName(_:qualified:)(v11, 0);
    v14 = v13;
    v1[2] = sub_100010F78(v12, v13, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 2, v1 + 3, v9 + 4);
    swift_bridgeObjectRelease(v14);
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain(v7);
    v1[3] = sub_100010F78(v8, v7, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 3, v1 + 4, v9 + 14);
    swift_bridgeObjectRelease_n(v7, 3);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Hosting thumbnail content for %s, state = %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy(v10, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  }
  else
  {
    v16 = v1[12];
    v15 = v1[13];
    v17 = v2[11];
    swift_bridgeObjectRelease_n(v2[8], 2);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  v18 = (_QWORD *)v2[9];
  v19 = v18[3];
  v20 = v18[4];
  sub_10000D648(v18, v19);
  v21 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of ThumbnailHost.displayThumbnailAndPerformHandshake(for:context:delegate:)[1]);
  v2[17] = v21;
  *v21 = v2;
  v21[1] = sub_10003C5BC;
  return dispatch thunk of ThumbnailHost.displayThumbnailAndPerformHandshake(for:context:delegate:)(v2[10], v2[6], v2[5], v19, v20);
}

uint64_t sub_10003C5BC(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 136);
  *(_QWORD *)(*v2 + 144) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = *(_QWORD *)(v4 + 120);
    v7 = *(_QWORD *)(v4 + 128);
    v8 = sub_10003C680;
  }
  else
  {
    *(double *)(v4 + 152) = a1;
    v6 = *(_QWORD *)(v4 + 120);
    v7 = *(_QWORD *)(v4 + 128);
    v8 = sub_10003C630;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_10003C630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD **)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 112));
  *v3 = v1;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003C680()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003C6BC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a1;
  v6[5] = a4;
  v8 = type metadata accessor for Logger(0);
  v6[8] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[9] = v9;
  v6[10] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[11] = *a3;
  v10 = type metadata accessor for MainActor(0);
  v6[12] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003C760, v11, v12);
}

uint64_t sub_10003C760()
{
  double *v0;
  double *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjectType;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[2];

  v1 = v0;
  v2 = *((_QWORD *)v0 + 6);
  v3 = swift_release(*((_QWORD *)v0 + 12));
  static Logger.uv.getter(v3);
  v4 = swift_bridgeObjectRetain_n(v2, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v29 = *((_QWORD *)v0 + 9);
    v30 = *((_QWORD *)v0 + 8);
    v31 = *((_QWORD *)v0 + 10);
    v7 = *((_QWORD *)v0 + 5);
    v8 = *((_QWORD *)v0 + 6);
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(64, -1);
    v32[0] = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = sub_10003D10C();
    v12 = _typeName(_:qualified:)(v11, 0);
    v14 = v13;
    *((_QWORD *)v0 + 2) = sub_100010F78(v12, v13, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v9 + 4);
    swift_bridgeObjectRelease(v14);
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain(v8);
    *((_QWORD *)v0 + 3) = sub_100010F78(v7, v8, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v9 + 14);
    swift_bridgeObjectRelease_n(v8, 3);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Generating thumbnail snapshot for %s, state = %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy(v10, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v30);
  }
  else
  {
    v15 = *((_QWORD *)v0 + 9);
    v16 = *((_QWORD *)v0 + 10);
    v17 = *((_QWORD *)v1 + 8);
    swift_bridgeObjectRelease_n(*((_QWORD *)v1 + 6), 2);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
  }
  v18 = *((_QWORD *)v1 + 7);
  v19 = *(_QWORD *)(v18 + 40);
  ObjectType = swift_getObjectType(*(_QWORD *)(v18 + 32));
  v21 = *(_QWORD *)(*(_QWORD *)(v19 + 8) + 8);
  dispatch thunk of PreviewShellScene.takeSnapshot()(ObjectType, v21);
  v22 = v1[11];
  v23 = *((_QWORD *)v1 + 10);
  v24 = (void *)dispatch thunk of PreviewShellScene.windowScene.getter(ObjectType, v21);
  v25 = objc_msgSend(v24, "screen");

  objc_msgSend(v25, "scale");
  v27 = v26;

  PreviewSnapshot.init(image:selectableRegions:cornerRadius:scaleFactor:)(v22, v27);
  swift_task_dealloc(v23);
  return (*((uint64_t (**)(void))v1 + 1))();
}

uint64_t sub_10003CA28(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.uv.getter(v7);
  v10 = swift_bridgeObjectRetain_n(a3, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v22 = a2;
    v14 = v13;
    v15 = swift_slowAlloc(64, -1);
    v25 = v15;
    *(_DWORD *)v14 = 136315394;
    v16 = sub_10003D10C();
    v17 = _typeName(_:qualified:)(v16, 0);
    v19 = v18;
    v20 = sub_100010F78(v17, v18, &v25);
    v23 = v5;
    v24 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v14 + 4);
    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain(a3);
    v24 = sub_100010F78(v22, a3, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v14 + 14);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Thumbnail generation canceled for %s, state = %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

uint64_t sub_10003CC30(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;

  v3 = type metadata accessor for MainActor(0);
  v1[2] = v3;
  v1[3] = static MainActor.shared.getter(v3);
  v4 = (_QWORD *)swift_task_alloc(async function pointer to Future<A>.value.getter[1]);
  v1[4] = v4;
  *v4 = v1;
  v4[1] = sub_10003CCAC;
  return Future<A>.value.getter(a1);
}

uint64_t sub_10003CCAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_10003CD68;
  else
    v6 = sub_10003CD34;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_10003CD34()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003CD68()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003CD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v10;
  _QWORD *v11;

  v10 = *v4;
  v11 = (_QWORD *)swift_task_alloc(dword_100061124);
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_10001AF18;
  return sub_10003BCE0(a1, a2, a3, v10, a4);
}

uint64_t sub_10003CE1C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 80) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_bridgeObjectRelease(*((_QWORD *)v0 + 4));
  sub_10000D6B0((_QWORD *)v0 + 5);
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v4], v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003CE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v8 = v3[3];
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v3[2] - 8) + 80);
  v10 = v3[4];
  v11 = (uint64_t)(v3 + 5);
  v12 = (uint64_t)v3 + ((v9 + 80) & ~v9);
  v13 = (_QWORD *)swift_task_alloc(dword_10006112C);
  *(_QWORD *)(v4 + 16) = v13;
  *v13 = v4;
  v13[1] = sub_10001D634;
  return sub_10003C2E0(a1, a2, a3, v8, v10, v11, v12);
}

uint64_t sub_10003CF3C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003CF68(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v8 = v3[2];
  v9 = v3[3];
  v10 = v3[4];
  v11 = (_QWORD *)swift_task_alloc(dword_10006113C);
  *(_QWORD *)(v4 + 16) = v11;
  *v11 = v4;
  v11[1] = sub_10001D634;
  return sub_10003C6BC(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_10003CFEC()
{
  _QWORD *v0;

  swift_release(v0[2]);
  sub_10000D6B0(v0 + 3);
  swift_release(v0[9]);
  swift_release(v0[11]);
  return swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10003D028()
{
  uint64_t *v0;

  return sub_10003B9F8(v0[2], v0 + 3, v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_10003D03C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003D060(uint64_t a1)
{
  uint64_t v1;

  return sub_10003CA28(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10003D068(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10006114C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10001D634;
  return sub_10003CC30(a1);
}

uint64_t sub_10003D0BC()
{
  char v1;

  v1 = 2;
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/ShellThumbnailFactory.swift", 117, 2, 52, 32, "generateThumbnail(for:using:)", 29, v1);
}

unint64_t sub_10003D10C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100061158;
  if (!qword_100061158)
  {
    v1 = objc_opt_self(NSHost);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100061158);
  }
  return result;
}

uint64_t sub_10003D148()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  sub_10000D6B0((_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 64, 7);
}

void sub_10003D174(uint64_t a1)
{
  uint64_t v1;

  sub_10002F080(a1, *(_QWORD *)(v1 + 16), (_QWORD *)(v1 + 24));
}

uint64_t sub_10003D180(uint64_t a1, _QWORD *a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = *a2;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 24) = v7;
  *v7 = v4;
  v7[1] = sub_10003D204;
  return v9(a1, a3, v4 + 16);
}

uint64_t sub_10003D204()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10003D274;
  else
    v3 = sub_10003D268;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10003D268()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003D274()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003D280()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003D2A4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc(dword_100061164);
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_10001AF18;
  return ((uint64_t (*)(uint64_t, _QWORD *, uint64_t, int *))((char *)&dword_100061160 + dword_100061160))(a1, a2, a3, v8);
}

uint64_t sub_10003D32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_100061174);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10001D634;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100061170 + dword_100061170))(a1, a2, v6);
}

uint64_t sub_10003D3AC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006658(&qword_10005FB38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003D3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;

  *(_QWORD *)(v5 + 16) = a1;
  v10 = (_QWORD *)swift_task_alloc(dword_1000611A4);
  *(_QWORD *)(v5 + 24) = v10;
  *v10 = v5;
  v10[1] = sub_10003D45C;
  return sub_10003B7EC(a2, a3, a4, a5);
}

uint64_t sub_10003D45C(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(double **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_10003D4B8()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  updated = type metadata accessor for SceneUpdateContext(0);
  v2 = *(_QWORD *)(updated - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, updated);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003D534(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SceneUpdateContext(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_100061194);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_10001D634;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100061190
                                                                              + dword_100061190))(a1, v5, v6, v7, v8);
}

uint64_t sub_10003D5D4()
{
  char v1;

  v1 = 2;
  return dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)(&_mh_execute_header, "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewShell/Sources/PreviewShell/CanvasUpdater.swift", 109, 2, 186, 32, "update(using:timing:performUpdate:didUpdate:)", 45, v1);
}

uint64_t sub_10003D624(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t updated;

  result = *a1;
  if (!result)
  {
    updated = type metadata accessor for CanvasUpdater.UpdateDelegate(255);
    result = swift_getWitnessTable(a2, updated);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC12PreviewShellP33_F59E84C211258484509200293B027E4319ResourceBundleClass);
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_hostHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostHandle");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_setTargetOfEventDeferringEnvironments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetOfEventDeferringEnvironments:");
}
