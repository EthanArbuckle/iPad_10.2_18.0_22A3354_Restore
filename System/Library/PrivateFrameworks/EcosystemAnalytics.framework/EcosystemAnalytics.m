id nm_extractTeamID(void *a1)
{
  return nm_signingInfo(a1, 0);
}

id nm_signingInfo(void *a1, uint64_t a2)
{
  id v3;
  const __CFURL *v4;
  SecStaticCodeRef v5;
  void *v6;
  OSStatus v8;
  void *v9;
  void *v10;
  CFDictionaryRef information;
  uint8_t buf[8];

  v3 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A86F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, " Extract signing info", buf, 2u);
  }
  if (!v3)
  {
    v6 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (SecStaticCodeCreateWithPath(v4, 0, (SecStaticCodeRef *)buf))
  {
    v5 = *(SecStaticCodeRef *)buf;
    if (*(_QWORD *)buf)
LABEL_6:
      CFRelease(v5);
  }
  else
  {
    information = 0;
    v8 = SecCodeCopySigningInformation(*(SecStaticCodeRef *)buf, 2u, &information);
    CFRelease(*(CFTypeRef *)buf);
    if (!v8)
    {
      if (a2 == 1)
      {
        CFDictionaryGetValue(information, (const void *)*MEMORY[0x24BDE9268]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          hexStringForData(v9);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = 0;
        }

      }
      else if (a2)
      {
        v6 = 0;
      }
      else
      {
        CFDictionaryGetValue(information, (const void *)*MEMORY[0x24BDE9260]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(information);
      goto LABEL_8;
    }
    v5 = information;
    if (information)
      goto LABEL_6;
  }
  v6 = 0;
LABEL_8:

LABEL_10:
  return v6;
}

id nm_extractCDHash(void *a1)
{
  return nm_signingInfo(a1, 1);
}

id hexStringForData(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  char *v7;
  int v8;
  void *v9;

  v1 = a1;
  v2 = v1;
  if (v1
    && (v3 = objc_msgSend(v1, "length"),
        v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v2), "bytes"),
        (v5 = malloc_type_calloc((2 * v3) | 1, 1uLL, 0xAC4065AAuLL)) != 0))
  {
    v6 = v5;
    if (v3)
    {
      v7 = (char *)v5;
      do
      {
        v8 = *v4++;
        sprintf(v7, "%2.2x", v8);
        v7 += 2;
        --v3;
      }
      while (v3);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void nm_systemstats_get_microstackshots(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  systemstats_get_microstackshots();

}

uint64_t __nm_systemstats_get_microstackshots_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_slice(void *a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;
  uint64_t v6;
  _QWORD callback[4];
  id v9;

  v3 = a2;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  callback[0] = MEMORY[0x24BDAC760];
  callback[1] = 3221225472;
  callback[2] = __nm_macho_for_each_slice_block_invoke;
  callback[3] = &unk_250BAF4E0;
  v9 = v3;
  v5 = v3;
  v6 = macho_for_each_slice(v4, callback);

  return v6;
}

uint64_t __nm_macho_for_each_slice_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_imported_symbol(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v6;

  v6 = a3;
  v3 = v6;
  v4 = macho_for_each_imported_symbol();

  return v4;
}

uint64_t __nm_macho_for_each_imported_symbol_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_dependent_dylib(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v6;

  v6 = a3;
  v3 = v6;
  v4 = macho_for_each_dependent_dylib();

  return v4;
}

uint64_t __nm_macho_for_each_dependent_dylib_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_exported_symbol(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v6;

  v6 = a3;
  v3 = v6;
  v4 = macho_for_each_exported_symbol();

  return v4;
}

uint64_t __nm_macho_for_each_exported_symbol_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_defined_rpath(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v6;

  v6 = a3;
  v3 = v6;
  v4 = macho_for_each_defined_rpath();

  return v4;
}

uint64_t __nm_macho_for_each_defined_rpath_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id nm_dyld_get_uuid_for_header()
{
  void *v0;
  void *v1;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0;
  v3[1] = 0;
  v0 = 0;
  if (_dyld_get_image_uuid())
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v3);
    objc_msgSend(v1, "UUIDString");
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

uint64_t nm_OSASanitizePath()
{
  return OSASanitizePath();
}

uint64_t nm_CRSetCrashLogMessage(uint64_t result)
{
  qword_2569C6408 = result;
  return result;
}

uint64_t MicrostackshotsCoordinator.__allocating_init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = 0;
  *(_WORD *)(result + 40) = 1;
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t MicrostackshotsCoordinator.init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 32) = 0;
  *(_WORD *)(v2 + 40) = 1;
  *(_QWORD *)(v2 + 16) = a1;
  return v2;
}

uint64_t MicrostackshotsCoordinator.__allocating_init(interruptCallback:sendEvents:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 16) = a1;
  *(_BYTE *)(result + 40) = a3;
  *(_BYTE *)(result + 41) = a4;
  return result;
}

uint64_t MicrostackshotsCoordinator.init(interruptCallback:sendEvents:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 16) = a1;
  *(_BYTE *)(v4 + 40) = a3;
  *(_BYTE *)(v4 + 41) = a4;
  return v4;
}

uint64_t sub_23A871A0C()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char *v34;
  uint64_t (*v35)(uint64_t);
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[2];
  char *v69;
  char *v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  __int128 v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unint64_t v84;
  unint64_t v85;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v0);
  v69 = (char *)v68 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_23A890034();
  v72 = *(_QWORD *)(v2 - 8);
  v73 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v70 = (char *)v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v78 = (char *)v68 - v5;
  v6 = sub_23A890190();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902C8();
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v10 = swift_allocObject();
  v77 = xmmword_23A890C00;
  *(_OWORD *)(v10 + 16) = xmmword_23A890C00;
  v11 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = 500;
  v76 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v12 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v84 = 0;
  v85 = 0xE000000000000000;
  sub_23A8903DC();
  swift_bridgeObjectRelease();
  v84 = 0xD000000000000020;
  v85 = 0x800000023A891920;
  v80 = 500;
  sub_23A890490();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  sub_23A890184();
  sub_23A8724FC();
  v13 = sub_23A890394();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  if (v13)
  {
    nm_CRSetCrashLogMessage(v13 + 32);
    swift_bridgeObjectRelease();
  }
  type metadata accessor for AnalyticsRandomizer();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = sub_23A872F0C(MEMORY[0x24BEE4AF8]);
  v14[5] = -1;
  sub_23A8902C8();
  v15 = (void *)sub_23A89034C();
  sub_23A890064();

  v14[3] = 0xD00000000000002DLL;
  v14[4] = 0x800000023A891970;
  v75 = v14;
  v14[5] = 500;
  v16 = sub_23A873AC0();
  v17 = (uint64_t)v78;
  if (!v16)
  {
    sub_23A8902C8();
    v31 = (void *)sub_23A89034C();
    sub_23A890064();

    goto LABEL_12;
  }
  v18 = v16;
  *(_QWORD *)&v71 = *(_QWORD *)(v16 + 16);
  if (!(_QWORD)v71)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_23A8902C8();
    v32 = (void *)sub_23A89034C();
    sub_23A890064();

    sub_23A890028();
    swift_beginAccess();
    v33 = 6;
    v71 = xmmword_23A890C10;
    v34 = v70;
    while (1)
    {
      v35 = *(uint64_t (**)(uint64_t))(v79 + 16);
      v36 = swift_retain();
      v37 = v35(v36);
      swift_release();
      if ((v37 & 1) != 0)
      {
        sub_23A8902BC();
        v53 = (void *)sub_23A89034C();
        sub_23A890064();

        v83 = 1;
        v54 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720) + 48);
        v56 = v72;
        v55 = v73;
        v57 = (uint64_t)v69;
        (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v69, v17, v73);
        *(_QWORD *)(v57 + v54) = 0x4082C00000000000;
        v58 = type metadata accessor for TargetType(0);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v57, 0, 1, v58);
        v82 = 4;
        v81 = 0u;
        sub_23A8879F4(&v83, v57, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v82, 0xD00000000000002DLL, 0x800000023A891C60, (uint64_t *)&v81);
        swift_release();
        sub_23A8742E4(v57);
        v59 = *(_QWORD *)(v79 + 32);
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v17, v55);
        return v59;
      }
      sub_23A890004();
      sub_23A8902C8();
      v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = v71;
      v39 = sub_23A89001C();
      v41 = v40;
      v42 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v38 + 56) = MEMORY[0x24BEE0D00];
      v43 = sub_23A8742A0();
      *(_QWORD *)(v38 + 64) = v43;
      *(_QWORD *)(v38 + 32) = v39;
      *(_QWORD *)(v38 + 40) = v41;
      v44 = sub_23A89001C();
      *(_QWORD *)(v38 + 96) = v42;
      *(_QWORD *)(v38 + 104) = v43;
      *(_QWORD *)(v38 + 72) = v44;
      *(_QWORD *)(v38 + 80) = v45;
      v46 = (void *)sub_23A89034C();
      v47 = v79;
      sub_23A890064();
      v17 = (uint64_t)v78;
      swift_bridgeObjectRelease();

      v48 = (void *)MEMORY[0x23B859758]();
      v49 = (uint64_t)v75;
      sub_23A8729AC(v17, (uint64_t)v75, 600.0);
      objc_autoreleasePoolPop(v48);
      sub_23A8902C8();
      v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = v77;
      v51 = *(_QWORD *)(v47 + 32);
      *(_QWORD *)(v50 + 56) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v50 + 64) = MEMORY[0x24BEE17F0];
      *(_QWORD *)(v50 + 32) = v51;
      v52 = (void *)sub_23A89034C();
      sub_23A890064();
      swift_bridgeObjectRelease();

      if (*(_QWORD *)(*(_QWORD *)(v49 + 16) + 16) >= 0x1F4uLL)
        break;
      (*(void (**)(uint64_t, char *, uint64_t))(v72 + 40))(v17, v34, v73);
      if (!--v33)
        goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v34, v73);
LABEL_19:
    sub_23A87F098();
    v59 = v60;
    sub_23A8902C8();
    v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = v77;
    *(_QWORD *)(v61 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v61 + 64) = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v61 + 32) = v59;
    v62 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v17, v73);
    return v59;
  }
  v68[1] = v14 + 2;
  swift_beginAccess();
  v19 = 0;
  v20 = (uint64_t)v75;
  while (1)
  {
    v21 = *(_DWORD *)(v18 + 4 * v19 + 32);
    v22 = *(uint64_t (**)(uint64_t))(v79 + 16);
    v23 = swift_retain();
    LOBYTE(v22) = v22(v23);
    swift_release();
    if ((v22 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_23A8902BC();
      v64 = (void *)sub_23A89034C();
      sub_23A890064();

      swift_release();
      return *(_QWORD *)(v79 + 32);
    }
    sub_23A8902C8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v77;
    *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE3F88];
    *(_QWORD *)(v24 + 64) = MEMORY[0x24BEE3FF0];
    *(_DWORD *)(v24 + 32) = v21;
    v25 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    v26 = (void *)MEMORY[0x23B859758]();
    v27 = v79;
    sub_23A872540(v21, v20);
    objc_autoreleasePoolPop(v26);
    sub_23A8902A4();
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = v77;
    v29 = *(_QWORD *)(v27 + 32);
    *(_QWORD *)(v28 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v28 + 64) = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v28 + 32) = v29;
    v30 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    if (*(_QWORD *)(*(_QWORD *)(v20 + 16) + 16) >= 0x1F5uLL)
      break;
    if ((_QWORD)v71 == ++v19)
    {
      swift_bridgeObjectRelease();
      v17 = (uint64_t)v78;
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
  sub_23A87F098();
  v59 = v65;
  sub_23A8902C8();
  v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = v77;
  *(_QWORD *)(v66 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v66 + 64) = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v66 + 32) = v59;
  v67 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  swift_release();
  return v59;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B859B60]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A8724FC()
{
  unint64_t result;

  result = qword_2569C5710;
  if (!qword_2569C5710)
  {
    result = MEMORY[0x23B859B78](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569C5710);
  }
  return result;
}

uint64_t sub_23A872540(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v3 = v2;
  v6 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_DWORD *)((char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_23A890190();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902A4();
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v13 = (void *)sub_23A89034C();
  sub_23A890064();

  v18[0] = 0xD00000000000002ALL;
  v18[1] = 0x800000023A891DC0;
  sub_23A890184();
  sub_23A8724FC();
  v14 = sub_23A890394();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();
  if (v14)
  {
    nm_CRSetCrashLogMessage(v14 + 32);
    swift_bridgeObjectRelease();
  }
  *v8 = a1;
  type metadata accessor for TargetType(0);
  swift_storeEnumTagMultiPayload();
  v15 = swift_allocObject();
  swift_weakInit();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = a2;
  swift_retain();
  swift_retain();
  sub_23A88EEC4((uint64_t)v8);
  swift_release();
  swift_release();
  sub_23A874354((uint64_t)v8);
  return *(_QWORD *)(v3 + 32);
}

uint64_t sub_23A87276C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  _QWORD v15[6];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6 = *(_QWORD *)(result + 32);
    v7 = __OFADD__(v6, 1);
    v8 = v6 + 1;
    if (v7)
    {
      __break(1u);
      goto LABEL_16;
    }
    *(_QWORD *)(result + 32) = v8;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v9 = *(unsigned __int8 *)(result + 40);
      swift_release();
      if (v9 != 1)
        goto LABEL_10;
      goto LABEL_7;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_7:
  if (a3)
  {
    sub_23A87EB6C(a1);
  }
  else
  {
    v10 = (void *)sub_23A890148();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a1;
    v15[4] = sub_23A8745EC;
    v15[5] = v11;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 1107296256;
    v15[2] = sub_23A888918;
    v15[3] = &block_descriptor;
    v12 = _Block_copy(v15);
    swift_bridgeObjectRetain();
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v12);

  }
LABEL_10:
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  swift_release();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  v13 = *(unsigned __int8 *)(result + 41);
  result = swift_release();
  if (v13 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_23A890C00;
    *(_QWORD *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B8);
    *(_QWORD *)(v14 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_23A8904E4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A8729AC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];

  v6 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A890190();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902A4();
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v13 = (void *)sub_23A89034C();
  sub_23A890064();

  v20[0] = 0xD00000000000002BLL;
  v20[1] = 0x800000023A891EF0;
  sub_23A890184();
  sub_23A8724FC();
  v14 = sub_23A890394();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();
  if (v14)
  {
    nm_CRSetCrashLogMessage(v14 + 32);
    swift_bridgeObjectRelease();
  }
  v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720) + 48);
  v16 = sub_23A890034();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v8, a1, v16);
  *(double *)&v8[v15] = a3;
  type metadata accessor for TargetType(0);
  swift_storeEnumTagMultiPayload();
  v17 = swift_allocObject();
  swift_weakInit();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  *(_QWORD *)(v18 + 24) = a2;
  swift_retain();
  swift_retain();
  sub_23A88EEC4((uint64_t)v8);
  swift_release();
  swift_release();
  return sub_23A874354((uint64_t)v8);
}

uint64_t sub_23A872C10(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = *(_QWORD *)(result + 32);
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      goto LABEL_14;
    }
    *(_QWORD *)(result + 32) = v5;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v6 = *(unsigned __int8 *)(result + 40);
      swift_release();
      if (v6 != 1)
        goto LABEL_8;
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  sub_23A87EB6C(a1);
LABEL_8:
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  swift_release();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v7 = *(unsigned __int8 *)(result + 41);
  result = swift_release();
  if (v7 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B0);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_23A890C00;
    *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B8);
    *(_QWORD *)(v8 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_23A8904E4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A872D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_23A8904F0();
    sub_23A8901B4();
    v6 = sub_23A890508();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23A89049C() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23A89049C() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t MicrostackshotsCoordinator.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t MicrostackshotsCoordinator.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_23A872F0C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58D8);
  v2 = (_QWORD *)sub_23A890460();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23A87F770(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_23A873024(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58A8);
  v2 = (_QWORD *)sub_23A890460();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_23A87F770(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_23A87313C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unint64_t result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v1 = a1;
  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5898);
  v2 = sub_23A890460();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(v1 + 16);
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v23 = v2 + 64;
  swift_retain();
  v25 = v4 - 1;
  v5 = 32;
  for (i = v1; ; v1 = i)
  {
    v24 = v5;
    v6 = v1 + v5;
    v7 = *(_OWORD *)(v6 + 48);
    v35 = *(_OWORD *)(v6 + 32);
    v36 = v7;
    v8 = *(_OWORD *)(v6 + 80);
    v37 = *(_OWORD *)(v6 + 64);
    v38 = v8;
    v9 = *(_OWORD *)(v6 + 112);
    v39 = *(_OWORD *)(v6 + 96);
    v40 = v9;
    v10 = *(_OWORD *)(v6 + 16);
    v34[0] = *(_OWORD *)v6;
    v34[1] = v10;
    v11 = *(_QWORD *)(v6 + 128);
    v41 = v11;
    v12 = v10;
    v13 = v35;
    v14 = v36;
    v32 = *((_QWORD *)&v37 + 1);
    v33 = v37;
    v30 = *((_QWORD *)&v38 + 1);
    v31 = v38;
    v28 = *((_QWORD *)&v39 + 1);
    v29 = v39;
    v26 = *((_QWORD *)&v9 + 1);
    v27 = v9;
    v15 = v34[0];
    sub_23A8744A4((uint64_t)v34);
    result = sub_23A87F770(v15, *((uint64_t *)&v15 + 1));
    if ((v17 & 1) != 0)
      break;
    *(_QWORD *)(v23 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v15;
    v18 = v3[7] + 120 * result;
    *(_OWORD *)v18 = v12;
    *(_OWORD *)(v18 + 16) = v13;
    *(_OWORD *)(v18 + 32) = v14;
    *(_QWORD *)(v18 + 48) = v33;
    *(_QWORD *)(v18 + 56) = v32;
    *(_QWORD *)(v18 + 64) = v31;
    *(_QWORD *)(v18 + 72) = v30;
    *(_QWORD *)(v18 + 80) = v29;
    *(_QWORD *)(v18 + 88) = v28;
    *(_QWORD *)(v18 + 96) = v27;
    *(_QWORD *)(v18 + 104) = v26;
    *(_QWORD *)(v18 + 112) = v11;
    v19 = v3[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_12;
    v3[2] = v21;
    if (!v25)
    {
      swift_release();
      goto LABEL_10;
    }
    --v25;
    v5 = v24 + 136;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_23A87332C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58A0);
  v2 = sub_23A890460();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v21 = v2 + 64;
  swift_retain();
  v5 = (_QWORD *)(a1 + 144);
  while (1)
  {
    v22 = v4;
    v6 = *(v5 - 14);
    v7 = *(v5 - 13);
    v8 = *(v5 - 11);
    v29 = *(v5 - 12);
    v28 = *((_BYTE *)v5 - 80);
    v9 = *(v5 - 8);
    v10 = *(v5 - 6);
    v26 = *(v5 - 7);
    v27 = *(v5 - 9);
    v11 = *(v5 - 4);
    v12 = *(v5 - 2);
    v24 = *(v5 - 3);
    v25 = *(v5 - 5);
    v13 = *v5;
    v23 = *(v5 - 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23A87F770(v6, v7);
    if ((v15 & 1) != 0)
      break;
    *(_QWORD *)(v21 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = (uint64_t *)(v3[6] + 16 * result);
    *v16 = v6;
    v16[1] = v7;
    v17 = v3[7] + 104 * result;
    *(_QWORD *)v17 = v29;
    *(_QWORD *)(v17 + 8) = v8;
    *(_BYTE *)(v17 + 16) = v28;
    *(_QWORD *)(v17 + 24) = v27;
    *(_QWORD *)(v17 + 32) = v9;
    *(_QWORD *)(v17 + 40) = v26;
    *(_QWORD *)(v17 + 48) = v10;
    *(_QWORD *)(v17 + 56) = v25;
    *(_QWORD *)(v17 + 64) = v11;
    *(_QWORD *)(v17 + 72) = v24;
    *(_QWORD *)(v17 + 80) = v12;
    *(_QWORD *)(v17 + 88) = v23;
    *(_QWORD *)(v17 + 96) = v13;
    v18 = v3[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    v3[2] = v20;
    v5 += 15;
    v4 = v22 - 1;
    if (v22 == 1)
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

_QWORD *sub_23A8734F4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23A873500(uint64_t a1, uint64_t a2)
{
  return sub_23A873648(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23A87350C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23A890154();
  *a2 = 0;
  return result;
}

uint64_t sub_23A873580(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23A890160();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23A8735FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23A89016C();
  v2 = sub_23A890148();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A87363C(uint64_t a1, uint64_t a2)
{
  return sub_23A873648(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23A873648(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23A89016C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A873684()
{
  sub_23A89016C();
  sub_23A8901B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A8736C4()
{
  uint64_t v0;

  sub_23A89016C();
  sub_23A8904F0();
  sub_23A8901B4();
  v0 = sub_23A890508();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_23A873734(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_23A87373C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23A87376C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23A873780@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_23A873794(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23A8737A8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23A8737BC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

BOOL sub_23A8737D0()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_23A8737E0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_23A8737F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23A89016C();
  v2 = v1;
  if (v0 == sub_23A89016C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23A89049C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_23A87387C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A873890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23A890148();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A8738D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A89016C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A8738FC()
{
  sub_23A874440(&qword_2569C5888, (uint64_t)&unk_23A890DA8);
  sub_23A874440(&qword_2569C5890, (uint64_t)&unk_23A890D48);
  return sub_23A890478();
}

void sub_23A873968()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = v2 - 2;
  if (v2 >= 2)
  {
    v4 = 0;
    while (1)
    {
      v13 = 0;
      MEMORY[0x23B859C20](&v13, 8);
      v6 = (v13 * (unsigned __int128)v2) >> 64;
      if (v2 > v13 * v2)
      {
        v7 = -(uint64_t)v2 % v2;
        if (v7 > v13 * v2)
        {
          do
          {
            v13 = 0;
            MEMORY[0x23B859C20](&v13, 8);
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
        v9 = *(_QWORD *)(v1 + 16);
        if (v4 >= v9)
          goto LABEL_19;
        if (v8 >= v9)
          goto LABEL_20;
        v10 = *(_DWORD *)(v1 + 32 + 4 * v4);
        v11 = *(_DWORD *)(v1 + 32 + 4 * v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_23A873AAC(v1);
        v12 = *(_QWORD *)(v1 + 16);
        if (v4 >= v12)
          goto LABEL_21;
        *(_DWORD *)(v1 + 32 + 4 * v4) = v11;
        if (v8 >= v12)
          goto LABEL_22;
        *(_DWORD *)(v1 + 32 + 4 * v8) = v10;
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

uint64_t sub_23A873AAC(uint64_t a1)
{
  return sub_23A88AC10(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A873AC0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  unsigned int v36;
  unsigned int v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  char *v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  unsigned int v57;
  id v58;
  uint64_t v59;
  id v60;
  char *v61;
  __int128 v62;
  void *v63;
  unsigned __int8 v64;
  unsigned __int8 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v56 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902C8();
  v3 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v4 = (void *)sub_23A89034C();
  sub_23A890064();

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE80CF8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58C0);
  v6 = swift_allocObject();
  v62 = xmmword_23A890C00;
  *(_OWORD *)(v6 + 16) = xmmword_23A890C00;
  *(_QWORD *)(v6 + 32) = sub_23A89016C();
  *(_QWORD *)(v6 + 40) = v7;
  v8 = (void *)sub_23A89025C();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setEndowmentNamespaces_, v8);

  objc_msgSend(v5, sel_setValues_, 1);
  v9 = objc_msgSend((id)objc_opt_self(), sel_predicateMatchingProcessTypeApplication);
  v10 = (void *)objc_opt_self();
  *(_QWORD *)&v66 = 0;
  v11 = objc_msgSend(v10, sel_statesForPredicate_withDescriptor_error_, v9, v5, &v66);
  v12 = (void *)v66;
  if (v11)
  {
    v13 = v11;
    v59 = v3;
    sub_23A874644(0, &qword_2569C58D0);
    v14 = sub_23A890268();
    v15 = v12;

    v58 = v9;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v16 = sub_23A89043C();
      v60 = v5;
      if (v16)
        goto LABEL_4;
    }
    else
    {
      v16 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      v60 = v5;
      if (v16)
      {
LABEL_4:
        if (v16 < 1)
          __break(1u);
        v17 = 0;
        v61 = (char *)MEMORY[0x24BEE4AF8];
        while (1)
        {
          if ((v14 & 0xC000000000000001) != 0)
            v18 = (id)MEMORY[0x23B85953C](v17, v14);
          else
            v18 = *(id *)(v14 + 8 * v17 + 32);
          v19 = v18;
          if (objc_msgSend(v18, sel_taskState) != 4)
            goto LABEL_25;
          v20 = objc_msgSend(v19, sel_endowmentNamespaces);
          if (!v20)
            goto LABEL_25;
          v21 = v20;
          v22 = sub_23A890280();

          v23 = sub_23A89016C();
          v25 = sub_23A872D98(v23, v24, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v25 & 1) == 0)
            goto LABEL_25;
          v26 = objc_msgSend(v19, sel_process);
          if (!v26)
            goto LABEL_25;
          v27 = v26;
          v28 = objc_msgSend(v26, sel_bundle);

          if (!v28)
            goto LABEL_25;
          v29 = objc_msgSend(v28, sel_identifier);

          if (!v29)
            goto LABEL_25;
          sub_23A89016C();

          v30 = objc_msgSend(v19, sel_process);
          if (v30)
            break;

          swift_bridgeObjectRelease();
LABEL_26:
          if (v16 == ++v17)
            goto LABEL_32;
        }
        v31 = v30;
        v57 = objc_msgSend(v30, sel_pid);

        v32 = objc_allocWithZone(MEMORY[0x24BDC1540]);
        v33 = (void *)sub_23A890148();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v66 = 0;
        v34 = objc_msgSend(v32, sel_initWithBundleIdentifier_allowPlaceholder_error_, v33, 0, &v66);

        if (v34)
        {
          v35 = (id)v66;
          v36 = objc_msgSend(v34, sel_developerType);

          if (v36 == 3)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v61 = sub_23A885948(0, *((_QWORD *)v61 + 2) + 1, 1, v61);
            v37 = v57;
            v39 = *((_QWORD *)v61 + 2);
            v38 = *((_QWORD *)v61 + 3);
            if (v39 >= v38 >> 1)
              v61 = sub_23A885948((char *)(v38 > 1), v39 + 1, 1, v61);
            v40 = v61;
            *((_QWORD *)v61 + 2) = v39 + 1;
            *(_DWORD *)&v40[4 * v39 + 32] = v37;
          }
          goto LABEL_26;
        }
        v41 = (id)v66;
        v42 = (void *)sub_23A88FF5C();

        swift_willThrow();
LABEL_25:

        goto LABEL_26;
      }
    }
    v61 = (char *)MEMORY[0x24BEE4AF8];
LABEL_32:

    swift_bridgeObjectRelease_n();
    v5 = v60;
    v46 = v61;
    v49 = *((_QWORD *)v61 + 2);
    if (v49)
      goto LABEL_33;
LABEL_29:
    swift_bridgeObjectRelease();
    sub_23A8902BC();
    v50 = (void *)sub_23A89034C();
    sub_23A890064();

    return 0;
  }
  v43 = (id)v66;
  v44 = (void *)sub_23A88FF5C();

  swift_willThrow();
  sub_23A8902BC();
  v45 = (void *)sub_23A89034C();
  v46 = (char *)MEMORY[0x24BEE4AF8];
  sub_23A890064();

  v65 = 1;
  v47 = type metadata accessor for TargetType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v2, 1, 1, v47);
  v64 = 9;
  *(_QWORD *)&v66 = 0;
  *((_QWORD *)&v66 + 1) = 0xE000000000000000;
  sub_23A8903DC();
  sub_23A8901C0();
  v63 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58C8);
  sub_23A89040C();
  v48 = v66;
  v66 = 0u;
  sub_23A8879F4(&v65, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v64, v48, *((uint64_t *)&v48 + 1), (uint64_t *)&v66);
  swift_bridgeObjectRelease();

  sub_23A8742E4((uint64_t)v2);
  v49 = *((_QWORD *)v46 + 2);
  if (!v49)
    goto LABEL_29;
LABEL_33:
  sub_23A8902C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v52 = swift_allocObject();
  v53 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v52 + 16) = v62;
  v54 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v52 + 56) = v53;
  *(_QWORD *)(v52 + 64) = v54;
  *(_QWORD *)(v52 + 32) = v49;
  v55 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  *(_QWORD *)&v66 = v46;
  swift_bridgeObjectRetain();
  sub_23A873968();
  swift_bridgeObjectRelease();

  return v66;
}

unint64_t sub_23A8742A0()
{
  unint64_t result;

  result = qword_2569C5718;
  if (!qword_2569C5718)
  {
    result = MEMORY[0x23B859B78](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569C5718);
  }
  return result;
}

uint64_t sub_23A8742E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A874324()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A87434C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A87276C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A874354(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AnalyzableTarget(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for MicrostackshotsCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for MicrostackshotsCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.__allocating_init(interruptCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.__allocating_init(interruptCallback:sendEvents:printTostdout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.analyzeMicrostackshotsUntilEventsLimitSent()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.analyzeMicrostackshots(pid:randomizer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_23A874790(a1, &qword_2569C5868);
}

uint64_t sub_23A8743F8()
{
  return sub_23A874440(&qword_2569C5870, (uint64_t)&unk_23A890D0C);
}

uint64_t sub_23A87441C()
{
  return sub_23A874440(&qword_2569C5878, (uint64_t)&unk_23A890CE0);
}

uint64_t sub_23A874440(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    result = MEMORY[0x23B859B78](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A874480()
{
  return sub_23A874440(&qword_2569C5880, (uint64_t)&unk_23A890D7C);
}

uint64_t sub_23A8744A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A874558(v4, v2);
  return a1;
}

uint64_t sub_23A874558(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23A8745C8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8745EC()
{
  return swift_bridgeObjectRetain();
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

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A87463C(uint64_t a1)
{
  return sub_23A872C10(a1);
}

uint64_t sub_23A874644(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppBundleParser(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy28_4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23A8746C4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 28))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A8746E4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 28) = v3;
  return result;
}

void type metadata accessor for mach_header(uint64_t a1)
{
  sub_23A874790(a1, &qword_2569C58E0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23A874734(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A874754(uint64_t result, int a2, int a3)
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

void type metadata accessor for _CSTypeRef(uint64_t a1)
{
  sub_23A874790(a1, &qword_2569C58E8);
}

void sub_23A874790(uint64_t a1, unint64_t *a2)
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

uint64_t destroy for AppBundleParser()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppBundleParser(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppBundleParser(_QWORD *a1, _QWORD *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for AppBundleParser(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppBundleParser(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppBundleParser(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppBundleParser()
{
  return &type metadata for AppBundleParser;
}

uint64_t sub_23A874A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;

  v4 = sub_23A88FEB4();
  v46 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v45 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v49 = a1;
  *((_QWORD *)&v49 + 1) = a2;
  v51 = 47;
  v52 = 0xE100000000000000;
  sub_23A8724FC();
  v6 = sub_23A890370();
  v7 = 0xE000000000000000;
  v51 = 0;
  v52 = 0xE000000000000000;
  v8 = *(_QWORD *)(v6 + 16);
  v47 = v4;
  if (v8)
  {
    v9 = (unint64_t *)(v6 + 40);
    while (1)
    {
      v10 = *(v9 - 1);
      v7 = *v9;
      *(_QWORD *)&v49 = 47;
      *((_QWORD *)&v49 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_23A8901C0();
      sub_23A8901C0();
      swift_bridgeObjectRelease();
      if ((sub_23A890238() & 1) != 0)
        break;
      v9 += 2;
      swift_bridgeObjectRelease();
      if (!--v8)
      {
        v10 = 0;
        v7 = 0xE000000000000000;
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }
  swift_bridgeObjectRelease();
  if (!v10 && v7 == 0xE000000000000000 || (sub_23A89049C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    v35 = 0;
    v36 = 0xE000000000000000;
    goto LABEL_38;
  }
  v11 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v12 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithPath_, v12);

  if (!v13)
  {
    v49 = 0u;
    v50 = 0u;
    sub_23A875044((uint64_t)&v49);
LABEL_35:
    v49 = 0u;
    v50 = 0u;
LABEL_36:

    sub_23A875044((uint64_t)&v49);
    goto LABEL_37;
  }
  v14 = objc_msgSend(v13, sel_infoDictionary);
  if (!v14)
    goto LABEL_23;
  v15 = v14;
  v16 = sub_23A890118();

  if (*(_QWORD *)(v16 + 16) && (v17 = sub_23A87F770(0xD000000000000013, 0x800000023A8920E0), (v18 & 1) != 0))
  {
    sub_23A875084(*(_QWORD *)(v16 + 56) + 32 * v17, (uint64_t)&v49);
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
  }
  swift_bridgeObjectRelease();
  v19 = *((_QWORD *)&v50 + 1);
  sub_23A875044((uint64_t)&v49);
  if (!v19)
    goto LABEL_25;
  v20 = objc_msgSend(v13, sel_infoDictionary);
  if (v20)
  {
    v21 = v20;
    v22 = sub_23A890118();

    if (*(_QWORD *)(v22 + 16) && (v23 = sub_23A87F770(0xD000000000000013, 0x800000023A8920E0), (v24 & 1) != 0))
    {
      sub_23A875084(*(_QWORD *)(v22 + 56) + 32 * v23, (uint64_t)&v49);
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v50 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
        goto LABEL_47;
      goto LABEL_25;
    }
  }
  else
  {
LABEL_23:
    v49 = 0u;
    v50 = 0u;
  }
  sub_23A875044((uint64_t)&v49);
LABEL_25:
  v25 = objc_msgSend(v13, sel_infoDictionary);
  if (!v25)
    goto LABEL_35;
  v26 = v25;
  v27 = sub_23A890118();

  if (*(_QWORD *)(v27 + 16) && (v28 = sub_23A87F770(0x656C646E75424643, 0xEC000000656D614ELL), (v29 & 1) != 0))
  {
    sub_23A875084(*(_QWORD *)(v27 + 56) + 32 * v28, (uint64_t)&v49);
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v50 + 1))
    goto LABEL_36;
  sub_23A875044((uint64_t)&v49);
  v30 = objc_msgSend(v13, sel_infoDictionary);
  if (!v30)
    goto LABEL_35;
  v31 = v30;
  v32 = sub_23A890118();

  if (*(_QWORD *)(v32 + 16) && (v33 = sub_23A87F770(0x656C646E75424643, 0xEC000000656D614ELL), (v34 & 1) != 0))
  {
    sub_23A875084(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)&v49);
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v50 + 1))
    goto LABEL_36;
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_37;
  }
LABEL_47:
  v37 = v48;
  v49 = v48;
  v38 = v45;
  sub_23A88FEA8();
  v39 = sub_23A89037C();
  v41 = v40;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v47);
  swift_bridgeObjectRelease();
  v42 = HIBYTE(v41) & 0xF;
  if ((v41 & 0x2000000000000000) == 0)
    v42 = v39 & 0xFFFFFFFFFFFFLL;
  if (!v42)
  {
    swift_bridgeObjectRelease();

    goto LABEL_37;
  }
  v49 = v37;
  swift_bridgeObjectRetain();
  sub_23A8901C0();
  swift_bridgeObjectRelease();

  v36 = *((_QWORD *)&v49 + 1);
  v35 = v49;
  if (!(_QWORD)v49)
  {
LABEL_38:
    if (v36 == 0xE000000000000000)
      goto LABEL_39;
  }
  if ((sub_23A89049C() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v35;
  }
LABEL_39:
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23A875044(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C58F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A875084(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A8750C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t *v39;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  unint64_t v46;

  *(_QWORD *)&v43 = a1;
  *((_QWORD *)&v43 + 1) = a2;
  sub_23A8724FC();
  swift_bridgeObjectRetain_n();
  v5 = sub_23A890370();
  v45 = 0;
  v46 = 0xE000000000000000;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v39 = a3;
    v7 = (unint64_t *)(v5 + 40);
    while (1)
    {
      v9 = *(v7 - 1);
      v8 = *v7;
      *(_QWORD *)&v43 = 47;
      *((_QWORD *)&v43 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_23A8901C0();
      sub_23A8901C0();
      swift_bridgeObjectRelease();
      if ((sub_23A890238() & 1) != 0)
        break;
      v7 += 2;
      swift_bridgeObjectRelease();
      if (!--v6)
      {
        swift_bridgeObjectRelease();
        v9 = 0;
        v8 = 0xE000000000000000;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    sub_23A8902B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_23A890C00;
    *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v11 + 64) = sub_23A8742A0();
    *(_QWORD *)(v11 + 32) = v9;
    *(_QWORD *)(v11 + 40) = v8;
    sub_23A875650();
    swift_bridgeObjectRetain();
    v12 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

LABEL_8:
    a3 = v39;
    v10 = a1;
    if (v9)
      goto LABEL_11;
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = 0xE000000000000000;
    v10 = a1;
  }
  if (v8 == 0xE000000000000000)
  {
    swift_bridgeObjectRelease();
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_46;
  }
LABEL_11:
  v17 = sub_23A89049C();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_46;
  }
  v18 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v19 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v18, sel_initWithPath_, v19);

  if (!v20)
  {
    v14 = 0;
    v13 = 0;
LABEL_22:
    v43 = 0u;
    v44 = 0u;
    goto LABEL_23;
  }
  v21 = objc_msgSend(v20, sel_bundleIdentifier);
  if (v21)
  {
    v22 = v21;
    v13 = sub_23A89016C();
    v14 = v23;

  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  v24 = objc_msgSend(v20, sel_infoDictionary, v39);
  if (!v24)
    goto LABEL_22;
  v25 = v24;
  v26 = sub_23A890118();

  if (*(_QWORD *)(v26 + 16) && (v27 = sub_23A87F770(0xD00000000000001ALL, 0x800000023A892100), (v28 & 1) != 0))
  {
    sub_23A875084(*(_QWORD *)(v26 + 56) + 32 * v27, (uint64_t)&v43);
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v44 + 1))
  {
    if (swift_dynamicCast())
    {
      v15 = v41;
      v16 = v42;

      goto LABEL_46;
    }
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
LABEL_23:
  sub_23A875044((uint64_t)&v43);
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_44;
LABEL_31:
  v29 = objc_msgSend(v20, sel_infoDictionary, v39);
  if (!v29)
  {

LABEL_44:
    v43 = 0u;
    v44 = 0u;
LABEL_45:
    sub_23A875044((uint64_t)&v43);
    v15 = 0;
    v16 = 0;
    goto LABEL_46;
  }
  v30 = v29;
  v31 = sub_23A890118();

  if (*(_QWORD *)(v31 + 16) && (v32 = sub_23A87F770(0x656C646E75424643, 0xEF6E6F6973726556), (v33 & 1) != 0))
  {
    sub_23A875084(*(_QWORD *)(v31 + 56) + 32 * v32, (uint64_t)&v43);
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v44 + 1))
    goto LABEL_45;
  v34 = swift_dynamicCast();
  if (v34)
    v15 = v41;
  else
    v15 = 0;
  if (v34)
    v16 = v42;
  else
    v16 = 0;
LABEL_46:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v35 = sub_23A874A64(v10, a2);
  v37 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease_n();
  *a3 = v10;
  a3[1] = a2;
  a3[2] = v13;
  a3[3] = v14;
  a3[4] = v15;
  a3[5] = v16;
  a3[6] = v35;
  a3[7] = v37;
  return result;
}

unint64_t sub_23A875650()
{
  unint64_t result;

  result = qword_2569C5AF0;
  if (!qword_2569C5AF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569C5AF0);
  }
  return result;
}

uint64_t sub_23A87568C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23A875694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t sub_23A87569C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_OWORD *)(v5 + 40) = xmmword_23A890ED0;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_QWORD *)(v5 + 104) = 0;
  v11 = v5 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_startTime;
  sub_23A890028();
  v12 = OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval) = 0;
  v13 = OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_thirdPartyOnly;
  *(_BYTE *)(v5 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_thirdPartyOnly) = 2;
  *(_DWORD *)(v5 + 16) = -1;
  *(_QWORD *)(v5 + 24) = a3;
  *(_QWORD *)(v5 + 32) = a4;
  swift_beginAccess();
  v14 = sub_23A890034();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v11, a1, v14);
  swift_endAccess();
  *(double *)(v5 + v12) = a5;
  *(_BYTE *)(v5 + v13) = a2;
  return v5;
}

uint64_t sub_23A875794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;

  sub_23A87790C();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = (int *)(v4 + 32);
    do
    {
      v7 = *v6++;
      v8 = (void *)MEMORY[0x23B859758]();
      v9 = sub_23A877FAC(v7);
      sub_23A8791FC(v9);
      sub_23A87990C(v10);
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_symbolicate);
      objc_msgSend(v9, sel_postprocess);
      sub_23A875868(a1, a2, v9);

      objc_autoreleasePoolPop(v8);
      --v5;
    }
    while (v5);
  }
  return swift_bridgeObjectRelease();
}

void sub_23A875868(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t i;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  id v32;
  void *v33;
  BOOL v34;
  unint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  void *v60;
  unint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  void *v95;
  id v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  char isUniquelyReferenced_nonNull_native;
  id v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  id v125;
  int64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  id v132;
  uint64_t v133;
  __n128 v134;
  unint64_t v135;
  id v136;
  unint64_t v137;
  id v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  void *v143;
  id v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  id v159;
  id v160;
  id v161;
  const void *v162;
  const char *v163;
  uint64_t v164;
  int64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  __int128 v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  int64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  __int128 v180;
  unint64_t v181;
  unint64_t v182;
  _QWORD *v183;
  uint64_t v184;
  unint64_t v185;
  _QWORD *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int64_t v191;
  unint64_t v192;
  unint64_t v193;
  id v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  unint64_t v202;
  id v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  _QWORD *v220;
  const void *v221;
  id v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  _QWORD v226[5];
  _QWORD *v227;
  __int128 v228;
  uint64_t (*v229)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v230;
  uint64_t (*v231)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v232;
  _QWORD v233[2];
  char v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  unint64_t v242;
  __int128 v243;

  v223 = a2;
  v205 = a1;
  v4 = sub_23A890058();
  v177 = *(_QWORD *)(v4 - 8);
  v178 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v176 = (char *)&v163 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23A87332C(MEMORY[0x24BEE4AF8]);
  v183 = (_QWORD *)(v6 + 16);
  if ((uint64_t)objc_msgSend(a3, sel_numSamples) < 1)
  {
    swift_release();
    return;
  }
  v206 = v6;
  sub_23A8902B0();
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23A890C00;
  v8 = objc_msgSend(a3, sel_tasksByUniquePid);
  v9 = sub_23A874644(0, &qword_2569C5B60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5B68);
  v10 = sub_23A879B28();
  v11 = sub_23A890118();

  v12 = *(_QWORD *)(v11 + 16);
  swift_bridgeObjectRelease();
  v13 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v7 + 64) = v13;
  *(_QWORD *)(v7 + 32) = v12;
  v170 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v14 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v15 = objc_msgSend(a3, sel_tasksByUniquePid);
  v190 = v9;
  v181 = v10;
  v16 = sub_23A890118();

  v17 = 0;
  v18 = *(_QWORD *)(v16 + 64);
  v164 = v16 + 64;
  v174 = v16;
  v19 = 1 << *(_BYTE *)(v16 + 32);
  if (v19 < 64)
    v20 = ~(-1 << v19);
  else
    v20 = -1;
  v21 = v20 & v18;
  v165 = (unint64_t)(v19 + 63) >> 6;
  v180 = xmmword_23A890EE0;
  v187 = MEMORY[0x24BEE4AD0] + 8;
  v169 = xmmword_23A890C10;
  v168 = 0x800000023A892500;
  v163 = "unknown main binary";
  if (!v21)
    goto LABEL_7;
LABEL_6:
  v22 = __clz(__rbit64(v21));
  v23 = (v21 - 1) & v21;
  for (i = v22 | (v17 << 6); ; i = __clz(__rbit64(v26)) + (v17 << 6))
  {
    v172 = v23;
    v173 = v17;
    v28 = *(_QWORD *)(*(_QWORD *)(v174 + 56) + 8 * i);
    v179 = v28;
    if (v28 >> 62)
      break;
    v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v29)
      goto LABEL_25;
LABEL_124:
    swift_bridgeObjectRelease();
    v21 = v172;
    v17 = v173;
    if (v172)
      goto LABEL_6;
LABEL_7:
    v25 = v17 + 1;
    if (__OFADD__(v17, 1))
      goto LABEL_135;
    if (v25 >= v165)
    {
LABEL_131:
      swift_release();
      swift_release();
      return;
    }
    v26 = *(_QWORD *)(v164 + 8 * v25);
    ++v17;
    if (!v26)
    {
      v17 = v25 + 1;
      if (v25 + 1 >= v165)
        goto LABEL_131;
      v26 = *(_QWORD *)(v164 + 8 * v17);
      if (!v26)
      {
        v17 = v25 + 2;
        if (v25 + 2 >= v165)
          goto LABEL_131;
        v26 = *(_QWORD *)(v164 + 8 * v17);
        if (!v26)
        {
          v17 = v25 + 3;
          if (v25 + 3 >= v165)
            goto LABEL_131;
          v26 = *(_QWORD *)(v164 + 8 * v17);
          if (!v26)
          {
            v27 = v25 + 4;
            if (v27 >= v165)
              goto LABEL_131;
            v26 = *(_QWORD *)(v164 + 8 * v27);
            if (!v26)
            {
              while (1)
              {
                v17 = v27 + 1;
                if (__OFADD__(v27, 1))
                  goto LABEL_136;
                if (v17 >= v165)
                  goto LABEL_131;
                v26 = *(_QWORD *)(v164 + 8 * v17);
                ++v27;
                if (v26)
                  goto LABEL_22;
              }
            }
            v17 = v27;
          }
        }
      }
    }
LABEL_22:
    v23 = (v26 - 1) & v26;
  }
  swift_bridgeObjectRetain_n();
  v28 = v179;
  v29 = sub_23A89043C();
  swift_bridgeObjectRelease();
  if (!v29)
    goto LABEL_124;
LABEL_25:
  v30 = 0;
  v182 = v28 & 0xC000000000000001;
  v166 = v28 + 32;
  v167 = v28 & 0xFFFFFFFFFFFFFF8;
  v175 = v29;
  while (2)
  {
    if (v182)
    {
      v32 = (id)MEMORY[0x23B85953C](v30, v28);
    }
    else
    {
      if (v30 >= *(_QWORD *)(v167 + 16))
        goto LABEL_134;
      v32 = *(id *)(v166 + 8 * v30);
    }
    v33 = v32;
    v34 = __OFADD__(v30, 1);
    v35 = v30 + 1;
    if (v34)
      goto LABEL_133;
    v36 = objc_msgSend(v32, sel_bundleIdentifier);
    if (v36)
    {

      v37 = objc_msgSend(v33, sel_bundleIdentifier);
      if (!v37)
        goto LABEL_137;
      v38 = v37;
      v39 = sub_23A89016C();
      v41 = v40;

      swift_bridgeObjectRelease();
      v42 = HIBYTE(v41) & 0xF;
      if ((v41 & 0x2000000000000000) == 0)
        v42 = v39 & 0xFFFFFFFFFFFFLL;
      if (v42)
      {
        v43 = v35;
        sub_23A8902B0();
        v44 = swift_allocObject();
        *(_OWORD *)(v44 + 16) = v169;
        v45 = objc_msgSend(v33, sel_mainBinaryPath);
        if (v45)
        {
          v46 = v45;
          v47 = sub_23A89016C();
          v49 = v48;

        }
        else
        {
          v47 = 0;
          v49 = 0;
        }
        v50 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v44 + 56) = MEMORY[0x24BEE0D00];
        v51 = sub_23A8742A0();
        *(_QWORD *)(v44 + 64) = v51;
        v52 = 0xD000000000000013;
        if (v49)
          v52 = v47;
        v53 = v168;
        if (v49)
          v53 = v49;
        *(_QWORD *)(v44 + 32) = v52;
        *(_QWORD *)(v44 + 40) = v53;
        v54 = objc_msgSend(v33, sel_bundleIdentifier, v163);
        if (v54)
        {
          v55 = v54;
          v56 = sub_23A89016C();
          v58 = v57;

          v59 = (uint64_t *)(v44 + 72);
          *(_QWORD *)(v44 + 96) = v50;
          *(_QWORD *)(v44 + 104) = v51;
          if (v58)
          {
            *v59 = v56;
            v35 = v43;
            goto LABEL_49;
          }
        }
        else
        {
          v59 = (uint64_t *)(v44 + 72);
          *(_QWORD *)(v44 + 96) = v50;
          *(_QWORD *)(v44 + 104) = v51;
        }
        v35 = v43;
        *v59 = 0xD000000000000019;
        v58 = (unint64_t)v163 | 0x8000000000000000;
LABEL_49:
        *(_QWORD *)(v44 + 80) = v58;
        v60 = (void *)sub_23A89034C();
        sub_23A890064();
        swift_bridgeObjectRelease();

      }
    }
    v61 = v33;
    v62 = objc_msgSend((id)v61, sel_mainBinaryPath);
    if (!v62)
      goto LABEL_130;
    v63 = v62;
    v214 = sub_23A89016C();
    v215 = v64;

    v65 = objc_msgSend((id)v61, sel_bundleIdentifier);
    if (v65)
    {
      v66 = v65;
      v209 = sub_23A89016C();
      v212 = v67;

    }
    else
    {
      v209 = 0;
      v212 = 0;
    }
    v68 = objc_msgSend((id)v61, sel_bundleShortVersion, v163);
    v213 = (id)v61;
    if (v68)
    {
      v69 = v68;
      v208 = sub_23A89016C();
      v71 = v70;

    }
    else
    {
      v208 = 0;
      v71 = 0;
    }
    swift_bridgeObjectRetain_n();
    v72 = v215;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v73 = v214;
    v207 = sub_23A874A64(v214, v72);
    v210 = v74;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v211 = v71;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    type metadata accessor for MachOParser();
    v75 = (_QWORD *)swift_allocObject();
    swift_bridgeObjectRetain();
    v76 = MEMORY[0x24BEE4AF8];
    v75[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
    v75[7] = v76;
    v75[2] = v73;
    v75[3] = v72;
    v75[4] = sub_23A8769EC;
    v75[5] = 0;
    swift_bridgeObjectRetain();
    v77 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v231 = sub_23A879BA4;
    v232 = v75;
    *(_QWORD *)&v228 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v228 + 1) = 1107296256;
    v229 = sub_23A87A648;
    v230 = &block_descriptor_20;
    v78 = _Block_copy(&v228);
    v186 = v75;
    swift_retain();
    swift_release();
    nm_macho_for_each_slice(v77, v78);
    _Block_release(v78);

    v79 = objc_msgSend(v213, sel_mainBinary);
    v185 = v35;
    if (v79)
    {
      v80 = v79;
      v81 = objc_msgSend(v79, sel_uuid);

      v82 = v176;
      sub_23A89004C();

      v83 = sub_23A890040();
      v225 = v84;
      (*(void (**)(char *, uint64_t))(v177 + 8))(v82, v178);
    }
    else
    {
      v83 = 0;
      v225 = 0xE000000000000000;
    }
    v85 = v214;
    v86 = sub_23A882028();
    v87 = sub_23A88FC78(v85);
    v89 = v88;
    swift_bridgeObjectRetain();
    v90 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v91 = nm_extractTeamID(v90);

    if (v91)
    {
      v92 = sub_23A89016C();
      v94 = v93;

    }
    else
    {
      v92 = 0;
      v94 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    v95 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v96 = nm_extractCDHash(v95);

    if (v96)
    {
      v97 = sub_23A89016C();
      v99 = v98;

    }
    else
    {
      v97 = 0;
      v99 = 0xE000000000000000;
    }
    v100 = sub_23A87A90C();
    v233[0] = v83;
    v233[1] = v225;
    if (v101)
      v102 = v100;
    else
      v102 = 0;
    v103 = 0xE000000000000000;
    if (v101)
      v103 = v101;
    v234 = v86;
    v235 = v87;
    v236 = v89;
    v237 = v92;
    v238 = v94;
    v239 = v97;
    v240 = v99;
    v241 = v102;
    v242 = v103;
    v243 = v180;
    v104 = v183;
    swift_beginAccess();
    v105 = v215;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v226[0] = *v104;
    *v104 = 0x8000000000000000;
    sub_23A8808D0((uint64_t)v233, v214, v105, isUniquelyReferenced_nonNull_native);
    *v104 = v226[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    v107 = objc_msgSend(v213, sel_threads);
    v188 = sub_23A874644(0, &qword_2569C5B80);
    v108 = sub_23A890118();

    if ((v108 & 0xC000000000000001) != 0)
    {
      v109 = sub_23A890418();
      v192 = 0;
      v110 = 0;
      v111 = 0;
      v108 = v109 | 0x8000000000000000;
    }
    else
    {
      v112 = -1 << *(_BYTE *)(v108 + 32);
      v113 = *(_QWORD *)(v108 + 64);
      v192 = v108 + 64;
      v114 = ~v112;
      v115 = -v112;
      if (v115 < 64)
        v116 = ~(-1 << v115);
      else
        v116 = -1;
      v111 = v116 & v113;
      v110 = v114;
    }
    v117 = 0;
    v189 = v108 & 0x7FFFFFFFFFFFFFFFLL;
    v184 = v110;
    v191 = (unint64_t)(v110 + 64) >> 6;
    v193 = v108;
LABEL_79:
    if ((v108 & 0x8000000000000000) != 0)
    {
      v120 = sub_23A890424();
      if (!v120)
        goto LABEL_26;
      v122 = v121;
      v226[0] = v120;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v123 = (id)v228;
      swift_unknownObjectRelease();
      v226[0] = v122;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v124 = (void *)v228;
      swift_unknownObjectRelease();
      v125 = v124;
      v119 = v117;
      v197 = v111;
      if (!v123)
      {
LABEL_26:
        sub_23A879BAC();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v31 = v213;

        v30 = v185;
        v28 = v179;
        if (v185 == v175)
          goto LABEL_124;
        continue;
      }
    }
    else
    {
      if (v111)
      {
        v197 = (v111 - 1) & v111;
        v118 = __clz(__rbit64(v111)) | (v117 << 6);
        v119 = v117;
      }
      else
      {
        v126 = v117 + 1;
        if (__OFADD__(v117, 1))
        {
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
          return;
        }
        if (v126 >= v191)
          goto LABEL_26;
        v127 = *(_QWORD *)(v192 + 8 * v126);
        v128 = v117 + 1;
        if (!v127)
        {
          v128 = v117 + 2;
          if (v117 + 2 >= v191)
            goto LABEL_26;
          v127 = *(_QWORD *)(v192 + 8 * v128);
          if (!v127)
          {
            v128 = v117 + 3;
            if (v117 + 3 >= v191)
              goto LABEL_26;
            v127 = *(_QWORD *)(v192 + 8 * v128);
            if (!v127)
            {
              v128 = v117 + 4;
              if (v117 + 4 >= v191)
                goto LABEL_26;
              v127 = *(_QWORD *)(v192 + 8 * v128);
              if (!v127)
              {
                v129 = v117 + 5;
                do
                {
                  if (v191 == v129)
                    goto LABEL_26;
                  v127 = *(_QWORD *)(v192 + 8 * v129++);
                }
                while (!v127);
                v128 = v129 - 1;
                v108 = v193;
              }
            }
          }
        }
        v197 = (v127 - 1) & v127;
        v119 = v128;
        v118 = __clz(__rbit64(v127)) + (v128 << 6);
      }
      v130 = 8 * v118;
      v131 = *(void **)(*(_QWORD *)(v108 + 56) + v130);
      v123 = *(id *)(*(_QWORD *)(v108 + 48) + v130);
      v125 = v131;
      if (!v123)
        goto LABEL_26;
    }
    break;
  }
  v195 = v123;
  v196 = v119;
  v194 = v125;
  v132 = objc_msgSend(v125, sel_threadStates);
  sub_23A874644(0, &qword_2569C5B88);
  v61 = sub_23A890268();

  if (!(v61 >> 62))
  {
    v133 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v133)
      goto LABEL_102;
    goto LABEL_78;
  }
  swift_bridgeObjectRetain();
  v133 = sub_23A89043C();
  swift_bridgeObjectRelease();
  if (!v133)
  {
LABEL_78:

    swift_bridgeObjectRelease();
    v117 = v196;
    v111 = v197;
    v108 = v193;
    goto LABEL_79;
  }
LABEL_102:
  v134.n128_f64[0] = sub_23A879BB4(&v228);
  v135 = 0;
  v201 = v61;
  v202 = v61 & 0xC000000000000001;
  v198 = v61 + 32;
  v199 = v61 & 0xFFFFFFFFFFFFFF8;
  v200 = v133;
  while (2)
  {
    if (v202)
    {
      v136 = (id)MEMORY[0x23B85953C](v135, v61, v134);
    }
    else
    {
      if (v135 >= *(_QWORD *)(v199 + 16))
        goto LABEL_129;
      v136 = *(id *)(v198 + 8 * v135);
    }
    v61 = (unint64_t)v136;
    v34 = __OFADD__(v135, 1);
    v137 = v135 + 1;
    if (!v34)
    {
      v218 = swift_allocObject();
      sub_23A879CE4((uint64_t)&v228, v218 + 16);
      v225 = swift_allocObject();
      *(_QWORD *)(v225 + 16) = 0;
      v138 = objc_msgSend((id)v61, sel_stack);
      sub_23A874644(0, &qword_2569C5B98);
      v139 = sub_23A890268();

      v203 = (id)v61;
      v204 = v137;
      if (v139 >> 62)
      {
        swift_bridgeObjectRetain();
        v140 = sub_23A89043C();
        swift_bridgeObjectRelease();
        if (v140)
        {
LABEL_111:
          if (v140 < 1)
            goto LABEL_128;
          v141 = 0;
          v219 = v139 & 0xC000000000000001;
          v216 = v140;
          v217 = v139;
          do
          {
            if (v219)
              v142 = (id)MEMORY[0x23B85953C](v141, v139);
            else
              v142 = *(id *)(v139 + 8 * v141 + 32);
            v143 = v142;
            v144 = objc_msgSend(v142, sel_instruction);
            if (v144)
            {
              v222 = v144;
              v145 = (_QWORD *)swift_allocObject();
              v146 = v214;
              v147 = v215;
              v145[2] = v143;
              v145[3] = v146;
              v145[4] = v147;
              v145[5] = v146;
              v148 = v209;
              v149 = v210;
              v145[6] = v147;
              v145[7] = v148;
              v150 = v211;
              v151 = v208;
              v145[8] = v212;
              v145[9] = v151;
              v153 = v206;
              v152 = v207;
              v145[10] = v150;
              v145[11] = v152;
              v145[12] = v149;
              v145[13] = v153;
              v154 = v213;
              v155 = v218;
              v145[14] = v213;
              v145[15] = v155;
              v156 = v223;
              v145[16] = v205;
              v145[17] = v156;
              v157 = v224;
              v145[18] = v225;
              v145[19] = v157;
              v226[4] = sub_23A879DA8;
              v227 = v145;
              v226[0] = MEMORY[0x24BDAC760];
              v226[1] = 1107296256;
              v226[2] = sub_23A877890;
              v226[3] = &block_descriptor_30;
              v158 = _Block_copy(v226);
              v220 = v227;
              v221 = v158;
              v159 = v154;
              swift_bridgeObjectRetain_n();
              v140 = v216;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v160 = v143;
              swift_retain();
              v139 = v217;
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_release();
              v162 = v221;
              v161 = v222;
              objc_msgSend(v222, sel_enumerateSymbols_, v221);

              _Block_release(v162);
              v143 = v161;
            }
            ++v141;

          }
          while (v140 != v141);
        }
      }
      else
      {
        v140 = *(_QWORD *)((v139 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v140)
          goto LABEL_111;
      }

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      v61 = v201;
      v135 = v204;
      if (v204 == v200)
        goto LABEL_78;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_128:
  __break(1u);
LABEL_129:
  __break(1u);
LABEL_130:
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

uint64_t sub_23A8769EC()
{
  return 0;
}

uint64_t sub_23A8769F4(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, _QWORD *a10, void (*a11)(id *, uint64_t), uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t result;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v69;
  char v70;
  char v71;
  char v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  unint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  id v107;
  void *v108;
  void *v109;
  unint64_t v110;
  int v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  unint64_t v117;
  id v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t (*v125)(uint64_t);
  uint64_t v126;
  char v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  __int128 v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  id v137;
  unint64_t v138;
  id v139;
  void (*v140)(id *, uint64_t);
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  unint64_t v146;
  id v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  unint64_t v151;
  _QWORD *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181[2];
  unsigned __int8 v182;
  unsigned __int8 v183[49];
  _QWORD v184[8];
  char v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  uint64_t v216;
  id v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t v220;
  unint64_t v221;
  uint64_t v222;
  _QWORD *v223;
  _BYTE v224[456];
  _BYTE v225[432];
  _BYTE v226[456];
  _QWORD v227[54];
  unsigned __int8 v228[456];
  id v229;
  unint64_t v230;
  uint64_t (*v231)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v232;
  uint64_t (*v233)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v234;
  uint64_t *v235;
  uint64_t v236;
  char v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  char v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint64_t v268;
  id v269;
  unint64_t v270;
  uint64_t v271;
  uint64_t v272;
  unint64_t v273;
  uint64_t v274;
  _QWORD *v275;
  _QWORD v276[2];
  char v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  unint64_t v281;
  uint64_t v282;
  unint64_t v283;
  uint64_t v284;
  unint64_t v285;
  __int128 v286;

  v179 = a5;
  v180 = a6;
  v178 = a1;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v137 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23A890058();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v137 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = objc_msgSend(a4, sel_instruction);
  if (!v24)
    goto LABEL_10;
  v25 = v24;
  v26 = objc_msgSend(v24, sel_binary);

  if (!v26)
    goto LABEL_10;
  v27 = objc_msgSend(v26, sel_path);

  if (!v27)
    goto LABEL_10;
  v176 = sub_23A89016C();
  v177 = v28;

  v29 = objc_msgSend(a4, sel_instruction);
  if (!v29
    || (v30 = v29, v31 = objc_msgSend(v29, sel_binary), v30, !v31))
  {
    swift_bridgeObjectRelease();
LABEL_10:
    v228[0] = 1;
    v38 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v19, 1, 1, v38);
    v39 = sub_23A88FC78(v179);
    v40 = *(_QWORD *)(a7 + 48);
    v41 = *(_QWORD *)(a7 + 56);
    v42 = *(_OWORD *)(a7 + 16);
    v43 = *(_QWORD *)(a7 + 32);
    v44 = *(_QWORD *)(a7 + 40);
    LOBYTE(v227[0]) = 2;
    v230 = 0;
    v229 = 0;
    sub_23A8879F4(v228, (uint64_t)v19, 0, 1, v39, v45, v40, v41, v42, *((unint64_t *)&v42 + 1), v43, v44, (unsigned __int8 *)v227, 0xD00000000000001FLL, 0x800000023A892640, (uint64_t *)&v229);
LABEL_11:
    swift_bridgeObjectRelease();
    return sub_23A8742E4((uint64_t)v19);
  }
  v32 = (uint64_t *)(a8 + 16);
  v33 = objc_msgSend(v31, sel_uuid);

  sub_23A89004C();
  v174 = sub_23A890040();
  v175 = v34;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  swift_beginAccess();
  v35 = v177;
  if (*(_QWORD *)(*v32 + 16)
    && (swift_bridgeObjectRetain(), sub_23A87F770(v176, v35), v37 = v36, swift_bridgeObjectRelease(), (v37 & 1) != 0))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v173 = v32;
    type metadata accessor for MachOParser();
    v47 = (_QWORD *)swift_allocObject();
    swift_bridgeObjectRetain();
    v48 = MEMORY[0x24BEE4AF8];
    v47[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
    v47[7] = v48;
    v49 = v176;
    v47[2] = v176;
    v47[3] = v35;
    v47[4] = sub_23A8769EC;
    v47[5] = 0;
    swift_bridgeObjectRetain();
    v50 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v233 = sub_23A879BA4;
    v234 = v47;
    v229 = (id)MEMORY[0x24BDAC760];
    v230 = 1107296256;
    v231 = sub_23A87A648;
    v232 = &block_descriptor_34;
    v51 = _Block_copy(&v229);
    swift_retain();
    swift_release();
    nm_macho_for_each_slice(v50, v51);
    _Block_release(v51);

    v172 = sub_23A882028();
    v52 = sub_23A88FC78(v49);
    v54 = v53;
    swift_bridgeObjectRetain();
    v55 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v56 = nm_extractTeamID(v55);

    v170 = v54;
    v171 = v52;
    if (v56)
    {
      v57 = sub_23A89016C();
      v168 = v58;
      v169 = v57;

    }
    else
    {
      v168 = 0xE000000000000000;
      v169 = 0;
    }
    swift_bridgeObjectRetain();
    v59 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v60 = nm_extractCDHash(v59);

    v32 = v173;
    if (v60)
    {
      v61 = sub_23A89016C();
      v63 = v62;

    }
    else
    {
      v61 = 0;
      v63 = 0xE000000000000000;
    }
    v64 = sub_23A87A90C();
    if (v65)
      v66 = v64;
    else
      v66 = 0;
    if (v65)
      v67 = v65;
    else
      v67 = 0xE000000000000000;
    v276[0] = v174;
    v276[1] = v175;
    v277 = v172;
    v278 = v171;
    v279 = v170;
    v280 = v169;
    v281 = v168;
    v282 = v61;
    v283 = v63;
    v284 = v66;
    v285 = v67;
    v286 = xmmword_23A890EE0;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v227[0] = *v32;
    *v32 = 0x8000000000000000;
    v35 = v177;
    sub_23A87E798((uint64_t)v276, v176, v177, isUniquelyReferenced_nonNull_native, (uint64_t)&v229);
    *v32 = v227[0];
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    sub_23A879DE4((uint64_t)v229, v230);
  }
  v69 = v180;
  swift_beginAccess();
  if (!*(_QWORD *)(*v32 + 16))
    goto LABEL_38;
  swift_bridgeObjectRetain();
  sub_23A87F770(v179, v69);
  v71 = v70;
  swift_endAccess();
  if ((v71 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (!*(_QWORD *)(*v32 + 16))
    goto LABEL_38;
  swift_bridgeObjectRetain();
  sub_23A87F770(v176, v35);
  if ((v72 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_endAccess();
    return swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v73 = *v32;
  if (!*(_QWORD *)(*v32 + 16))
  {
LABEL_60:
    swift_endAccess();
    __break(1u);
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  v74 = sub_23A87F770(v179, v69);
  if ((v75 & 1) == 0)
  {
LABEL_59:
    swift_bridgeObjectRelease();
    goto LABEL_60;
  }
  v76 = *(_QWORD *)(v73 + 56) + 104 * v74;
  v77 = *(uint64_t **)v76;
  v78 = *(_QWORD *)(v76 + 8);
  v172 = *(unsigned __int8 *)(v76 + 16);
  v79 = *(_QWORD *)(v76 + 32);
  v171 = *(_QWORD *)(v76 + 24);
  v80 = *(_QWORD *)(v76 + 40);
  v177 = *(_QWORD *)(v76 + 48);
  v168 = *(_QWORD *)(v76 + 56);
  v169 = v80;
  v175 = *(_QWORD *)(v76 + 64);
  v81 = *(_QWORD *)(v76 + 72);
  v82 = *(_QWORD *)(v76 + 80);
  v173 = v77;
  v174 = v82;
  v83 = *(_QWORD *)(v76 + 96);
  v166 = *(_QWORD *)(v76 + 88);
  v167 = v81;
  swift_endAccess();
  v165 = v83;
  swift_bridgeObjectRetain();
  v164 = v78;
  swift_bridgeObjectRetain();
  v170 = v79;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v84 = *v32;
  if (!*(_QWORD *)(*v32 + 16))
  {
LABEL_62:
    swift_endAccess();
    result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  v85 = sub_23A87F770(v176, v35);
  if ((v86 & 1) == 0)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  v152 = a10;
  v147 = a9;
  v87 = *(_QWORD *)(v84 + 56) + 104 * v85;
  v88 = *(_QWORD *)(v87 + 8);
  v163 = *(_QWORD *)v87;
  v162 = *(unsigned __int8 *)(v87 + 16);
  v89 = *(_QWORD *)(v87 + 32);
  v161 = *(_QWORD *)(v87 + 24);
  v90 = *(_QWORD *)(v87 + 48);
  v159 = *(_QWORD *)(v87 + 40);
  v91 = *(_QWORD *)(v87 + 64);
  v157 = *(_QWORD *)(v87 + 56);
  v92 = *(_QWORD *)(v87 + 72);
  v176 = *(_QWORD *)(v87 + 80);
  v93 = *(_QWORD *)(v87 + 96);
  v154 = *(_QWORD *)(v87 + 88);
  v155 = v92;
  swift_endAccess();
  v153 = v93;
  swift_bridgeObjectRetain();
  v150 = v88;
  swift_bridgeObjectRetain();
  v160 = v89;
  swift_bridgeObjectRetain();
  v158 = v90;
  swift_bridgeObjectRetain();
  v156 = v91;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  v94 = v178;
  v95 = objc_msgSend(v178, sel_name);
  if (v95)
  {
    v96 = v95;
    v97 = (id)sub_23A89016C();
    v151 = v98;

  }
  else
  {
    v97 = 0;
    v151 = 0xE000000000000000;
  }
  v99 = (uint64_t)(v152 + 2);
  v229 = objc_msgSend(v94, sel_offsetIntoSegment);
  v178 = (id)sub_23A890490();
  v149 = v100;
  v101 = objc_msgSend(a4, sel_instruction);
  v102 = v101;
  if (v101)
  {
    v103 = objc_msgSend(v101, sel_binary);

    if (v103)
    {
      v102 = objc_msgSend(v103, sel_path);

      if (v102)
      {
        v104 = sub_23A89016C();

        v102 = (id)sub_23A88FC78(v104);
        v106 = v105;
        swift_bridgeObjectRelease();
        goto LABEL_46;
      }
    }
    else
    {
      v102 = 0;
    }
  }
  v106 = 0xE000000000000000;
LABEL_46:
  v107 = objc_msgSend(v147, sel_architectureString);
  if (v107)
  {
    v108 = v107;
    v109 = (void *)sub_23A89016C();
    v146 = v110;
    v147 = v109;

  }
  else
  {
    v146 = 0xE000000000000000;
    v147 = 0;
  }
  swift_beginAccess();
  sub_23A879CE4(v99, (uint64_t)v227);
  sub_23A879CE4((uint64_t)v227, (uint64_t)v228);
  v111 = sub_23A879E54((uint64_t)v228);
  v142 = a12;
  if (v111 == 1)
  {
    v143 = 0xE000000000000000;
    v144 = 0;
  }
  else
  {
    v112 = v152[24];
    v143 = v152[25];
    v144 = v112;
    swift_bridgeObjectRetain();
  }
  v140 = a11;
  swift_beginAccess();
  sub_23A879CE4(v99, (uint64_t)v225);
  sub_23A879CE4((uint64_t)v225, (uint64_t)v226);
  v113 = sub_23A879E54((uint64_t)v226);
  v148 = v99;
  v145 = (_QWORD *)(a13 + 16);
  v114 = v150;
  v115 = v164;
  if (v113 == 1)
  {
    v141 = 0;
    v152 = (_QWORD *)0xE000000000000000;
  }
  else
  {
    v116 = (_QWORD *)v152[3];
    v141 = v152[2];
    v152 = v116;
    swift_bridgeObjectRetain();
  }
  v229 = v97;
  v230 = v151;
  v231 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v178;
  v232 = v149;
  v233 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v102;
  v234 = (_QWORD *)v106;
  v235 = v173;
  v236 = v115;
  v137 = v97;
  v138 = v106;
  v237 = v172;
  v238 = v171;
  v139 = v102;
  v239 = v170;
  v240 = v169;
  v241 = v177;
  v242 = v168;
  v243 = v175;
  v244 = v167;
  v245 = v174;
  v246 = v166;
  v247 = v165;
  v248 = v163;
  v249 = v114;
  v250 = v162;
  v251 = v161;
  v252 = v160;
  v253 = v159;
  v254 = v158;
  v255 = v157;
  v256 = v156;
  v257 = v155;
  v258 = v176;
  v259 = v154;
  v260 = v153;
  v267 = 0u;
  v266 = 0u;
  v265 = 0u;
  v264 = 0u;
  v263 = 0u;
  v262 = 0u;
  v261 = 0u;
  v268 = 0;
  v117 = v146;
  v118 = v147;
  v269 = v147;
  v270 = v146;
  v271 = 1;
  v120 = v143;
  v119 = v144;
  v272 = v144;
  v273 = v143;
  v121 = v141;
  v274 = v141;
  v122 = v152;
  v275 = v152;
  v140(&v229, a7);
  v184[0] = v137;
  v184[1] = v151;
  v184[2] = v178;
  v184[3] = v149;
  v184[4] = v139;
  v184[5] = v138;
  v184[6] = v173;
  v184[7] = v164;
  v185 = v172;
  v186 = v171;
  v187 = v170;
  v188 = v169;
  v189 = v177;
  v190 = v168;
  v191 = v175;
  v192 = v167;
  v193 = v174;
  v194 = v166;
  v195 = v165;
  v196 = v163;
  v197 = v150;
  v198 = v162;
  v199 = v161;
  v200 = v160;
  v201 = v159;
  v202 = v158;
  v203 = v157;
  v204 = v156;
  v205 = v155;
  v206 = v176;
  v207 = v154;
  v208 = v153;
  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  v209 = 0u;
  v216 = 0;
  v217 = v118;
  v218 = v117;
  v219 = 1;
  v220 = v119;
  v221 = v120;
  v222 = v121;
  v223 = v122;
  nullsub_1(v184);
  v123 = v148;
  swift_beginAccess();
  sub_23A879CE4(v123, (uint64_t)v224);
  sub_23A879CE4((uint64_t)v184, v123);
  sub_23A879E70((uint64_t)v224);
  v124 = v145;
  swift_beginAccess();
  if (__OFADD__(*v124, 1))
  {
    __break(1u);
    goto LABEL_59;
  }
  ++*v124;
  v125 = *(uint64_t (**)(uint64_t))(a14 + 24);
  v126 = swift_retain();
  v127 = v125(v126);
  result = swift_release();
  if ((v127 & 1) != 0)
  {
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v128 = (void *)sub_23A89034C();
    sub_23A890064();

    v183[0] = 1;
    v129 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v129 - 8) + 56))(v19, 1, 1, v129);
    v130 = sub_23A88FC78(v179);
    v131 = *(_QWORD *)(a7 + 48);
    v132 = *(_QWORD *)(a7 + 56);
    v133 = *(_OWORD *)(a7 + 16);
    v134 = *(_QWORD *)(a7 + 32);
    v135 = *(_QWORD *)(a7 + 40);
    v182 = 4;
    v181[0] = 0;
    v181[1] = 0;
    sub_23A8879F4(v183, (uint64_t)v19, 0, 1, v130, v136, v131, v132, v133, *((unint64_t *)&v133 + 1), v134, v135, &v182, 0xD00000000000002DLL, 0x800000023A891C60, v181);
    goto LABEL_11;
  }
  return result;
}

void sub_23A877890(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void (*v7)(id, void *, uint64_t);
  id v8;
  id v9;

  v7 = *(void (**)(id, void *, uint64_t))(a1 + 32);
  swift_retain();
  v9 = a2;
  v8 = a3;
  v7(v9, a3, a4);
  swift_release();

}

void sub_23A87790C()
{
  id v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char **p_name;
  char *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  void *v54;
  unsigned int v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  int64_t v64;
  char *v65;
  uint64_t v66;

  v0 = sub_23A877FAC(-1);
  objc_msgSend(v0, sel_postprocess);
  if ((uint64_t)objc_msgSend(v0, sel_numSamples) < 1)
  {

    return;
  }
  sub_23A8902B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23A890C00;
  v2 = objc_msgSend(v0, sel_tasksByUniquePid);
  sub_23A874644(0, &qword_2569C5B60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5B68);
  sub_23A879B28();
  v3 = sub_23A890118();

  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  v5 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v1 + 64) = v5;
  *(_QWORD *)(v1 + 32) = v4;
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v6 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v7 = objc_msgSend(v0, sel_tasksByUniquePid);
  v8 = sub_23A890118();

  v9 = 0;
  v10 = v8 + 64;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v8 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  v15 = (char *)MEMORY[0x24BEE4AF8];
  v62 = v8;
  v63 = v0;
  v60 = v14;
  v61 = v8 + 64;
  if (!v13)
    goto LABEL_8;
  while (2)
  {
    while (1)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v17 = v16 | (v9 << 6);
LABEL_24:
      v21 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v17);
      if (v21 >> 62)
        break;
      v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v22)
        goto LABEL_26;
LABEL_6:
      swift_bridgeObjectRelease();
      if (!v13)
        goto LABEL_8;
    }
    swift_bridgeObjectRetain_n();
    v22 = sub_23A89043C();
    swift_bridgeObjectRelease();
    if (!v22)
      goto LABEL_6;
LABEL_26:
    v64 = v9;
    v66 = v22;
    v23 = 4;
    p_name = (char **)(&stru_250BB0FF8 + 8);
    do
    {
      if ((v21 & 0xC000000000000001) != 0)
        v26 = (id)MEMORY[0x23B85953C](v23 - 4, v21);
      else
        v26 = *(id *)(v21 + 8 * v23);
      v27 = v26;
      v28 = v23 - 3;
      if (__OFADD__(v23 - 4, 1))
      {
        __break(1u);
        goto LABEL_63;
      }
      v29 = objc_msgSend(v26, p_name[111]);
      if (v29)
      {

        v30 = objc_msgSend(v27, p_name[111]);
        if (!v30)
          goto LABEL_65;
        v31 = v30;
        v32 = sub_23A89016C();
        v34 = v33;

        swift_bridgeObjectRelease();
        v35 = HIBYTE(v34) & 0xF;
        if ((v34 & 0x2000000000000000) == 0)
          v35 = v32 & 0xFFFFFFFFFFFFLL;
        if (v35)
        {
          v36 = objc_msgSend(v27, p_name[111]);
          if (!v36)
            goto LABEL_66;
          v37 = v36;
          sub_23A89016C();

          LOBYTE(v37) = sub_23A87A258();
          swift_bridgeObjectRelease();
          if ((v37 & 1) == 0)
          {
            sub_23A8902B0();
            v38 = swift_allocObject();
            *(_OWORD *)(v38 + 16) = xmmword_23A890C10;
            v39 = objc_msgSend(v27, sel_mainBinaryPath);
            if (v39)
            {
              v40 = v39;
              v41 = sub_23A89016C();
              v43 = v42;

            }
            else
            {
              v41 = 0;
              v43 = 0;
            }
            v65 = v15;
            v44 = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v38 + 56) = MEMORY[0x24BEE0D00];
            v45 = sub_23A8742A0();
            *(_QWORD *)(v38 + 64) = v45;
            v46 = 0xD000000000000013;
            if (v43)
              v46 = v41;
            v47 = 0x800000023A892500;
            if (v43)
              v47 = v43;
            *(_QWORD *)(v38 + 32) = v46;
            *(_QWORD *)(v38 + 40) = v47;
            v48 = objc_msgSend(v27, sel_bundleIdentifier);
            if (v48)
            {
              v49 = v48;
              v50 = sub_23A89016C();
              v52 = v51;

              v53 = (uint64_t *)(v38 + 72);
              *(_QWORD *)(v38 + 96) = MEMORY[0x24BEE0D00];
              *(_QWORD *)(v38 + 104) = v45;
              if (v52)
              {
                *v53 = v50;
LABEL_52:
                *(_QWORD *)(v38 + 80) = v52;
                v54 = (void *)sub_23A89034C();
                sub_23A890064();
                swift_bridgeObjectRelease();

                v55 = objc_msgSend(v27, sel_pid);
                v56 = v65;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v56 = sub_23A885948(0, *((_QWORD *)v65 + 2) + 1, 1, v65);
                v58 = *((_QWORD *)v56 + 2);
                v57 = *((_QWORD *)v56 + 3);
                v59 = v56;
                if (v58 >= v57 >> 1)
                  v59 = sub_23A885948((char *)(v57 > 1), v58 + 1, 1, v56);
                *((_QWORD *)v59 + 2) = v58 + 1;
                v25 = &v59[4 * v58];
                v15 = v59;
                *((_DWORD *)v25 + 8) = v55;
                p_name = &stru_250BB0FF8.name;
                goto LABEL_28;
              }
            }
            else
            {
              v53 = (uint64_t *)(v38 + 72);
              *(_QWORD *)(v38 + 96) = v44;
              *(_QWORD *)(v38 + 104) = v45;
            }
            *v53 = 0xD000000000000019;
            v52 = 0x800000023A892520;
            goto LABEL_52;
          }
        }
      }
LABEL_28:

      ++v23;
    }
    while (v28 != v66);
    swift_bridgeObjectRelease();
    v8 = v62;
    v0 = v63;
    v14 = v60;
    v10 = v61;
    v9 = v64;
    if (v13)
      continue;
    break;
  }
LABEL_8:
  v18 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v18 >= v14)
    goto LABEL_60;
  v19 = *(_QWORD *)(v10 + 8 * v18);
  ++v9;
  if (v19)
    goto LABEL_23;
  v9 = v18 + 1;
  if (v18 + 1 >= v14)
    goto LABEL_60;
  v19 = *(_QWORD *)(v10 + 8 * v9);
  if (v19)
    goto LABEL_23;
  v9 = v18 + 2;
  if (v18 + 2 >= v14)
    goto LABEL_60;
  v19 = *(_QWORD *)(v10 + 8 * v9);
  if (v19)
    goto LABEL_23;
  v9 = v18 + 3;
  if (v18 + 3 >= v14)
    goto LABEL_60;
  v19 = *(_QWORD *)(v10 + 8 * v9);
  if (v19)
    goto LABEL_23;
  v20 = v18 + 4;
  if (v20 >= v14)
  {
LABEL_60:

    swift_release();
  }
  else
  {
    v19 = *(_QWORD *)(v10 + 8 * v20);
    if (v19)
    {
      v9 = v20;
LABEL_23:
      v13 = (v19 - 1) & v19;
      v17 = __clz(__rbit64(v19)) + (v9 << 6);
      goto LABEL_24;
    }
    while (1)
    {
      v9 = v20 + 1;
      if (__OFADD__(v20, 1))
        break;
      if (v9 >= v14)
        goto LABEL_60;
      v19 = *(_QWORD *)(v10 + 8 * v9);
      ++v20;
      if (v19)
        goto LABEL_23;
    }
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
  }
}

id sub_23A877FAC(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t empty;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  dispatch_semaphore_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  uint64_t v54;
  xpc_object_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  dispatch_semaphore_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  mach_timebase_info info;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v70;
  uint64_t (*v71)(int, uint64_t, int);
  uint64_t v72;
  uint64_t v73;

  LODWORD(v66) = a1;
  v73 = *MEMORY[0x24BDAC8D0];
  v61 = sub_23A890034();
  v58 = *(_QWORD *)(v61 - 8);
  v1 = MEMORY[0x24BDAC7A8](v61);
  v57 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v60 = (char *)&v54 - v3;
  v4 = sub_23A8902E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8902D4();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_23A8900AC();
  MEMORY[0x24BDAC7A8](v9);
  v65 = swift_allocObject();
  *(_QWORD *)(v65 + 16) = 0;
  v64 = swift_allocObject();
  *(_DWORD *)(v64 + 16) = 0;
  v63 = dispatch_semaphore_create(0);
  sub_23A874644(0, &qword_2569C5AD0);
  sub_23A890094();
  info = (mach_timebase_info)MEMORY[0x24BEE4AF8];
  sub_23A878F88();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5AE0);
  sub_23A87A1A4(&qword_2569C5AE8, &qword_2569C5AE0, MEMORY[0x24BEE12C8]);
  sub_23A8903B8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v4);
  v10 = sub_23A8902F8();
  empty = xpc_dictionary_create_empty();
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84148]), sel_initForFileParsing);
  objc_msgSend(v12, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v12, sel_dataGatheringOptions) | 0x40);
  objc_msgSend(v12, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v12, sel_dataGatheringOptions) | 0x20);
  objc_msgSend(v12, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v12, sel_dataGatheringOptions) | 1);
  objc_msgSend(v12, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v12, sel_dataGatheringOptions) & 0xFFFFFFFFFFFFFFEFLL);
  objc_msgSend(v12, sel_setAdditionalCSSymbolicatorFlags_, objc_msgSend(v12, sel_additionalCSSymbolicatorFlags) | 0x4000440);
  info = 0;
  mach_timebase_info(&info);
  objc_msgSend(v12, sel_setMachTimebase_, info);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  v14 = swift_allocObject();
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE60]), sel_init);
  objc_msgSend(v15, sel_timeIntervalSince1970);
  v17 = v16;

  if ((~*(_QWORD *)&v17 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v17 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v17 >= 1.84467441e19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((unint64_t)v17 >= 0xFFFFFFFFFFFFFC18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(double *)(v14 + 16) = (double)((unint64_t)v17 + 1000);
  v18 = v66;
  if ((int)v66 < 1)
  {
    v55 = empty;
    v56 = v10;
    sub_23A8902C8();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v19 = (void *)sub_23A89034C();
    sub_23A890064();

    v20 = v59 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_startTime;
    swift_beginAccess();
    v21 = v58;
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
    v23 = v57;
    v24 = v14;
    v25 = v13;
    v26 = v61;
    v22(v57, v20, v61);
    v27 = v60;
    sub_23A890004();
    v28 = *(void (**)(char *, uint64_t))(v21 + 8);
    v28(v23, v26);
    sub_23A890010();
    v30 = v29;
    v28(v27, v26);
    v31 = *MEMORY[0x24BDBD238];
    *(double *)(v25 + 16) = v30 - *MEMORY[0x24BDBD238];
    v22(v27, v20, v26);
    sub_23A890010();
    v33 = v32;
    v34 = v26;
    v13 = v25;
    v14 = v24;
    v28(v27, v34);
    v35 = v33 - v31;
    *(double *)(v24 + 16) = v35;
    sub_23A8902A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_23A890C10;
    v37 = *(_QWORD *)(v13 + 16);
    v38 = MEMORY[0x24BEE13C8];
    v39 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v36 + 56) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v36 + 64) = v39;
    *(_QWORD *)(v36 + 32) = v37;
    *(_QWORD *)(v36 + 96) = v38;
    *(_QWORD *)(v36 + 104) = v39;
    *(double *)(v36 + 72) = v35;
    v40 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    v41 = v31 + *(double *)(v13 + 16);
    if ((~*(_QWORD *)&v41 & 0x7FF0000000000000) != 0)
    {
      if (v41 > -1.0)
      {
        if (v41 < 1.84467441e19)
        {
          empty = v55;
          xpc_dictionary_set_uint64(v55, "time", (unint64_t)v41);
          v18 = v66;
          v10 = v56;
          goto LABEL_11;
        }
LABEL_18:
        __break(1u);
      }
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  xpc_dictionary_set_uint64(empty, "pid", v66);
LABEL_11:
  v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84128]), sel_init);
  v43 = swift_allocObject();
  v44 = v65;
  *(_QWORD *)(v43 + 16) = v64;
  *(_QWORD *)(v43 + 24) = v12;
  *(_QWORD *)(v43 + 32) = v13;
  *(_QWORD *)(v43 + 40) = v14;
  *(_DWORD *)(v43 + 48) = v18;
  *(_QWORD *)(v43 + 56) = v42;
  *(_QWORD *)(v43 + 64) = v44;
  v62 = v14;
  v45 = v12;
  v46 = v63;
  *(_QWORD *)(v43 + 72) = v63;
  *(_QWORD *)(v43 + 80) = v10;
  v71 = sub_23A879070;
  v72 = v43;
  info = (mach_timebase_info)MEMORY[0x24BDAC760];
  v68 = 1107296256;
  v69 = sub_23A878D94;
  v70 = &block_descriptor_0;
  v47 = (void *)v10;
  v48 = _Block_copy(&info);
  v66 = v72;
  swift_unknownObjectRetain();
  swift_retain();
  v49 = v45;
  swift_retain();
  swift_retain();
  v50 = v42;
  swift_retain();
  v51 = v46;
  v52 = v47;
  swift_release();
  nm_systemstats_get_microstackshots((uint64_t)empty, v48);
  _Block_release(v48);
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_unknownObjectRelease_n();
  return v49;
}

uint64_t sub_23A878790(int a1, uint64_t a2, int a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, int a8, void *a9, uint64_t a10, void *a11, uint64_t a12)
{
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
  char *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  int v45;
  int v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD aBlock[7];

  v52 = a8;
  v55 = a6;
  v56 = a7;
  v53 = a2;
  v54 = a5;
  v15 = sub_23A89007C();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23A890088();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23A8900AC();
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v23);
  v29 = (char *)&v43 - v28;
  if (a3 != 54)
  {
    v51 = a12;
    v45 = a1;
    v46 = a3;
    v47 = a4;
    v44 = a9;
    v30 = *MEMORY[0x24BEE5470];
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 104);
    v32 = result;
    v49 = v27;
    v50 = result;
    v33 = v18;
    v34 = v27;
    v31(v21, v30, v33);
    sub_23A8900A0();
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v25, v29, v32);
    sub_23A890070();
    v35 = swift_allocObject();
    v48 = v17;
    v36 = v53;
    v37 = v54;
    *(_QWORD *)(v35 + 16) = a4;
    *(_QWORD *)(v35 + 24) = v36;
    v38 = v55;
    v39 = v56;
    *(_QWORD *)(v35 + 32) = v37;
    *(_QWORD *)(v35 + 40) = v38;
    *(_QWORD *)(v35 + 48) = v39;
    *(_DWORD *)(v35 + 56) = v52;
    *(_QWORD *)(v35 + 64) = a9;
    *(_BYTE *)(v35 + 72) = v45 & 1;
    *(_QWORD *)(v35 + 80) = a10;
    *(_DWORD *)(v35 + 88) = v46;
    *(_QWORD *)(v35 + 96) = a11;
    aBlock[4] = sub_23A87911C;
    aBlock[5] = v35;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A878D68;
    aBlock[3] = &block_descriptor_14;
    _Block_copy(aBlock);
    sub_23A8900C4();
    swift_allocObject();
    swift_unknownObjectRetain();
    v40 = v37;
    swift_retain();
    swift_retain();
    v41 = v44;
    swift_retain();
    v42 = a11;
    swift_retain();
    sub_23A8900B8();
    swift_release();
    sub_23A8902EC();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v29, v50);
  }
  return result;
}

void sub_23A878A48(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, unsigned int a10)
{
  _DWORD *v18;
  void *v19;
  _BYTE *bytes_ptr;
  size_t length;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  double v26;
  os_log_type_t v27;
  NSObject *v28;
  uint8_t *v29;

  v18 = (_DWORD *)(a1 + 16);
  swift_beginAccess();
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v19 = (void *)sub_23A89034C();
    sub_23A890064();

    return;
  }
  swift_beginAccess();
  *v18 = 1;
  if (a2)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(a2);
    length = xpc_data_get_length(a2);
    if (!bytes_ptr)
    {
      __break(1u);
      goto LABEL_14;
    }
    v22 = sub_23A879A38(bytes_ptr, length);
    v24 = v23;
    v25 = (void *)sub_23A88FFF8();
    swift_beginAccess();
    v26 = *(double *)(a4 + 16);
    swift_beginAccess();
    objc_msgSend(a3, sel_addMicrostackshotsFromData_ofTypes_inTimeRangeStart_end_onlyPid_onlyTid_statistics_, v25, 17, a6, 0, a7, v26, *(double *)(a5 + 16));
    sub_23A879AE4(v22, v24);

  }
  if ((a8 & 1) == 0)
    return;
  if ((a10 & 0x80000000) != 0)
  {
LABEL_14:
    sub_23A890430();
    __break(1u);
    return;
  }
  swift_beginAccess();
  *(_QWORD *)(a9 + 16) = a10;
  v27 = sub_23A8902BC();
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  swift_retain();
  v28 = sub_23A89034C();
  if (os_log_type_enabled(v28, v27))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 134217984;
    swift_beginAccess();
    sub_23A890358();
    swift_release();
    _os_log_impl(&dword_23A86F000, v28, v27, "EcosystemAnalytics.framework:MicrostackshotsParser: Done: %llu", v29, 0xCu);
    MEMORY[0x23B859C14](v29, -1, -1);
  }
  else
  {
    swift_release();
  }

  sub_23A890304();
}

uint64_t sub_23A878D68(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23A878D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v7(a2, a3, a4);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A878DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_23A87A1E4(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_startTime;
  v2 = sub_23A890034();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A878E70()
{
  return type metadata accessor for MicrostackshotsParser();
}

uint64_t type metadata accessor for MicrostackshotsParser()
{
  uint64_t result;

  result = qword_2569C5928;
  if (!qword_2569C5928)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A878EB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A890034();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A878F68()
{
  return swift_deallocObject();
}

uint64_t sub_23A878F78()
{
  return swift_deallocObject();
}

unint64_t sub_23A878F88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C5AD8;
  if (!qword_2569C5AD8)
  {
    v1 = sub_23A8902D4();
    result = MEMORY[0x23B859B78](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2569C5AD8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B859B6C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A879014()
{
  id *v0;

  swift_release();

  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A879070(int a1, uint64_t a2, int a3)
{
  uint64_t v3;

  return sub_23A878790(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void **)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_DWORD *)(v3 + 48), *(void **)(v3 + 56), *(_QWORD *)(v3 + 64), *(void **)(v3 + 72), *(_QWORD *)(v3 + 80));
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

uint64_t sub_23A8790C0()
{
  id *v0;

  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_23A87911C()
{
  uint64_t v0;

  sub_23A878A48(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(unsigned int *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_DWORD *)(v0 + 88));
}

void *sub_23A879168(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_23A89046C();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

void sub_23A8791FC(void *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  unint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;

  sub_23A8902B0();
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v2 = (void *)sub_23A89034C();
  sub_23A890064();

  if ((uint64_t)objc_msgSend(a1, sel_numSamples) < 1)
    return;
  sub_23A8902B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A890C00;
  v4 = objc_msgSend(a1, sel_tasksByUniquePid);
  sub_23A874644(0, &qword_2569C5B60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5B68);
  sub_23A879B28();
  v5 = sub_23A890118();

  v6 = *(_QWORD *)(v5 + 16);
  swift_bridgeObjectRelease();
  v7 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v3 + 64) = v7;
  *(_QWORD *)(v3 + 32) = v6;
  v8 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v9 = objc_msgSend(a1, sel_tasksByUniquePid);
  v10 = sub_23A890118();

  v11 = 0;
  v12 = v10 + 64;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v10 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v63 = v10 + 64;
  v64 = v10;
  v62 = v16;
  if (!v15)
    goto LABEL_8;
  while (2)
  {
    while (1)
    {
      v18 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v19 = v18 | (v11 << 6);
LABEL_24:
      v23 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v19);
      if (v23 >> 62)
        break;
      v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v24)
        goto LABEL_26;
LABEL_6:
      swift_bridgeObjectRelease();
      if (!v15)
        goto LABEL_8;
    }
    swift_bridgeObjectRetain_n();
    v24 = sub_23A89043C();
    swift_bridgeObjectRelease();
    if (!v24)
      goto LABEL_6;
LABEL_26:
    v65 = v15;
    v66 = v24;
    v25 = 4;
    do
    {
      v68 = v17;
      if ((v23 & 0xC000000000000001) != 0)
        v26 = (id)MEMORY[0x23B85953C](v25 - 4, v23);
      else
        v26 = *(id *)(v23 + 8 * v25);
      v27 = v26;
      if (__OFADD__(v25 - 4, 1))
      {
        __break(1u);
        goto LABEL_64;
      }
      v67 = v25 - 3;
      v28 = objc_msgSend(v26, sel_bundleIdentifier);
      if (v28)
      {

        v29 = objc_msgSend(v27, sel_bundleIdentifier);
        if (!v29)
          goto LABEL_66;
        v30 = v29;
        v31 = sub_23A89016C();
        v33 = v32;

        swift_bridgeObjectRelease();
        v34 = HIBYTE(v33) & 0xF;
        if ((v33 & 0x2000000000000000) == 0)
          v34 = v31 & 0xFFFFFFFFFFFFLL;
        if (v34)
        {
          sub_23A8902B0();
          v35 = swift_allocObject();
          *(_OWORD *)(v35 + 16) = xmmword_23A890C10;
          v36 = objc_msgSend(v27, sel_mainBinaryPath);
          if (v36)
          {
            v37 = v36;
            v38 = sub_23A89016C();
            v40 = v39;

          }
          else
          {
            v38 = 0;
            v40 = 0;
          }
          v41 = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
          v42 = sub_23A8742A0();
          *(_QWORD *)(v35 + 64) = v42;
          v43 = 0xD000000000000013;
          if (v40)
            v43 = v38;
          v44 = 0x800000023A892500;
          if (v40)
            v44 = v40;
          *(_QWORD *)(v35 + 32) = v43;
          *(_QWORD *)(v35 + 40) = v44;
          v45 = objc_msgSend(v27, sel_bundleIdentifier, v62, v63, v64);
          if (v45)
          {
            v46 = v45;
            v47 = sub_23A89016C();
            v49 = v48;

            v50 = (uint64_t *)(v35 + 72);
            *(_QWORD *)(v35 + 96) = v41;
            *(_QWORD *)(v35 + 104) = v42;
            if (v49)
            {
              *v50 = v47;
LABEL_50:
              *(_QWORD *)(v35 + 80) = v49;
              v51 = (void *)sub_23A89034C();
              sub_23A890064();
              swift_bridgeObjectRelease();

              goto LABEL_51;
            }
          }
          else
          {
            v50 = (uint64_t *)(v35 + 72);
            *(_QWORD *)(v35 + 96) = v41;
            *(_QWORD *)(v35 + 104) = v42;
          }
          *v50 = 0xD000000000000019;
          v49 = 0x800000023A892520;
          goto LABEL_50;
        }
      }
LABEL_51:
      v52 = objc_msgSend(v27, sel_name, v62, v63, v64);
      if (v52)
      {
        v53 = v52;
        v54 = sub_23A89016C();
        v56 = v55;

        sub_23A8902B0();
        v57 = swift_allocObject();
        *(_OWORD *)(v57 + 16) = xmmword_23A890C00;
        *(_QWORD *)(v57 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v57 + 64) = sub_23A8742A0();
        *(_QWORD *)(v57 + 32) = v54;
        *(_QWORD *)(v57 + 40) = v56;
        swift_bridgeObjectRetain();
        v58 = (void *)sub_23A89034C();
        sub_23A890064();
        swift_bridgeObjectRelease();

        v17 = v68;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v17 = sub_23A885A54(0, v68[2] + 1, 1, v68);
        v60 = v17[2];
        v59 = v17[3];
        if (v60 >= v59 >> 1)
          v17 = sub_23A885A54((_QWORD *)(v59 > 1), v60 + 1, 1, v17);
        v17[2] = v60 + 1;
        v61 = &v17[2 * v60];
        v61[4] = v54;
        v61[5] = v56;
      }
      else
      {
        v17 = v68;
      }

      ++v25;
    }
    while (v67 != v66);
    swift_bridgeObjectRelease();
    v12 = v63;
    v10 = v64;
    v16 = v62;
    v15 = v65;
    if (v65)
      continue;
    break;
  }
LABEL_8:
  v20 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (v20 >= v16)
    goto LABEL_61;
  v21 = *(_QWORD *)(v12 + 8 * v20);
  ++v11;
  if (v21)
    goto LABEL_23;
  v11 = v20 + 1;
  if (v20 + 1 >= v16)
    goto LABEL_61;
  v21 = *(_QWORD *)(v12 + 8 * v11);
  if (v21)
    goto LABEL_23;
  v11 = v20 + 2;
  if (v20 + 2 >= v16)
    goto LABEL_61;
  v21 = *(_QWORD *)(v12 + 8 * v11);
  if (v21)
    goto LABEL_23;
  v11 = v20 + 3;
  if (v20 + 3 >= v16)
    goto LABEL_61;
  v21 = *(_QWORD *)(v12 + 8 * v11);
  if (v21)
    goto LABEL_23;
  v22 = v20 + 4;
  if (v22 >= v16)
  {
LABEL_61:
    swift_release();
  }
  else
  {
    v21 = *(_QWORD *)(v12 + 8 * v22);
    if (v21)
    {
      v11 = v22;
LABEL_23:
      v15 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v11 << 6);
      goto LABEL_24;
    }
    while (1)
    {
      v11 = v22 + 1;
      if (__OFADD__(v22, 1))
        break;
      if (v11 >= v16)
        goto LABEL_61;
      v21 = *(_QWORD *)(v12 + 8 * v11);
      ++v22;
      if (v21)
        goto LABEL_23;
    }
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
  }
}

uint64_t sub_23A87990C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v2 = sub_23A890190();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA8);
  sub_23A87A1A4((unint64_t *)&qword_2569C5BB0, &qword_2569C5BA8, MEMORY[0x24BEE12B0]);
  v10 = sub_23A890130();
  v11 = v6;
  v10 = sub_23A890244();
  v11 = v7;
  sub_23A890184();
  sub_23A8724FC();
  v8 = sub_23A890394();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  result = swift_bridgeObjectRelease();
  if (v8)
  {
    nm_CRSetCrashLogMessage(v8 + 32);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A879A38(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_23A886DB8(__src, &__src[a2]);
  sub_23A88FF08();
  swift_allocObject();
  sub_23A88FECC();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_23A88FFD4();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_23A879AE4(uint64_t a1, unint64_t a2)
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

unint64_t sub_23A879B28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C5B70;
  if (!qword_2569C5B70)
  {
    v1 = sub_23A874644(255, &qword_2569C5B60);
    result = MEMORY[0x23B859B78](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2569C5B70);
  }
  return result;
}

uint64_t sub_23A879B80()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A879BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A87A3BC(a1, a2, a3, a4, v4);
}

uint64_t sub_23A879BAC()
{
  return swift_release();
}

double sub_23A879BB4(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[25] = 0u;
  a1[26] = 0u;
  a1[23] = 0u;
  a1[24] = 0u;
  a1[21] = 0u;
  a1[22] = 0u;
  a1[19] = 0u;
  a1[20] = 0u;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_23A879BF4()
{
  _QWORD *v0;

  if (v0[3])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v0[35])
    {
      swift_bridgeObjectRelease();
      if (v0[37])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_23A879CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A879D2C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A879DA8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23A8769F4(a1, a2, a3, *(void **)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), v3 + 40, *(_QWORD *)(v3 + 104), *(void **)(v3 + 112), *(_QWORD **)(v3 + 120), *(void (**)(id *, uint64_t))(v3 + 128), *(_QWORD *)(v3 + 136), *(_QWORD *)(v3 + 144), *(_QWORD *)(v3 + 152));
}

uint64_t sub_23A879DE4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A879E54(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_23A879E70(uint64_t a1)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a1 + 256);
  v5 = *(_OWORD *)(a1 + 272);
  v3 = *(_OWORD *)(a1 + 224);
  sub_23A879F10(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1));
  return a1;
}

uint64_t sub_23A879F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A87A0F4(a33, a34, a35, a36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A87A0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return sub_23A879DE4(a3, a4);
  }
  return result;
}

uint64_t sub_23A87A1A4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B859B78](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A87A1E4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A87A258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_23A8901E4();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_23A8901E4();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_23A89049C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_23A8901E4();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_23A8901E4();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23A87A3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  _QWORD v9[6];

  v9[4] = sub_23A87E9E8;
  v9[5] = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A87A600;
  v9[3] = &block_descriptor_24;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  nm_macho_for_each_defined_rpath(a1, a3, v7);
  _Block_release(v7);
  return 0;
}

uint64_t sub_23A87A46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;

  sub_23A8902B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23A890C00;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5D88);
  v5 = sub_23A89019C();
  v7 = v6;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_23A8742A0();
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v7;
  sub_23A875650();
  v8 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v9 = sub_23A8901CC();
  v11 = v10;
  v12 = (_QWORD *)(a3 + 56);
  swift_beginAccess();
  v13 = *(_QWORD **)(a3 + 56);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a3 + 56) = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v13 = sub_23A885A54(0, v13[2] + 1, 1, v13);
    *v12 = v13;
  }
  v16 = v13[2];
  v15 = v13[3];
  if (v16 >= v15 >> 1)
  {
    v13 = sub_23A885A54((_QWORD *)(v15 > 1), v16 + 1, 1, v13);
    *v12 = v13;
  }
  v13[2] = v16 + 1;
  v17 = &v13[2 * v16];
  v17[4] = v9;
  v17[5] = v11;
  return swift_endAccess();
}

uint64_t sub_23A87A600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_23A87A648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a5) = v9(a2, a3, a4, a5);
  swift_release();
  return a5 & 1;
}

uint64_t sub_23A87A6B4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[6];

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  swift_bridgeObjectRetain();
  v1 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v11[4] = sub_23A87EB08;
  v11[5] = v0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_23A87A648;
  v11[3] = &block_descriptor_57;
  v2 = _Block_copy(v11);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v1, v2);
  _Block_release(v2);

  sub_23A8902B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A890C00;
  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 64) = sub_23A8742A0();
  v6 = 7104878;
  if (v5)
    v6 = v4;
  v7 = 0xE300000000000000;
  if (v5)
    v7 = v5;
  *(_QWORD *)(v3 + 32) = v6;
  *(_QWORD *)(v3 + 40) = v7;
  sub_23A875650();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v9 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v9;
}

uint64_t sub_23A87A88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = nm_dyld_get_uuid_for_header();
  if (v6)
  {
    v7 = v6;
    v8 = sub_23A89016C();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  swift_beginAccess();
  *(_QWORD *)(a5 + 16) = v8;
  *(_QWORD *)(a5 + 24) = v10;
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23A87A90C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  unint64_t v40;

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)&v37 = *(_QWORD *)(v0 + 16);
  *((_QWORD *)&v37 + 1) = v1;
  v39 = 47;
  v40 = 0xE100000000000000;
  sub_23A8724FC();
  result = sub_23A890370();
  v3 = *(_QWORD *)(result + 16);
  if (!v3)
  {
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v4 = result;
  v5 = result + 32;
  v6 = (_QWORD *)(result + 32 + 16 * (v3 - 1));
  v7 = v6[1];
  *(_QWORD *)&v37 = *v6;
  *((_QWORD *)&v37 + 1) = v7;
  v39 = 0x6F77656D6172662ELL;
  v40 = 0xEA00000000006B72;
  v8 = MEMORY[0x24BEE0D00];
  result = sub_23A8903A0();
  if ((result & 1) != 0)
    goto LABEL_6;
  v9 = v6[1];
  *(_QWORD *)&v37 = *v6;
  *((_QWORD *)&v37 + 1) = v9;
  v39 = 1886413102;
  v40 = 0xE400000000000000;
  result = sub_23A8903A0();
  if ((result & 1) != 0)
    goto LABEL_6;
  v10 = v6[1];
  *(_QWORD *)&v37 = *v6;
  *((_QWORD *)&v37 + 1) = v10;
  v39 = 0x69736E657478652ELL;
  v40 = 0xEA00000000006E6FLL;
  result = sub_23A8903A0();
  if ((result & 1) != 0
    || (v11 = v6[1],
        *(_QWORD *)&v37 = *v6,
        *((_QWORD *)&v37 + 1) = v11,
        v39 = 0x6E6967756C702ELL,
        v40 = 0xE700000000000000,
        result = sub_23A8903A0(),
        (result & 1) != 0))
  {
LABEL_6:
    if (*(_QWORD *)(v4 + 16) >= (unint64_t)v3)
    {
      *(_QWORD *)&v37 = v4;
      *((_QWORD *)&v37 + 1) = v5;
      *((_QWORD *)&v38 + 1) = (2 * v3) | 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5D90);
      sub_23A87EA4C();
      sub_23A890130();
      swift_bridgeObjectRelease();
      v12 = objc_allocWithZone(MEMORY[0x24BDD1488]);
      v13 = (void *)sub_23A890148();
      swift_bridgeObjectRelease();
      v14 = objc_msgSend(v12, sel_initWithPath_, v13, v37, 0);

      if (!v14)
        goto LABEL_28;
      v15 = objc_msgSend(v14, sel_infoDictionary);
      if (v15)
      {
        v16 = v15;
        v17 = sub_23A890118();

        if (*(_QWORD *)(v17 + 16) && (v18 = sub_23A87F770(0xD00000000000001ALL, 0x800000023A892100), (v19 & 1) != 0))
        {
          sub_23A875084(*(_QWORD *)(v17 + 56) + 32 * v18, (uint64_t)&v37);
        }
        else
        {
          v37 = 0u;
          v38 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v38 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v20 = v39;
            v21 = v40;

LABEL_29:
            sub_23A8902B0();
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
            v27 = swift_allocObject();
            *(_OWORD *)(v27 + 16) = xmmword_23A890C00;
            *(_QWORD *)(v27 + 56) = v8;
            *(_QWORD *)(v27 + 64) = sub_23A8742A0();
            v28 = 7104878;
            if (v21)
              v28 = v20;
            v29 = 0xE300000000000000;
            if (v21)
              v29 = v21;
            *(_QWORD *)(v27 + 32) = v28;
            *(_QWORD *)(v27 + 40) = v29;
            sub_23A875650();
            swift_bridgeObjectRetain();
            v30 = (void *)sub_23A89034C();
            sub_23A890064();
            swift_bridgeObjectRelease();

            return v20;
          }
LABEL_18:
          v22 = objc_msgSend(v14, sel_infoDictionary, v37, (_QWORD)v38);
          if (v22)
          {
            v23 = v22;
            v24 = sub_23A890118();

            if (*(_QWORD *)(v24 + 16)
              && (v25 = sub_23A87F770(0x656C646E75424643, 0xEF6E6F6973726556), (v26 & 1) != 0))
            {
              sub_23A875084(*(_QWORD *)(v24 + 56) + 32 * v25, (uint64_t)&v37);
            }
            else
            {
              v37 = 0u;
              v38 = 0u;
            }

            swift_bridgeObjectRelease();
            if (*((_QWORD *)&v38 + 1))
            {
              if (swift_dynamicCast())
              {
                v20 = v39;
                v21 = v40;
                goto LABEL_29;
              }
LABEL_28:
              v20 = 0;
              v21 = 0;
              goto LABEL_29;
            }
          }
          else
          {

            v37 = 0u;
            v38 = 0u;
          }
          sub_23A87EAA8((uint64_t)&v37, (uint64_t *)&unk_2569C58F0);
          goto LABEL_28;
        }
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
      }
      sub_23A87EAA8((uint64_t)&v37, (uint64_t *)&unk_2569C58F0);
      goto LABEL_18;
    }
    goto LABEL_45;
  }
  if (v3 == 1)
  {
LABEL_43:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  v31 = (uint64_t *)(v4 + 16 * v3-- + 8);
  while (1)
  {
    v32 = v3 - 1;
    if (v3 < 1)
      break;
    if (v32 >= *(_QWORD *)(v4 + 16))
      goto LABEL_47;
    v33 = *v31;
    *(_QWORD *)&v37 = *(v31 - 1);
    *((_QWORD *)&v37 + 1) = v33;
    v39 = 0x6F77656D6172662ELL;
    v40 = 0xEA00000000006B72;
    result = sub_23A8903A0();
    if ((result & 1) != 0)
      goto LABEL_6;
    v34 = *v31;
    *(_QWORD *)&v37 = *(v31 - 1);
    *((_QWORD *)&v37 + 1) = v34;
    v39 = 1886413102;
    v40 = 0xE400000000000000;
    result = sub_23A8903A0();
    if ((result & 1) != 0)
      goto LABEL_6;
    v35 = *v31;
    *(_QWORD *)&v37 = *(v31 - 1);
    *((_QWORD *)&v37 + 1) = v35;
    v39 = 0x69736E657478652ELL;
    v40 = 0xEA00000000006E6FLL;
    result = sub_23A8903A0();
    if ((result & 1) != 0)
      goto LABEL_6;
    v36 = *v31;
    *(_QWORD *)&v37 = *(v31 - 1);
    *((_QWORD *)&v37 + 1) = v36;
    v39 = 0x6E6967756C702ELL;
    v40 = 0xE700000000000000;
    result = sub_23A8903A0();
    if ((result & 1) != 0)
      goto LABEL_6;
    v31 -= 2;
    --v3;
    if (!v32)
      goto LABEL_43;
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_23A87AF18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v10;
  void *v11;
  _QWORD v13[6];

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a5;
  v10[3] = a6;
  v10[4] = a1;
  v13[4] = sub_23A87EA40;
  v13[5] = v10;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_23A87BCC8;
  v13[3] = &block_descriptor_37;
  v11 = _Block_copy(v13);
  swift_retain();
  swift_retain();
  swift_release();
  nm_macho_for_each_imported_symbol(a1, a3, v11);
  _Block_release(v11);
  return 1;
}

uint64_t sub_23A87AFF0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, _QWORD *a6, mach_header *a7)
{
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
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  _QWORD **v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v92;
  unint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  mach_header *mh;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  _QWORD *v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  _BYTE v155[7];
  _BYTE v156[7];

  v11 = sub_23A8901CC();
  v13 = v12;
  v14 = sub_23A8901CC();
  v16 = v15;
  v17 = CSDemangleSymbolName();
  if (v17)
  {
    v18 = v17;
    swift_bridgeObjectRelease();
    v14 = sub_23A8901CC();
    v16 = v19;
    MEMORY[0x23B859C14](v18, -1, -1);
  }
  if ((sub_23A87A258() & 1) == 0 && (sub_23A87A258() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  mh = a7;
  sub_23A8902B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23A890FB0;
  v21 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v20 + 56) = MEMORY[0x24BEE0D00];
  v22 = sub_23A8742A0();
  v109 = v14;
  *(_QWORD *)(v20 + 32) = v14;
  *(_QWORD *)(v20 + 40) = v16;
  *(_QWORD *)(v20 + 96) = v21;
  *(_QWORD *)(v20 + 104) = v22;
  *(_QWORD *)(v20 + 64) = v22;
  *(_QWORD *)(v20 + 72) = v11;
  v148 = v11;
  *(_QWORD *)(v20 + 80) = v13;
  v23 = MEMORY[0x24BEE1360];
  *(_QWORD *)(v20 + 136) = MEMORY[0x24BEE1328];
  *(_QWORD *)(v20 + 144) = v23;
  *(_BYTE *)(v20 + 112) = a3 & 1;
  sub_23A875650();
  v110 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v25 = a6[2];
  v26 = a6[3];
  swift_beginAccess();
  v27 = a6[6];
  v150 = v13;
  v106 = a5;
  v146 = a6 + 6;
  if (!*(_QWORD *)(v27 + 16))
    goto LABEL_12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28 = sub_23A87F770(v25, v26);
  if ((v29 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v30 = (uint64_t *)(*(_QWORD *)(v27 + 56) + 120 * v28);
  v31 = v30[2];
  v131 = v30[5];
  v132 = *v30;
  v130 = v30[6];
  v141 = v30[3];
  v136 = v30[1];
  swift_bridgeObjectRetain();
  sub_23A874558(v31, v141);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v136)
  {
LABEL_12:
    v130 = 0xE000000000000000;
    v131 = 0;
    v32 = v148;
    goto LABEL_13;
  }
  v32 = v148;
  if (v141)
  {
    swift_bridgeObjectRetain();
    sub_23A87A0F4(v132, v136, v31, v141);
  }
  else
  {
    sub_23A87A0F4(v132, v136, v31, 0);
    v130 = 0xE000000000000000;
    v131 = 0;
  }
LABEL_13:
  v111 = 0x6E776F6E6B6E75;
  v112 = 0x6534366D7261;
  v34 = a6[6];
  if (!*(_QWORD *)(v34 + 16))
  {
    v49 = 0;
LABEL_20:
    v48 = a6 + 6;
    goto LABEL_25;
  }
  v35 = a6[2];
  v36 = a6[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37 = sub_23A87F770(v35, v36);
  if ((v38 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v49 = 0;
    goto LABEL_20;
  }
  v143 = a6;
  v39 = (uint64_t *)(*(_QWORD *)(v34 + 56) + 120 * v37);
  v137 = *v39;
  v152 = v39[1];
  v41 = v39[2];
  v40 = v39[3];
  v42 = v39[4];
  v121 = v39[6];
  v122 = v39[5];
  v119 = v39[8];
  v120 = v39[7];
  v43 = v39[10];
  v133 = v39[9];
  v44 = v39[11];
  v45 = v39[12];
  v47 = v39[13];
  v46 = v39[14];
  swift_bridgeObjectRetain();
  v142 = v46;
  v124 = v47;
  v125 = v45;
  v140 = v44;
  v114 = v43;
  v115 = v41;
  v113 = v40;
  sub_23A874558(v41, v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v152)
  {
    sub_23A874558(v41, v40);
    sub_23A87A0F4(v137, v152, v41, v40);
    v48 = v146;
    if (v113)
    {
      v32 = v148;
      a6 = v143;
      goto LABEL_26;
    }
    v49 = v41;
    v32 = v148;
  }
  else
  {
    v49 = 0;
    v48 = v146;
    v32 = v148;
  }
  a6 = v143;
LABEL_25:
  sub_23A879DE4(v49, 0);
  v142 = 0xE600000000000000;
  LOBYTE(v42) = 5;
  v113 = 0xE700000000000000;
  v115 = 0x6E776F6E6B6E75;
  v122 = 0x6E776F6E6B6E75;
  v120 = 0x6E776F6E6B6E75;
  v121 = 0xE700000000000000;
  v119 = 0xE700000000000000;
  v133 = 0x6E776F6E6B6E75;
  v114 = 0xE700000000000000;
  v140 = 0x6E776F6E6B6E75;
  v124 = 0x6534366D7261;
  v125 = 0xE700000000000000;
LABEL_26:
  v50 = a6[6];
  v105 = v42;
  if (!*(_QWORD *)(v50 + 16))
  {
    v74 = 0;
LABEL_33:
    v64 = v150;
    goto LABEL_34;
  }
  v51 = a6[2];
  v52 = a6[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v53 = sub_23A87F770(v51, v52);
  if ((v54 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v74 = 0;
    v48 = v146;
    v32 = v148;
    goto LABEL_33;
  }
  v55 = (uint64_t *)(*(_QWORD *)(v50 + 56) + 120 * v53);
  v101 = *v55;
  v102 = v55[1];
  v104 = v55[2];
  v153 = v55[3];
  v128 = v55[4];
  v56 = v55[6];
  v144 = v55[5];
  v57 = v55[8];
  v126 = v55[7];
  v59 = v55[9];
  v58 = v55[10];
  v61 = v55[11];
  v60 = v55[12];
  v62 = v55[13];
  v63 = v55[14];
  swift_bridgeObjectRetain();
  v138 = v63;
  v103 = v62;
  v116 = v58;
  v117 = v59;
  v118 = v57;
  sub_23A874558(v104, v153);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v64 = v150;
  if (v102)
  {
    v65 = v56;
    v66 = v126;
    sub_23A874558(v104, v153);
    v67 = v128;
    sub_23A87A0F4(v101, v102, v104, v153);
    v48 = v146;
    v68 = v144;
    if (v153)
    {
      v69 = v153;
      v70 = v150;
      v111 = v104;
      v112 = v103;
      v32 = v148;
      v72 = v61;
      v71 = v138;
      v73 = v60;
      goto LABEL_35;
    }
    v32 = v148;
    v74 = v104;
  }
  else
  {
    v74 = 0;
    v48 = v146;
    v32 = v148;
  }
LABEL_34:
  v70 = v64;
  sub_23A879DE4(v74, 0);
  v71 = 0xE600000000000000;
  v67 = 5;
  v69 = 0xE700000000000000;
  v68 = 0x6E776F6E6B6E75;
  v65 = 0xE700000000000000;
  v66 = 0x6E776F6E6B6E75;
  v118 = 0xE700000000000000;
  v117 = 0x6E776F6E6B6E75;
  v116 = 0xE700000000000000;
  v72 = 0x6E776F6E6B6E75;
  v73 = 0xE700000000000000;
LABEL_35:
  v75 = *v48;
  if (!*(_QWORD *)(*v48 + 16))
  {
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_45;
  }
  v145 = v68;
  v154 = v69;
  v134 = v73;
  v135 = v72;
  v139 = v71;
  v129 = v67;
  swift_bridgeObjectRetain();
  v76 = sub_23A87F770(v32, v70);
  if ((v77 & 1) == 0)
  {
LABEL_45:
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  v127 = v66;
  v123 = v65;
  v78 = (_QWORD **)(v106 + 16);
  v79 = (uint64_t *)(*(_QWORD *)(v75 + 56) + 120 * v76);
  v80 = v79[2];
  v81 = v79[3];
  v97 = v79[4];
  v98 = *v79;
  v95 = v79[6];
  v96 = v79[5];
  v82 = v79[9];
  v147 = v79[7];
  v149 = v79[8];
  v83 = v79[10];
  v84 = v79[11];
  v86 = v79[12];
  v85 = v79[13];
  v87 = v79[14];
  v107 = v79[1];
  swift_bridgeObjectRetain();
  v99 = v87;
  v100 = v84;
  sub_23A874558(v80, v81);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  nm_macho_arch_name_for_mach_header(mh);
  v88 = sub_23A8901CC();
  v151 = v89;
  swift_beginAccess();
  v90 = *v78;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v78 = v90;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v90 = sub_23A885B60(0, v90[2] + 1, 1, v90);
    *v78 = v90;
  }
  v93 = v90[2];
  v92 = v90[3];
  if (v93 >= v92 >> 1)
  {
    v90 = sub_23A885B60((_QWORD *)(v92 > 1), v93 + 1, 1, v90);
    *v78 = v90;
  }
  v90[2] = v93 + 1;
  v94 = &v90[54 * v93];
  v94[4] = v109;
  v94[5] = v110;
  v94[8] = v131;
  v94[9] = v130;
  v94[10] = v115;
  v94[11] = v113;
  *((_BYTE *)v94 + 96) = v105;
  v94[13] = v122;
  v94[14] = v121;
  v94[15] = v120;
  v94[16] = v119;
  v94[17] = v133;
  v94[18] = v114;
  v94[19] = v140;
  v94[20] = v125;
  v94[21] = v124;
  v94[22] = v142;
  *(_DWORD *)((char *)v94 + 97) = *(_DWORD *)v156;
  *((_DWORD *)v94 + 25) = *(_DWORD *)&v156[3];
  v94[6] = 0;
  v94[7] = 0xE000000000000000;
  v94[23] = v111;
  v94[24] = v154;
  *((_BYTE *)v94 + 200) = v129;
  *((_DWORD *)v94 + 51) = *(_DWORD *)&v155[3];
  *(_DWORD *)((char *)v94 + 201) = *(_DWORD *)v155;
  v94[26] = v145;
  v94[27] = v123;
  v94[28] = v127;
  v94[29] = v118;
  v94[30] = v117;
  v94[31] = v116;
  v94[32] = v135;
  v94[33] = v134;
  v94[34] = v112;
  v94[35] = v139;
  v94[36] = v98;
  v94[37] = v107;
  v94[38] = v80;
  v94[39] = v81;
  v94[40] = v97;
  v94[41] = v96;
  v94[42] = v95;
  v94[43] = v147;
  v94[44] = v149;
  v94[45] = v82;
  v94[46] = v83;
  v94[47] = v100;
  v94[48] = v86;
  v94[49] = v85;
  v94[50] = v99;
  v94[51] = v88;
  v94[52] = v151;
  v94[53] = 1;
  v94[54] = 0;
  v94[55] = 0xE000000000000000;
  v94[56] = 0;
  v94[57] = 0xE000000000000000;
  return swift_endAccess();
}

uint64_t sub_23A87BCC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v9(a2, a3, a4, a5);
  return swift_release();
}

void sub_23A87BD28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  void *v25;
  void *v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];
  uint64_t v32;
  _QWORD v33[13];
  __int128 v34;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 24);
  v30 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  v29 = sub_23A87A6B4();
  v4 = v3;
  swift_bridgeObjectRetain();
  v28 = sub_23A882028();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  v27 = sub_23A88FC78(v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v9 = nm_extractTeamID(v8);

  if (v9)
  {
    v10 = sub_23A89016C();
    v12 = v11;

  }
  else
  {
    v10 = 0;
    v12 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v13 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v14 = nm_extractCDHash(v13);

  if (v14)
  {
    v15 = sub_23A89016C();
    v17 = v16;

  }
  else
  {
    v15 = 0;
    v17 = 0xE000000000000000;
  }
  v18 = sub_23A87A90C();
  v33[0] = 0;
  v33[1] = 0xE000000000000000;
  v20 = v29;
  if (v4)
  {
    v21 = v4;
  }
  else
  {
    v20 = 0;
    v21 = 0xE000000000000000;
  }
  if (v19)
    v22 = v18;
  else
    v22 = 0;
  if (v19)
    v23 = v19;
  else
    v23 = 0xE000000000000000;
  v33[2] = v20;
  v33[3] = v21;
  v33[4] = v28;
  v33[5] = v27;
  v33[6] = v7;
  v33[7] = v10;
  v33[8] = v12;
  v33[9] = v15;
  v33[10] = v17;
  v33[11] = v22;
  v33[12] = v23;
  v34 = xmmword_23A890EE0;
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v32 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0x8000000000000000;
  sub_23A880D0C((uint64_t)v33, v30, v2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v1 + 48) = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v25 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_23A87EA98;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A87A648;
  aBlock[3] = &block_descriptor_48;
  v26 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v25, v26);
  _Block_release(v26);

}

uint64_t sub_23A87BFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  _QWORD v9[6];

  v9[4] = sub_23A87EAA0;
  v9[5] = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A87C244;
  v9[3] = &block_descriptor_51;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  nm_macho_for_each_dependent_dylib(a1, a3, v7);
  _Block_release(v7);
  return 1;
}

uint64_t sub_23A87C09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15[15];

  v5 = sub_23A8901CC();
  v7 = v6;
  sub_23A8902B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_23A890C00;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 64) = sub_23A8742A0();
  *(_QWORD *)(v8 + 32) = v5;
  *(_QWORD *)(v8 + 40) = v7;
  sub_23A875650();
  swift_bridgeObjectRetain();
  v9 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a4 + 48) + 16))
  {
    swift_bridgeObjectRetain();
    sub_23A87F770(v5, v7);
    v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
      return swift_bridgeObjectRelease();
  }
  sub_23A87C29C(v5, v7, v15);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *(_QWORD *)(a4 + 48);
  *(_QWORD *)(a4 + 48) = 0x8000000000000000;
  sub_23A880D0C((uint64_t)v15, v5, v7, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a4 + 48) = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_23A87C244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);
  return swift_release();
}

uint64_t sub_23A87C29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  unsigned int v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  unsigned __int8 v77;
  void *v78;
  id v79;
  unint64_t v80;
  void *v81;
  id v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  void *v98;
  uint64_t result;
  uint64_t *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  id v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t aBlock;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v128;
  uint64_t (*v129)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v130;

  v4 = v3;
  v8 = sub_23A88FFBC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = a1;
  v126 = a2;
  v123 = 0x687461707240;
  v124 = 0xE600000000000000;
  sub_23A8724FC();
  v12 = sub_23A8903A0();
  v113 = a2;
  v114 = a1;
  v104 = a3;
  if ((v12 & 1) != 0)
  {
    swift_beginAccess();
    v13 = *(_QWORD *)(v3 + 56);
    v112 = *(_QWORD *)(v13 + 16);
    if (v112)
    {
      v109 = (uint64_t)v11;
      v110 = v9;
      v111 = v8;
      v116 = (id)objc_opt_self();
      v108 = v13 + 32;
      v103 = v13;
      swift_bridgeObjectRetain();
      v14 = 0;
      v105 = (unint64_t)"yPath: %@, weakImport: %d";
      v107 = 0x800000023A892C20;
      v106 = v4;
      while (1)
      {
        v15 = *(_QWORD *)(v108 + 16 * v14 + 8);
        v121 = *(_QWORD *)(v108 + 16 * v14);
        v122 = v15;
        v119 = 0xD000000000000010;
        v120 = v107;
        v115 = v15;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v16 = v109;
        sub_23A88FF80();
        v17 = sub_23A88FF68();
        (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v16, v111);
        v18 = *(_QWORD *)(v17 + 16);
        if (v18)
        {
          v19 = 0;
          while (1)
          {
            v20 = v17 + 8 * v19;
            v22 = *(_QWORD *)(v20 + 32);
            v21 = *(_QWORD *)(v20 + 40);
            aBlock = v22;
            v126 = v21;
            v117 = 1886413102;
            v118 = 0xE400000000000000;
            if ((sub_23A8903A0() & 1) != 0)
              break;
            v19 += 2;
            if (!--v18)
              goto LABEL_8;
          }
          aBlock = v17;
          v126 = v17 + 32;
          v127 = 0;
          v128 = (void *)(v19 + 3);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5D90);
          sub_23A87EA4C();
          sub_23A890130();
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_8:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
        v23 = objc_msgSend(v116, sel_defaultManager);
        v24 = (void *)sub_23A890148();
        v25 = objc_msgSend(v23, sel_fileExistsAtPath_, v24);

        if ((v25 & 1) == 0)
          break;
        v26 = objc_allocWithZone(MEMORY[0x24BDD1488]);
        v27 = (void *)sub_23A890148();
        swift_bridgeObjectRelease();
        v28 = objc_msgSend(v26, sel_initWithPath_, v27);

        if (!v28)
          goto LABEL_15;
        v29 = objc_msgSend(v28, sel_executablePath);
        v30 = v113;
        if (v29)
        {
          v31 = v29;
          sub_23A89016C();
          swift_bridgeObjectRelease();

          v32 = (void *)sub_23A890148();
          v33 = objc_msgSend(v32, sel_stringByDeletingLastPathComponent);
          v34 = sub_23A89016C();
          v36 = v35;
          swift_bridgeObjectRelease();

        }
        else
        {
          swift_bridgeObjectRelease();

          v36 = v105 | 0x8000000000000000;
          v34 = 0xD000000000000010;
        }
        v37 = v114;
LABEL_18:
        aBlock = v34;
        v126 = v36;
        v38 = sub_23A890388();
        v40 = v39;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        aBlock = v37;
        v126 = v30;
        v121 = 0x687461707240;
        v122 = 0xE600000000000000;
        v119 = v38;
        v120 = v40;
        v41 = sub_23A890388();
        v43 = v42;
        swift_bridgeObjectRelease();
        v44 = objc_msgSend(v116, sel_defaultManager);
        v45 = (void *)sub_23A890148();
        LODWORD(v40) = objc_msgSend(v44, sel_fileExistsAtPath_, v45);

        if ((_DWORD)v40)
        {
          swift_bridgeObjectRelease();
          type metadata accessor for MachOParser();
          v68 = (_QWORD *)swift_allocObject();
          swift_bridgeObjectRetain();
          v69 = MEMORY[0x24BEE4AF8];
          v68[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
          v68[7] = v69;
          v68[2] = v41;
          v68[3] = v43;
          v68[4] = sub_23A8769EC;
          v68[5] = 0;
          swift_bridgeObjectRetain();
          v70 = (void *)sub_23A890148();
          swift_bridgeObjectRelease();
          v129 = sub_23A879BA4;
          v130 = v68;
          aBlock = MEMORY[0x24BDAC760];
          v126 = 1107296256;
          v127 = sub_23A87A648;
          v128 = &block_descriptor_45;
          v71 = _Block_copy(&aBlock);
          swift_retain();
          swift_release();
          nm_macho_for_each_slice(v70, v71);
          _Block_release(v71);

          v72 = sub_23A87A6B4();
          if (v73)
            v74 = v72;
          else
            v74 = 0;
          v75 = 0xE000000000000000;
          if (v73)
            v76 = v73;
          else
            v76 = (void *)0xE000000000000000;
          v77 = sub_23A882028();
          swift_bridgeObjectRetain();
          v78 = (void *)sub_23A890148();
          swift_bridgeObjectRelease();
          v79 = nm_extractTeamID(v78);

          v116 = v76;
          if (v79)
          {
            v109 = sub_23A89016C();
            v75 = v80;

          }
          else
          {
            v109 = 0;
          }
          swift_bridgeObjectRetain();
          v81 = (void *)sub_23A890148();
          swift_bridgeObjectRelease();
          v82 = nm_extractCDHash(v81);

          v63 = v75;
          v61 = v74;
          if (v82)
          {
            v111 = sub_23A89016C();
            v110 = v83;

          }
          else
          {
            v111 = 0;
            v110 = 0xE000000000000000;
          }
          v62 = v77;
          v84 = sub_23A87A90C();
          v86 = v85;
          swift_release();
          if (v86)
            v87 = v84;
          else
            v87 = 0;
          v115 = v87;
          if (v86)
            v88 = v86;
          else
            v88 = 0xE000000000000000;
          v112 = v88;
          v67 = 0xE600000000000000;
          v66 = 0x6534366D7261;
          v59 = v109;
          goto LABEL_64;
        }
        ++v14;
        swift_bridgeObjectRelease();
        if (v14 == v112)
        {
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
      }
      swift_bridgeObjectRelease();
LABEL_15:
      swift_bridgeObjectRelease();
      v36 = v105 | 0x8000000000000000;
      v34 = 0xD000000000000010;
      v30 = v113;
      v37 = v114;
      goto LABEL_18;
    }
    goto LABEL_30;
  }
  if (!a1 && a2 == 0xE000000000000000
    || (sub_23A89049C() & 1) != 0
    || (v46 = objc_msgSend((id)objc_opt_self(), sel_defaultManager),
        v47 = (void *)sub_23A890148(),
        v48 = objc_msgSend(v46, sel_fileExistsAtPath_, v47),
        v46,
        v47,
        !v48))
  {
LABEL_30:
    v61 = 0;
    v115 = 0;
    v116 = 0;
    v62 = 0;
    v41 = 0;
    v43 = 0;
    v59 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v112 = 0;
    v66 = 0;
    v67 = 0;
    goto LABEL_65;
  }
  type metadata accessor for MachOParser();
  v49 = (_QWORD *)swift_allocObject();
  swift_bridgeObjectRetain();
  v50 = MEMORY[0x24BEE4AF8];
  v49[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
  v49[7] = v50;
  v49[2] = a1;
  v49[3] = a2;
  v49[4] = sub_23A8769EC;
  v49[5] = 0;
  swift_bridgeObjectRetain();
  v51 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v129 = sub_23A879BA4;
  v130 = v49;
  aBlock = MEMORY[0x24BDAC760];
  v126 = 1107296256;
  v127 = sub_23A87A648;
  v128 = &block_descriptor_41;
  v52 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v51, v52);
  _Block_release(v52);

  v53 = sub_23A87A6B4();
  v55 = v54;
  if (v54)
    v56 = v53;
  else
    v56 = 0;
  v109 = v56;
  v108 = sub_23A882028();
  swift_bridgeObjectRetain();
  v57 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v58 = nm_extractTeamID(v57);

  if (v58)
  {
    v59 = sub_23A89016C();
    v107 = v60;

  }
  else
  {
    v59 = 0;
    v107 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v89 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v90 = nm_extractCDHash(v89);

  v91 = v114;
  if (v90)
  {
    v111 = sub_23A89016C();
    v110 = v92;

  }
  else
  {
    v111 = 0;
    v110 = 0xE000000000000000;
  }
  v93 = sub_23A87A90C();
  v95 = v94;
  swift_release();
  if (v95)
    v96 = v93;
  else
    v96 = 0;
  if (v95)
    v97 = v95;
  else
    v97 = 0xE000000000000000;
  v112 = v97;
  if (v55)
    v98 = v55;
  else
    v98 = (void *)0xE000000000000000;
  v115 = v96;
  v116 = v98;
  swift_bridgeObjectRetain();
  v67 = 0xE600000000000000;
  v43 = a2;
  v66 = 0x6534366D7261;
  v41 = v91;
  v61 = v109;
  v62 = v108;
  v63 = v107;
LABEL_64:
  v64 = v111;
  v65 = v110;
LABEL_65:
  result = swift_bridgeObjectRetain();
  v100 = v104;
  *v104 = v114;
  v100[1] = result;
  v101 = (uint64_t)v116;
  v100[2] = v61;
  v100[3] = v101;
  v100[4] = v62;
  v100[5] = v41;
  v100[6] = v43;
  v100[7] = v59;
  v100[8] = v63;
  v100[9] = v64;
  v102 = v115;
  v100[10] = v65;
  v100[11] = v102;
  v100[12] = v112;
  v100[13] = v66;
  v100[14] = v67;
  return result;
}

uint64_t sub_23A87CD70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v9;

  v1 = MEMORY[0x24BEE4AF8];
  v9 = MEMORY[0x24BEE4AF8];
  sub_23A87BD28();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v0;
  aBlock[4] = sub_23A87E9F8;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A87A648;
  aBlock[3] = &block_descriptor_31;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v3, v5);
  _Block_release(v5);

  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  sub_23A87CEBC(v6);
  return v9;
}

uint64_t sub_23A87CEBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_23A885B60(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[54 * v8 + 4];
  if (a1 + 32 < v9 + 432 * v2 && v9 < a1 + 32 + 432 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23A89046C();
  __break(1u);
  return result;
}

uint64_t sub_23A87D014()
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
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t aBlock;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  void *v48;
  void (*v49)(uint64_t, uint64_t);
  _QWORD *v50;
  _QWORD v51[2];
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  __int128 v61;

  v1 = v0;
  v42 = sub_23A890190();
  v41 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v40 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = swift_allocObject();
  v4 = MEMORY[0x24BEE4AF8];
  v44 = v3;
  *(_QWORD *)(v3 + 16) = MEMORY[0x24BEE4AF8];
  v43 = v3 + 16;
  v5 = swift_allocObject();
  v6 = sub_23A87332C(v4);
  *(_QWORD *)(v5 + 16) = v6;
  v7 = *(_QWORD *)(v1 + 24);
  v39 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  v8 = sub_23A87A6B4();
  v10 = v9;
  swift_bridgeObjectRetain();
  v38 = sub_23A882028();
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  v37 = sub_23A88FC78(v11);
  v36 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v14 = nm_extractTeamID(v13);

  if (v14)
  {
    v35 = sub_23A89016C();
    v34 = v15;

  }
  else
  {
    v35 = 0;
    v34 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v16 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  v17 = nm_extractCDHash(v16);

  if (v17)
  {
    v18 = sub_23A89016C();
    v20 = v19;

  }
  else
  {
    v18 = 0;
    v20 = 0xE000000000000000;
  }
  if (!v10)
  {
    v10 = 0xE000000000000000;
    v8 = 0;
  }
  v21 = sub_23A87A90C();
  if (v22)
    v23 = v21;
  else
    v23 = 0;
  if (v22)
    v24 = v22;
  else
    v24 = 0xE000000000000000;
  v51[0] = v8;
  v51[1] = v10;
  v52 = v38;
  v53 = v37;
  v54 = v36;
  v55 = v35;
  v56 = v34;
  v57 = v18;
  v58 = v20;
  v59 = v23;
  v60 = v24;
  v61 = xmmword_23A890EE0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  aBlock = v6;
  *(_QWORD *)(v5 + 16) = 0x8000000000000000;
  sub_23A8808D0((uint64_t)v51, v39, v7, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 16) = aBlock;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = *(_QWORD *)(v1 + 24);
  aBlock = *(_QWORD *)(v1 + 16);
  v46 = v26;
  swift_bridgeObjectRetain();
  v27 = v40;
  sub_23A890184();
  sub_23A8724FC();
  sub_23A890394();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v42);
  swift_bridgeObjectRelease();
  v28 = (_QWORD *)swift_allocObject();
  v28[2] = v1;
  v28[3] = v5;
  v29 = v44;
  v28[4] = v44;
  v49 = sub_23A87E93C;
  v50 = v28;
  aBlock = MEMORY[0x24BDAC760];
  v46 = 1107296256;
  v47 = sub_23A87A600;
  v48 = &block_descriptor_1;
  v30 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  CSSymbolicatorForeachSymbolicatorWithPath();
  swift_bridgeObjectRelease();
  _Block_release(v30);
  swift_beginAccess();
  v31 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v31;
}

void sub_23A87D438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  __int128 aBlock;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  void (*v31)(uint64_t, uint64_t);
  _QWORD *v32;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(uint64_t (**)(uint64_t))(a3 + 32);
  v12 = swift_retain();
  LOBYTE(v11) = v11(v12);
  swift_release();
  if ((v11 & 1) != 0)
  {
    sub_23A8902BC();
    sub_23A875650();
    v13 = (void *)sub_23A89034C();
    sub_23A890064();

    v27 = 0;
    v14 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain();
    v15 = sub_23A88FC78(v14);
    v17 = v16;
    swift_bridgeObjectRelease();
    *v10 = v15;
    v10[1] = v17;
    v18 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 0, 1, v18);
    v19 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain();
    v20 = sub_23A88FC78(v19);
    v22 = v21;
    swift_bridgeObjectRelease();
    v26 = 4;
    aBlock = 0u;
    sub_23A8879F4(&v27, (uint64_t)v10, 0, 1, v20, v22, 0, 0, 0, 0, 0, 0, &v26, 0xD000000000000042, 0x800000023A892960, (uint64_t *)&aBlock);
    swift_bridgeObjectRelease();
    sub_23A87EAA8((uint64_t)v10, &qword_2569C5BA0);
  }
  else
  {
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = a3;
    v23[3] = a4;
    v23[4] = a5;
    v31 = sub_23A87E998;
    v32 = v23;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v29 = sub_23A87A600;
    v30 = &block_descriptor_12;
    v24 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    CSSymbolicatorForeachSymbolOwnerAtTime();
    _Block_release(v24);
  }
}

void sub_23A87D6DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  __int128 aBlock;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  void *v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  _QWORD *v34;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(uint64_t (**)(uint64_t))(a3 + 32);
  v14 = swift_retain();
  LOBYTE(v13) = v13(v14);
  swift_release();
  if ((v13 & 1) != 0)
  {
    sub_23A8902BC();
    sub_23A875650();
    v15 = (void *)sub_23A89034C();
    sub_23A890064();

    v29 = 0;
    v16 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain();
    v17 = sub_23A88FC78(v16);
    v19 = v18;
    swift_bridgeObjectRelease();
    *v12 = v17;
    v12[1] = v19;
    v20 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 0, 1, v20);
    v21 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain();
    v22 = sub_23A88FC78(v21);
    v24 = v23;
    swift_bridgeObjectRelease();
    v28 = 4;
    aBlock = 0u;
    sub_23A8879F4(&v29, (uint64_t)v12, 0, 1, v22, v24, 0, 0, 0, 0, 0, 0, &v28, 0xD00000000000003FLL, 0x800000023A892A10, (uint64_t *)&aBlock);
    swift_bridgeObjectRelease();
    sub_23A87EAA8((uint64_t)v12, &qword_2569C5BA0);
  }
  else
  {
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = a3;
    v25[3] = a1;
    v25[4] = a2;
    v25[5] = a4;
    v25[6] = a5;
    v33 = sub_23A87E9D8;
    v34 = v25;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v31 = sub_23A87A600;
    v32 = &block_descriptor_18;
    v26 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    CSSymbolOwnerForeachSymbol();
    _Block_release(v26);
  }
}

uint64_t sub_23A87D980(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t result;
  uint64_t Name;
  uint64_t Path;
  uint64_t FamilyName;
  uint64_t CFUUIDBytes;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v64;
  char v65;
  char v66;
  char v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  _QWORD **v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  char v123;
  unint64_t v124;
  unint64_t v125;
  _QWORD *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t (*v160)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _BYTE v169[7];
  uint64_t v170;
  unsigned __int8 v171[24];
  uint64_t v172;
  unint64_t v173;
  char v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  __int128 v183;
  __int128 aBlock;
  uint64_t (*v185)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v186;
  uint64_t (*v187)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  unint64_t v193;
  __int128 v194;

  v168 = a7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (uint64_t (*)(uint64_t))a3[4];
  v13 = swift_retain();
  LOBYTE(v12) = v12(v13);
  swift_release();
  if ((v12 & 1) != 0)
  {
    sub_23A8902BC();
    sub_23A875650();
    v14 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v172) = 0;
    v15 = a3[2];
    swift_bridgeObjectRetain();
    v16 = sub_23A88FC78(v15);
    v18 = v17;
    swift_bridgeObjectRelease();
    *v11 = v16;
    v11[1] = v18;
    v19 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v11, 0, 1, v19);
    v20 = a3[2];
    swift_bridgeObjectRetain();
    v21 = sub_23A88FC78(v20);
    v23 = v22;
    swift_bridgeObjectRelease();
    v171[0] = 4;
    aBlock = 0u;
    sub_23A8879F4((unsigned __int8 *)&v172, (uint64_t)v11, 0, 1, v21, v23, 0, 0, 0, 0, 0, 0, v171, 0xD000000000000033, 0x800000023A892AB0, (uint64_t *)&aBlock);
    swift_bridgeObjectRelease();
    return sub_23A87EAA8((uint64_t)v11, &qword_2569C5BA0);
  }
  Name = CSSymbolGetName();
  Path = CSSymbolOwnerGetPath();
  CSSymbolOwnerGetArchitecture();
  FamilyName = CSArchitectureGetFamilyName();
  CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  v29 = swift_slowAlloc();
  if (CFUUIDBytes && MEMORY[0x23B8596EC](CFUUIDBytes, v29, 40))
  {
    v30 = sub_23A8901D8();
    v32 = v31;
    if (!Name)
      return swift_bridgeObjectRelease();
  }
  else
  {
    v30 = 0;
    v32 = 0xE000000000000000;
    if (!Name)
      return swift_bridgeObjectRelease();
  }
  if (!Path || !FamilyName)
    return swift_bridgeObjectRelease();
  v166 = v30;
  v158 = FamilyName;
  v159 = Name;
  v33 = (uint64_t *)(a6 + 16);
  v34 = sub_23A8901CC();
  v36 = v35;
  v37 = a3[3];
  v167 = a3[2];
  swift_beginAccess();
  v38 = *v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39 = sub_23A8901CC();
  if (!*(_QWORD *)(v38 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  sub_23A87F770(v39, v40);
  v42 = v41;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) == 0)
  {
LABEL_15:
    type metadata accessor for MachOParser();
    v43 = (_QWORD *)swift_allocObject();
    swift_bridgeObjectRetain();
    v44 = MEMORY[0x24BEE4AF8];
    v43[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
    v43[7] = v44;
    v43[2] = v34;
    v43[3] = v36;
    v43[4] = sub_23A8769EC;
    v43[5] = 0;
    swift_bridgeObjectRetain();
    v45 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v187 = sub_23A879BA4;
    v188 = v43;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v185 = sub_23A87A648;
    v186 = &block_descriptor_21;
    v46 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    nm_macho_for_each_slice(v45, v46);
    _Block_release(v46);

    v163 = v37;
    LODWORD(v162) = sub_23A882028();
    v47 = sub_23A88FC78(v34);
    v160 = v48;
    v161 = (void *)v47;
    swift_bridgeObjectRetain();
    v49 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v50 = nm_extractTeamID(v49);

    v164 = v34;
    v165 = v36;
    if (v50)
    {
      v51 = sub_23A89016C();
      v53 = v52;

    }
    else
    {
      v51 = 0;
      v53 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    v54 = (void *)sub_23A890148();
    swift_bridgeObjectRelease();
    v55 = nm_extractCDHash(v54);

    if (v55)
    {
      v56 = sub_23A89016C();
      v58 = v57;

    }
    else
    {
      v56 = 0;
      v58 = 0xE000000000000000;
    }
    v59 = sub_23A87A90C();
    if (v60)
      v61 = v59;
    else
      v61 = 0;
    if (v60)
      v62 = v60;
    else
      v62 = 0xE000000000000000;
    *(_QWORD *)&aBlock = v166;
    *((_QWORD *)&aBlock + 1) = v32;
    LOBYTE(v185) = v162;
    v186 = v161;
    v187 = v160;
    v188 = (_QWORD *)v51;
    v189 = v53;
    v190 = v56;
    v191 = v58;
    v192 = v61;
    v193 = v62;
    v194 = xmmword_23A890EE0;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v170 = *v33;
    *v33 = 0x8000000000000000;
    v34 = v164;
    v36 = v165;
    sub_23A87E798((uint64_t)&aBlock, v164, v165, isUniquelyReferenced_nonNull_native, (uint64_t)&v172);
    *v33 = v170;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    sub_23A879DE4(v172, v173);
    v37 = v163;
  }
  swift_beginAccess();
  if (!*(_QWORD *)(*v33 + 16))
    goto LABEL_52;
  swift_bridgeObjectRetain();
  v64 = v167;
  sub_23A87F770(v167, v37);
  v66 = v65;
  swift_endAccess();
  if ((v66 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_53:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (!*(_QWORD *)(*v33 + 16))
  {
LABEL_52:
    swift_endAccess();
    goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  sub_23A87F770(v34, v36);
  if ((v67 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v68 = *v33;
  if (!*(_QWORD *)(*v33 + 16))
  {
LABEL_55:
    swift_endAccess();
    __break(1u);
    goto LABEL_56;
  }
  swift_bridgeObjectRetain();
  v69 = sub_23A87F770(v64, v37);
  if ((v70 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  v71 = *(_QWORD *)(v68 + 56) + 104 * v69;
  v72 = *(void **)v71;
  v163 = *(_QWORD *)(v71 + 8);
  LODWORD(v160) = *(unsigned __int8 *)(v71 + 16);
  v73 = *(_QWORD *)(v71 + 32);
  v151 = *(_QWORD *)(v71 + 24);
  v74 = *(_QWORD *)(v71 + 40);
  v75 = *(_QWORD *)(v71 + 48);
  v161 = v72;
  v162 = v75;
  v76 = *(_QWORD *)(v71 + 64);
  v156 = *(_QWORD *)(v71 + 56);
  v157 = v74;
  v77 = *(_QWORD *)(v71 + 80);
  v153 = *(_QWORD *)(v71 + 72);
  v78 = *(_QWORD *)(v71 + 96);
  v149 = *(_QWORD *)(v71 + 88);
  swift_endAccess();
  v150 = v78;
  swift_bridgeObjectRetain();
  v79 = v163;
  swift_bridgeObjectRetain();
  v154 = v73;
  v80 = v162;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v155 = v76;
  swift_bridgeObjectRetain();
  v152 = v77;
  v81 = v161;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ((!v81 && v79 == 0xE000000000000000 || (sub_23A89049C() & 1) != 0)
    && (v167 == v34 && v37 == v36 || (sub_23A89049C() & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v82 = v155;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v83 = v80;
    v163 = sub_23A88FC78(v151);
    v85 = v84;
    swift_bridgeObjectRelease();
    v172 = v166;
    v173 = v32;
    v174 = (char)v160;
    v175 = v163;
    v176 = v85;
    v177 = v157;
    v178 = v83;
    v179 = v156;
    v180 = v82;
    v86 = v167;
    v181 = v153;
    v182 = v152;
    v183 = xmmword_23A890EE0;
    swift_beginAccess();
    v87 = swift_isUniquelyReferenced_nonNull_native();
    v170 = *v33;
    *v33 = 0x8000000000000000;
    sub_23A8808D0((uint64_t)&v172, v86, v37, v87);
    *v33 = v170;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_beginAccess();
    v88 = *v33;
    if (!*(_QWORD *)(*v33 + 16))
    {
LABEL_59:
      swift_endAccess();
      result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v89 = sub_23A87F770(v86, v37);
    if ((v90 & 1) == 0)
    {
LABEL_58:
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
    v91 = *(_QWORD *)(v88 + 56) + 104 * v89;
    v161 = *(void **)v91;
    v163 = *(_QWORD *)(v91 + 8);
    LODWORD(v160) = *(unsigned __int8 *)(v91 + 16);
    v92 = *(_QWORD *)(v91 + 32);
    v151 = *(_QWORD *)(v91 + 24);
    v93 = *(_QWORD *)(v91 + 40);
    v94 = *(_QWORD *)(v91 + 48);
    v95 = *(_QWORD *)(v91 + 64);
    v156 = *(_QWORD *)(v91 + 56);
    v157 = v93;
    v96 = *(_QWORD *)(v91 + 80);
    v153 = *(_QWORD *)(v91 + 72);
    v97 = *(_QWORD *)(v91 + 96);
    v149 = *(_QWORD *)(v91 + 88);
    swift_endAccess();
    v150 = v97;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v154 = v92;
    swift_bridgeObjectRetain();
    v162 = v94;
    swift_bridgeObjectRetain();
    v155 = v95;
    swift_bridgeObjectRetain();
    v152 = v96;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v98 = *v33;
  if (!*(_QWORD *)(*v33 + 16))
  {
LABEL_57:
    swift_endAccess();
    __break(1u);
    goto LABEL_58;
  }
  swift_bridgeObjectRetain();
  v99 = sub_23A87F770(v34, v36);
  if ((v100 & 1) == 0)
  {
LABEL_56:
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  v101 = (_QWORD **)(v168 + 16);
  v102 = *(_QWORD *)(v98 + 56) + 104 * v99;
  v103 = *(_QWORD *)v102;
  v104 = *(_QWORD *)(v102 + 8);
  HIDWORD(v140) = *(unsigned __int8 *)(v102 + 16);
  v105 = *(_QWORD *)(v102 + 24);
  v106 = *(_QWORD *)(v102 + 32);
  v107 = *(_QWORD *)(v102 + 48);
  v145 = *(_QWORD *)(v102 + 40);
  v146 = v105;
  v108 = *(_QWORD *)(v102 + 56);
  v109 = *(_QWORD *)(v102 + 64);
  v110 = *(_QWORD *)(v102 + 80);
  v143 = *(_QWORD *)(v102 + 72);
  v144 = v108;
  v111 = *(_QWORD *)(v102 + 88);
  v112 = *(_QWORD *)(v102 + 96);
  v141 = v103;
  v142 = v111;
  swift_endAccess();
  v147 = v112;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v168 = v106;
  swift_bridgeObjectRetain();
  v167 = v107;
  swift_bridgeObjectRetain();
  v166 = v109;
  swift_bridgeObjectRetain();
  v148 = v110;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v113 = sub_23A8901CC();
  v115 = v114;
  v116 = sub_23A88FC78(v34);
  v118 = v117;
  swift_bridgeObjectRelease();
  v119 = sub_23A8901CC();
  v121 = v120;
  swift_beginAccess();
  v122 = *v101;
  v123 = swift_isUniquelyReferenced_nonNull_native();
  *v101 = v122;
  v164 = v119;
  v165 = v121;
  if ((v123 & 1) == 0)
  {
    v122 = sub_23A885B60(0, v122[2] + 1, 1, v122);
    *v101 = v122;
  }
  v125 = v122[2];
  v124 = v122[3];
  if (v125 >= v124 >> 1)
  {
    v122 = sub_23A885B60((_QWORD *)(v124 > 1), v125 + 1, 1, v122);
    *v101 = v122;
  }
  v122[2] = v125 + 1;
  v126 = &v122[54 * v125];
  v126[4] = v113;
  v126[5] = v115;
  v126[6] = 0;
  v126[7] = 0xE000000000000000;
  v126[8] = v116;
  v127 = v161;
  v126[9] = v118;
  v126[10] = v127;
  v126[11] = v163;
  *((_BYTE *)v126 + 96) = (_BYTE)v160;
  LODWORD(v127) = *(_DWORD *)((char *)&v170 + 3);
  *(_DWORD *)((char *)v126 + 97) = v170;
  *((_DWORD *)v126 + 25) = (_DWORD)v127;
  v128 = v154;
  v126[13] = v151;
  v126[14] = v128;
  v129 = v162;
  v126[15] = v157;
  v126[16] = v129;
  v130 = v155;
  v126[17] = v156;
  v126[18] = v130;
  v131 = v152;
  v126[19] = v153;
  v126[20] = v131;
  v132 = v150;
  v126[21] = v149;
  v126[22] = v132;
  v126[23] = v141;
  v126[24] = v104;
  *((_BYTE *)v126 + 200) = BYTE4(v140);
  LODWORD(v132) = *(_DWORD *)v169;
  *((_DWORD *)v126 + 51) = *(_DWORD *)&v169[3];
  *(_DWORD *)((char *)v126 + 201) = v132;
  v133 = v168;
  v126[26] = v146;
  v126[27] = v133;
  v134 = v167;
  v126[28] = v145;
  v126[29] = v134;
  v135 = v166;
  v126[30] = v144;
  v126[31] = v135;
  v136 = v148;
  v126[32] = v143;
  v126[33] = v136;
  v137 = v147;
  v126[34] = v142;
  v126[35] = v137;
  *((_OWORD *)v126 + 23) = 0u;
  *((_OWORD *)v126 + 24) = 0u;
  *((_OWORD *)v126 + 21) = 0u;
  *((_OWORD *)v126 + 22) = 0u;
  *((_OWORD *)v126 + 19) = 0u;
  *((_OWORD *)v126 + 20) = 0u;
  *((_OWORD *)v126 + 18) = 0u;
  v138 = v164;
  v139 = v165;
  v126[50] = 0;
  v126[51] = v138;
  v126[52] = v139;
  v126[53] = 1;
  v126[54] = 0;
  v126[55] = 0xE000000000000000;
  v126[56] = 0;
  v126[57] = 0xE000000000000000;
  return swift_endAccess();
}

uint64_t sub_23A87E6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v6 = (_QWORD *)(a5 + 16);
  result = swift_beginAccess();
  v8 = *(_QWORD *)(a5 + 16);
  v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    *v6 = v9;
    return 1;
  }
  return result;
}

uint64_t sub_23A87E718()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MachOParser()
{
  return objc_opt_self();
}

uint64_t sub_23A87E774()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A87E798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_23A87F770(a2, a3);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= result && (a4 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7] + 104 * v14;
        v22 = *(_QWORD *)(v21 + 8);
        v23 = *(_BYTE *)(v21 + 16);
        v24 = *(_OWORD *)(v21 + 24);
        v25 = *(_OWORD *)(v21 + 40);
        v26 = *(_OWORD *)(v21 + 56);
        v27 = *(_QWORD *)(v21 + 72);
        v28 = *(_QWORD *)(v21 + 80);
        *(_QWORD *)a5 = *(_QWORD *)v21;
        *(_QWORD *)(a5 + 8) = v22;
        *(_BYTE *)(a5 + 16) = v23;
        *(_OWORD *)(a5 + 24) = v24;
        *(_OWORD *)(a5 + 40) = v25;
        *(_OWORD *)(a5 + 56) = v26;
        *(_QWORD *)(a5 + 72) = v27;
        *(_QWORD *)(a5 + 80) = v28;
        *(_OWORD *)(a5 + 88) = *(_OWORD *)(v21 + 88);
        v29 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)v21 = *(_OWORD *)a1;
        *(_OWORD *)(v21 + 16) = v29;
        v30 = *(_OWORD *)(a1 + 48);
        *(_OWORD *)(v21 + 32) = *(_OWORD *)(a1 + 32);
        *(_OWORD *)(v21 + 48) = v30;
        v31 = *(_OWORD *)(a1 + 80);
        *(_OWORD *)(v21 + 64) = *(_OWORD *)(a1 + 64);
        *(_OWORD *)(v21 + 80) = v31;
        *(_QWORD *)(v21 + 96) = *(_QWORD *)(a1 + 96);
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= result && (a4 & 1) == 0)
    {
      result = (uint64_t)sub_23A8810B0();
      goto LABEL_7;
    }
    sub_23A87FBC8(result, a4 & 1);
    result = sub_23A87F770(a2, a3);
    if ((v18 & 1) == (v32 & 1))
    {
      v14 = result;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23A880E90(v14, a2, a3, a1, v20);
      *(_QWORD *)(a5 + 96) = 0;
      *(_OWORD *)(a5 + 64) = 0u;
      *(_OWORD *)(a5 + 80) = 0u;
      *(_OWORD *)(a5 + 32) = 0u;
      *(_OWORD *)(a5 + 48) = 0u;
      *(_OWORD *)a5 = 0u;
      *(_OWORD *)(a5 + 16) = 0u;
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23A8904A8();
  __break(1u);
  return result;
}

void sub_23A87E93C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23A87D438(a1, a2, v2[2], v2[3], v2[4]);
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

uint64_t objectdestroy_5Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23A87E998(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23A87D6DC(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_23A87E9A4()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A87E9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A87D980(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_23A87E9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A87A46C(a1, a2, v2);
}

uint64_t sub_23A87E9F0()
{
  return objectdestroy_27Tm();
}

uint64_t sub_23A87E9F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A87AF18(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_23A87EA00()
{
  return objectdestroy_27Tm();
}

uint64_t objectdestroy_27Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A87EA40(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A87AFF0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD **)(v4 + 24), *(mach_header **)(v4 + 32));
}

unint64_t sub_23A87EA4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C5D98;
  if (!qword_2569C5D98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569C5D90);
    result = MEMORY[0x23B859B78](MEMORY[0x24BEE2170], v1);
    atomic_store(result, (unint64_t *)&qword_2569C5D98);
  }
  return result;
}

uint64_t sub_23A87EA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A87BFEC(a1, a2, a3, a4, v4);
}

uint64_t sub_23A87EAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23A87C09C(a1, a2, a3, v3);
}

uint64_t sub_23A87EAA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A87EAE4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A87EB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A87A88C(a1, a2, a3, a4, v4);
}

void sub_23A87EB6C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  char v4;
  id v5;
  unint64_t v6;
  char v7;
  id v8;
  unint64_t v9;
  char v10;
  id v11;
  unint64_t v12;
  char v13;
  id v14;
  unint64_t v15;
  char v16;
  id v17;
  uint64_t *v18;
  char v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  uint64_t v34;

  if (*(_QWORD *)(a1 + 16))
  {
    v3 = sub_23A87F770(0x614E6C6F626D7973, 0xEA0000000000656DLL);
    if ((v4 & 1) != 0)
      v5 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5EA8);
  sub_23A89019C();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  if (*(_QWORD *)(a1 + 16))
  {
    v6 = sub_23A87F770(0x61507972616E6962, 0xEA00000000006874);
    if ((v7 & 1) != 0)
      v8 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v6);
  }
  sub_23A89019C();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  if (*(_QWORD *)(a1 + 16))
  {
    v9 = sub_23A87F770(0x74615062696C7964, 0xE900000000000068);
    if ((v10 & 1) != 0)
      v11 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v9);
  }
  sub_23A89019C();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  if (*(_QWORD *)(a1 + 16))
  {
    v12 = sub_23A87F770(0xD000000000000010, 0x800000023A892D80);
    if ((v13 & 1) != 0)
      v14 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v12);
  }
  sub_23A89019C();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  if (*(_QWORD *)(a1 + 16))
  {
    v15 = sub_23A87F770(0x794472656C6C6163, 0xEF6874615062696CLL);
    if ((v16 & 1) != 0)
      v17 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v15);
  }
  sub_23A89019C();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  v18 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v1 + 16) + 16)
    || (swift_bridgeObjectRetain(),
        sub_23A87F770(0, 0xE000000000000000),
        v20 = v19,
        swift_bridgeObjectRelease(),
        (v20 & 1) == 0))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = *v18;
    *v18 = 0x8000000000000000;
    sub_23A880A54(a1, 0, 0xE000000000000000, isUniquelyReferenced_nonNull_native);
    *v18 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return;
  }
  v21 = *v18;
  if (!*(_QWORD *)(*v18 + 16))
  {
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = sub_23A87F770(0, 0xE000000000000000);
  if ((v23 & 1) != 0)
  {
    v24 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v24 + 16))
    {
      swift_bridgeObjectRetain();
      v25 = sub_23A87F770(0x6F436C6F626D7973, 0xEB00000000746E75);
      if ((v26 & 1) != 0)
      {
        v27 = *(id *)(*(_QWORD *)(v24 + 56) + 8 * v25);
        swift_bridgeObjectRelease();
        objc_opt_self();
        v28 = swift_dynamicCastObjCClassUnconditional();
        MEMORY[0x23B859488](v28);
        sub_23A89031C();
        sub_23A890334();
        v29 = sub_23A890328();
        v30 = swift_isUniquelyReferenced_nonNull_native();
        sub_23A880BB0(v29, 0x6F436C6F626D7973, 0xEB00000000746E75, v30);
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v31 = swift_isUniquelyReferenced_nonNull_native();
        v33 = *v18;
        *v18 = 0x8000000000000000;
        sub_23A880A54(v24, 0, 0xE000000000000000, v31);
        *v18 = v33;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();

        return;
      }
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_27:
  swift_bridgeObjectRelease();
  __break(1u);
}

void sub_23A87F098()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t aBlock[6];

  v1 = v0[5];
  if (v1 == -1)
  {
    swift_beginAccess();
    v1 = *(_QWORD *)(v0[2] + 16);
  }
  v2 = v0 + 2;
  swift_beginAccess();
  v48 = v0;
  v3 = *(_QWORD *)(v0[2] + 16);
  if (v1 >= v3)
  {
LABEL_22:
    v20 = sub_23A8902C8();
    sub_23A875650();
    swift_retain_n();
    v21 = sub_23A89034C();
    if (os_log_type_enabled(v21, v20))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      *(_DWORD *)v22 = 134218242;
      aBlock[0] = v23;
      sub_23A890358();
      swift_release();
      *(_WORD *)(v22 + 12) = 2080;
      v24 = v48[3];
      v25 = v48[4];
      swift_bridgeObjectRetain();
      sub_23A885F20(v24, v25, aBlock);
      sub_23A890358();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A86F000, v21, v20, "EcosystemAnalytics.framework:AnalyticsRandomizer: Sending %ld %s events", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B859C14](v23, -1, -1);
      MEMORY[0x23B859C14](v22, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v26 = v48[2];
    v27 = v26 + 64;
    v28 = 1 << *(_BYTE *)(v26 + 32);
    v29 = -1;
    if (v28 < 64)
      v29 = ~(-1 << v28);
    v30 = v29 & *(_QWORD *)(v26 + 64);
    v31 = (unint64_t)(v28 + 63) >> 6;
    swift_bridgeObjectRetain();
    v32 = 0;
    while (1)
    {
      if (v30)
      {
        v33 = __clz(__rbit64(v30));
        v30 &= v30 - 1;
        v34 = v33 | (v32 << 6);
      }
      else
      {
        v43 = v32 + 1;
        if (__OFADD__(v32, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        if (v43 >= v31)
          goto LABEL_45;
        v44 = *(_QWORD *)(v27 + 8 * v43);
        ++v32;
        if (!v44)
        {
          v32 = v43 + 1;
          if (v43 + 1 >= v31)
            goto LABEL_45;
          v44 = *(_QWORD *)(v27 + 8 * v32);
          if (!v44)
          {
            v32 = v43 + 2;
            if (v43 + 2 >= v31)
              goto LABEL_45;
            v44 = *(_QWORD *)(v27 + 8 * v32);
            if (!v44)
            {
              v45 = v43 + 3;
              if (v45 >= v31)
              {
LABEL_45:
                swift_release();
                return;
              }
              v44 = *(_QWORD *)(v27 + 8 * v45);
              if (!v44)
              {
                while (1)
                {
                  v32 = v45 + 1;
                  if (__OFADD__(v45, 1))
                    goto LABEL_50;
                  if (v32 >= v31)
                    goto LABEL_45;
                  v44 = *(_QWORD *)(v27 + 8 * v32);
                  ++v45;
                  if (v44)
                    goto LABEL_44;
                }
              }
              v32 = v45;
            }
          }
        }
LABEL_44:
        v30 = (v44 - 1) & v44;
        v34 = __clz(__rbit64(v44)) + (v32 << 6);
      }
      v35 = (uint64_t *)(*(_QWORD *)(v26 + 48) + 16 * v34);
      v36 = *v35;
      v37 = v35[1];
      v38 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v34);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B0);
      v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_23A890C00;
      *(_QWORD *)(v39 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B8);
      *(_QWORD *)(v39 + 32) = v38;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_23A8904E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v40 = (void *)sub_23A890148();
      swift_bridgeObjectRelease();
      v41 = (_QWORD *)swift_allocObject();
      v41[2] = v36;
      v41[3] = v37;
      v41[4] = v38;
      aBlock[4] = (uint64_t)sub_23A8817B8;
      aBlock[5] = (uint64_t)v41;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23A888918;
      aBlock[3] = (uint64_t)&block_descriptor_2;
      v42 = _Block_copy(aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v42);

    }
  }
  v46 = v1;
  while (v3)
  {
    aBlock[0] = 0;
    MEMORY[0x23B859C20](aBlock, 8);
    v4 = ((unint64_t)aBlock[0] * (unsigned __int128)(unint64_t)v3) >> 64;
    if (v3 > (unint64_t)(aBlock[0] * v3))
    {
      v5 = -v3 % (unint64_t)v3;
      if (v5 > aBlock[0] * v3)
      {
        do
        {
          aBlock[0] = 0;
          MEMORY[0x23B859C20](aBlock, 8);
        }
        while (v5 > aBlock[0] * v3);
        v4 = ((unint64_t)aBlock[0] * (unsigned __int128)(unint64_t)v3) >> 64;
      }
    }
    v6 = *v2;
    v7 = *(_QWORD *)(*v2 + 16);
    if (v7)
    {
      v47 = v4;
      v8 = v2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58C0);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 17;
      v9[2] = v7;
      v9[3] = 2 * (v11 >> 4);
      v12 = sub_23A8817D8((uint64_t)aBlock, v9 + 4, v7, v6);
      swift_bridgeObjectRetain_n();
      sub_23A879BAC();
      if (v12 != v7)
        goto LABEL_49;
      swift_bridgeObjectRelease();
      v2 = v8;
      v1 = v46;
      v4 = v47;
    }
    else
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    if (v4 >= v9[2])
      goto LABEL_48;
    v13 = &v9[2 * v4];
    v14 = v13[4];
    v15 = v13[5];
    swift_bridgeObjectRetain();
    swift_release();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v16 = sub_23A87F770(v14, v15);
    LOBYTE(v14) = v17;
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v19 = *v2;
      v49 = *v2;
      *v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_23A880EFC();
        v19 = v49;
      }
      swift_bridgeObjectRelease();
      sub_23A8806FC(v16, v19);
      *v2 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
    v3 = *(_QWORD *)(*v2 + 16);
    if (v1 >= v3)
      goto LABEL_22;
  }
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
}

uint64_t AnalyticsRandomizer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AnalyticsRandomizer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsRandomizer()
{
  return objc_opt_self();
}

uint64_t method lookup function for AnalyticsRandomizer()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_23A87F770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A8904F0();
  sub_23A8901B4();
  v4 = sub_23A890508();
  return sub_23A87F7D4(a1, a2, v4);
}

unint64_t sub_23A87F7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23A89049C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23A89049C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23A87F8B4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58D8);
  v36 = a2;
  v6 = sub_23A890454();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23A8904F0();
    sub_23A8901B4();
    result = sub_23A890508();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23A87FBC8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  int64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58A0);
  v50 = a2;
  v5 = sub_23A890454();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v47 = (_QWORD *)(v4 + 64);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v4 + 64);
    v46 = (unint64_t)(v7 + 63) >> 6;
    v10 = v5 + 64;
    result = swift_retain();
    v12 = 0;
    v48 = v4;
    v49 = v6;
    v13 = v6;
    while (1)
    {
      if (v9)
      {
        v51 = (v9 - 1) & v9;
        v52 = v12;
        v22 = __clz(__rbit64(v9)) | (v12 << 6);
      }
      else
      {
        v23 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
        if (v23 >= v46)
        {
          swift_release();
          v43 = v45;
          v24 = v47;
          if ((v50 & 1) == 0)
            goto LABEL_38;
LABEL_35:
          v44 = 1 << *(_BYTE *)(v4 + 32);
          if (v44 >= 64)
            bzero(v24, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v24 = -1 << v44;
          v6 = v49;
          *(_QWORD *)(v4 + 16) = 0;
          result = swift_release();
          goto LABEL_41;
        }
        v24 = v47;
        v25 = v47[v23];
        v26 = v12 + 1;
        if (!v25)
        {
          v26 = v12 + 2;
          if (v12 + 2 >= v46)
            goto LABEL_34;
          v25 = v47[v26];
          if (!v25)
          {
            v27 = v12 + 3;
            if (v12 + 3 >= v46)
            {
LABEL_34:
              swift_release();
              v43 = v45;
              if ((v50 & 1) == 0)
              {
LABEL_38:
                result = swift_release();
                v6 = v49;
                goto LABEL_41;
              }
              goto LABEL_35;
            }
            v25 = v47[v27];
            if (!v25)
            {
              while (1)
              {
                v26 = v27 + 1;
                if (__OFADD__(v27, 1))
                  break;
                if (v26 >= v46)
                  goto LABEL_34;
                v25 = v47[v26];
                ++v27;
                if (v25)
                  goto LABEL_30;
              }
LABEL_43:
              __break(1u);
              return result;
            }
            v26 = v12 + 3;
          }
        }
LABEL_30:
        v51 = (v25 - 1) & v25;
        v52 = v26;
        v22 = __clz(__rbit64(v25)) + (v26 << 6);
      }
      v32 = *(_QWORD *)(v4 + 56);
      v33 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v22);
      v35 = *v33;
      v34 = v33[1];
      v36 = (uint64_t *)(v32 + 104 * v22);
      v37 = v36[1];
      v59 = *((_BYTE *)v36 + 16);
      v38 = v36[4];
      v39 = v36[6];
      v57 = v36[5];
      v58 = v36[3];
      v40 = v36[8];
      v41 = v36[10];
      v55 = v36[9];
      v56 = v36[7];
      v42 = v36[12];
      v53 = *v36;
      v54 = v36[11];
      if ((v50 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_23A8904F0();
      sub_23A8901B4();
      v14 = sub_23A890508();
      v15 = -1 << *(_BYTE *)(v13 + 32);
      v16 = v14 & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v10 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v10 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        v19 = v39;
        result = v42;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v15) >> 6;
        v19 = v39;
        result = v42;
        do
        {
          if (++v17 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v30 = v17 == v29;
          if (v17 == v29)
            v17 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v10 + 8 * v17);
        }
        while (v31 == -1);
        v18 = __clz(__rbit64(~v31)) + (v17 << 6);
      }
      *(_QWORD *)(v10 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v20 = (_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v18);
      *v20 = v35;
      v20[1] = v34;
      v21 = *(_QWORD *)(v13 + 56) + 104 * v18;
      *(_QWORD *)v21 = v53;
      *(_QWORD *)(v21 + 8) = v37;
      *(_BYTE *)(v21 + 16) = v59;
      *(_QWORD *)(v21 + 24) = v58;
      *(_QWORD *)(v21 + 32) = v38;
      *(_QWORD *)(v21 + 40) = v57;
      *(_QWORD *)(v21 + 48) = v19;
      *(_QWORD *)(v21 + 56) = v56;
      *(_QWORD *)(v21 + 64) = v40;
      *(_QWORD *)(v21 + 72) = v55;
      *(_QWORD *)(v21 + 80) = v41;
      *(_QWORD *)(v21 + 88) = v54;
      *(_QWORD *)(v21 + 96) = result;
      ++*(_QWORD *)(v13 + 16);
      v4 = v48;
      v9 = v51;
      v12 = v52;
    }
  }
  result = swift_release();
  v43 = v45;
LABEL_41:
  *v43 = v6;
  return result;
}

uint64_t sub_23A87FFC0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58A8);
  v38 = a2;
  v6 = sub_23A890454();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_23A8904F0();
    sub_23A8901B4();
    result = sub_23A890508();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23A8802CC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  int64_t v48;
  _QWORD *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  int64_t v53;
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

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5898);
  v51 = a2;
  v57 = sub_23A890454();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v6 = 1 << *(_BYTE *)(v5 + 32);
  v49 = (_QWORD *)(v5 + 64);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v5 + 64);
  v47 = v2;
  v48 = (unint64_t)(v6 + 63) >> 6;
  v9 = v57 + 64;
  result = swift_retain();
  v11 = 0;
  v50 = v5;
  while (1)
  {
    if (v8)
    {
      v52 = (v8 - 1) & v8;
      v53 = v11;
      v24 = __clz(__rbit64(v8)) | (v11 << 6);
      goto LABEL_31;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v25 >= v48)
      break;
    v26 = v49;
    v27 = v49[v25];
    v28 = v11 + 1;
    if (!v27)
    {
      v28 = v11 + 2;
      if (v11 + 2 >= v48)
        goto LABEL_33;
      v27 = v49[v28];
      if (!v27)
      {
        v29 = v11 + 3;
        if (v11 + 3 >= v48)
        {
LABEL_33:
          swift_release();
          v3 = v47;
          if ((v51 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v27 = v49[v29];
        if (!v27)
        {
          while (1)
          {
            v28 = v29 + 1;
            if (__OFADD__(v29, 1))
              goto LABEL_42;
            if (v28 >= v48)
              goto LABEL_33;
            v27 = v49[v28];
            ++v29;
            if (v27)
              goto LABEL_30;
          }
        }
        v28 = v11 + 3;
      }
    }
LABEL_30:
    v52 = (v27 - 1) & v27;
    v53 = v28;
    v24 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_31:
    v34 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v24);
    v36 = *v34;
    v35 = v34[1];
    v37 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 120 * v24);
    v38 = v37[1];
    v54 = *v37;
    v39 = v37[2];
    v40 = v37[3];
    v42 = v37[4];
    v41 = v37[5];
    v44 = v37[6];
    v43 = v37[7];
    v45 = v37[8];
    v63 = v37[9];
    v61 = v37[11];
    v62 = v37[10];
    v59 = v37[13];
    v60 = v37[12];
    v58 = v37[14];
    if ((v51 & 1) == 0)
    {
      v56 = v37[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A874558(v39, v40);
      v38 = v56;
    }
    v55 = v40;
    v12 = v39;
    v13 = v38;
    sub_23A8904F0();
    sub_23A8901B4();
    v14 = sub_23A890508();
    v15 = -1 << *(_BYTE *)(v57 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v9 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v9 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      v19 = v55;
      v20 = v44;
      result = v43;
      v21 = v45;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v15) >> 6;
      v19 = v55;
      v20 = v44;
      result = v43;
      v21 = v45;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v32 = v17 == v31;
        if (v17 == v31)
          v17 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v9 + 8 * v17);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(_QWORD *)(v9 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v22 = (_QWORD *)(*(_QWORD *)(v57 + 48) + 16 * v18);
    *v22 = v36;
    v22[1] = v35;
    v23 = (_QWORD *)(*(_QWORD *)(v57 + 56) + 120 * v18);
    *v23 = v54;
    v23[1] = v13;
    v23[2] = v12;
    v23[3] = v19;
    v23[4] = v42;
    v23[5] = v41;
    v23[6] = v20;
    v23[7] = result;
    v23[8] = v21;
    v23[9] = v63;
    v23[10] = v62;
    v23[11] = v61;
    v23[12] = v60;
    v23[13] = v59;
    v23[14] = v58;
    ++*(_QWORD *)(v57 + 16);
    v5 = v50;
    v8 = v52;
    v11 = v53;
  }
  swift_release();
  v3 = v47;
  v26 = v49;
  if ((v51 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v46 = 1 << *(_BYTE *)(v5 + 32);
  if (v46 >= 64)
    bzero(v26, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v46;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v57;
  return result;
}

unint64_t sub_23A8806FC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A8903C4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A8904F0();
        swift_bridgeObjectRetain();
        sub_23A8901B4();
        v9 = sub_23A890508();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23A8808D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23A87F770(a2, a3);
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
    sub_23A8810B0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_23A88149C(a1, v18[7] + 104 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = v18[7] + 104 * v12;
    v24 = *(_OWORD *)a1;
    v25 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v23 + 16) = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v23 + 32) = v25;
    *(_OWORD *)v23 = v24;
    v26 = *(_OWORD *)(a1 + 48);
    v27 = *(_OWORD *)(a1 + 64);
    v28 = *(_OWORD *)(a1 + 80);
    *(_QWORD *)(v23 + 96) = *(_QWORD *)(a1 + 96);
    *(_OWORD *)(v23 + 64) = v27;
    *(_OWORD *)(v23 + 80) = v28;
    *(_OWORD *)(v23 + 48) = v26;
    v29 = v18[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v18[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A87FBC8(v15, a4 & 1);
  v20 = sub_23A87F770(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_23A88149C(a1, v18[7] + 104 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A8904A8();
  __break(1u);
  return result;
}

uint64_t sub_23A880A54(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23A87F770(a2, a3);
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
    sub_23A880EFC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
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
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A87F8B4(v15, a4 & 1);
  v21 = sub_23A87F770(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A8904A8();
  __break(1u);
  return result;
}

void sub_23A880BB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23A87F770(a2, a3);
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
    sub_23A8812EC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_23A87FFC0(v15, a4 & 1);
  v20 = sub_23A87F770(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23A8904A8();
  __break(1u);
}

uint64_t sub_23A880D0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23A87F770(a2, a3);
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
    sub_23A8814D8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_23A881750(a1, v18[7] + 120 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = v18[7] + 120 * v12;
    v24 = *(_OWORD *)a1;
    v25 = *(_OWORD *)(a1 + 16);
    v26 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v23 + 32) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v23 + 48) = v26;
    *(_OWORD *)v23 = v24;
    *(_OWORD *)(v23 + 16) = v25;
    v27 = *(_OWORD *)(a1 + 64);
    v28 = *(_OWORD *)(a1 + 80);
    v29 = *(_OWORD *)(a1 + 96);
    *(_QWORD *)(v23 + 112) = *(_QWORD *)(a1 + 112);
    *(_OWORD *)(v23 + 80) = v28;
    *(_OWORD *)(v23 + 96) = v29;
    *(_OWORD *)(v23 + 64) = v27;
    v30 = v18[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (!v31)
    {
      v18[2] = v32;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A8802CC(v15, a4 & 1);
  v20 = sub_23A87F770(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_23A881750(a1, v18[7] + 120 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A8904A8();
  __break(1u);
  return result;
}

unint64_t sub_23A880E90(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  v6 = a5[7] + 104 * result;
  v7 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)v6 = *(_OWORD *)a4;
  *(_OWORD *)(v6 + 16) = v7;
  *(_QWORD *)(v6 + 96) = *(_QWORD *)(a4 + 96);
  v8 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v6 + 80) = v8;
  v9 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v6 + 48) = v9;
  v10 = a5[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a5[2] = v12;
  return result;
}

void *sub_23A880EFC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58D8);
  v2 = *v0;
  v3 = sub_23A890448();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_23A8810B0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58A0);
  v37 = v0;
  v1 = *v0;
  v2 = sub_23A890448();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v37 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v39 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v38 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    v34 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v34 >= v38)
      goto LABEL_26;
    v35 = *(_QWORD *)(v39 + 8 * v34);
    ++v7;
    if (!v35)
    {
      v7 = v34 + 1;
      if (v34 + 1 >= v38)
        goto LABEL_26;
      v35 = *(_QWORD *)(v39 + 8 * v7);
      if (!v35)
        break;
    }
LABEL_25:
    v10 = (v35 - 1) & v35;
    v12 = __clz(__rbit64(v35)) + (v7 << 6);
LABEL_12:
    v13 = 16 * v12;
    v14 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v12);
    v15 = *v14;
    v16 = v14[1];
    v17 = 104 * v12;
    v18 = *(_QWORD *)(v1 + 56) + v17;
    v19 = *(_QWORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v21 = *(_BYTE *)(v18 + 16);
    v22 = *(_QWORD *)(v18 + 24);
    v23 = *(_QWORD *)(v18 + 32);
    v24 = *(_QWORD *)(v18 + 40);
    v25 = *(_QWORD *)(v18 + 48);
    v26 = *(_QWORD *)(v18 + 56);
    v27 = *(_QWORD *)(v18 + 64);
    v28 = *(_QWORD *)(v18 + 72);
    v29 = *(_QWORD *)(v18 + 80);
    v31 = *(_QWORD *)(v18 + 88);
    v30 = *(_QWORD *)(v18 + 96);
    v32 = (_QWORD *)(*(_QWORD *)(v3 + 48) + v13);
    *v32 = v15;
    v32[1] = v16;
    v33 = *(_QWORD *)(v3 + 56) + v17;
    *(_QWORD *)v33 = v19;
    *(_QWORD *)(v33 + 8) = v20;
    *(_BYTE *)(v33 + 16) = v21;
    *(_QWORD *)(v33 + 24) = v22;
    *(_QWORD *)(v33 + 32) = v23;
    *(_QWORD *)(v33 + 40) = v24;
    *(_QWORD *)(v33 + 48) = v25;
    *(_QWORD *)(v33 + 56) = v26;
    *(_QWORD *)(v33 + 64) = v27;
    *(_QWORD *)(v33 + 72) = v28;
    *(_QWORD *)(v33 + 80) = v29;
    *(_QWORD *)(v33 + 88) = v31;
    *(_QWORD *)(v33 + 96) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v36 = v34 + 2;
  if (v36 >= v38)
    goto LABEL_26;
  v35 = *(_QWORD *)(v39 + 8 * v36);
  if (v35)
  {
    v7 = v36;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v36 + 1;
    if (__OFADD__(v36, 1))
      break;
    if (v7 >= v38)
      goto LABEL_26;
    v35 = *(_QWORD *)(v39 + 8 * v7);
    ++v36;
    if (v35)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_23A8812EC()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58A8);
  v2 = *v0;
  v3 = sub_23A890448();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

uint64_t sub_23A88149C(uint64_t a1, uint64_t a2)
{
  assignWithTake for BinaryImage(a2, a1);
  return a2;
}

void *sub_23A8814D8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  BOOL v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
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
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  void *__src;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5898);
  v39 = v0;
  v1 = *v0;
  v2 = sub_23A890448();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    v38 = v3;
    result = (void *)swift_release();
    *v39 = v38;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  __src = (void *)(v1 + 64);
  v6 = v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5;
  v43 = v3;
  if (v6)
  {
    result = memmove(result, __src, 8 * v5);
    v3 = v43;
  }
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v41 = (unint64_t)(v8 + 63) >> 6;
  v42 = v1;
  while (1)
  {
    if (v10)
    {
      v44 = (v10 - 1) & v10;
      v45 = v7;
      v11 = __clz(__rbit64(v10)) | (v7 << 6);
      v12 = v42;
      v3 = v43;
      goto LABEL_12;
    }
    v34 = v7 + 1;
    v12 = v42;
    v3 = v43;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v34 >= v41)
      goto LABEL_26;
    v35 = *((_QWORD *)__src + v34);
    v36 = v7 + 1;
    if (!v35)
    {
      v36 = v7 + 2;
      if (v7 + 2 >= v41)
        goto LABEL_26;
      v35 = *((_QWORD *)__src + v36);
      if (!v35)
        break;
    }
LABEL_25:
    v44 = (v35 - 1) & v35;
    v45 = v36;
    v11 = __clz(__rbit64(v35)) + (v36 << 6);
LABEL_12:
    v13 = 16 * v11;
    v14 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v11);
    v16 = *v14;
    v15 = v14[1];
    v17 = 120 * v11;
    v18 = (uint64_t *)(*(_QWORD *)(v12 + 56) + v17);
    v19 = *v18;
    v20 = v18[1];
    v21 = v18[3];
    v22 = v18[4];
    v23 = v18[5];
    v25 = v18[6];
    v24 = v18[7];
    v47 = v18[2];
    v26 = v18[9];
    v46 = v18[8];
    v28 = v18[10];
    v27 = v18[11];
    v29 = v18[12];
    v30 = v18[13];
    v31 = v18[14];
    v32 = (_QWORD *)(*(_QWORD *)(v3 + 48) + v13);
    *v32 = v16;
    v32[1] = v15;
    v33 = (_QWORD *)(*(_QWORD *)(v3 + 56) + v17);
    *v33 = v19;
    v33[1] = v20;
    v33[2] = v47;
    v33[3] = v21;
    v33[4] = v22;
    v33[5] = v23;
    v33[6] = v25;
    v33[7] = v24;
    v33[8] = v46;
    v33[9] = v26;
    v33[10] = v28;
    v33[11] = v27;
    v33[12] = v29;
    v33[13] = v30;
    v33[14] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)sub_23A874558(v47, v21);
    v10 = v44;
    v7 = v45;
  }
  v37 = v7 + 3;
  if (v7 + 3 >= v41)
    goto LABEL_26;
  v35 = *((_QWORD *)__src + v37);
  if (v35)
  {
    v36 = v7 + 3;
    goto LABEL_25;
  }
  while (1)
  {
    v36 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v36 >= v41)
      goto LABEL_26;
    v35 = *((_QWORD *)__src + v36);
    ++v37;
    if (v35)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A881750(uint64_t a1, uint64_t a2)
{
  assignWithTake for LoadCommand(a2, a1);
  return a2;
}

uint64_t sub_23A88178C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8817B8()
{
  return swift_bridgeObjectRetain();
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

uint64_t sub_23A8817D8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_23A8819D8()
{
  qword_2569C6BD8 = (uint64_t)&unk_250BAF578;
}

void sub_23A8819EC()
{
  qword_2569C6BE0 = (uint64_t)&unk_250BAF5C8;
}

uint64_t destroy for LoadCommand(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LoadCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v5)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    v6 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v6;
    v7 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v7;
    v8 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v8;
    v9 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = v9;
    v10 = *(_QWORD *)(a2 + 104);
    v11 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v10;
    *(_QWORD *)(a1 + 112) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    v13 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v13;
    v14 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v14;
  }
  return a1;
}

uint64_t assignWithCopy for LoadCommand(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 16);
  v5 = (_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23A881D70(a1 + 16);
      v8 = *(_OWORD *)(a2 + 32);
      v7 = *(_OWORD *)(a2 + 48);
      *v4 = *v5;
      *(_OWORD *)(a1 + 32) = v8;
      *(_OWORD *)(a1 + 48) = v7;
      v10 = *(_OWORD *)(a2 + 80);
      v9 = *(_OWORD *)(a2 + 96);
      v11 = *(_OWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 80) = v10;
      *(_OWORD *)(a1 + 96) = v9;
      *(_OWORD *)(a1 + 64) = v11;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = *v5;
    v13 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v13;
    *v4 = v12;
    v14 = *(_OWORD *)(a2 + 64);
    v15 = *(_OWORD *)(a2 + 80);
    v16 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 80) = v15;
    *(_OWORD *)(a1 + 96) = v16;
    *(_OWORD *)(a1 + 64) = v14;
  }
  return a1;
}

uint64_t sub_23A881D70(uint64_t a1)
{
  destroy for BinaryImage();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for LoadCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 24);
  if (!v5)
  {
    sub_23A881D70(a1 + 16);
LABEL_5:
    v11 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v11;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    v12 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v12;
    v13 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v13;
    return a1;
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadCommand(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadCommand(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadCommand()
{
  return &type metadata for LoadCommand;
}

BOOL sub_23A881F68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A881F7C()
{
  sub_23A8904F0();
  sub_23A8904FC();
  return sub_23A890508();
}

uint64_t sub_23A881FC0()
{
  return sub_23A8904FC();
}

uint64_t sub_23A881FE8()
{
  sub_23A8904F0();
  sub_23A8904FC();
  return sub_23A890508();
}

uint64_t sub_23A882028()
{
  if ((sub_23A89022C() & 1) != 0 || (sub_23A89022C() & 1) != 0)
    return 0;
  if ((sub_23A89022C() & 1) != 0)
    return 1;
  if ((sub_23A89022C() & 1) != 0)
    return 2;
  if ((sub_23A89022C() & 1) != 0)
    return 3;
  if ((sub_23A89022C() & 1) != 0)
    return 4;
  return 5;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CoreAnalyticsLocation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CoreAnalyticsLocation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23A882258 + 4 * byte_23A8910A5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A88228C + 4 * asc_23A8910A0[v4]))();
}

uint64_t sub_23A88228C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A882294(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A88229CLL);
  return result;
}

uint64_t sub_23A8822A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A8822B0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A8822B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8822BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8822C8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A8822D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsLocation()
{
  return &type metadata for CoreAnalyticsLocation;
}

unint64_t sub_23A8822EC()
{
  unint64_t result;

  result = qword_2569C5EB0;
  if (!qword_2569C5EB0)
  {
    result = MEMORY[0x23B859B78](&unk_23A891128, &type metadata for CoreAnalyticsLocation);
    atomic_store(result, (unint64_t *)&qword_2569C5EB0);
  }
  return result;
}

uint64_t sub_23A882330(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  void *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v72;
  _QWORD v73[2];
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  __int128 v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  _OWORD v111[27];
  uint64_t v112;
  uint64_t v113[9];

  v90 = a6;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TargetType(0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (_QWORD *)((char *)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23A883BBC(a1, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_23A883C00((uint64_t)v17);
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v18 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v113[0]) = 0;
    sub_23A883BBC(a1, (uint64_t)v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    LOBYTE(v112) = 11;
    v111[0] = 0u;
    v19 = 0xD00000000000004BLL;
    v20 = "MachOAnalysisPerformer: AnalyzableTarget type does not match expected value";
LABEL_5:
    sub_23A8879F4((unsigned __int8 *)v113, (uint64_t)v13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (unsigned __int8 *)&v112, v19, (unint64_t)(v20 - 32) | 0x8000000000000000, (uint64_t *)v111);
    return sub_23A8742E4((uint64_t)v13);
  }
  LODWORD(v109) = a4;
  v89 = a5;
  v22 = *v17;
  v21 = v17[1];
  if ((a2() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v23 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v113[0]) = 0;
    sub_23A883BBC(a1, (uint64_t)v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    LOBYTE(v112) = 4;
    v111[0] = 0u;
    v19 = 0xD000000000000034;
    v20 = "MachOAnalysisPerformer: Interrupted, returning early";
    goto LABEL_5;
  }
  type metadata accessor for MachOParser();
  v25 = (_QWORD *)swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v26 = MEMORY[0x24BEE4AF8];
  v25[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
  v25[7] = v26;
  v25[2] = v22;
  v25[3] = v21;
  v25[4] = a2;
  v25[5] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  v27 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v111[2] = sub_23A879BA4;
  *((_QWORD *)&v111[2] + 1) = v25;
  *(_QWORD *)&v111[0] = MEMORY[0x24BDAC760];
  *((_QWORD *)&v111[0] + 1) = 1107296256;
  *(_QWORD *)&v111[1] = sub_23A87A648;
  *((_QWORD *)&v111[1] + 1) = &block_descriptor_4;
  v28 = _Block_copy(v111);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v27, v28);
  _Block_release(v28);
  swift_release();

  v29 = sub_23A87CD70();
  v112 = v29;
  if ((v109 & 1) != 0)
  {
    v30 = v29;
    sub_23A8902C8();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v31 = (void *)sub_23A89034C();
    sub_23A890064();

    v32 = sub_23A87D014();
    if (v32)
    {
      if (v30)
        sub_23A87CEBC(v32);
      else
        swift_bridgeObjectRelease();
    }
  }
  sub_23A8750C0(v22, v21, v113);
  if (v112)
    v33 = v112;
  else
    v33 = v26;
  v34 = *(_QWORD *)(v33 + 16);
  if (v34)
  {
    v73[1] = v25;
    v35 = v113[2];
    v36 = v113[3];
    v37 = v113[4];
    v38 = v113[5];
    v40 = v113[6];
    v39 = v113[7];
    v41 = sub_23A874644(0, &qword_2569C5EB8);
    if (v36)
      v42 = v35;
    else
      v42 = 0x6E776F6E6B6E75;
    v84 = v42;
    v85 = v41;
    v43 = 0xE700000000000000;
    v87 = v38;
    v88 = v36;
    if (v36)
      v44 = v36;
    else
      v44 = 0xE700000000000000;
    if (v38)
      v45 = v37;
    else
      v45 = 0x6E776F6E6B6E75;
    v82 = v45;
    v83 = v44;
    if (v38)
      v46 = v38;
    else
      v46 = 0xE700000000000000;
    if (v39)
      v47 = v40;
    else
      v47 = 0x6E776F6E6B6E75;
    v80 = v47;
    v81 = v46;
    v86 = v39;
    if (v39)
      v43 = v39;
    v79 = v43;
    swift_bridgeObjectRetain();
    v48 = v34 - 1;
    v49 = 32;
    v78 = xmmword_23A891150;
    v76 = 0x800000023A892F10;
    v77 = 0x800000023A892EF0;
    v74 = v33;
    v75 = 0x800000023A892D80;
    while (1)
    {
      memcpy(v111, (const void *)(v33 + v49), sizeof(v111));
      v109 = v48;
      v91 = v49;
      if (*((_QWORD *)&v111[16] + 1))
      {
        v50 = *((_QWORD *)&v111[17] + 1);
        if (*((_QWORD *)&v111[17] + 1))
        {
          v100 = *(_QWORD *)&v111[17];
          v51 = *(_QWORD *)&v111[19];
          v92 = *(_OWORD *)((char *)&v111[20] + 8);
          v52 = *(_QWORD *)&v111[20];
          v97 = *((_QWORD *)&v111[18] + 1);
          v98 = *((_QWORD *)&v111[21] + 1);
          v53 = *(_QWORD *)&v111[22];
          v93 = LOBYTE(v111[18]);
          v94 = *((_QWORD *)&v111[19] + 1);
          swift_bridgeObjectRetain();
          v96 = v51;
          swift_bridgeObjectRetain();
          v95 = v52;
          swift_bridgeObjectRetain();
          v101 = v50;
          swift_bridgeObjectRetain();
          v99 = v53;
          swift_bridgeObjectRetain();
        }
        else
        {
          v96 = *((_QWORD *)&v111[16] + 1);
          v97 = *(_QWORD *)&v111[16];
          swift_bridgeObjectRetain();
          v98 = 0x6E776F6E6B6E75;
          v99 = 0xE700000000000000;
          v93 = 5;
          v100 = 0x6E776F6E6B6E75;
          v101 = 0xE700000000000000;
          v94 = 0x6E776F6E6B6E75;
          v95 = 0xE700000000000000;
          *(_QWORD *)&v92 = 0x6E776F6E6B6E75;
          *((_QWORD *)&v92 + 1) = 0xE700000000000000;
        }
      }
      else
      {
        v54 = *(_QWORD *)&v111[10];
        v100 = *((_QWORD *)&v111[9] + 1);
        v93 = BYTE8(v111[10]);
        v55 = *((_QWORD *)&v111[11] + 1);
        v56 = *((_QWORD *)&v111[12] + 1);
        v94 = *(_QWORD *)&v111[12];
        v97 = *(_QWORD *)&v111[11];
        v57 = *((_QWORD *)&v111[14] + 1);
        v98 = *(_QWORD *)&v111[14];
        v92 = v111[13];
        swift_bridgeObjectRetain();
        v96 = v55;
        swift_bridgeObjectRetain();
        v95 = v56;
        swift_bridgeObjectRetain();
        v101 = v54;
        swift_bridgeObjectRetain();
        v99 = v57;
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5EC0);
      v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = v78;
      *(_QWORD *)(v58 + 32) = 0x6C646E7542707061;
      *(_QWORD *)(v58 + 40) = 0xEB00000000444965;
      sub_23A883C54(v111);
      swift_bridgeObjectRetain();
      v59 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 48) = v59;
      *(_QWORD *)(v58 + 56) = 0xD000000000000010;
      *(_QWORD *)(v58 + 64) = v77;
      swift_bridgeObjectRetain();
      v60 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 72) = v60;
      *(_QWORD *)(v58 + 80) = 0x656D614E707061;
      *(_QWORD *)(v58 + 88) = 0xE700000000000000;
      v107 = *((_QWORD *)&v111[3] + 1);
      v108 = *(_QWORD *)&v111[3];
      v102 = *(_QWORD *)&v111[5];
      v103 = *(_QWORD *)&v111[6];
      v106 = *((_QWORD *)&v111[7] + 1);
      v104 = *((_QWORD *)&v111[5] + 1);
      v105 = *(_QWORD *)&v111[8];
      swift_bridgeObjectRetain();
      v61 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 96) = v61;
      *(_QWORD *)(v58 + 104) = 1751347809;
      *(_QWORD *)(v58 + 112) = 0xE400000000000000;
      *(_QWORD *)(v58 + 120) = sub_23A890148();
      strcpy((char *)(v58 + 128), "binaryCDHash");
      *(_BYTE *)(v58 + 141) = 0;
      *(_WORD *)(v58 + 142) = -5120;
      *(_QWORD *)(v58 + 144) = sub_23A890148();
      strcpy((char *)(v58 + 152), "binaryLocation");
      *(_BYTE *)(v58 + 167) = -18;
      v62 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 168) = v62;
      *(_QWORD *)(v58 + 176) = 0x61507972616E6962;
      *(_QWORD *)(v58 + 184) = 0xEA00000000006874;
      *(_QWORD *)(v58 + 192) = sub_23A890148();
      strcpy((char *)(v58 + 200), "binaryTeamID");
      *(_BYTE *)(v58 + 213) = 0;
      *(_WORD *)(v58 + 214) = -5120;
      *(_QWORD *)(v58 + 216) = sub_23A890148();
      *(_QWORD *)(v58 + 224) = 0x55557972616E6962;
      *(_QWORD *)(v58 + 232) = 0xEA00000000004449;
      *(_QWORD *)(v58 + 240) = sub_23A890148();
      strcpy((char *)(v58 + 248), "binaryVersion");
      *(_WORD *)(v58 + 262) = -4864;
      *(_QWORD *)(v58 + 264) = sub_23A890148();
      *(_QWORD *)(v58 + 272) = 0x48444362696C7964;
      *(_QWORD *)(v58 + 280) = 0xEB00000000687361;
      v63 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 288) = v63;
      strcpy((char *)(v58 + 296), "dylibLocation");
      *(_WORD *)(v58 + 310) = -4864;
      v64 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 312) = v64;
      *(_QWORD *)(v58 + 320) = 0x74615062696C7964;
      *(_QWORD *)(v58 + 328) = 0xE900000000000068;
      v65 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 336) = v65;
      *(_QWORD *)(v58 + 344) = 0x61655462696C7964;
      *(_QWORD *)(v58 + 352) = 0xEB0000000044496DLL;
      v66 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 360) = v66;
      *(_QWORD *)(v58 + 368) = 0x49555562696C7964;
      *(_QWORD *)(v58 + 376) = 0xE900000000000044;
      v67 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 384) = v67;
      strcpy((char *)(v58 + 392), "dylibVersion");
      *(_BYTE *)(v58 + 405) = 0;
      *(_WORD *)(v58 + 406) = -5120;
      v68 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v58 + 408) = v68;
      *(_QWORD *)(v58 + 416) = 0x656372756F73;
      *(_QWORD *)(v58 + 424) = 0xE600000000000000;
      *(_QWORD *)(v58 + 432) = sub_23A890148();
      *(_QWORD *)(v58 + 440) = 0x614E6C6F626D7973;
      *(_QWORD *)(v58 + 448) = 0xEA0000000000656DLL;
      *(_QWORD *)(v58 + 456) = sub_23A890148();
      strcpy((char *)(v58 + 464), "symbolOffset");
      *(_BYTE *)(v58 + 477) = 0;
      *(_WORD *)(v58 + 478) = -5120;
      *(_QWORD *)(v58 + 480) = sub_23A890148();
      *(_QWORD *)(v58 + 488) = 0x794472656C6C6163;
      *(_QWORD *)(v58 + 496) = 0xEF6874615062696CLL;
      *(_QWORD *)(v58 + 504) = sub_23A890148();
      *(_QWORD *)(v58 + 512) = 0xD000000000000010;
      *(_QWORD *)(v58 + 520) = v75;
      *(_QWORD *)(v58 + 528) = sub_23A890148();
      v69 = sub_23A873024(v58);
      v70 = sub_23A890310();
      sub_23A883EB8(v111);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v110 = v69;
      sub_23A880BB0(v70, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
      v72 = v110;
      swift_bridgeObjectRelease();
      sub_23A8892D8(v72);
      swift_bridgeObjectRelease();
      if (!v109)
        break;
      v48 = v109 - 1;
      v49 = v91 + 432;
      v33 = v74;
    }
    swift_bridgeObjectRelease();
    sub_23A884070((uint64_t)v113);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_23A884070((uint64_t)v113);
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23A882F80(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
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
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v71;
  _QWORD v72[2];
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  __int128 v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  _OWORD v109[27];
  uint64_t v110;
  uint64_t v111[9];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TargetType(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (_QWORD *)((char *)v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23A883BBC(a1, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_23A883C00((uint64_t)v16);
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v17 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v111[0]) = 0;
    sub_23A883BBC(a1, (uint64_t)v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    LOBYTE(v110) = 11;
    v109[0] = 0u;
    v18 = 0xD00000000000004BLL;
    v19 = "MachOAnalysisPerformer: AnalyzableTarget type does not match expected value";
LABEL_5:
    sub_23A8879F4((unsigned __int8 *)v111, (uint64_t)v12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (unsigned __int8 *)&v110, v18, (unint64_t)(v19 - 32) | 0x8000000000000000, (uint64_t *)v109);
    return sub_23A8742E4((uint64_t)v12);
  }
  v88 = a5;
  v21 = *v16;
  v20 = v16[1];
  if ((a2() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v22 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v111[0]) = 0;
    sub_23A883BBC(a1, (uint64_t)v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    LOBYTE(v110) = 4;
    v109[0] = 0u;
    v18 = 0xD000000000000034;
    v19 = "MachOAnalysisPerformer: Interrupted, returning early";
    goto LABEL_5;
  }
  type metadata accessor for MachOParser();
  v24 = (_QWORD *)swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v25 = MEMORY[0x24BEE4AF8];
  v24[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
  v24[7] = v25;
  v24[2] = v21;
  v24[3] = v20;
  v24[4] = a2;
  v24[5] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  v26 = (void *)sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v109[2] = sub_23A879BA4;
  *((_QWORD *)&v109[2] + 1) = v24;
  *(_QWORD *)&v109[0] = MEMORY[0x24BDAC760];
  *((_QWORD *)&v109[0] + 1) = 1107296256;
  *(_QWORD *)&v109[1] = sub_23A87A648;
  *((_QWORD *)&v109[1] + 1) = &block_descriptor_3;
  v27 = _Block_copy(v109);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v26, v27);
  _Block_release(v27);
  swift_release();

  v28 = sub_23A87CD70();
  v110 = v28;
  if ((a4 & 1) != 0)
  {
    v29 = v28;
    sub_23A8902C8();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v30 = (void *)sub_23A89034C();
    sub_23A890064();

    v31 = sub_23A87D014();
    if (v31)
    {
      if (v29)
        sub_23A87CEBC(v31);
      else
        swift_bridgeObjectRelease();
    }
  }
  sub_23A8750C0(v21, v20, v111);
  if (v110)
    v32 = v110;
  else
    v32 = v25;
  v33 = *(_QWORD *)(v32 + 16);
  if (v33)
  {
    v72[1] = v24;
    v34 = v111[2];
    v35 = v111[3];
    v36 = v111[4];
    v37 = v111[5];
    v39 = v111[6];
    v38 = v111[7];
    v40 = sub_23A874644(0, &qword_2569C5EB8);
    if (v35)
      v41 = v34;
    else
      v41 = 0x6E776F6E6B6E75;
    v83 = v41;
    v84 = v40;
    v42 = 0xE700000000000000;
    v86 = v37;
    v87 = v35;
    if (v35)
      v43 = v35;
    else
      v43 = 0xE700000000000000;
    if (v37)
      v44 = v36;
    else
      v44 = 0x6E776F6E6B6E75;
    v81 = v44;
    v82 = v43;
    if (v37)
      v45 = v37;
    else
      v45 = 0xE700000000000000;
    if (v38)
      v46 = v39;
    else
      v46 = 0x6E776F6E6B6E75;
    v79 = v46;
    v80 = v45;
    v85 = v38;
    if (v38)
      v42 = v38;
    v78 = v42;
    swift_bridgeObjectRetain();
    v47 = v33 - 1;
    v48 = 32;
    v77 = xmmword_23A891150;
    v75 = 0x800000023A892F10;
    v76 = 0x800000023A892EF0;
    v73 = v32;
    v74 = 0x800000023A892D80;
    while (1)
    {
      memcpy(v109, (const void *)(v32 + v48), sizeof(v109));
      v107 = v47;
      v89 = v48;
      if (*((_QWORD *)&v109[16] + 1))
      {
        v49 = *((_QWORD *)&v109[17] + 1);
        if (*((_QWORD *)&v109[17] + 1))
        {
          v98 = *(_QWORD *)&v109[17];
          v50 = *(_QWORD *)&v109[19];
          v90 = *(_OWORD *)((char *)&v109[20] + 8);
          v51 = *(_QWORD *)&v109[20];
          v95 = *((_QWORD *)&v109[18] + 1);
          v96 = *((_QWORD *)&v109[21] + 1);
          v52 = *(_QWORD *)&v109[22];
          v91 = LOBYTE(v109[18]);
          v92 = *((_QWORD *)&v109[19] + 1);
          swift_bridgeObjectRetain();
          v94 = v50;
          swift_bridgeObjectRetain();
          v93 = v51;
          swift_bridgeObjectRetain();
          v99 = v49;
          swift_bridgeObjectRetain();
          v97 = v52;
          swift_bridgeObjectRetain();
        }
        else
        {
          v94 = *((_QWORD *)&v109[16] + 1);
          v95 = *(_QWORD *)&v109[16];
          swift_bridgeObjectRetain();
          v96 = 0x6E776F6E6B6E75;
          v97 = 0xE700000000000000;
          v91 = 5;
          v98 = 0x6E776F6E6B6E75;
          v99 = 0xE700000000000000;
          v92 = 0x6E776F6E6B6E75;
          v93 = 0xE700000000000000;
          *(_QWORD *)&v90 = 0x6E776F6E6B6E75;
          *((_QWORD *)&v90 + 1) = 0xE700000000000000;
        }
      }
      else
      {
        v53 = *(_QWORD *)&v109[10];
        v98 = *((_QWORD *)&v109[9] + 1);
        v91 = BYTE8(v109[10]);
        v54 = *((_QWORD *)&v109[11] + 1);
        v55 = *((_QWORD *)&v109[12] + 1);
        v92 = *(_QWORD *)&v109[12];
        v95 = *(_QWORD *)&v109[11];
        v56 = *((_QWORD *)&v109[14] + 1);
        v96 = *(_QWORD *)&v109[14];
        v90 = v109[13];
        swift_bridgeObjectRetain();
        v94 = v54;
        swift_bridgeObjectRetain();
        v93 = v55;
        swift_bridgeObjectRetain();
        v99 = v53;
        swift_bridgeObjectRetain();
        v97 = v56;
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5EC0);
      v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = v77;
      *(_QWORD *)(v57 + 32) = 0x6C646E7542707061;
      *(_QWORD *)(v57 + 40) = 0xEB00000000444965;
      sub_23A883C54(v109);
      swift_bridgeObjectRetain();
      v58 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 48) = v58;
      *(_QWORD *)(v57 + 56) = 0xD000000000000010;
      *(_QWORD *)(v57 + 64) = v76;
      swift_bridgeObjectRetain();
      v59 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 72) = v59;
      *(_QWORD *)(v57 + 80) = 0x656D614E707061;
      *(_QWORD *)(v57 + 88) = 0xE700000000000000;
      v105 = *((_QWORD *)&v109[3] + 1);
      v106 = *(_QWORD *)&v109[3];
      v100 = *(_QWORD *)&v109[5];
      v101 = *(_QWORD *)&v109[6];
      v104 = *((_QWORD *)&v109[7] + 1);
      v102 = *((_QWORD *)&v109[5] + 1);
      v103 = *(_QWORD *)&v109[8];
      swift_bridgeObjectRetain();
      v60 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 96) = v60;
      *(_QWORD *)(v57 + 104) = 1751347809;
      *(_QWORD *)(v57 + 112) = 0xE400000000000000;
      *(_QWORD *)(v57 + 120) = sub_23A890148();
      strcpy((char *)(v57 + 128), "binaryCDHash");
      *(_BYTE *)(v57 + 141) = 0;
      *(_WORD *)(v57 + 142) = -5120;
      *(_QWORD *)(v57 + 144) = sub_23A890148();
      strcpy((char *)(v57 + 152), "binaryLocation");
      *(_BYTE *)(v57 + 167) = -18;
      v61 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 168) = v61;
      *(_QWORD *)(v57 + 176) = 0x61507972616E6962;
      *(_QWORD *)(v57 + 184) = 0xEA00000000006874;
      *(_QWORD *)(v57 + 192) = sub_23A890148();
      strcpy((char *)(v57 + 200), "binaryTeamID");
      *(_BYTE *)(v57 + 213) = 0;
      *(_WORD *)(v57 + 214) = -5120;
      *(_QWORD *)(v57 + 216) = sub_23A890148();
      *(_QWORD *)(v57 + 224) = 0x55557972616E6962;
      *(_QWORD *)(v57 + 232) = 0xEA00000000004449;
      *(_QWORD *)(v57 + 240) = sub_23A890148();
      strcpy((char *)(v57 + 248), "binaryVersion");
      *(_WORD *)(v57 + 262) = -4864;
      *(_QWORD *)(v57 + 264) = sub_23A890148();
      *(_QWORD *)(v57 + 272) = 0x48444362696C7964;
      *(_QWORD *)(v57 + 280) = 0xEB00000000687361;
      v62 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 288) = v62;
      strcpy((char *)(v57 + 296), "dylibLocation");
      *(_WORD *)(v57 + 310) = -4864;
      v63 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 312) = v63;
      *(_QWORD *)(v57 + 320) = 0x74615062696C7964;
      *(_QWORD *)(v57 + 328) = 0xE900000000000068;
      v64 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 336) = v64;
      *(_QWORD *)(v57 + 344) = 0x61655462696C7964;
      *(_QWORD *)(v57 + 352) = 0xEB0000000044496DLL;
      v65 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 360) = v65;
      *(_QWORD *)(v57 + 368) = 0x49555562696C7964;
      *(_QWORD *)(v57 + 376) = 0xE900000000000044;
      v66 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 384) = v66;
      strcpy((char *)(v57 + 392), "dylibVersion");
      *(_BYTE *)(v57 + 405) = 0;
      *(_WORD *)(v57 + 406) = -5120;
      v67 = sub_23A890148();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v57 + 408) = v67;
      *(_QWORD *)(v57 + 416) = 0x656372756F73;
      *(_QWORD *)(v57 + 424) = 0xE600000000000000;
      *(_QWORD *)(v57 + 432) = sub_23A890148();
      *(_QWORD *)(v57 + 440) = 0x614E6C6F626D7973;
      *(_QWORD *)(v57 + 448) = 0xEA0000000000656DLL;
      *(_QWORD *)(v57 + 456) = sub_23A890148();
      strcpy((char *)(v57 + 464), "symbolOffset");
      *(_BYTE *)(v57 + 477) = 0;
      *(_WORD *)(v57 + 478) = -5120;
      *(_QWORD *)(v57 + 480) = sub_23A890148();
      *(_QWORD *)(v57 + 488) = 0x794472656C6C6163;
      *(_QWORD *)(v57 + 496) = 0xEF6874615062696CLL;
      *(_QWORD *)(v57 + 504) = sub_23A890148();
      *(_QWORD *)(v57 + 512) = 0xD000000000000010;
      *(_QWORD *)(v57 + 520) = v74;
      *(_QWORD *)(v57 + 528) = sub_23A890148();
      v68 = sub_23A873024(v57);
      v69 = sub_23A890310();
      sub_23A883EB8(v109);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v108 = v68;
      sub_23A880BB0(v69, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
      v71 = v108;
      swift_bridgeObjectRelease();
      sub_23A88A99C(v71);
      swift_bridgeObjectRelease();
      if (!v107)
        break;
      v47 = v107 - 1;
      v48 = v89 + 432;
      v32 = v73;
    }
    swift_bridgeObjectRelease();
    sub_23A884070((uint64_t)v111);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_23A884070((uint64_t)v111);
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23A883BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TargetType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A883C00(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TargetType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

_QWORD *sub_23A883C54(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1[33];
  v6 = a1[32];
  v3 = a1[35];
  v4 = a1[34];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A883E08(v6, v5, v4, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A883E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return sub_23A874558(a3, a4);
  }
  return result;
}

_QWORD *sub_23A883EB8(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1[33];
  v6 = a1[32];
  v3 = a1[35];
  v4 = a1[34];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A87A0F4(v6, v5, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A884070(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void sub_23A8840DC()
{
  qword_2569C6BE8 = -1;
}

uint64_t sub_23A8840EC()
{
  uint64_t v0;
  uint64_t result;

  if (*(_BYTE *)(v0 + 104) != 1)
    return *(_QWORD *)(v0 + 96);
  result = 0;
  *(_QWORD *)(v0 + 96) = 0;
  *(_BYTE *)(v0 + 104) = 0;
  return result;
}

uint64_t sub_23A884110()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0xD000000000000052;
  *(_QWORD *)(v0 + 24) = 0x800000023A893580;
  *(_QWORD *)(v0 + 32) = 0x6F6E67695F707061;
  *(_QWORD *)(v0 + 40) = 0xEF7473696C5F6572;
  *(_QWORD *)(v0 + 48) = 0xD000000000000012;
  *(_QWORD *)(v0 + 56) = 0x800000023A8935E0;
  *(_QWORD *)(v0 + 64) = 0xD00000000000001ELL;
  *(_QWORD *)(v0 + 72) = 0x800000023A893600;
  *(_QWORD *)(v0 + 80) = 0xD000000000000012;
  *(_QWORD *)(v0 + 88) = 0x800000023A893620;
  *(_QWORD *)(v0 + 96) = 0;
  *(_BYTE *)(v0 + 104) = 1;
  sub_23A8841D8();
  return v0;
}

uint64_t sub_23A8841D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  const char *v4;
  uint64_t result;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  sqlite3 *v11;
  sqlite3 *v12;
  const char **v13;
  int v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  sqlite3 *ppDb[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (const char *)(sub_23A8901A8() + 32);
  ppDb[0] = (sqlite3 *)sub_23A8840EC();
  LODWORD(v4) = sqlite3_open_v2(v4, ppDb, 4194305, 0);
  *(sqlite3 **)(v0 + 96) = ppDb[0];
  *(_BYTE *)(v0 + 104) = 0;
  result = swift_release();
  if ((_DWORD)v4)
  {
    v6 = sqlite3_extended_errcode(*(sqlite3 **)(v0 + 96));
    v7 = sub_23A885708(0xD000000000000029);
    v9 = v8;
    sqlite3_close(*(sqlite3 **)(v0 + 96));
    v16 = 3;
    v10 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v3, 1, 1, v10);
    v15 = 12;
    ppDb[0] = 0;
    ppDb[1] = (sqlite3 *)0xE000000000000000;
    sub_23A8903DC();
    swift_bridgeObjectRelease();
    ppDb[0] = (sqlite3 *)0xD000000000000029;
    ppDb[1] = (sqlite3 *)0x800000023A8934F0;
    v14 = v6;
    sub_23A890490();
    sub_23A8901C0();
    swift_bridgeObjectRelease();
    v11 = ppDb[0];
    v12 = ppDb[1];
    *(_OWORD *)ppDb = 0u;
    sub_23A8879F4(&v16, (uint64_t)v3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v15, (unint64_t)v11, (uint64_t)v12, (uint64_t *)ppDb);
    swift_bridgeObjectRelease();
    sub_23A87EAA8((uint64_t)v3, &qword_2569C5BA0);
    sub_23A886C84();
    swift_allocError();
    *v13 = v7;
    v13[1] = v9;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A884428()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  sqlite3 *v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  __int128 v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char **v11;
  _DWORD v12[2];
  __int128 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (sqlite3 *)sub_23A8840EC();
  result = sqlite3_close(v3);
  if ((_DWORD)result)
  {
    v5 = result;
    v15 = 3;
    v6 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v2, 1, 1, v6);
    v14 = 12;
    *(_QWORD *)&v13 = 0;
    *((_QWORD *)&v13 + 1) = 0xE000000000000000;
    sub_23A8903DC();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v13 = 0xD00000000000002ALL;
    *((_QWORD *)&v13 + 1) = 0x800000023A893460;
    v12[1] = v5;
    sub_23A890490();
    sub_23A8901C0();
    swift_bridgeObjectRelease();
    v7 = v13;
    v13 = 0u;
    sub_23A8879F4(&v15, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v14, v7, *((uint64_t *)&v7 + 1), (uint64_t *)&v13);
    swift_bridgeObjectRelease();
    sub_23A87EAA8((uint64_t)v2, &qword_2569C5BA0);
    v8 = sub_23A885708(0xD00000000000002ALL);
    v10 = v9;
    sub_23A886C84();
    swift_allocError();
    *v11 = v8;
    v11[1] = v10;
    return swift_willThrow();
  }
  return result;
}

void sub_23A884604(int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v18 = a1;
  v24 = *MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v5);
  v17[3] = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A890100();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B38];
  v22 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_23A8900F4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v23 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v21 = (char *)v17 - v13;
  swift_bridgeObjectRetain();
  v17[2] = a2;
  v17[4] = a3;
  sub_23A885204(a2, a3);
  v15 = v14;
  sub_23A886A88(&qword_2569C6000, v8, MEMORY[0x24BDC6B30]);
  sub_23A8900E8();
  v16 = (char *)&loc_23A884784 + dword_23A8851F4[v15 >> 62];
  v19 = v9;
  v20 = v10;
  __asm { BR              X10 }
}

uint64_t sub_23A884798()
{
  char *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  sqlite3_stmt *v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  os_log_type_t v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  sqlite3 *v28;
  uint64_t v29;
  int v30;
  id v31;
  char *v32;
  sqlite3_stmt *v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;

  *(_QWORD *)(v8 - 216) = v5;
  *(_QWORD *)(v8 - 104) = v1;
  *(_WORD *)(v8 - 96) = v7;
  *(_BYTE *)(v8 - 94) = BYTE2(v7);
  *(_BYTE *)(v8 - 93) = BYTE3(v7);
  *(_BYTE *)(v8 - 92) = BYTE4(v7);
  *(_BYTE *)(v8 - 91) = BYTE5(v7);
  sub_23A8900D0();
  sub_23A879AE4(v1, v7);
  v9 = *(_QWORD *)(v8 - 152);
  sub_23A8900DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 144) + 8))(v0, v3);
  sub_23A879AE4(v1, v7);
  (*(void (**)(_QWORD, uint64_t, unint64_t))(v6 + 16))(*(_QWORD *)(v8 - 128), v9, v2);
  sub_23A886A88(&qword_2569C6008, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6348], MEMORY[0x24BDC6358]);
  sub_23A890250();
  v10 = *(sqlite3_stmt **)(v8 - 104);
  v11 = *(_QWORD *)(v8 - 96);
  v12 = *((_QWORD *)v10 + 2);
  if (v11 != v12)
  {
    if (v11 < v12)
    {
      *(_QWORD *)(v8 - 128) = (char *)v10 + 32;
      v0 = (char *)MEMORY[0x24BEE4AF8];
      *(_OWORD *)(v8 - 144) = xmmword_23A890C00;
      v2 = v11;
      while ((v11 & 0x8000000000000000) == 0)
      {
        if (v2 >= *((_QWORD *)v10 + 2))
          goto LABEL_27;
        v21 = *(_BYTE *)(*(_QWORD *)(v8 - 128) + v2);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
        v22 = swift_allocObject();
        *(_OWORD *)(v22 + 16) = *(_OWORD *)(v8 - 144);
        *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE4260];
        *(_QWORD *)(v22 + 64) = MEMORY[0x24BEE42B0];
        *(_BYTE *)(v22 + 32) = v21;
        v23 = sub_23A890178();
        v4 = v24;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v0 = (char *)sub_23A885A54(0, *((_QWORD *)v0 + 2) + 1, 1, v0);
        v26 = *((_QWORD *)v0 + 2);
        v25 = *((_QWORD *)v0 + 3);
        if (v26 >= v25 >> 1)
          v0 = (char *)sub_23A885A54((_QWORD *)(v25 > 1), v26 + 1, 1, v0);
        ++v2;
        *((_QWORD *)v0 + 2) = v26 + 1;
        v27 = &v0[16 * v26];
        *((_QWORD *)v27 + 4) = v23;
        *((_QWORD *)v27 + 5) = v4;
        if (v12 == v2)
          goto LABEL_3;
      }
      __break(1u);
LABEL_27:
      __break(1u);
    }
    __break(1u);
LABEL_29:
    swift_once();
    goto LABEL_20;
  }
  v0 = (char *)MEMORY[0x24BEE4AF8];
LABEL_3:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 - 104) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA8);
  sub_23A886AC8();
  v13 = sub_23A890130();
  v15 = v14;
  swift_bridgeObjectRelease();
  v16 = sub_23A8902B0();
  sub_23A875650();
  v17 = *(_QWORD *)(v8 - 192);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v18 = sub_23A89034C();
  if (os_log_type_enabled(v18, v16))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    *(_QWORD *)(v8 - 104) = v20;
    *(_DWORD *)v19 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v8 - 112) = sub_23A885F20(*(_QWORD *)(v8 - 208), v17, (uint64_t *)(v8 - 104));
    sub_23A890358();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v8 - 112) = sub_23A885F20(v13, v15, (uint64_t *)(v8 - 104));
    sub_23A890358();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A86F000, v18, v16, "Hash for %s = %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B859C14](v20, -1, -1);
    MEMORY[0x23B859C14](v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  v4 = *(_QWORD *)(v8 - 160);
  v2 = 0xD000000000000015;
  *(_QWORD *)(v8 - 104) = 0;
  *(_QWORD *)(v8 - 96) = 0xE000000000000000;
  sub_23A8903DC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 - 104) = 0xD000000000000015;
  *(_QWORD *)(v8 - 96) = 0x800000023A893120;
  swift_bridgeObjectRetain();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  swift_bridgeObjectRetain();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  *(_QWORD *)(v8 - 112) = 0;
  v28 = (sqlite3 *)sub_23A8840EC();
  v29 = sub_23A8901A8();
  swift_bridgeObjectRelease();
  v30 = sqlite3_prepare_v2(v28, (const char *)(v29 + 32), -1, (sqlite3_stmt **)(v8 - 112), 0);
  swift_release();
  v10 = *(sqlite3_stmt **)(v8 - 112);
  if (!v10 || v30)
  {
    swift_bridgeObjectRelease();
    *(_BYTE *)(v8 - 113) = 3;
    v36 = type metadata accessor for TargetType(0);
    v37 = *(_QWORD *)(v8 - 200);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v37, 1, 1, v36);
    *(_BYTE *)(v8 - 114) = 12;
    *(_QWORD *)(v8 - 104) = 0;
    *(_QWORD *)(v8 - 96) = 0xE000000000000000;
    sub_23A8903DC();
    v38 = *(_QWORD *)(v8 - 96);
    *(_QWORD *)(v8 - 104) = *(_QWORD *)(v8 - 104);
    *(_QWORD *)(v8 - 96) = v38;
    sub_23A8901C0();
    *(_DWORD *)(v8 - 120) = v30;
    sub_23A890490();
    sub_23A8901C0();
    swift_bridgeObjectRelease();
    v39 = *(_QWORD *)(v8 - 104);
    v40 = *(_QWORD *)(v8 - 96);
    *(_OWORD *)(v8 - 104) = 0u;
    sub_23A8879F4((unsigned __int8 *)(v8 - 113), v37, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (unsigned __int8 *)(v8 - 114), v39, v40, (uint64_t *)(v8 - 104));
    swift_bridgeObjectRelease();
    sub_23A87EAA8(v37, &qword_2569C5BA0);
    v35 = sub_23A885708(0xD00000000000003DLL);
    v42 = v41;
    sub_23A886C84();
    swift_allocError();
    *v43 = v35;
    v43[1] = v42;
    swift_willThrow();
LABEL_24:
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v8 - 152), *(_QWORD *)(v8 - 168));
    return v35 & 1;
  }
  v31 = objc_retainAutorelease((id)sub_23A890148());
  v32 = (char *)objc_msgSend(v31, sel_UTF8String);
  if (!v32)
  {
    __break(1u);
    JUMPOUT(0x23A8851E0);
  }
  v0 = v32;
  swift_bridgeObjectRelease();

  if (qword_2569C5700 != -1)
    goto LABEL_29;
LABEL_20:
  sqlite3_bind_text(v10, 1, v0, -1, (void (__cdecl *)(void *))qword_2569C6BE8);
  v33 = *(sqlite3_stmt **)(v8 - 112);
  v34 = sqlite3_step(v33);
  if (v34 != 100)
  {
    v44 = v34;
    *(_BYTE *)(v8 - 113) = 3;
    v45 = type metadata accessor for TargetType(0);
    v46 = *(_QWORD *)(v8 - 200);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v46, 1, 1, v45);
    *(_BYTE *)(v8 - 114) = 12;
    *(_QWORD *)(v8 - 104) = 0;
    *(_QWORD *)(v8 - 96) = 0xE000000000000000;
    sub_23A8903DC();
    v47 = *(_QWORD *)(v8 - 96);
    *(_QWORD *)(v8 - 104) = *(_QWORD *)(v8 - 104);
    *(_QWORD *)(v8 - 96) = v47;
    sub_23A8901C0();
    *(_DWORD *)(v8 - 120) = v44;
    sub_23A890490();
    sub_23A8901C0();
    swift_bridgeObjectRelease();
    v48 = *(_QWORD *)(v8 - 104);
    v49 = *(_QWORD *)(v8 - 96);
    *(_OWORD *)(v8 - 104) = 0u;
    sub_23A8879F4((unsigned __int8 *)(v8 - 113), v46, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (unsigned __int8 *)(v8 - 114), v48, v49, (uint64_t *)(v8 - 104));
    swift_bridgeObjectRelease();
    sub_23A87EAA8(v46, &qword_2569C5BA0);
    v35 = sub_23A885708(v2 + 29);
    v51 = v50;
    sub_23A886C84();
    swift_allocError();
    *v52 = v35;
    v52[1] = v51;
    swift_willThrow();
    sqlite3_finalize(*(sqlite3_stmt **)(v8 - 112));
    goto LABEL_24;
  }
  LOBYTE(v35) = sqlite3_column_int(v33, 0) > 0;
  sqlite3_finalize(v33);
  (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v8 - 152), *(_QWORD *)(v8 - 168));
  return v35 & 1;
}

uint64_t sub_23A885204(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6020);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_23A87EAA8((uint64_t)v14, &qword_2569C6028);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_23A890400();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_23A887060(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_23A8901F0();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_23A8870C4(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_23A88650C();
    __asm { BR              X12 }
  }
  sub_23A8871D0(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_23A88FF14();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

const char *sub_23A885708(uint64_t a1)
{
  sqlite3 *v1;
  const char *result;

  swift_bridgeObjectRetain();
  sub_23A8901C0();
  sub_23A890490();
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  sub_23A8901C0();
  v1 = (sqlite3 *)sub_23A8840EC();
  result = sqlite3_errmsg(v1);
  if (result)
  {
    sub_23A8901CC();
    sub_23A8901C0();
    swift_bridgeObjectRelease();
    return (const char *)a1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A8857C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IgnoreListDataStore()
{
  return objc_opt_self();
}

uint64_t sub_23A885828(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23A885838(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_QWORD *sub_23A88586C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6018);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A8858D0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_23A890220();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B859350](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

char *sub_23A885948(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6038);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_23A886B9C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23A885A54(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58C0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A886CC8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23A885B60(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6030);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 432);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[54 * v8 + 4])
          memmove(v12, a4 + 4, 432 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23A886E78(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A885C88(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6040);
  v10 = *(_QWORD *)(sub_23A88FFBC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23A890430();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_23A88FFBC() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A887248(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23A885E90(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23A885EB0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23A885F20(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23A890358();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23A885F20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A885FF0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A875084((uint64_t)v12, *a3);
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
      sub_23A875084((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_23A885FF0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A890364();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A8861A8(a5, a6);
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
  v8 = sub_23A890400();
  if (!v8)
  {
    sub_23A890430();
    __break(1u);
LABEL_17:
    result = sub_23A89046C();
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

uint64_t sub_23A8861A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A88623C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A8863B0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A8863B0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A88623C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A88586C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A8903E8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A890430();
      __break(1u);
LABEL_10:
      v2 = sub_23A8901F0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A89046C();
    __break(1u);
LABEL_14:
    result = sub_23A890430();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_23A8863B0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6018);
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
  result = sub_23A89046C();
  __break(1u);
  return result;
}

_BYTE **sub_23A8864FC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_23A88650C()
{
  __asm { BR              X11 }
}

_QWORD *sub_23A88656C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_23A8867FC@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_23A886DB8(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_23A886F68((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_23A886FE0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_23A886870(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_23A8868D4(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_23A88FED8();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_23A88FEFC();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_23A88FEF0();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_23A886980(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_23A88FED8();
  if (!result || (result = sub_23A88FEFC(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23A88FEF0();
      sub_23A890100();
      sub_23A886A88(&qword_2569C6000, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B38], MEMORY[0x24BDC6B30]);
      return sub_23A8900D0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A886A44(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A886A88(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B859B78](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A886AC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C5BB0;
  if (!qword_2569C5BB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569C5BA8);
    result = MEMORY[0x23B859B78](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2569C5BB0);
  }
  return result;
}

uint64_t sub_23A886B14@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_23A8903E8();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_23A886B9C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23A89046C();
  __break(1u);
  return result;
}

unint64_t sub_23A886C84()
{
  unint64_t result;

  result = qword_2569C6010;
  if (!qword_2569C6010)
  {
    result = MEMORY[0x23B859B78](&unk_23A89120C, &type metadata for IgnoreListDataStoreError);
    atomic_store(result, (unint64_t *)&qword_2569C6010);
  }
  return result;
}

uint64_t sub_23A886CC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A89046C();
  __break(1u);
  return result;
}

uint64_t sub_23A886DB8(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_23A886E78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 432 * a1 + 32;
    v6 = a3 + 432 * v4;
    if (v5 >= v6 || v5 + 432 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A89046C();
  __break(1u);
  return result;
}

uint64_t sub_23A886F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23A88FF08();
  swift_allocObject();
  result = sub_23A88FECC();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23A88FFD4();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_23A886FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23A88FF08();
  swift_allocObject();
  result = sub_23A88FECC();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_23A887060(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_23A886DB8(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_23A886F68((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_23A886FE0((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_23A8870C4(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_23A88FF08();
      swift_allocObject();
      sub_23A88FEE4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_23A88FFD4();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *sub_23A887160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_23A886870((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_23A88722C, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_23A8871BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A879AE4(a1, a2);
  return a1;
}

uint64_t sub_23A8871D0(__int128 *a1, uint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23A88722C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A886B14(a1, a2);
}

uint64_t sub_23A887248(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_23A88FFBC() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_23A89046C();
  __break(1u);
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for IgnoreListDataStoreError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for IgnoreListDataStoreError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for IgnoreListDataStoreError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for IgnoreListDataStoreError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IgnoreListDataStoreError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IgnoreListDataStoreError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IgnoreListDataStoreError()
{
  return &type metadata for IgnoreListDataStoreError;
}

uint64_t static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unsigned __int8 *a13, unint64_t a14, uint64_t a15, uint64_t *a16)
{
  return sub_23A8879F4(a1, a2, a3, a4 & 1, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_23A8874CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = AnalysisFailureType.rawValue.getter();
  v2 = v1;
  if (v0 == AnalysisFailureType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23A89049C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

EcosystemAnalytics::AnalysisTypeForCA_optional __swiftcall AnalysisTypeForCA.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (EcosystemAnalytics::AnalysisTypeForCA_optional)rawValue;
}

uint64_t AnalysisTypeForCA.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

EcosystemAnalytics::AnalysisTypeForCA_optional sub_23A88757C(Swift::Int *a1)
{
  return AnalysisTypeForCA.init(rawValue:)(*a1);
}

void sub_23A887584(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

EcosystemAnalytics::AnalysisFailureType_optional __swiftcall AnalysisFailureType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  EcosystemAnalytics::AnalysisFailureType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23A890484();
  result.value = swift_bridgeObjectRelease();
  v5 = 14;
  if (v3 < 0xE)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AnalysisFailureType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A887620 + 4 * byte_23A891250[*v0]))(0xD000000000000011, 0x800000023A891780);
}

uint64_t sub_23A887620()
{
  return 0x45786F62646E6173;
}

uint64_t sub_23A887640@<X0>(uint64_t a1@<X8>)
{
  return a1 - 1;
}

uint64_t sub_23A887720()
{
  return 0x72456574696C7173;
}

uint64_t sub_23A887740()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_23A887758()
{
  return sub_23A8874CC();
}

uint64_t sub_23A887764()
{
  sub_23A8904F0();
  AnalysisFailureType.rawValue.getter();
  sub_23A8901B4();
  swift_bridgeObjectRelease();
  return sub_23A890508();
}

uint64_t sub_23A8877C8()
{
  AnalysisFailureType.rawValue.getter();
  sub_23A8901B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A887818()
{
  sub_23A8904F0();
  AnalysisFailureType.rawValue.getter();
  sub_23A8901B4();
  swift_bridgeObjectRelease();
  return sub_23A890508();
}

EcosystemAnalytics::AnalysisFailureType_optional sub_23A887878(Swift::String *a1)
{
  return AnalysisFailureType.init(rawValue:)(*a1);
}

uint64_t sub_23A887884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AnalysisFailureType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AnalysisFailureState.xpcState.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnalysisFailureState.xpcState.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AnalysisFailureState.xpcState.modify())()
{
  return nullsub_1;
}

EcosystemAnalytics::AnalysisFailureState __swiftcall AnalysisFailureState.init(xpcState:)(EcosystemAnalytics::AnalysisFailureState xpcState)
{
  EcosystemAnalytics::AnalysisFailureState *v1;

  *v1 = xpcState;
  return xpcState;
}

uint64_t AnalysisFailureState.init(xpcActivity:)@<X0>(_xpc_activity_s *a1@<X0>, uint64_t *a2@<X8>)
{
  xpc_object_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v3 = xpc_activity_copy_criteria(a1);
  if (v3)
  {
    xpc_dictionary_get_uint64(v3, (const char *)*MEMORY[0x24BDAC5B8]);
    sub_23A890490();
    sub_23A8901C0();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    result = swift_bridgeObjectRelease();
    v6 = 0x3D79616C6564;
    v5 = 0xE600000000000000;
  }
  else
  {
    result = swift_unknownObjectRelease();
    v5 = 0xE700000000000000;
    v6 = 0x6E776F6E6B6E75;
  }
  *a2 = v6;
  a2[1] = v5;
  return result;
}

uint64_t sub_23A8879F4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unsigned __int8 *a13, unint64_t a14, uint64_t a15, uint64_t *a16)
{
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t inited;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v64;
  int v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85[41];

  v77 = a5;
  v78 = a8;
  v73 = a7;
  v74 = a6;
  LODWORD(v75) = a4;
  v80 = a3;
  v72 = a2;
  v76 = a12;
  v70 = a11;
  v69 = a9;
  v71 = a15;
  v67 = a14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for TargetType(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = (uint64_t)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v64 - v23;
  LODWORD(v25) = *a1;
  v26 = *a13;
  v27 = *a16;
  v28 = a16[1];
  if ((_DWORD)v25 == 3)
    v25 = 2;
  else
    v25 = v25;
  v82 = v25;
  sub_23A888510(v72, (uint64_t)v18);
  v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19);
  v83 = v24;
  v79 = v19;
  if (v29 == 1)
  {
    swift_storeEnumTagMultiPayload();
    sub_23A8742E4((uint64_t)v18);
  }
  else
  {
    sub_23A888594((uint64_t)v18, (uint64_t)v24);
  }
  v30 = v80;
  if ((v75 & 1) != 0)
    v30 = 0;
  v80 = v30;
  v31 = v77;
  if (!v74)
    v31 = 0x206E776F6E6B6E75;
  v77 = v31;
  v32 = 0xEC00000068746170;
  if (v74)
    v32 = v74;
  v75 = v32;
  if (v78)
    v33 = v73;
  else
    v33 = 0x206E776F6E6B6E75;
  v34 = 0xEC000000656D616ELL;
  if (v78)
    v34 = v78;
  v72 = v34;
  v73 = v33;
  v35 = v69;
  if (!a10)
    v35 = 0xD000000000000011;
  v68 = v35;
  v36 = 0x800000023A893640;
  if (a10)
    v36 = a10;
  v66 = v36;
  v37 = 0xD000000000000016;
  if (v76)
    v37 = v70;
  v70 = v37;
  v38 = 0x800000023A893660;
  if (v76)
    v38 = v76;
  v69 = v38;
  if (v26 == 14)
    v39 = 13;
  else
    v39 = v26;
  v65 = v39;
  v40 = 0xD00000000000001BLL;
  if (v71)
    v40 = v67;
  v67 = v40;
  v41 = 0x6E776F6E6B6E75;
  if (v28)
    v41 = v27;
  v64 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A891480;
  *(_QWORD *)(inited + 32) = 0x74536E6F6D656164;
  *(_QWORD *)(inited + 40) = 0xEB00000000657461;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v43 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v43;
  *(_QWORD *)(inited + 56) = 0xD000000000000012;
  *(_QWORD *)(inited + 64) = 0x800000023A8936A0;
  v44 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 72) = v44;
  *(_QWORD *)(inited + 80) = 0x546572756C696166;
  *(_QWORD *)(inited + 88) = 0xEB00000000657079;
  LOBYTE(v85[0]) = v65;
  AnalysisFailureType.rawValue.getter();
  v45 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 96) = v45;
  strcpy((char *)(inited + 104), "targetBundleID");
  *(_BYTE *)(inited + 119) = -18;
  v46 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 120) = v46;
  *(_QWORD *)(inited + 128) = 0xD000000000000013;
  *(_QWORD *)(inited + 136) = 0x800000023A8936C0;
  v47 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 144) = v47;
  *(_QWORD *)(inited + 152) = 0x614E746567726174;
  *(_QWORD *)(inited + 160) = 0xEA0000000000656DLL;
  v48 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 168) = v48;
  *(_QWORD *)(inited + 176) = 0x6150746567726174;
  *(_QWORD *)(inited + 184) = 0xEA00000000006874;
  sub_23A88FC78(v77);
  swift_bridgeObjectRelease();
  v49 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 192) = v49;
  *(_QWORD *)(inited + 200) = 0x7954746567726174;
  *(_QWORD *)(inited + 208) = 0xEA00000000006570;
  v50 = (uint64_t)v83;
  sub_23A883BBC((uint64_t)v83, v81);
  sub_23A89019C();
  v51 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 216) = v51;
  *(_QWORD *)(inited + 224) = 1701869940;
  *(_QWORD *)(inited + 232) = 0xE400000000000000;
  *(_QWORD *)(inited + 240) = sub_23A89028C();
  strcpy((char *)(inited + 248), "failureRetries");
  *(_BYTE *)(inited + 263) = -18;
  *(_QWORD *)(inited + 264) = sub_23A89028C();
  v52 = sub_23A873024(inited);
  LOBYTE(v51) = sub_23A8902BC();
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  swift_bridgeObjectRetain_n();
  v53 = sub_23A89034C();
  v54 = v51;
  if (os_log_type_enabled(v53, (os_log_type_t)v51))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v85[0] = v56;
    *(_DWORD *)v55 = 136315138;
    sub_23A874644(0, &qword_2569C6058);
    swift_bridgeObjectRetain();
    v57 = sub_23A890124();
    v59 = v58;
    swift_bridgeObjectRelease();
    v84 = sub_23A885F20(v57, v59, v85);
    v50 = (uint64_t)v83;
    sub_23A890358();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A86F000, v53, v54, "Sending failure analysis event: %s)", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B859C14](v56, -1, -1);
    MEMORY[0x23B859C14](v55, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v60 = (void *)sub_23A890148();
  v61 = swift_allocObject();
  *(_QWORD *)(v61 + 16) = v52;
  v85[4] = (uint64_t)sub_23A8745EC;
  v85[5] = v61;
  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 1107296256;
  v85[2] = (uint64_t)sub_23A888918;
  v85[3] = (uint64_t)&block_descriptor_4;
  v62 = _Block_copy(v85);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v62);

  return sub_23A883C00(v50);
}

unint64_t sub_23A8881AC()
{
  unint64_t result;

  result = qword_2569C6048;
  if (!qword_2569C6048)
  {
    result = MEMORY[0x23B859B78](&protocol conformance descriptor for AnalysisTypeForCA, &type metadata for AnalysisTypeForCA);
    atomic_store(result, (unint64_t *)&qword_2569C6048);
  }
  return result;
}

unint64_t sub_23A8881F4()
{
  unint64_t result;

  result = qword_2569C6050;
  if (!qword_2569C6050)
  {
    result = MEMORY[0x23B859B78](&protocol conformance descriptor for AnalysisFailureType, &type metadata for AnalysisFailureType);
    atomic_store(result, (unint64_t *)&qword_2569C6050);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AnalysisTypeForCA(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AnalysisTypeForCA(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A888314 + 4 * byte_23A891263[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A888348 + 4 * byte_23A89125E[v4]))();
}

uint64_t sub_23A888348(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A888350(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A888358);
  return result;
}

uint64_t sub_23A888364(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A88836CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A888370(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A888378(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AnalysisTypeForCA()
{
  return &type metadata for AnalysisTypeForCA;
}

uint64_t getEnumTagSinglePayload for AnalysisFailureType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalysisFailureType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_23A888470 + 4 * byte_23A89126D[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_23A8884A4 + 4 * byte_23A891268[v4]))();
}

uint64_t sub_23A8884A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8884AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A8884B4);
  return result;
}

uint64_t sub_23A8884C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A8884C8);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_23A8884CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8884D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AnalysisFailureType()
{
  return &type metadata for AnalysisFailureType;
}

ValueMetadata *type metadata accessor for AnalysisFailureState()
{
  return &type metadata for AnalysisFailureState;
}

ValueMetadata *type metadata accessor for AnalysisFailure()
{
  return &type metadata for AnalysisFailure;
}

uint64_t sub_23A888510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A888558()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t sub_23A888594(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TargetType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for BinaryImage()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BinaryImage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BinaryImage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
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
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for BinaryImage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryImage(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BinaryImage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BinaryImage()
{
  return &type metadata for BinaryImage;
}

id sub_23A888918(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_23A874644(0, &qword_2569C6058);
    v4 = (void *)sub_23A89010C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t MachOAnalysisCoordinator.__allocating_init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_WORD *)(result + 32) = 1;
  *(_BYTE *)(result + 34) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t MachOAnalysisCoordinator.init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_WORD *)(v2 + 32) = 1;
  *(_BYTE *)(v2 + 34) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t MachOAnalysisCoordinator.__allocating_init(interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_BYTE *)(result + 32) = a3;
  *(_BYTE *)(result + 33) = a4;
  *(_BYTE *)(result + 34) = a5;
  return result;
}

uint64_t MachOAnalysisCoordinator.init(interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_BYTE *)(v5 + 32) = a3;
  *(_BYTE *)(v5 + 33) = a4;
  *(_BYTE *)(v5 + 34) = a5;
  return v5;
}

uint64_t sub_23A888A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t inited;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  _QWORD *v40;
  void *v41;
  uint64_t v42;
  uint64_t (*v43)(void);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v48;
  char v49;
  char *v50;
  char v51;
  void (*v52)(char *, uint64_t);
  char v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  __int128 v66;
  uint64_t *v67;
  char *v68;
  char *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  __int128 v80;

  v4 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x24BDAC7A8](v4);
  v70 = (uint64_t *)((char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v6);
  v67 = (uint64_t *)((char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6060);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A88FF50();
  v75 = *(_QWORD *)(v11 - 8);
  v76 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v68 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v64 - v14;
  v15 = sub_23A88FFBC();
  v73 = *(_QWORD *)(v15 - 8);
  v74 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v77 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23A890190();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902C8();
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v21 = swift_allocObject();
  v66 = xmmword_23A890C00;
  *(_OWORD *)(v21 + 16) = xmmword_23A890C00;
  *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
  v65 = sub_23A8742A0();
  *(_QWORD *)(v21 + 64) = v65;
  *(_QWORD *)(v21 + 32) = a1;
  *(_QWORD *)(v21 + 40) = a2;
  v22 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  swift_bridgeObjectRetain();
  v72 = v22;
  v23 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  v24 = a1;
  sub_23A88FC78(a1);
  *(_QWORD *)&v80 = 0xD000000000000020;
  *((_QWORD *)&v80 + 1) = 0x800000023A893770;
  sub_23A8901C0();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v80 = sub_23A890244();
  *((_QWORD *)&v80 + 1) = v25;
  sub_23A890184();
  sub_23A8724FC();
  v26 = sub_23A890394();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  swift_bridgeObjectRelease();
  if (v26)
  {
    nm_CRSetCrashLogMessage(v26 + 32);
    swift_bridgeObjectRelease();
  }
  v27 = v77;
  sub_23A88FF80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6068);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A890C10;
  v29 = (void *)*MEMORY[0x24BDBCDD8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCDD8];
  v30 = (void *)*MEMORY[0x24BDBCDE0];
  *(_QWORD *)(inited + 40) = *MEMORY[0x24BDBCDE0];
  v31 = v29;
  v32 = v30;
  sub_23A88B9F4(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_23A88FF74();
  swift_bridgeObjectRelease();
  v33 = v75;
  v34 = v76;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v10, 0, 1, v76);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v10, 1, v34) != 1)
  {
    v48 = v69;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v69, v10, v34);
    v49 = sub_23A88FF2C();
    if (v49 == 2)
    {
      v50 = v68;
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v68, v48, v34);
    }
    else
    {
      v51 = v49;
      v50 = v68;
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v68, v48, v34);
      if ((v51 & 1) == 0)
      {
        v35 = v27;
        v52 = *(void (**)(char *, uint64_t))(v33 + 8);
        v52(v50, v34);
        goto LABEL_13;
      }
    }
    v35 = v27;
    v53 = sub_23A88FF44();
    v52 = *(void (**)(char *, uint64_t))(v33 + 8);
    v52(v50, v34);
    if (v53 == 2 || (v53 & 1) != 0)
    {
      v52(v48, v34);
      goto LABEL_5;
    }
LABEL_13:
    v54 = MEMORY[0x24BEE0D00];
    sub_23A8902BC();
    v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = v66;
    v56 = v65;
    *(_QWORD *)(v55 + 56) = v54;
    *(_QWORD *)(v55 + 64) = v56;
    *(_QWORD *)(v55 + 32) = v24;
    *(_QWORD *)(v55 + 40) = a2;
    swift_bridgeObjectRetain();
    v57 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    v79 = 0;
    v58 = sub_23A88FC78(v24);
    v59 = (uint64_t)v67;
    *v67 = v58;
    *(_QWORD *)(v59 + 8) = v60;
    v61 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v59, 0, 1, v61);
    v62 = sub_23A88FC78(v24);
    v78 = 6;
    v80 = 0u;
    sub_23A8879F4(&v79, v59, 0, 0, v62, v63, 0, 0, 0, 0, 0, 0, &v78, 0, 0, (uint64_t *)&v80);
    swift_bridgeObjectRelease();
    sub_23A87EAA8(v59, &qword_2569C5BA0);
    v52(v48, v34);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v35, v74);
    return 0;
  }
  v35 = v27;
  sub_23A87EAA8((uint64_t)v10, &qword_2569C6060);
LABEL_5:
  v36 = v73;
  v37 = (uint64_t)v70;
  *v70 = v24;
  *(_QWORD *)(v37 + 8) = a2;
  type metadata accessor for TargetType(0);
  swift_storeEnumTagMultiPayload();
  v38 = v71;
  v39 = *(unsigned __int8 *)(v71 + 33);
  type metadata accessor for AnalyticsRandomizer();
  v40 = (_QWORD *)swift_initStackObject();
  swift_bridgeObjectRetain();
  v40[2] = sub_23A872F0C(MEMORY[0x24BEE4AF8]);
  v40[5] = -1;
  sub_23A8902C8();
  v41 = (void *)sub_23A89034C();
  sub_23A890064();

  v40[3] = 0xD00000000000002CLL;
  v40[4] = 0x800000023A8937A0;
  v40[5] = 500;
  v42 = swift_allocObject();
  swift_weakInit();
  v43 = *(uint64_t (**)(void))(v38 + 16);
  v44 = *(_QWORD *)(v38 + 24);
  swift_retain();
  swift_retain();
  sub_23A882330(v37, v43, v44, v39, v42, (uint64_t)v40);
  swift_release();
  sub_23A87F098();
  v46 = v45;
  swift_release();
  sub_23A874354(v37);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v74);
  swift_release();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v46;
}

uint64_t sub_23A8892D8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = *(_QWORD *)(result + 40);
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      goto LABEL_14;
    }
    *(_QWORD *)(result + 40) = v5;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v6 = *(unsigned __int8 *)(result + 32);
      swift_release();
      if (v6 != 1)
        goto LABEL_8;
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  sub_23A87EB6C(a1);
LABEL_8:
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  swift_release();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v7 = *(unsigned __int8 *)(result + 34);
  result = swift_release();
  if (v7 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B0);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_23A890C00;
    *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B8);
    *(_QWORD *)(v8 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_23A8904E4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A889460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 v61;
  unsigned __int8 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (uint64_t *)((char *)&v58 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v58 - v7;
  v9 = sub_23A88FFBC();
  v10 = *(_QWORD **)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v58 - v14;
  v16 = sub_23A88AD6C();
  if (!v16)
  {
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v20 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v59) = 0;
    *v2 = 0;
    v2[1] = 0xE000000000000000;
    v21 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v2, 0, 1, v21);
    v62 = 8;
    v63 = 0u;
    sub_23A8879F4((unsigned __int8 *)&v59, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v62, 0xD000000000000025, 0x800000023A8938C0, (uint64_t *)&v63);
    goto LABEL_5;
  }
  sub_23A88A050((uint64_t)v16, (uint64_t)v8);
  swift_bridgeObjectRelease();
  v17 = (unsigned int (*)(char *, uint64_t, uint64_t))v10[6];
  if (v17(v8, 1, v9) == 1)
  {
    sub_23A87EAA8((uint64_t)v8, &qword_2569C6070);
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v18 = (void *)sub_23A89034C();
    sub_23A890064();

    LOBYTE(v59) = 0;
    *v2 = 0;
    v2[1] = 0xE000000000000000;
    v19 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v2, 0, 1, v19);
    v62 = 7;
    v63 = 0u;
    sub_23A8879F4((unsigned __int8 *)&v59, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v62, 0xD000000000000024, 0x800000023A893950, (uint64_t *)&v63);
LABEL_5:
    sub_23A87EAA8((uint64_t)v2, &qword_2569C5BA0);
    return 0;
  }
  v22 = (void (*)(char *, char *, uint64_t))v10[4];
  v22(v15, v8, v9);
  v23 = sub_23A88BC44();
  if (v23)
  {
    sub_23A88A050(v23, (uint64_t)v6);
    swift_bridgeObjectRelease();
    if (v17(v6, 1, v9) != 1)
    {
      v22(v13, v6, v9);
      v55 = sub_23A88FFB0();
      v53 = sub_23A888A84(v55, v56);
      swift_bridgeObjectRelease();
      v57 = (void (*)(char *, uint64_t))v10[1];
      v57(v13, v9);
      v57(v15, v9);
      return v53;
    }
    sub_23A87EAA8((uint64_t)v6, &qword_2569C6070);
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v24 = (void *)sub_23A89034C();
    sub_23A890064();

    v25 = sub_23A88FFB0();
    sub_23A8750C0(v25, v26, (uint64_t *)&v63);
    v62 = 0;
    v27 = sub_23A88FFB0();
    v28 = sub_23A88FC78(v27);
    v30 = v29;
    swift_bridgeObjectRelease();
    *v2 = v28;
    v2[1] = v30;
    v31 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v2, 0, 1, v31);
    v32 = sub_23A88FFB0();
    v33 = sub_23A88FC78(v32);
    v35 = v34;
    swift_bridgeObjectRelease();
    v36 = v67;
    v37 = v68;
    v38 = v64;
    v39 = v65;
    v40 = v66;
    v61 = 7;
    v41 = 0xD000000000000030;
    v59 = 0;
    v60 = 0;
    v42 = "Failed to find a random mach-o binary to inspect";
  }
  else
  {
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v43 = (void *)sub_23A89034C();
    sub_23A890064();

    v44 = sub_23A88FFB0();
    sub_23A8750C0(v44, v45, (uint64_t *)&v63);
    v62 = 0;
    v46 = sub_23A88FFB0();
    v47 = sub_23A88FC78(v46);
    v49 = v48;
    swift_bridgeObjectRelease();
    *v2 = v47;
    v2[1] = v49;
    v50 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v2, 0, 1, v50);
    v51 = sub_23A88FFB0();
    v33 = sub_23A88FC78(v51);
    v35 = v52;
    swift_bridgeObjectRelease();
    v36 = v67;
    v37 = v68;
    v38 = v64;
    v39 = v65;
    v40 = v66;
    v61 = 8;
    v41 = 0xD00000000000002DLL;
    v59 = 0;
    v60 = 0;
    v42 = "Failed to find any mach-o binaries in the app";
  }
  sub_23A8879F4(&v62, (uint64_t)v2, 0, 1, v33, v35, v36, v37, v38, *((unint64_t *)&v38 + 1), v39, v40, &v61, v41, (unint64_t)(v42 - 32) | 0x8000000000000000, &v59);
  swift_bridgeObjectRelease();
  sub_23A884070((uint64_t)&v63);
  sub_23A87EAA8((uint64_t)v2, &qword_2569C5BA0);
  ((void (*)(char *, uint64_t))v10[1])(v15, v9);
  return 0;
}

uint64_t sub_23A889B24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (uint64_t *)((char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v36 - v7;
  v9 = sub_23A88FFBC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902C8();
  v39 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v13 = (void *)sub_23A89034C();
  sub_23A890064();

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  sub_23A87EAA8((uint64_t)v8, &qword_2569C6070);
  v14 = 0;
  v38 = xmmword_23A890C10;
  v37 = 0x800000023A893C50;
  while (1)
  {
    sub_23A88A050(MEMORY[0x24BEE4AF8], (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
    {
      swift_release();
      sub_23A87EAA8((uint64_t)v6, &qword_2569C6070);
      sub_23A8902BC();
      v33 = (void *)sub_23A89034C();
      sub_23A890064();

      v42 = 0;
      *v2 = 0;
      v2[1] = 0xE000000000000000;
      v34 = type metadata accessor for TargetType(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v2, 0, 1, v34);
      v41 = 7;
      v40 = 0u;
      sub_23A8879F4(&v42, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v41, 0xD00000000000002DLL, 0x800000023A893B90, (uint64_t *)&v40);
      sub_23A87EAA8((uint64_t)v2, &qword_2569C5BA0);
      return 0;
    }
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v6, v9);
    v15 = sub_23A88FFB0();
    v17 = sub_23A888A84(v15, v16);
    swift_bridgeObjectRelease();
    if (v17)
      break;
    sub_23A8902BC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v38;
    v19 = sub_23A88FFB0();
    v21 = v20;
    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    v22 = sub_23A8742A0();
    *(_QWORD *)(v18 + 32) = v19;
    *(_QWORD *)(v18 + 40) = v21;
    *(_QWORD *)(v18 + 96) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v18 + 104) = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v18 + 64) = v22;
    *(_QWORD *)(v18 + 72) = v14;
    v23 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    v42 = 0;
    v24 = sub_23A88FFB0();
    v25 = sub_23A88FC78(v24);
    v27 = v26;
    swift_bridgeObjectRelease();
    *v2 = v25;
    v2[1] = v27;
    v28 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v2, 0, 1, v28);
    v29 = sub_23A88FFB0();
    v30 = sub_23A88FC78(v29);
    v32 = v31;
    swift_bridgeObjectRelease();
    v41 = 0;
    v40 = 0u;
    sub_23A8879F4(&v42, (uint64_t)v2, v14, 0, v30, v32, 0, 0, 0, 0, 0, 0, &v41, 0xD000000000000032, v37, (uint64_t *)&v40);
    swift_bridgeObjectRelease();
    sub_23A87EAA8((uint64_t)v2, &qword_2569C5BA0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if (++v14 == 5)
    {
      swift_release();
      return 0;
    }
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  return v17;
}

uint64_t sub_23A88A050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v15;
  uint32_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t result;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;

  v4 = sub_23A88FFBC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v14((char *)&v27 - v12, 1, 1, v4);
  v15 = *(_QWORD *)(a1 + 16);
  if (!v15)
  {
    sub_23A8902BC();
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v21 = (void *)sub_23A89034C();
    sub_23A890064();

    v14((char *)a2, 1, 1, v4);
    return sub_23A87EAA8((uint64_t)v13, &qword_2569C6070);
  }
  if (HIDWORD(v15))
    goto LABEL_16;
  v16 = arc4random_uniform(*(_QWORD *)(a1 + 16));
  if (v15 <= v16)
  {
    __break(1u);
LABEL_16:
    result = sub_23A890430();
    __break(1u);
    return result;
  }
  v17 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  v17(v11, a1+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v16, v4);
  v14(v11, 0, 1, v4);
  sub_23A88CCCC((uint64_t)v11, (uint64_t)v13);
  sub_23A8902A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23A890C00;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    v19 = 0;
    v20 = 0;
  }
  else
  {
    v17(v7, (unint64_t)v13, v4);
    v19 = sub_23A88FFB0();
    v20 = v23;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v18 + 64) = sub_23A8742A0();
  if (v20)
    v24 = v19;
  else
    v24 = 0;
  v25 = 0xE000000000000000;
  if (v20)
    v25 = v20;
  *(_QWORD *)(v18 + 32) = v24;
  *(_QWORD *)(v18 + 40) = v25;
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v26 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  return sub_23A88CD14((uint64_t)v13, a2, &qword_2569C6070);
}

uint64_t sub_23A88A390(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void);
  uint64_t (*v35)(void);
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v60;
  __int128 v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  uint64_t *v64;
  char *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68[2];
  unsigned __int8 v69;
  unsigned __int8 v70;
  uint64_t v71[9];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5BA0);
  MEMORY[0x24BDAC7A8](v4);
  v67 = (uint64_t *)((char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x24BDAC7A8](v6);
  v64 = (uint64_t *)((char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  MEMORY[0x24BDAC7A8](v8);
  v65 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A88FFBC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902C8();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v15 = swift_allocObject();
  v61 = xmmword_23A890C00;
  *(_OWORD *)(v15 + 16) = xmmword_23A890C00;
  *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
  v60 = sub_23A8742A0();
  *(_QWORD *)(v15 + 64) = v60;
  *(_QWORD *)(v15 + 32) = a1;
  *(_QWORD *)(v15 + 40) = a2;
  v16 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  swift_bridgeObjectRetain();
  v17 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  sub_23A8750C0(a1, a2, v71);
  sub_23A88FF80();
  v18 = sub_23A88BC44();
  v62 = *(void (**)(char *, uint64_t))(v11 + 8);
  v63 = v13;
  v62(v13, v10);
  if (v18)
  {
    v57 = v14;
    v58 = v16;
    sub_23A884070((uint64_t)v71);
    v19 = *(_QWORD *)(v18 + 16);
    v56 = v18;
    if (v19)
    {
      v20 = v18 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
      v21 = *(_QWORD *)(v11 + 16);
      v60 = *(_QWORD *)(v11 + 72);
      *(_QWORD *)&v61 = v21;
      swift_bridgeObjectRetain();
      v23 = v64;
      v22 = v65;
      v24 = v63;
      while (1)
      {
        ((void (*)(char *, unint64_t, uint64_t))v61)(v22, v20, v10);
        v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
        v25(v22, 0, 1, v10);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v22, 1, v10) == 1)
          break;
        v59 = v25;
        v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v11 + 32))(v24, v22, v10);
        v67 = (uint64_t *)MEMORY[0x23B859758](v26);
        *v23 = sub_23A88FFA4();
        v23[1] = v27;
        type metadata accessor for TargetType(0);
        swift_storeEnumTagMultiPayload();
        v28 = v66;
        v29 = *(_BYTE *)(v66 + 33);
        v30 = swift_allocObject();
        swift_weakInit();
        v31 = v10;
        v32 = v11;
        v34 = *(uint64_t (**)(void))(v28 + 16);
        v33 = *(_QWORD *)(v28 + 24);
        swift_retain();
        v35 = v34;
        v11 = v32;
        v10 = v31;
        sub_23A882F80((uint64_t)v23, v35, v33, v29, v30);
        v22 = v65;
        swift_release();
        sub_23A874354((uint64_t)v23);
        swift_release();
        objc_autoreleasePoolPop(v67);
        v62(v24, v31);
        v20 += v60;
        if (!--v19)
        {
          v59(v22, 1, 1, v31);
          break;
        }
      }
    }
    else
    {
      v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      swift_bridgeObjectRetain();
      v46(v65, 1, 1, v10);
    }
    v47 = v56;
    swift_bridgeObjectRelease();
    sub_23A8902C8();
    v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_23A890C10;
    v49 = *(_QWORD *)(v47 + 16);
    swift_bridgeObjectRelease();
    v50 = MEMORY[0x24BEE1768];
    v51 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v48 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v48 + 64) = v51;
    *(_QWORD *)(v48 + 32) = v49;
    v52 = v66;
    v53 = *(_QWORD *)(v66 + 40);
    *(_QWORD *)(v48 + 96) = v50;
    *(_QWORD *)(v48 + 104) = v51;
    *(_QWORD *)(v48 + 72) = v53;
    v54 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    return *(_QWORD *)(v52 + 40);
  }
  else
  {
    sub_23A8902BC();
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = v61;
    v37 = v60;
    *(_QWORD *)(v36 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v36 + 64) = v37;
    *(_QWORD *)(v36 + 32) = a1;
    *(_QWORD *)(v36 + 40) = a2;
    swift_bridgeObjectRetain();
    v38 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    v70 = 0;
    v39 = sub_23A88FC78(a1);
    v40 = v67;
    *v67 = v39;
    v40[1] = v41;
    v42 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v40, 0, 1, v42);
    v43 = sub_23A88FC78(a1);
    v69 = 0;
    v68[0] = 0;
    v68[1] = 0;
    sub_23A8879F4(&v70, (uint64_t)v40, 0, 1, v43, v44, v71[6], v71[7], v71[2], v71[3], v71[4], v71[5], &v69, 0xD000000000000030, 0x800000023A893D50, v68);
    swift_bridgeObjectRelease();
    sub_23A884070((uint64_t)v71);
    sub_23A87EAA8((uint64_t)v40, &qword_2569C5BA0);
    return 0;
  }
}

uint64_t sub_23A88A99C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  _QWORD v12[6];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = *(_QWORD *)(result + 40);
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      goto LABEL_14;
    }
    *(_QWORD *)(result + 40) = v5;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v6 = *(unsigned __int8 *)(result + 32);
      swift_release();
      if (v6 != 1)
        goto LABEL_8;
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  v7 = (void *)sub_23A890148();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  v12[4] = sub_23A8745EC;
  v12[5] = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_23A888918;
  v12[3] = &block_descriptor_5;
  v9 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

LABEL_8:
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  swift_release();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v10 = *(unsigned __int8 *)(result + 34);
  result = swift_release();
  if (v10 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B0);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_23A890C00;
    *(_QWORD *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C58B8);
    *(_QWORD *)(v11 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_23A8904E4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A88ABC8()
{
  return swift_release();
}

uint64_t MachOAnalysisCoordinator.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t MachOAnalysisCoordinator.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23A88AC10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6038);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23A89046C();
  __break(1u);
  return result;
}

id sub_23A88AD6C()
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
  char *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id result;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void (*v31)(_QWORD, _QWORD, _QWORD);
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void (*v80)(char *, uint64_t, uint64_t, uint64_t);
  __int128 v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void (*v86)(char *, char *, uint64_t);
  void (*v87)(_QWORD, _QWORD, _QWORD);
  __int128 v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  MEMORY[0x24BDAC7A8](v0);
  v82 = (char *)&v71 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_23A88FFBC();
  v83 = *(_QWORD *)(v74 - 8);
  v2 = MEMORY[0x24BDAC7A8](v74);
  v73 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v85 = (char *)&v71 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v89 = (char *)&v71 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v71 - v8;
  v10 = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithOptions_, 128);
  v11 = objc_msgSend(v10, sel_nextObject);
  if (v11)
  {
    v12 = v11;
    v72 = MEMORY[0x24BEE4AF8];
    v88 = xmmword_23A890C00;
    v87 = (void (*)(_QWORD, _QWORD, _QWORD))v9;
    while (1)
    {
      sub_23A8902B0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = v88;
      v14 = objc_msgSend(v12, sel_bundleIdentifier);
      if (v14)
      {
        v15 = v14;
        v16 = sub_23A89016C();
        v18 = v17;

      }
      else
      {
        v16 = 0;
        v18 = 0;
      }
      v92 = v16;
      v93 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6220);
      v19 = sub_23A89019C();
      v21 = v20;
      *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v13 + 64) = sub_23A8742A0();
      *(_QWORD *)(v13 + 32) = v19;
      *(_QWORD *)(v13 + 40) = v21;
      sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
      v22 = (void *)sub_23A89034C();
      sub_23A890064();
      swift_bridgeObjectRelease();

      v23 = objc_msgSend(v12, sel_bundleIdentifier);
      if (!v23)
        goto LABEL_9;

      result = objc_msgSend(v12, sel_bundleIdentifier);
      if (!result)
      {
        __break(1u);
        return result;
      }
      v25 = result;
      v26 = sub_23A89016C();
      v28 = v27;

      v92 = v26;
      v93 = v28;
      v90 = 0x6C7070612E6D6F63;
      v91 = 0xE900000000000065;
      sub_23A8724FC();
      LOBYTE(v26) = sub_23A8903A0();
      swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {
        v30 = objc_msgSend(v12, sel_URL);
        v31 = v87;
        sub_23A88FF98();

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v72 = sub_23A885C88(0, *(_QWORD *)(v72 + 16) + 1, 1, v72);
        v33 = *(_QWORD *)(v72 + 16);
        v32 = *(_QWORD *)(v72 + 24);
        if (v33 >= v32 >> 1)
          v72 = sub_23A885C88(v32 > 1, v33 + 1, 1, v72);
        v34 = v72;
        *(_QWORD *)(v72 + 16) = v33 + 1;
        (*(void (**)(unint64_t, _QWORD, uint64_t))(v83 + 32))(v34+ ((*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80))+ *(_QWORD *)(v83 + 72) * v33, v31, v74);

        v29 = objc_msgSend(v10, sel_nextObject);
      }
      else
      {
LABEL_9:

        v29 = objc_msgSend(v10, sel_nextObject);
      }
      v12 = v29;
      if (!v12)
        goto LABEL_18;
    }
  }
  v72 = MEMORY[0x24BEE4AF8];
LABEL_18:
  sub_23A8902B0();
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v36 = swift_allocObject();
  v81 = xmmword_23A890C00;
  *(_OWORD *)(v36 + 16) = xmmword_23A890C00;
  *(_QWORD *)(v36 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6210);
  *(_QWORD *)(v36 + 64) = sub_23A88CD58();
  v37 = v72;
  *(_QWORD *)(v36 + 32) = v72;
  v38 = sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  swift_bridgeObjectRetain();
  v39 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  sub_23A8902C8();
  v76 = v35;
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = v81;
  v41 = MEMORY[0x24BEE1768];
  v42 = *(_QWORD *)(v37 + 16);
  v43 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v40 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v40 + 64) = v43;
  *(_QWORD *)(v40 + 32) = v42;
  v77 = v38;
  v44 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  type metadata accessor for IgnoreListDataStore();
  swift_initStackObject();
  v84 = sub_23A884110();
  v45 = *(_QWORD *)(v37 + 16);
  if (v45)
  {
    v46 = v83;
    v75 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    v47 = v37 + v75;
    v48 = *(_QWORD *)(v83 + 72);
    v87 = *(void (**)(_QWORD, _QWORD, _QWORD))(v83 + 16);
    v49 = MEMORY[0x24BEE4AF8];
    v50 = v82;
    v51 = v74;
    v79 = v10;
    v78 = v48;
    v87(v82, v47, v74);
    while (1)
    {
      v80 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
      v80(v50, 0, 1, v51);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v50, 1, v51) == 1)
      {
        v41 = MEMORY[0x24BEE1768];
        v43 = MEMORY[0x24BEE17F0];
        goto LABEL_39;
      }
      *(_QWORD *)&v88 = v49;
      v86 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      v86(v89, v50, v51);
      v58 = sub_23A88FFB0();
      sub_23A8750C0(v58, v59, &v92);
      v60 = v95 ? v94 : 0;
      v61 = v95 ? v95 : 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A884070((uint64_t)&v92);
      v90 = v60;
      v91 = v61;
      swift_bridgeObjectRetain();
      sub_23A8901C0();
      sub_23A8901C0();
      sub_23A8901C0();
      sub_23A8901C0();
      sub_23A884604(0, v90, v91);
      v63 = v62;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v64 = v78;
      if ((v63 & 1) != 0)
      {
        sub_23A8902A4();
        v52 = swift_allocObject();
        *(_OWORD *)(v52 + 16) = v81;
        v53 = v89;
        v54 = sub_23A88FF8C();
        v56 = v55;
        *(_QWORD *)(v52 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v52 + 64) = sub_23A8742A0();
        *(_QWORD *)(v52 + 32) = v54;
        *(_QWORD *)(v52 + 40) = v56;
        v57 = (void *)sub_23A89034C();
        sub_23A890064();
        swift_bridgeObjectRelease();

        v50 = v82;
        v51 = v74;
        v49 = v88;
      }
      else
      {
        v53 = v89;
        v51 = v74;
        v87(v73, v89, v74);
        v49 = v88;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v49 = sub_23A885C88(0, *(_QWORD *)(v49 + 16) + 1, 1, v49);
        v50 = v82;
        v66 = *(_QWORD *)(v49 + 16);
        v65 = *(_QWORD *)(v49 + 24);
        if (v66 >= v65 >> 1)
          v49 = sub_23A885C88(v65 > 1, v66 + 1, 1, v49);
        *(_QWORD *)(v49 + 16) = v66 + 1;
        v86((char *)(v49 + v75 + v66 * v64), v73, v51);
      }
      v46 = v83;
      (*(void (**)(char *, uint64_t))(v83 + 8))(v53, v51);
      v47 += v64;
      --v45;
      v10 = v79;
      if (!v45)
        break;
      v87(v50, v47, v51);
    }
    v41 = MEMORY[0x24BEE1768];
    v43 = MEMORY[0x24BEE17F0];
    v80(v50, 1, 1, v51);
  }
  else
  {
    v49 = MEMORY[0x24BEE4AF8];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56))(v82, 1, 1, v74);
  }
LABEL_39:
  swift_bridgeObjectRelease();
  sub_23A884428();
  if (*(_QWORD *)(v49 + 16))
  {
    sub_23A8902C8();
    v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = v81;
    v68 = *(_QWORD *)(v49 + 16);
    *(_QWORD *)(v67 + 56) = v41;
    *(_QWORD *)(v67 + 64) = v43;
    *(_QWORD *)(v67 + 32) = v68;
    v69 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A8902C8();
    v70 = (void *)sub_23A89034C();
    sub_23A890064();

    swift_release();
    return 0;
  }
  return (id)v49;
}

uint64_t sub_23A88B9F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6228);
    v3 = sub_23A8903D0();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_23A89016C();
      sub_23A8904F0();
      v7 = v6;
      sub_23A8901B4();
      v8 = sub_23A890508();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_23A89016C();
        v17 = v16;
        if (v15 == sub_23A89016C() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_23A89049C();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_23A89016C();
          v24 = v23;
          if (v22 == sub_23A89016C() && v24 == v25)
            goto LABEL_3;
          v27 = sub_23A89049C();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_23A88BC20()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A88BC44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  uint64_t inited;
  void *v36;
  id v37;
  unint64_t v38;
  char v39;
  void (*v40)(unint64_t, uint64_t);
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  void *v45;
  id v46;
  char *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unsigned int (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  char *v59;
  char v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void (*v68)(unint64_t, char *, uint64_t);
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  char v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  void *v108;
  char *v109;
  char *v110;
  char *v111;
  id v112;
  uint64_t v113;
  void (*v114)(char *, char *, uint64_t);
  uint64_t v115;
  char *v116;
  uint64_t v117;
  unsigned int (*v118)(char *, uint64_t, uint64_t);
  char *v119;
  unint64_t v120;
  uint64_t v121;
  char *v122;
  id v123;
  id v124;
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  __int128 v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t, uint64_t, uint64_t);
  char *v132;
  _BYTE v133[32];
  __int128 v134;
  __int128 v135;
  uint64_t (*v136)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v137;

  v117 = sub_23A88FF50();
  v115 = *(_QWORD *)(v117 - 8);
  v0 = MEMORY[0x24BDAC7A8](v117);
  v111 = (char *)&v105 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v105 - v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v122 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v110 = (char *)&v105 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v105 - v9;
  v11 = sub_23A88FFBC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v125 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v116 = (char *)&v105 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v126 = (char *)&v105 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v107 = (char *)&v105 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v109 = (char *)&v105 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v127 = (char *)&v105 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v132 = (char *)&v105 - v25;
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6068);
  v27 = swift_allocObject();
  v129 = xmmword_23A890C00;
  *(_OWORD *)(v27 + 16) = xmmword_23A890C00;
  v28 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(v27 + 32) = *MEMORY[0x24BDBCC60];
  v124 = v28;
  v112 = v26;
  v29 = (void *)sub_23A890298();
  swift_bridgeObjectRelease();
  v123 = v29;
  v130 = v12;
  if (v29)
  {
    v108 = (void *)*MEMORY[0x24BDBCCA0];
    v113 = MEMORY[0x24BEE4AF8];
    v121 = MEMORY[0x24BEE4AD8] + 8;
    v119 = v10;
    v120 = (unint64_t)v3;
    while (1)
    {
      if (objc_msgSend(v123, sel_nextObject))
      {
        sub_23A8903AC();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v133, 0, sizeof(v133));
      }
      sub_23A88CD14((uint64_t)v133, (uint64_t)&v134, (uint64_t *)&unk_2569C58F0);
      if (!*((_QWORD *)&v135 + 1))
        goto LABEL_34;
      v30 = swift_dynamicCast();
      v131 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v131(v10, v30 ^ 1u, 1, v11);
      v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
      if (v31(v10, 1, v11) == 1)
      {
        v72 = v122;
        v73 = v126;
        goto LABEL_36;
      }
      v118 = v31;
      v32 = v11;
      v33 = *(void (**)(char *, char *))(v12 + 32);
      v34 = v32;
      v33(v132, v10);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v129;
      v36 = v124;
      *(_QWORD *)(inited + 32) = v124;
      v37 = v36;
      sub_23A88B9F4(inited);
      swift_setDeallocating();
      type metadata accessor for URLResourceKey(0);
      v38 = v120;
      swift_arrayDestroy();
      sub_23A88FF74();
      v114 = (void (*)(char *, char *, uint64_t))v33;
      swift_bridgeObjectRelease();
      v39 = sub_23A88FF20();
      v40 = *(void (**)(unint64_t, uint64_t))(v115 + 8);
      v40(v38, v117);
      v41 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
      if (v39 == 2)
        break;
      v42 = v127;
      v11 = v34;
      v41(v127, v132, v34);
      if ((v39 & 1) != 0)
      {
        v10 = v119;
        goto LABEL_10;
      }
      v44 = swift_initStackObject();
      *(_OWORD *)(v44 + 16) = v129;
      v45 = v108;
      *(_QWORD *)(v44 + 32) = v108;
      v46 = v45;
      sub_23A88B9F4(v44);
      swift_setDeallocating();
      swift_arrayDestroy();
      v47 = v111;
      sub_23A88FF74();
      swift_bridgeObjectRelease();
      v48 = sub_23A88FF38();
      v40((unint64_t)v47, v117);
      v43 = *(void (**)(char *, uint64_t))(v130 + 8);
      v43(v42, v34);
      if (v48 == 2)
        goto LABEL_32;
      if ((v48 & 1) != 0)
        goto LABEL_32;
      sub_23A88FFB0();
      v106 = v49;
      v50 = swift_allocObject();
      *(_QWORD *)(v50 + 16) = 0;
      v51 = (void *)sub_23A890148();
      v136 = sub_23A88CC7C;
      v137 = (_QWORD *)v50;
      *(_QWORD *)&v134 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v134 + 1) = 1107296256;
      *(_QWORD *)&v135 = sub_23A87A648;
      *((_QWORD *)&v135 + 1) = &block_descriptor_13;
      v52 = _Block_copy(&v134);
      swift_retain();
      swift_release();
      nm_macho_for_each_slice(v51, v52);
      _Block_release(v52);

      swift_beginAccess();
      v53 = *(_QWORD *)(v50 + 16);
      swift_bridgeObjectRelease();
      swift_release();
      if (!v53)
      {
LABEL_32:
        v12 = v130;
        v10 = v119;
      }
      else
      {
        v54 = *(_QWORD *)(v113 + 16);
        if (v54)
        {
          v55 = v130;
          v56 = v113 + ((*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80));
          swift_bridgeObjectRetain();
          v106 = *(_QWORD *)(v55 + 72);
          v57 = v118;
          while (1)
          {
            v58 = v110;
            v41(v110, (char *)v56, v11);
            v131(v58, 0, 1, v11);
            if (v57(v58, 1, v11) == 1)
              break;
            v59 = v109;
            v114(v109, v58, v11);
            sub_23A88CC84();
            v60 = sub_23A89013C();
            v43(v59, v11);
            if ((v60 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_32;
            }
            v56 += v106;
            if (!--v54)
              goto LABEL_25;
          }
        }
        else
        {
          swift_bridgeObjectRetain();
LABEL_25:
          v131(v110, 1, 1, v11);
        }
        swift_bridgeObjectRelease();
        LODWORD(v131) = sub_23A8902B0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
        v61 = swift_allocObject();
        *(_OWORD *)(v61 + 16) = v129;
        v62 = v132;
        v63 = sub_23A88FFB0();
        v65 = v64;
        *(_QWORD *)(v61 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v61 + 64) = sub_23A8742A0();
        *(_QWORD *)(v61 + 32) = v63;
        *(_QWORD *)(v61 + 40) = v65;
        sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
        v66 = (void *)sub_23A89034C();
        sub_23A890064();
        swift_bridgeObjectRelease();

        v41(v107, v62, v11);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v113 = sub_23A885C88(0, *(_QWORD *)(v113 + 16) + 1, 1, v113);
        v12 = v130;
        v10 = v119;
        v67 = v113;
        v68 = (void (*)(unint64_t, char *, uint64_t))v114;
        v70 = *(_QWORD *)(v113 + 16);
        v69 = *(_QWORD *)(v113 + 24);
        if (v70 >= v69 >> 1)
          v67 = sub_23A885C88(v69 > 1, v70 + 1, 1, v113);
        *(_QWORD *)(v67 + 16) = v70 + 1;
        v71 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
        v113 = v67;
        v68(v67 + v71 + *(_QWORD *)(v12 + 72) * v70, v107, v11);
      }
LABEL_11:
      v43(v132, v11);
    }
    v10 = v119;
    v11 = v34;
    v42 = v127;
    v41(v127, v132, v34);
LABEL_10:
    v12 = v130;
    v43 = *(void (**)(char *, uint64_t))(v130 + 8);
    v43(v42, v11);
    goto LABEL_11;
  }
  v134 = 0u;
  v135 = 0u;
  v113 = MEMORY[0x24BEE4AF8];
LABEL_34:
  v72 = v122;
  v73 = v126;
  sub_23A87EAA8((uint64_t)&v134, (uint64_t *)&unk_2569C58F0);
  v131 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v131(v10, 1, 1, v11);
LABEL_36:
  sub_23A87EAA8((uint64_t)v10, &qword_2569C6070);
  type metadata accessor for IgnoreListDataStore();
  swift_initStackObject();
  v124 = (id)sub_23A884110();
  v74 = *(_QWORD *)(v113 + 16);
  if (v74)
  {
    v120 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v75 = v113 + v120;
    v76 = *(_QWORD *)(v12 + 72);
    v132 = *(char **)(v12 + 16);
    v128 = MEMORY[0x24BEE4AF8];
    v121 = v76;
    ((void (*)(char *, unint64_t, uint64_t))v132)(v72, v113 + v120, v11);
    while (1)
    {
      v131(v72, 0, 1, v11);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v72, 1, v11) == 1)
        break;
      v127 = *(char **)(v12 + 32);
      ((void (*)(char *, char *, uint64_t))v127)(v73, v72, v11);
      v83 = sub_23A88FFB0();
      v85 = v84;
      type metadata accessor for MachOParser();
      v86 = (_QWORD *)swift_allocObject();
      v87 = MEMORY[0x24BEE4AF8];
      v86[6] = sub_23A87313C(MEMORY[0x24BEE4AF8]);
      v86[7] = v87;
      v86[2] = v83;
      v86[3] = v85;
      v86[4] = sub_23A8769EC;
      v86[5] = 0;
      swift_bridgeObjectRetain();
      v88 = (void *)sub_23A890148();
      swift_bridgeObjectRelease();
      v136 = sub_23A879BA4;
      v137 = v86;
      *(_QWORD *)&v134 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v134 + 1) = 1107296256;
      *(_QWORD *)&v135 = sub_23A87A648;
      *((_QWORD *)&v135 + 1) = &block_descriptor_7;
      v89 = _Block_copy(&v134);
      swift_retain();
      swift_release();
      nm_macho_for_each_slice(v88, v89);
      _Block_release(v89);

      v90 = sub_23A87A6B4();
      if (v91)
        v92 = v90;
      else
        v92 = 0;
      if (v91)
        v93 = v91;
      else
        v93 = 0xE000000000000000;
      *(_QWORD *)&v134 = v92;
      *((_QWORD *)&v134 + 1) = v93;
      swift_bridgeObjectRetain();
      sub_23A8901C0();
      sub_23A8901C0();
      sub_23A884604(1, v134, *((unint64_t *)&v134 + 1));
      v95 = v94;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v95 & 1) != 0)
      {
        sub_23A8902B0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
        v77 = swift_allocObject();
        *(_OWORD *)(v77 + 16) = v129;
        v78 = sub_23A88FFB0();
        v80 = v79;
        *(_QWORD *)(v77 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v77 + 64) = sub_23A8742A0();
        *(_QWORD *)(v77 + 32) = v78;
        *(_QWORD *)(v77 + 40) = v80;
        sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
        v81 = (void *)sub_23A89034C();
        sub_23A890064();
        swift_release();
        swift_bridgeObjectRelease();

        v82 = v121;
        v72 = v122;
      }
      else
      {
        ((void (*)(char *, char *, uint64_t))v132)(v116, v126, v11);
        v96 = v128;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v96 = sub_23A885C88(0, *(_QWORD *)(v96 + 16) + 1, 1, v96);
        v72 = v122;
        v98 = *(_QWORD *)(v96 + 16);
        v97 = *(_QWORD *)(v96 + 24);
        if (v98 >= v97 >> 1)
          v96 = sub_23A885C88(v97 > 1, v98 + 1, 1, v96);
        *(_QWORD *)(v96 + 16) = v98 + 1;
        v128 = v96;
        v82 = v121;
        ((void (*)(unint64_t, char *, uint64_t))v127)(v96 + v120 + v98 * v121, v116, v11);
        swift_release();
      }
      v12 = v130;
      v73 = v126;
      (*(void (**)(char *, uint64_t))(v130 + 8))(v126, v11);
      v75 += v82;
      if (!--v74)
        goto LABEL_55;
      ((void (*)(char *, unint64_t, uint64_t))v132)(v72, v75, v11);
    }
  }
  else
  {
    v128 = MEMORY[0x24BEE4AF8];
LABEL_55:
    v131(v72, 1, 1, v11);
  }
  swift_bridgeObjectRelease();
  sub_23A884428();
  v99 = v128;
  if (*(_QWORD *)(v128 + 16))
  {
    sub_23A8902C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
    v100 = swift_allocObject();
    *(_OWORD *)(v100 + 16) = v129;
    v101 = *(_QWORD *)(v99 + 16);
    v102 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v100 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v100 + 64) = v102;
    *(_QWORD *)(v100 + 32) = v101;
    sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
    v103 = (void *)sub_23A89034C();
    sub_23A890064();
    swift_bridgeObjectRelease();

    swift_release();
  }
  else
  {
    swift_release();

    swift_bridgeObjectRelease();
    return 0;
  }
  return v99;
}

uint64_t type metadata accessor for MachOAnalysisCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for MachOAnalysisCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.__allocating_init(interruptCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.__allocating_init(interruptCallback:sendEvents:coreSymbolication:printTostdout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeRandomMachO()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeMachO(path:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeAppMachO()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeNonAppMachO()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeApp(path:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t sub_23A88CC30()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t sub_23A88CC6C()
{
  return swift_deallocObject();
}

uint64_t sub_23A88CC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A87E6B0(a1, a2, a3, a4, v4);
}

unint64_t sub_23A88CC84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C6208;
  if (!qword_2569C6208)
  {
    v1 = sub_23A88FFBC();
    result = MEMORY[0x23B859B78](MEMORY[0x24BDCDB00], v1);
    atomic_store(result, (unint64_t *)&qword_2569C6208);
  }
  return result;
}

uint64_t sub_23A88CCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C6070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A88CD14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_23A88CD58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C6218;
  if (!qword_2569C6218)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569C6210);
    result = MEMORY[0x23B859B78](MEMORY[0x24BDCFBF8], v1);
    atomic_store(result, (unint64_t *)&qword_2569C6218);
  }
  return result;
}

uint64_t AnalysisCoordinator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t static AnalysisCoordinator.staticallyAnalyzeAppPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7)
{
  return sub_23A88CE24(a1, a2, a3, a4, a5, a6, a7, (uint64_t)"EcosystemAnalytics.framework:AnalysisCoordinator: statically analyzing app at path %{private}@", 94, sub_23A88A390);
}

uint64_t static AnalysisCoordinator.staticallyAnalyzeMachOPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7)
{
  return sub_23A88CE24(a1, a2, a3, a4, a5, a6, a7, (uint64_t)"EcosystemAnalytics.framework:AnalysisCoordinator: statically analyzing mach-o at path %{private}@", 97, sub_23A888A84);
}

uint64_t sub_23A88CE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t))
{
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  sub_23A8902C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23A890C00;
  *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v15 + 64) = sub_23A8742A0();
  *(_QWORD *)(v15 + 32) = a1;
  *(_QWORD *)(v15 + 40) = a2;
  sub_23A875650();
  swift_bridgeObjectRetain();
  v16 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  type metadata accessor for MachOAnalysisCoordinator();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 40) = 0;
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_BYTE *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 33) = a6;
  *(_BYTE *)(v17 + 34) = a7;
  swift_retain();
  v18 = a10(a1, a2);
  swift_release();
  return v18;
}

uint64_t static AnalysisCoordinator.staticallyAnalyze(interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;

  sub_23A8902C8();
  sub_23A875650();
  v10 = (void *)sub_23A89034C();
  sub_23A890064();

  type metadata accessor for MachOAnalysisCoordinator();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *(_BYTE *)(v11 + 32) = a3;
  *(_BYTE *)(v11 + 33) = a4;
  *(_BYTE *)(v11 + 34) = a5;
  swift_retain();
  v12 = sub_23A889460();
  swift_release();
  return v12;
}

uint64_t static AnalysisCoordinator.runtimeAnalyzePID(_:interruptCallback:sendEvents:printTostdout:)(int a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  sub_23A8902C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v10 = swift_allocObject();
  v11 = MEMORY[0x24BEE3F88];
  *(_OWORD *)(v10 + 16) = xmmword_23A890C00;
  v12 = MEMORY[0x24BEE3FF0];
  *(_QWORD *)(v10 + 56) = v11;
  *(_QWORD *)(v10 + 64) = v12;
  *(_DWORD *)(v10 + 32) = a1;
  sub_23A875650();
  v13 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  type metadata accessor for MicrostackshotsCoordinator();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 24) = a3;
  *(_QWORD *)(v14 + 32) = 0;
  *(_QWORD *)(v14 + 16) = a2;
  *(_BYTE *)(v14 + 40) = a4;
  *(_BYTE *)(v14 + 41) = a5;
  swift_retain();
  v15 = sub_23A872540(a1, 0);
  swift_release();
  return v15;
}

uint64_t static AnalysisCoordinator.runtimeAnalyze(interruptCallback:sendEvents:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;

  sub_23A8902C8();
  sub_23A875650();
  v8 = (void *)sub_23A89034C();
  sub_23A890064();

  type metadata accessor for MicrostackshotsCoordinator();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 24) = a2;
  *(_QWORD *)(v9 + 32) = 0;
  *(_QWORD *)(v9 + 16) = a1;
  *(_BYTE *)(v9 + 40) = a3;
  *(_BYTE *)(v9 + 41) = a4;
  swift_retain();
  v10 = sub_23A871A0C();
  swift_release();
  return v10;
}

uint64_t AnalysisCoordinator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalysisCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for AnalysisCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for Symbol(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 264))
  {
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(a1 + 280))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Symbol(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  v11 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v11;
  v12 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v12;
  v13 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v13;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v14 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v14;
  v15 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v15;
  v16 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v16;
  v17 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v17;
  v18 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v18;
  v35 = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v35)
  {
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = v35;
    v19 = *(_QWORD *)(a2 + 280);
    swift_bridgeObjectRetain();
    if (v19)
    {
      *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
      *(_QWORD *)(a1 + 280) = v19;
      *(_BYTE *)(a1 + 288) = *(_BYTE *)(a2 + 288);
      v20 = *(_QWORD *)(a2 + 304);
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      *(_QWORD *)(a1 + 304) = v20;
      v21 = *(_QWORD *)(a2 + 320);
      *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
      *(_QWORD *)(a1 + 320) = v21;
      v22 = *(_QWORD *)(a2 + 336);
      *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
      *(_QWORD *)(a1 + 336) = v22;
      v23 = *(_QWORD *)(a2 + 352);
      *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
      *(_QWORD *)(a1 + 352) = v23;
      v24 = *(_QWORD *)(a2 + 368);
      *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
      *(_QWORD *)(a1 + 368) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v28 = *(_OWORD *)(a2 + 352);
      *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
      *(_OWORD *)(a1 + 352) = v28;
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
      v29 = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
      *(_OWORD *)(a1 + 288) = v29;
      v30 = *(_OWORD *)(a2 + 320);
      *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 320) = v30;
    }
  }
  else
  {
    v25 = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 336) = v25;
    *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    v26 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 272) = v26;
    v27 = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 304) = v27;
  }
  v31 = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v31;
  v32 = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 400) = v32;
  v33 = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  *(_QWORD *)(a1 + 416) = v33;
  *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Symbol(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 256);
  v5 = (__int128 *)(a2 + 256);
  v6 = *(_QWORD *)(a2 + 264);
  if (!*(_QWORD *)(a1 + 264))
  {
    if (!v6)
    {
      v22 = *v5;
      v23 = *(_OWORD *)(a2 + 272);
      v24 = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 304) = v24;
      *v4 = v22;
      *(_OWORD *)(a1 + 272) = v23;
      v25 = *(_OWORD *)(a2 + 320);
      v26 = *(_OWORD *)(a2 + 336);
      v27 = *(_OWORD *)(a2 + 352);
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v26;
      *(_OWORD *)(a1 + 352) = v27;
      *(_OWORD *)(a1 + 320) = v25;
      goto LABEL_15;
    }
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
    v10 = *(_QWORD *)(a2 + 280);
    swift_bridgeObjectRetain();
    if (!v10)
    {
      v11 = *(_OWORD *)(a2 + 272);
      v12 = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 304) = v12;
      *(_OWORD *)(a1 + 272) = v11;
      v13 = *(_OWORD *)(a2 + 320);
      v14 = *(_OWORD *)(a2 + 336);
      v15 = *(_OWORD *)(a2 + 352);
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v14;
      *(_OWORD *)(a1 + 352) = v15;
      *(_OWORD *)(a1 + 320) = v13;
      goto LABEL_15;
    }
LABEL_11:
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_BYTE *)(a1 + 288) = *(_BYTE *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  if (!v6)
  {
    sub_23A88DB34(a1 + 256);
    v16 = *(_OWORD *)(a2 + 304);
    v18 = *v5;
    v17 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 304) = v16;
    *v4 = v18;
    *(_OWORD *)(a1 + 272) = v17;
    v20 = *(_OWORD *)(a2 + 336);
    v19 = *(_OWORD *)(a2 + 352);
    v21 = *(_OWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    *(_OWORD *)(a1 + 336) = v20;
    *(_OWORD *)(a1 + 352) = v19;
    *(_OWORD *)(a1 + 320) = v21;
    goto LABEL_15;
  }
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (__int128 *)(a1 + 272);
  v8 = (__int128 *)(a2 + 272);
  v9 = *(_QWORD *)(a2 + 280);
  if (!*(_QWORD *)(a1 + 280))
  {
    if (!v9)
    {
      v33 = *v8;
      v34 = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 304) = v34;
      *v7 = v33;
      v35 = *(_OWORD *)(a2 + 320);
      v36 = *(_OWORD *)(a2 + 336);
      v37 = *(_OWORD *)(a2 + 352);
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v36;
      *(_OWORD *)(a1 + 352) = v37;
      *(_OWORD *)(a1 + 320) = v35;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (v9)
  {
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(a1 + 288) = *(_BYTE *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23A881D70(a1 + 272);
    v29 = *(_OWORD *)(a2 + 288);
    v28 = *(_OWORD *)(a2 + 304);
    *v7 = *v8;
    *(_OWORD *)(a1 + 288) = v29;
    *(_OWORD *)(a1 + 304) = v28;
    v31 = *(_OWORD *)(a2 + 336);
    v30 = *(_OWORD *)(a2 + 352);
    v32 = *(_OWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    *(_OWORD *)(a1 + 336) = v31;
    *(_OWORD *)(a1 + 352) = v30;
    *(_OWORD *)(a1 + 320) = v32;
  }
LABEL_15:
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A88DB34(uint64_t a1)
{
  destroy for LoadCommand(a1);
  return a1;
}

void *__swift_memcpy432_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1B0uLL);
}

uint64_t assignWithTake for Symbol(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v13;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v14 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v16;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v18;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 264))
    goto LABEL_7;
  v19 = *(_QWORD *)(a2 + 264);
  if (!v19)
  {
    sub_23A88DB34(a1 + 256);
LABEL_7:
    v26 = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 336) = v26;
    *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    v27 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 272) = v27;
    v28 = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 304) = v28;
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v19;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 280))
  {
LABEL_9:
    v29 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v29;
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    v30 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v30;
    v31 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v31;
    goto LABEL_10;
  }
  v20 = *(_QWORD *)(a2 + 280);
  if (!v20)
  {
    sub_23A881D70(a1 + 272);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v20;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 288) = *(_BYTE *)(a2 + 288);
  v21 = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 304) = v21;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = v22;
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = v23;
  swift_bridgeObjectRelease();
  v24 = *(_QWORD *)(a2 + 352);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 352) = v24;
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  *(_QWORD *)(a1 + 368) = v25;
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v32;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  swift_bridgeObjectRelease();
  v33 = *(_QWORD *)(a2 + 424);
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = v33;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Symbol(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 432))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Symbol(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 424) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 432) = 1;
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
    *(_BYTE *)(result + 432) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Symbol()
{
  return &type metadata for Symbol;
}

uint64_t sub_23A88DEE4(uint64_t a1, uint64_t a2, void (*a3)(unint64_t))
{
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A891150;
  *(_QWORD *)(inited + 32) = 0x6C646E7542707061;
  *(_QWORD *)(inited + 40) = 0xEB00000000444965;
  swift_bridgeObjectRetain();
  v4 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = 0xD000000000000010;
  *(_QWORD *)(inited + 64) = 0x800000023A892EF0;
  swift_bridgeObjectRetain();
  v5 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0x656D614E707061;
  *(_QWORD *)(inited + 88) = 0xE700000000000000;
  swift_bridgeObjectRetain();
  v6 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 96) = v6;
  *(_QWORD *)(inited + 104) = 1751347809;
  *(_QWORD *)(inited + 112) = 0xE400000000000000;
  *(_QWORD *)(inited + 120) = sub_23A890148();
  strcpy((char *)(inited + 128), "binaryCDHash");
  *(_BYTE *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(_QWORD *)(inited + 144) = sub_23A890148();
  strcpy((char *)(inited + 152), "binaryLocation");
  *(_BYTE *)(inited + 167) = -18;
  v7 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 168) = v7;
  *(_QWORD *)(inited + 176) = 0x61507972616E6962;
  *(_QWORD *)(inited + 184) = 0xEA00000000006874;
  *(_QWORD *)(inited + 192) = sub_23A890148();
  strcpy((char *)(inited + 200), "binaryTeamID");
  *(_BYTE *)(inited + 213) = 0;
  *(_WORD *)(inited + 214) = -5120;
  *(_QWORD *)(inited + 216) = sub_23A890148();
  *(_QWORD *)(inited + 224) = 0x55557972616E6962;
  *(_QWORD *)(inited + 232) = 0xEA00000000004449;
  *(_QWORD *)(inited + 240) = sub_23A890148();
  strcpy((char *)(inited + 248), "binaryVersion");
  *(_WORD *)(inited + 262) = -4864;
  *(_QWORD *)(inited + 264) = sub_23A890148();
  *(_QWORD *)(inited + 272) = 0x48444362696C7964;
  *(_QWORD *)(inited + 280) = 0xEB00000000687361;
  *(_QWORD *)(inited + 288) = sub_23A890148();
  strcpy((char *)(inited + 296), "dylibLocation");
  *(_WORD *)(inited + 310) = -4864;
  v8 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 312) = v8;
  *(_QWORD *)(inited + 320) = 0x74615062696C7964;
  *(_QWORD *)(inited + 328) = 0xE900000000000068;
  *(_QWORD *)(inited + 336) = sub_23A890148();
  *(_QWORD *)(inited + 344) = 0x61655462696C7964;
  *(_QWORD *)(inited + 352) = 0xEB0000000044496DLL;
  *(_QWORD *)(inited + 360) = sub_23A890148();
  *(_QWORD *)(inited + 368) = 0x49555562696C7964;
  *(_QWORD *)(inited + 376) = 0xE900000000000044;
  *(_QWORD *)(inited + 384) = sub_23A890148();
  strcpy((char *)(inited + 392), "dylibVersion");
  *(_BYTE *)(inited + 405) = 0;
  *(_WORD *)(inited + 406) = -5120;
  *(_QWORD *)(inited + 408) = sub_23A890148();
  *(_QWORD *)(inited + 416) = 0x656372756F73;
  *(_QWORD *)(inited + 424) = 0xE600000000000000;
  *(_QWORD *)(inited + 432) = sub_23A890148();
  *(_QWORD *)(inited + 440) = 0x614E6C6F626D7973;
  *(_QWORD *)(inited + 448) = 0xEA0000000000656DLL;
  *(_QWORD *)(inited + 456) = sub_23A890148();
  strcpy((char *)(inited + 464), "symbolOffset");
  *(_BYTE *)(inited + 477) = 0;
  *(_WORD *)(inited + 478) = -5120;
  *(_QWORD *)(inited + 480) = sub_23A890148();
  *(_QWORD *)(inited + 488) = 0x794472656C6C6163;
  *(_QWORD *)(inited + 496) = 0xEF6874615062696CLL;
  *(_QWORD *)(inited + 504) = sub_23A890148();
  *(_QWORD *)(inited + 512) = 0xD000000000000010;
  *(_QWORD *)(inited + 520) = 0x800000023A892D80;
  *(_QWORD *)(inited + 528) = sub_23A890148();
  v9 = sub_23A873024(inited);
  sub_23A874644(0, &qword_2569C5EB8);
  v10 = sub_23A890310();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_23A880BB0(v10, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  a3(v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A88E474(uint64_t a1, uint64_t a2, void (*a3)(unint64_t))
{
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A891150;
  *(_QWORD *)(inited + 32) = 0x6C646E7542707061;
  *(_QWORD *)(inited + 40) = 0xEB00000000444965;
  swift_bridgeObjectRetain();
  v4 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = 0xD000000000000010;
  *(_QWORD *)(inited + 64) = 0x800000023A892EF0;
  swift_bridgeObjectRetain();
  v5 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0x656D614E707061;
  *(_QWORD *)(inited + 88) = 0xE700000000000000;
  swift_bridgeObjectRetain();
  v6 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 96) = v6;
  *(_QWORD *)(inited + 104) = 1751347809;
  *(_QWORD *)(inited + 112) = 0xE400000000000000;
  *(_QWORD *)(inited + 120) = sub_23A890148();
  strcpy((char *)(inited + 128), "binaryCDHash");
  *(_BYTE *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(_QWORD *)(inited + 144) = sub_23A890148();
  strcpy((char *)(inited + 152), "binaryLocation");
  *(_BYTE *)(inited + 167) = -18;
  v7 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 168) = v7;
  *(_QWORD *)(inited + 176) = 0x61507972616E6962;
  *(_QWORD *)(inited + 184) = 0xEA00000000006874;
  *(_QWORD *)(inited + 192) = sub_23A890148();
  strcpy((char *)(inited + 200), "binaryTeamID");
  *(_BYTE *)(inited + 213) = 0;
  *(_WORD *)(inited + 214) = -5120;
  *(_QWORD *)(inited + 216) = sub_23A890148();
  *(_QWORD *)(inited + 224) = 0x55557972616E6962;
  *(_QWORD *)(inited + 232) = 0xEA00000000004449;
  *(_QWORD *)(inited + 240) = sub_23A890148();
  strcpy((char *)(inited + 248), "binaryVersion");
  *(_WORD *)(inited + 262) = -4864;
  *(_QWORD *)(inited + 264) = sub_23A890148();
  *(_QWORD *)(inited + 272) = 0x48444362696C7964;
  *(_QWORD *)(inited + 280) = 0xEB00000000687361;
  *(_QWORD *)(inited + 288) = sub_23A890148();
  strcpy((char *)(inited + 296), "dylibLocation");
  *(_WORD *)(inited + 310) = -4864;
  v8 = sub_23A890148();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 312) = v8;
  *(_QWORD *)(inited + 320) = 0x74615062696C7964;
  *(_QWORD *)(inited + 328) = 0xE900000000000068;
  *(_QWORD *)(inited + 336) = sub_23A890148();
  *(_QWORD *)(inited + 344) = 0x61655462696C7964;
  *(_QWORD *)(inited + 352) = 0xEB0000000044496DLL;
  *(_QWORD *)(inited + 360) = sub_23A890148();
  *(_QWORD *)(inited + 368) = 0x49555562696C7964;
  *(_QWORD *)(inited + 376) = 0xE900000000000044;
  *(_QWORD *)(inited + 384) = sub_23A890148();
  strcpy((char *)(inited + 392), "dylibVersion");
  *(_BYTE *)(inited + 405) = 0;
  *(_WORD *)(inited + 406) = -5120;
  *(_QWORD *)(inited + 408) = sub_23A890148();
  *(_QWORD *)(inited + 416) = 0x656372756F73;
  *(_QWORD *)(inited + 424) = 0xE600000000000000;
  *(_QWORD *)(inited + 432) = sub_23A890148();
  *(_QWORD *)(inited + 440) = 0x614E6C6F626D7973;
  *(_QWORD *)(inited + 448) = 0xEA0000000000656DLL;
  *(_QWORD *)(inited + 456) = sub_23A890148();
  strcpy((char *)(inited + 464), "symbolOffset");
  *(_BYTE *)(inited + 477) = 0;
  *(_WORD *)(inited + 478) = -5120;
  *(_QWORD *)(inited + 480) = sub_23A890148();
  *(_QWORD *)(inited + 488) = 0x794472656C6C6163;
  *(_QWORD *)(inited + 496) = 0xEF6874615062696CLL;
  *(_QWORD *)(inited + 504) = sub_23A890148();
  *(_QWORD *)(inited + 512) = 0xD000000000000010;
  *(_QWORD *)(inited + 520) = 0x800000023A892D80;
  *(_QWORD *)(inited + 528) = sub_23A890148();
  v9 = sub_23A873024(inited);
  sub_23A874644(0, &qword_2569C5EB8);
  v10 = sub_23A890310();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_23A880BB0(v10, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  a3(v9);
  return swift_bridgeObjectRelease();
}

void sub_23A88E9E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  id v19;

  sub_23A8902C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v10 = swift_allocObject();
  v11 = MEMORY[0x24BEE3F88];
  *(_OWORD *)(v10 + 16) = xmmword_23A890C00;
  v12 = MEMORY[0x24BEE3FF0];
  *(_QWORD *)(v10 + 56) = v11;
  *(_QWORD *)(v10 + 64) = v12;
  *(_DWORD *)(v10 + 32) = a1;
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v13 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  type metadata accessor for MicrostackshotsParser();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = xmmword_23A890ED0;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 72) = 0u;
  *(_OWORD *)(v14 + 88) = 0u;
  *(_QWORD *)(v14 + 104) = 0;
  swift_retain();
  sub_23A890028();
  v15 = OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval;
  *(_QWORD *)(v14 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval) = 0;
  *(_BYTE *)(v14 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_thirdPartyOnly) = 2;
  *(_DWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = a5;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = *(double *)(v14 + v15);
  swift_retain();
  if (v17 == 0.0)
  {
    v19 = sub_23A877FAC(a1);
    sub_23A8791FC(v19);
    sub_23A87990C(v18);
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_symbolicate);
    objc_msgSend(v19, sel_postprocess);
    sub_23A875868((uint64_t)sub_23A88F060, v16, v19);
    swift_release();
    swift_release();

  }
  else
  {
    sub_23A875794((uint64_t)sub_23A88F060, v16);
    swift_release();
    swift_release();
  }
}

uint64_t sub_23A88EC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v25 = a4;
  v26 = a2;
  v10 = sub_23A890034();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8902C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5708);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23A890C00;
  v15 = sub_23A890274();
  v17 = v16;
  *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v14 + 64) = sub_23A8742A0();
  *(_QWORD *)(v14 + 32) = v15;
  *(_QWORD *)(v14 + 40) = v17;
  sub_23A874644(0, (unint64_t *)&qword_2569C5AF0);
  v18 = (void *)sub_23A89034C();
  sub_23A890064();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  type metadata accessor for MicrostackshotsParser();
  swift_allocObject();
  swift_retain();
  v19 = sub_23A87569C((uint64_t)v13, 1, v25, a5, a6);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v26;
  *(_QWORD *)(v20 + 24) = a3;
  if (*(double *)(v19 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval) == 0.0)
  {
    v21 = *(_DWORD *)(v19 + 16);
    swift_retain();
    swift_retain();
    v22 = sub_23A877FAC(v21);
    sub_23A8791FC(v22);
    sub_23A87990C(v23);
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_symbolicate);
    objc_msgSend(v22, sel_postprocess);
    sub_23A875868((uint64_t)sub_23A88F068, v20, v22);
    swift_release();
    swift_release();

  }
  else
  {
    swift_retain();
    swift_retain();
    sub_23A875794((uint64_t)sub_23A88F068, v20);
    swift_release();
    swift_release();
  }
  return swift_release();
}

void sub_23A88EEC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v2 = sub_23A890034();
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for TargetType(0);
  MEMORY[0x24BDAC7A8](v3);
  sub_23A883BBC(a1, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (char *)sub_23A88EF9C + 4 * byte_23A8915AA[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A88EF9C()
{
  uint64_t v0;

  return sub_23A883C00(v0);
}

uint64_t sub_23A88F03C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A88F060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A88E474(a1, a2, *(void (**)(unint64_t))(v2 + 16));
}

uint64_t sub_23A88F068(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A88DEE4(a1, a2, *(void (**)(unint64_t))(v2 + 16));
}

uint64_t *initializeBufferWithCopyOfBuffer for TargetType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  unsigned int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      v10 = sub_23A890034();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
      *(uint64_t *)((char *)a1 + *(int *)(v11 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v11 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for TargetType(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 4)
  {
    v3 = sub_23A890034();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (result <= 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for TargetType(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    v8 = sub_23A890034();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
    *(_QWORD *)((char *)a1 + *(int *)(v9 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v9 + 48));
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for TargetType(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_23A883C00((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      v7 = sub_23A890034();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
      *(_QWORD *)((char *)a1 + *(int *)(v8 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v8 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for TargetType(uint64_t a1)
{
  return sub_23A88FBDC(a1, qword_2569C6338);
}

char *initializeWithTake for TargetType(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 4)
  {
    v6 = sub_23A890034();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
    *(_QWORD *)&a1[*(int *)(v7 + 48)] = *(_QWORD *)&a2[*(int *)(v7 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for TargetType(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A883C00((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      v6 = sub_23A890034();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
      *(_QWORD *)&a1[*(int *)(v7 + 48)] = *(_QWORD *)&a2[*(int *)(v7 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TargetType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for TargetType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A88F57C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A88F58C()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  v3 = &unk_23A8915D0;
  v4 = &unk_23A8915D0;
  v5 = MEMORY[0x24BEE0170] + 64;
  v6 = MEMORY[0x24BEE0170] + 64;
  result = sub_23A890034();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v7 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_23A88F624(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(type metadata accessor for TargetType(0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      v9 = sub_23A890034();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
      *(uint64_t *)((char *)a1 + *(int *)(v10 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v10 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A88F744(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for TargetType(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 4)
  {
    v3 = sub_23A890034();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (result <= 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_23A88F7BC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unsigned int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for TargetType(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    v7 = sub_23A890034();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
    *(_QWORD *)((char *)a1 + *(int *)(v8 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v8 + 48));
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_23A88F8B4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unsigned int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A883C00((uint64_t)a1);
    v4 = type metadata accessor for TargetType(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      v6 = sub_23A890034();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
      *(_QWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v7 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *sub_23A88F9CC(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for TargetType(0);
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    v5 = sub_23A890034();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
    *(_QWORD *)&a1[*(int *)(v6 + 48)] = *(_QWORD *)&a2[*(int *)(v6 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  return a1;
}

char *sub_23A88FA78(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A883C00((uint64_t)a1);
    v4 = type metadata accessor for TargetType(0);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      v5 = sub_23A890034();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5720);
      *(_QWORD *)&a1[*(int *)(v6 + 48)] = *(_QWORD *)&a2[*(int *)(v6 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23A88FB34()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A88FB40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TargetType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23A88FB7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A88FB88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TargetType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AnalyzableTarget(uint64_t a1)
{
  return sub_23A88FBDC(a1, qword_2569C63C8);
}

uint64_t sub_23A88FBDC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A88FC10()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TargetType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A88FC78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v2 = sub_23A88FFBC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_23A89022C() & 1) != 0 || (sub_23A89022C() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  sub_23A88FF80();
  v7 = sub_23A88FF68();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v16 = v7;
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    v13 = (void *)sub_23A890148();
    v14 = (id)nm_OSASanitizePath();

    if (!v14)
      return 0;
    a1 = sub_23A89016C();

    return a1;
  }
  v9 = v16;
  v15 = v16 + 32;
  sub_23A8724FC();
  v10 = 0;
  v11 = (uint64_t *)(v9 + 40);
  while (1)
  {
    v12 = *v11;
    v17 = *(v11 - 1);
    v18 = v12;
    v21 = 1886413102;
    v22 = 0xE400000000000000;
    if ((sub_23A8903A0() & 1) != 0)
      break;
    v11 += 2;
    if (v8 == ++v10)
      goto LABEL_9;
  }
  if (*(_QWORD *)(v16 + 16) >= v8)
  {
    v17 = v16;
    v18 = v15;
    v19 = v10;
    v20 = (2 * v8) | 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C5D90);
    sub_23A87EA4C();
    a1 = sub_23A890130();
    swift_bridgeObjectRelease();
    return a1;
  }
  __break(1u);
  return sub_23A88FEA8();
}

uint64_t sub_23A88FEA8()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_23A88FEB4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23A88FEC0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23A88FECC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23A88FED8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23A88FEE4()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23A88FEF0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23A88FEFC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23A88FF08()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23A88FF14()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_23A88FF20()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_23A88FF2C()
{
  return MEMORY[0x24BDCC748]();
}

uint64_t sub_23A88FF38()
{
  return MEMORY[0x24BDCC758]();
}

uint64_t sub_23A88FF44()
{
  return MEMORY[0x24BDCC768]();
}

uint64_t sub_23A88FF50()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23A88FF5C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A88FF68()
{
  return MEMORY[0x24BDCD830]();
}

uint64_t sub_23A88FF74()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_23A88FF80()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23A88FF8C()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_23A88FF98()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23A88FFA4()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23A88FFB0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_23A88FFBC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A88FFC8()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23A88FFD4()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23A88FFE0()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23A88FFEC()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23A88FFF8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A890004()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23A890010()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23A89001C()
{
  return MEMORY[0x24BDCE8C8]();
}

uint64_t sub_23A890028()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23A890034()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A890040()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A89004C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23A890058()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A890064()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23A890070()
{
  return MEMORY[0x24BEE5448]();
}

uint64_t sub_23A89007C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A890088()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_23A890094()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A8900A0()
{
  return MEMORY[0x24BEE54F0]();
}

uint64_t sub_23A8900AC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A8900B8()
{
  return MEMORY[0x24BEE55C0]();
}

uint64_t sub_23A8900C4()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_23A8900D0()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_23A8900DC()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_23A8900E8()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_23A8900F4()
{
  return MEMORY[0x24BDC6348]();
}

uint64_t sub_23A890100()
{
  return MEMORY[0x24BDC6B38]();
}

uint64_t sub_23A89010C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A890118()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A890124()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23A890130()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23A89013C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A890148()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A890154()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23A890160()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23A89016C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A890178()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23A890184()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23A890190()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23A89019C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A8901A8()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23A8901B4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A8901C0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A8901CC()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23A8901D8()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_23A8901E4()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_23A8901F0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A8901FC()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23A890208()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23A890214()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23A890220()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23A89022C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23A890238()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_23A890244()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23A890250()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23A89025C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A890268()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A890274()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_23A890280()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23A89028C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23A890298()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_23A8902A4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A8902B0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A8902BC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A8902C8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A8902D4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23A8902E0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23A8902EC()
{
  return MEMORY[0x24BEE5788]();
}

uint64_t sub_23A8902F8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23A890304()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_23A890310()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23A89031C()
{
  return MEMORY[0x24BDD02E0]();
}

uint64_t sub_23A890328()
{
  return MEMORY[0x24BDD02E8]();
}

uint64_t sub_23A890334()
{
  return MEMORY[0x24BDD0308]();
}

uint64_t sub_23A890340()
{
  return MEMORY[0x24BDD0328]();
}

uint64_t sub_23A89034C()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_23A890358()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A890364()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A890370()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23A89037C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23A890388()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_23A890394()
{
  return MEMORY[0x24BDD0618]();
}

uint64_t sub_23A8903A0()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23A8903AC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A8903B8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A8903C4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A8903D0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A8903DC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A8903E8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A8903F4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A890400()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A89040C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A890418()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_23A890424()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_23A890430()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A89043C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A890448()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A890454()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A890460()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A89046C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A890478()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23A890484()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A890490()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A89049C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A8904A8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A8904B4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A8904C0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A8904CC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A8904D8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A8904E4()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23A8904F0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A8904FC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A890508()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x24BE286C0]();
}

uint64_t CSDemangleSymbolName()
{
  return MEMORY[0x24BE286C8]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x24BE28758]();
}

uint64_t CSSymbolOwnerForeachSymbol()
{
  return MEMORY[0x24BE28798]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x24BE287A8]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x24BE287B8]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x24BE287D0]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x24BE28880]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x24BE28898]();
}

uint64_t CSUUIDCFUUIDBytesToString()
{
  return MEMORY[0x24BE28930]();
}

uint64_t OSASanitizePath()
{
  return MEMORY[0x24BE6DFE0]();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x24BDE89E0](code, *(_QWORD *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x24BDE8D28](path, *(_QWORD *)&flags, staticCode);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x24BDACA50]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x24BDAE108]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

const char *__cdecl macho_arch_name_for_mach_header(const mach_header *mh)
{
  return (const char *)MEMORY[0x24BDAECC8](mh);
}

uint64_t macho_dylib_install_name()
{
  return MEMORY[0x24BDAECD0]();
}

uint64_t macho_for_each_defined_rpath()
{
  return MEMORY[0x24BDAECD8]();
}

uint64_t macho_for_each_dependent_dylib()
{
  return MEMORY[0x24BDAECE0]();
}

uint64_t macho_for_each_exported_symbol()
{
  return MEMORY[0x24BDAECE8]();
}

uint64_t macho_for_each_imported_symbol()
{
  return MEMORY[0x24BDAECF0]();
}

int macho_for_each_slice(const char *path, void *callback)
{
  return MEMORY[0x24BDAECF8](path, callback);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t systemstats_get_microstackshots()
{
  return MEMORY[0x24BEDE3E8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

