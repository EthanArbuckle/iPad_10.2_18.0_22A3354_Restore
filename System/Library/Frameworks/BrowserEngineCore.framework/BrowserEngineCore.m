uint64_t be_memory_inline_jit_restrict_rwx_to_rw_with_witness_impl(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  __dmb(0xAu);
  if (MEMORY[0xFFFFFC10C] == 1)
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC110]);
  else
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC110]);
  __dmb(0xAu);
  __isb(0xFu);
  if (a2 != 4868436 || v2 != a1)
  {
    __break(0xC471u);
    JUMPOUT(0x23305A5FCLL);
  }
  return 0;
}

uint64_t be_memory_inline_jit_restrict_rwx_to_rx_with_witness_impl()
{
  uint64_t v0;
  unint64_t StatusReg;

  __dmb(0xAu);
  v0 = MEMORY[0xFFFFFC118];
  if (MEMORY[0xFFFFFC10C] == 1)
  {
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC118]);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7));
  }
  else
  {
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC118]);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5));
  }
  if (v0 != StatusReg)
  {
    __break(0xC471u);
    JUMPOUT(0x23305A6C8);
  }
  __isb(0xFu);
  return 0;
}

BOOL be_memory_inline_jit_restrict_with_witness_supported()
{
  return MEMORY[0xFFFFFC10C] && MEMORY[0xFFFFFC10C] - 1 < 3;
}

BOOL _BECheckEntitlmentForAuditToken(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  return +[_BESwiftCBridge checkEntitlement:forAuditToken:](_BESwiftCBridge, "checkEntitlement:forAuditToken:", a1, v4);
}

BOOL _BECheckEntitlmentForCurrentProcess(uint64_t a1)
{
  return +[_BESwiftCBridge checkEntitlementForCurrentProcess:](_BESwiftCBridge, "checkEntitlementForCurrentProcess:", a1);
}

BrowserEngineCore::BrowserEngineEntitlement_optional __swiftcall BrowserEngineEntitlement.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  uint64_t countAndFlagsBits;
  char *v4;
  BrowserEngineCore::BrowserEngineEntitlement_optional result;
  char v6;
  char v7;

  object = rawValue._object;
  countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  if (rawValue._countAndFlagsBits == 0xD00000000000002BLL && rawValue._object == (void *)0x800000023305BAB0
    || (sub_23305B718() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 0;
  }
  else if (countAndFlagsBits == 0xD000000000000031 && object == (void *)0x800000023305BAE0
         || (sub_23305B718() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 1;
  }
  else if (countAndFlagsBits == 0xD000000000000031 && object == (void *)0x800000023305BB20
         || (sub_23305B718() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 2;
  }
  else if (countAndFlagsBits == 0xD000000000000030 && object == (void *)0x800000023305BB60)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 3;
  }
  else
  {
    v7 = sub_23305B718();
    result.value = swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      v6 = 3;
    else
      v6 = 4;
  }
  *v4 = v6;
  return result;
}

uint64_t BrowserEngineEntitlement.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23305A9A0 + 4 * byte_23305B8C0[*v0]))(0xD00000000000002BLL, 0x800000023305BAB0);
}

unint64_t sub_23305A9A0()
{
  return 0xD000000000000031;
}

uint64_t sub_23305A9C8@<X0>(uint64_t a1@<X8>)
{
  return a1 - 1;
}

uint64_t BrowserEngineEntitlement.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23305AA18 + 4 * byte_23305B8C4[*v0]))(0xD00000000000002BLL, 0x800000023305BAB0);
}

unint64_t sub_23305AA18()
{
  return 0xD000000000000031;
}

uint64_t sub_23305AA40@<X0>(uint64_t a1@<X8>)
{
  return a1 - 1;
}

void sub_23305AA58(char *a1)
{
  sub_23305AAAC(*a1);
}

unint64_t sub_23305AA68()
{
  unint64_t result;

  result = qword_256031688;
  if (!qword_256031688)
  {
    result = MEMORY[0x23492D5E8](&protocol conformance descriptor for BrowserEngineEntitlement, &type metadata for BrowserEngineEntitlement);
    atomic_store(result, (unint64_t *)&qword_256031688);
  }
  return result;
}

void sub_23305AAAC(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23305AAFC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23305AB58 + 4 * byte_23305B8CC[a2]))(0xD000000000000031);
}

uint64_t sub_23305AB58(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000031 && v1 == 0x800000023305BAE0)
    v2 = 1;
  else
    v2 = sub_23305B718();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23305ABF0()
{
  char *v0;

  sub_23305ABF8(*v0);
}

void sub_23305ABF8(char a1)
{
  sub_23305B724();
  __asm { BR              X10 }
}

uint64_t sub_23305AC54()
{
  sub_23305B700();
  swift_bridgeObjectRelease();
  return sub_23305B730();
}

void sub_23305ACC0(uint64_t a1)
{
  char *v1;

  sub_23305ACC8(a1, *v1);
}

void sub_23305ACC8(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23305AD10()
{
  sub_23305B700();
  return swift_bridgeObjectRelease();
}

void sub_23305AD64(uint64_t a1)
{
  char *v1;

  sub_23305AD6C(a1, *v1);
}

void sub_23305AD6C(uint64_t a1, char a2)
{
  sub_23305B724();
  __asm { BR              X10 }
}

uint64_t sub_23305ADC4()
{
  sub_23305B700();
  swift_bridgeObjectRelease();
  return sub_23305B730();
}

BrowserEngineCore::BrowserEngineEntitlement_optional sub_23305AE30(Swift::String *a1)
{
  return BrowserEngineEntitlement.init(rawValue:)(*a1);
}

uint64_t sub_23305AE3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = BrowserEngineEntitlement.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrowserEngineEntitlement(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BrowserEngineEntitlement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23305AF50 + 4 * byte_23305B8E1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23305AF84 + 4 * byte_23305B8DC[v4]))();
}

uint64_t sub_23305AF84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23305AF8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23305AF94);
  return result;
}

uint64_t sub_23305AFA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23305AFA8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23305AFAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23305AFB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23305AFC0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23305AFCC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BrowserEngineEntitlement()
{
  return &type metadata for BrowserEngineEntitlement;
}

uint64_t initializeBufferWithCopyOfBuffer for AuditToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditToken(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AuditToken(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256031690)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256031690);
  }
}

__int128 *sub_23305B0C0()
{
  __int128 *result;
  __int128 v1;

  result = (__int128 *)objc_msgSend((id)objc_opt_self(), sel_auditTokenForCurrentProcess);
  if (result)
  {
    v1 = result[1];
    xmmword_256031698 = *result;
    *(_OWORD *)&qword_2560316A8 = v1;
  }
  else
  {
    result = (__int128 *)sub_23305B70C();
    __break(1u);
  }
  return result;
}

void __swiftcall AuditToken.init(_:)(BrowserEngineCore::AuditToken *__return_ptr retstr, audit_token_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)retstr->inner.val = a2;
  *(_QWORD *)&retstr->inner.val[2] = v2;
  *(_QWORD *)&retstr->inner.val[4] = v3;
  *(_QWORD *)&retstr->inner.val[6] = v4;
}

double static AuditToken.current.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (qword_256031680 != -1)
    swift_once();
  result = *(double *)&xmmword_256031698;
  v3 = *(_OWORD *)&qword_2560316A8;
  *a1 = xmmword_256031698;
  a1[1] = v3;
  return result;
}

uint64_t AuditToken.inner.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AuditToken.pid.getter()
{
  _OWORD *v0;
  __int128 v1;
  audit_token_t v3;

  v1 = v0[1];
  *(_OWORD *)v3.val = *v0;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3);
}

uint64_t sub_23305B1FC()
{
  uint64_t v0;
  uint64_t result;
  unsigned __int8 v2;

  sub_23305B6F4();
  v0 = xpc_copy_entitlement_for_token();
  swift_release();
  if (!v0)
    return 2;
  result = _CFXPCCreateCFObjectFromXPCObject();
  if (result)
  {
    swift_unknownObjectRelease();
    if (swift_dynamicCast())
      return v2;
    else
      return 2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall AuditToken.has(browserEngineEntitlement:)(BrowserEngineCore::BrowserEngineEntitlement browserEngineEntitlement)
{
  Swift::Bool result;

  __asm { BR              X11 }
  return result;
}

uint64_t sub_23305B334()
{
  char v0;

  v0 = sub_23305B1FC();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

id sub_23305B478()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwiftCBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SwiftCBridge()
{
  return objc_opt_self();
}

void sub_23305B4C8(uint64_t a1, void *a2)
{
  Swift::String v4;

  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  BrowserEngineEntitlement.init(rawValue:)(v4);
  __asm { BR              X11 }
}

uint64_t sub_23305B550()
{
  char v0;

  v0 = sub_23305B1FC();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_23305B5D4(uint64_t a1, void *a2)
{
  Swift::String v4;
  char v6;

  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  BrowserEngineEntitlement.init(rawValue:)(v4);
  if (v6 != 4)
  {
    if (qword_256031680 != -1)
      swift_once();
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t sub_23305B6E8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23305B6F4()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23305B700()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23305B70C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23305B718()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23305B724()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23305B730()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

