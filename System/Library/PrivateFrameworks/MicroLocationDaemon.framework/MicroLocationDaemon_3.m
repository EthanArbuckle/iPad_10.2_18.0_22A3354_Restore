uint64_t sub_241B7FDC8()
{
  return MEMORY[0x24BDC64F8]();
}

uint64_t sub_241B7FDD4()
{
  return MEMORY[0x24BDC6518]();
}

uint64_t sub_241B7FDE0()
{
  return MEMORY[0x24BDC6588]();
}

uint64_t sub_241B7FDEC()
{
  return MEMORY[0x24BDC65A0]();
}

uint64_t sub_241B7FDF8()
{
  return MEMORY[0x24BDC65C0]();
}

uint64_t sub_241B7FE04()
{
  return MEMORY[0x24BDC65D8]();
}

uint64_t sub_241B7FE10()
{
  return MEMORY[0x24BDC6618]();
}

uint64_t sub_241B7FE1C()
{
  return MEMORY[0x24BDC6630]();
}

uint64_t sub_241B7FE28()
{
  return MEMORY[0x24BDC6640]();
}

uint64_t sub_241B7FE34()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_241B7FE40()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_241B7FE4C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_241B7FE58()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_241B7FE64()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_241B7FE70()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_241B7FE7C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_241B7FE88()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_241B7FE94()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_241B7FEA0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_241B7FEAC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_241B7FEB8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_241B7FEC4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_241B7FED0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_241B7FEDC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_241B7FEE8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_241B7FEF4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_241B7FF00()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_241B7FF0C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_241B7FF18()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_241B7FF24()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_241B7FF30()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_241B7FF3C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_241B7FF48()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_241B7FF54()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_241B7FF60()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_241B7FF6C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x24BE85860]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

uint64_t CPSqliteDatabaseDelete()
{
  return MEMORY[0x24BE04738]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x24BDD8808]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x24BE67120]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x24BE74F60]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x24BDE89F0](*(_QWORD *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

uint64_t ULLocationTypeToString()
{
  return MEMORY[0x24BE669A8]();
}

uint64_t ULServiceQualityReasonToString()
{
  return MEMORY[0x24BE669B0]();
}

uint64_t ULServiceQualityToString()
{
  return MEMORY[0x24BE669B8]();
}

uint64_t ULServiceStateToString()
{
  return MEMORY[0x24BE669C0]();
}

uint64_t ULServiceSuspendReasonToString()
{
  return MEMORY[0x24BE669C8]();
}

uint64_t ULServiceTypeToString()
{
  return MEMORY[0x24BE669D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, const void *a2)
{
  return MEMORY[0x24BEDD670](this, a2);
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
  MEMORY[0x24BEDD698](this);
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return MEMORY[0x24BEDD6A8]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD6D8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6E0](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD6E8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6F8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD700](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD708](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD720](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD728](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x24BEDD748](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x24BEDD778](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x24BEDD7E0]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
  MEMORY[0x24BEDD7E8](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x24BEDD7F0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::OnShutdown(wireless_diagnostics::google::protobuf::internal *this, void (*a2)(void))
{
  return MEMORY[0x24BEDD808](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x24BEDD810]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x24BEDD960](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return MEMORY[0x24BEDD968]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return MEMORY[0x24BEDD970]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD978](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD988](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD998](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return MEMORY[0x24BEDD9B0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9B8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9C0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9D8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline()
{
  return MEMORY[0x24BEDD9F8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return MEMORY[0x24BEDDA10]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return MEMORY[0x24BEDDA18](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDDA20](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDDA28](this, a2, a3, a4);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
  MEMORY[0x24BEDDA38](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap()
{
  return MEMORY[0x24BEDDA40]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x24BEDDA48](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  return MEMORY[0x24BEDDA50](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete()
{
  return MEMORY[0x24BEDDA58]();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2)
{
  return MEMORY[0x24BEDDA90](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDDAB8](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB58](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB60](this);
}

{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC60](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAEC8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF08]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x24BEDB3A8]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x24BEDB648](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  MEMORY[0x24BEDB658](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_2511D1968();
}

void operator delete(void *__p)
{
  off_2511D1970(__p);
}

uint64_t operator delete()
{
  return off_2511D1978();
}

uint64_t operator new[]()
{
  return off_2511D1980();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2511D1988(__sz);
}

uint64_t operator new()
{
  return off_2511D1990();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x24BEDB938](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void cblas_dgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const double __alpha, const double *__A, const int __lda, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
  MEMORY[0x24BDB2AD8](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

double cblas_dnrm2(const int __N, const double *__X, const int __incX)
{
  double result;

  MEMORY[0x24BDB2AF8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_dscal(const int __N, const double __alpha, double *__X, const int __incX)
{
  MEMORY[0x24BDB2B08](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __alpha);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x24BDADA40]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x24BDADB28]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x24BDADB78]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

double nan(const char *a1)
{
  double result;

  MEMORY[0x24BDAEFF8](a1);
  return result;
}

long double nextafter(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF110](__x, __y);
  return result;
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_config(int a1, ...)
{
  return MEMORY[0x24BEDE090](*(_QWORD *)&a1);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x24BEDE0D0](db, zDbName);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x24BEDE0E0](db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x24BEDE130](a1, *(_QWORD *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x24BEDE138](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_limit(sqlite3 *a1, int id, int newVal)
{
  return MEMORY[0x24BEDE190](a1, *(_QWORD *)&id, *(_QWORD *)&newVal);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_shutdown(void)
{
  return MEMORY[0x24BEDE270]();
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x24BEDE2A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x24BEDE398](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x24BDB0BC0]();
}

