@implementation _NSSwiftCalendar

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _NSSwiftCalendar *v5;

  v4 = a3;
  v5 = self;
  _NSSwiftCalendar.encode(with:)((NSCoder)v4);

}

- (Class)classForCoder
{
  _NSSwiftCalendar *v2;

  v2 = self;
  _NSSwiftCalendar.classForCoder.getter();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  swift_release();
}

- (int64_t)firstWeekday
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftCalendar *v5;
  uint64_t v6;
  uint64_t ObjectType;
  int64_t v8;
  __int128 v10;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 32);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftCalendar.calendar.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  v6 = *((_QWORD *)&v10 + 1);
  ObjectType = swift_getObjectType();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 56))(ObjectType, v6);

  swift_unknownObjectRelease();
  return v8;
}

- (int64_t)minimumDaysInFirstWeek
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftCalendar *v5;
  uint64_t v6;
  uint64_t ObjectType;
  int64_t v8;
  __int128 v10;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 32);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftCalendar.calendar.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  v6 = *((_QWORD *)&v10 + 1);
  ObjectType = swift_getObjectType();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 72))(ObjectType, v6);

  swift_unknownObjectRelease();
  return v8;
}

- (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6
{
  int v7;
  uint64_t v9;
  uint64_t v10;
  _NSSwiftCalendar *v11;
  Class isa;
  uint64_t __dst[36];
  uint64_t v15;
  _BYTE __src[288];

  v7 = a3;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  __dst[0] = v9;
  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  v15 = v10;
  v11 = self;
  _NSSwiftCalendar.components(_:from:to:options:)(v7, __dst, &v15, __src);

  memcpy(__dst, __src, 0x11AuLL);
  isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__src);
  return isa;
}

- (id)_components:(unint64_t)a3 fromDate:(id)a4
{
  int v4;
  double v6;
  _NSSwiftCalendar *v7;
  Class isa;
  double v10[36];
  _BYTE __src[288];

  v4 = a3;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v10[0] = v6;
  v7 = self;
  _NSSwiftCalendar._components(_:from:)(v4, v10, __src);

  memcpy(v10, __src, 0x11AuLL);
  isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__src);
  return isa;
}

- (id)copyWithZone:(void *)a3
{
  _NSSwiftCalendar *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  _NSSwiftCalendar.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (NSTimeZone)timeZone
{
  _NSSwiftCalendar *v2;
  uint64_t v3;
  uint64_t ObjectType;
  void *v5;
  __int128 v7;

  v2 = self;
  _NSSwiftCalendar.timeZone.getter(&v7);

  if (!(_QWORD)v7)
    return (NSTimeZone *)0;
  v3 = *((_QWORD *)&v7 + 1);
  ObjectType = swift_getObjectType();
  v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 120))(ObjectType, v3);
  swift_unknownObjectRelease();
  return (NSTimeZone *)v5;
}

- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4 toDate:(id)a5 options:(unint64_t)a6
{
  return @objc _NSSwiftCalendar.date(byAdding:value:to:options:)(self, (int)a2, a3, a4, a5, a6, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t *, uint64_t))_NSSwiftCalendar.date(byAdding:value:to:options:));
}

- (void)getHour:(int64_t *)a3 minute:(int64_t *)a4 second:(int64_t *)a5 nanosecond:(int64_t *)a6 fromDate:(id)a7
{
  @objc _NSSwiftCalendar.getEra(_:year:month:day:from:)(self, (int)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))_NSSwiftCalendar.getHour(_:minute:second:nanosecond:from:));
}

- (_NSSwiftCalendar)initWithCoder:(id)a3
{
  return (_NSSwiftCalendar *)_NSSwiftCalendar.init(coder:)(a3);
}

- (void)setFirstWeekday:(int64_t)a3
{
  @objc _NSSwiftCalendar.firstWeekday.setter((char *)self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftCalendar.firstWeekday.setter);
}

- (void)setMinimumDaysInFirstWeek:(int64_t)a3
{
  @objc _NSSwiftCalendar.firstWeekday.setter((char *)self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *))partial apply for closure #1 in _NSSwiftCalendar.minimumDaysInFirstWeek.setter);
}

- (void)setTimeZone:(id)a3
{
  _NSSwiftCalendar *v3;
  os_unfair_lock_s *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  _NSSwiftCalendar *v8;

  v3 = self;
  if (a3)
  {
    type metadata accessor for _NSSwiftTimeZone();
    if (swift_dynamicCastClass())
    {
      self = (_NSSwiftCalendar *)swift_unknownObjectRetain();
    }
    else
    {
      type metadata accessor for _TimeZoneBridged();
      *(_QWORD *)(swift_allocObject() + 16) = a3;
      lazy protocol witness table accessor for type CFDictionaryRef and conformance CFDictionaryRef(&lazy protocol witness table cache variable for type _TimeZoneBridged and conformance _TimeZoneBridged, (uint64_t (*)(uint64_t))type metadata accessor for _TimeZoneBridged, (uint64_t)&protocol conformance descriptor for _TimeZoneBridged);
      self = (_NSSwiftCalendar *)a3;
    }
  }
  MEMORY[0x1E0C80A78](self);
  v6 = (uint64_t)&v5[4];
  v7 = v5 + 8;
  v8 = v3;
  os_unfair_lock_lock(v7);
  partial apply for closure #1 in _NSSwiftCalendar.timeZone.setter(v6);
  os_unfair_lock_unlock(v7);

  swift_unknownObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  _NSSwiftCalendar *v4;
  _NSSwiftCalendar *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = _NSSwiftCalendar.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSString)calendarIdentifier
{
  _NSSwiftCalendar *v2;
  id v3;

  v2 = self;
  v3 = (id)specialized _NSSwiftCalendar.calendarIdentifier.getter();

  return (NSString *)v3;
}

- (BOOL)rangeOfUnit:(unint64_t)a3 startDate:(id *)a4 interval:(double *)a5 forDate:(id)a6
{
  uint64_t v10;
  _NSSwiftCalendar *v11;
  uint64_t v13;

  objc_msgSend(a6, sel_timeIntervalSinceReferenceDate);
  v13 = v10;
  v11 = self;
  LOBYTE(a5) = _NSSwiftCalendar.range(of:start:interval:for:)(a3, a4, a5, (double *)&v13);

  return a5 & 1;
}

- (_NSSwiftCalendar)initWithCheckedCalendarIdentifier:(id)a3
{
  return (_NSSwiftCalendar *)_NSSwiftCalendar.init(checkedCalendarIdentifier:)(a3);
}

- (int64_t)component:(unint64_t)a3 fromDate:(id)a4
{
  _NSSwiftCalendar *v6;
  Foundation::Date v7;
  Swift::Int v8;

  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v6 = self;
  v8 = _NSSwiftCalendar.component(_:from:)(a3, v7);

  return v8;
}

- (id)dateByAddingComponents:(id)a3 toDate:(id)a4 options:(unint64_t)a5
{
  char v5;
  uint64_t v8;
  _NSSwiftCalendar *v9;
  id v10;
  uint64_t v12;
  _BYTE __dst[288];
  double v14;
  char v15;
  _BYTE __src[288];

  v5 = a5;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a3, __src);
  memcpy(__dst, __src, 0x11AuLL);
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v12 = v8;
  v9 = self;
  _NSSwiftCalendar.date(byAdding:to:options:)(__dst, (double *)&v12, v5);

  outlined release of DateComponents((uint64_t)__src);
  if ((v15 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v14);
  return v10;
}

- (id)_dateFromComponents:(id)a3
{
  _NSSwiftCalendar *v4;
  id v5;
  _BYTE v7[288];
  double v8;
  char v9;
  _BYTE __src[288];

  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a3, __src);
  memcpy(v7, __src, 0x11AuLL);
  v4 = self;
  _NSSwiftCalendar._date(from:)((uint64_t *)&v8, v7);

  outlined release of DateComponents((uint64_t)__src);
  if ((v9 & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v8);
  return v5;
}

- (void)setLocale:(id)a3
{
  _NSSwiftCalendar *v3;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  _NSSwiftCalendar *v7;

  v3 = self;
  if (a3)
  {
    type metadata accessor for _NSSwiftLocale();
    if (swift_dynamicCastClass())
    {
      self = (_NSSwiftCalendar *)swift_unknownObjectRetain();
    }
    else
    {
      type metadata accessor for _LocaleBridged();
      *(_QWORD *)(swift_allocObject() + 16) = a3;
      lazy protocol witness table accessor for type CFDictionaryRef and conformance CFDictionaryRef((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (uint64_t (*)(uint64_t))type metadata accessor for _LocaleBridged, (uint64_t)&protocol conformance descriptor for _LocaleBridged);
      self = (_NSSwiftCalendar *)a3;
    }
  }
  MEMORY[0x1E0C80A78](self);
  v6 = v5 + 8;
  v7 = v3;
  os_unfair_lock_lock(v6);
  partial apply for closure #1 in _NSSwiftCalendar.locale.setter();
  os_unfair_lock_unlock(v6);

  swift_unknownObjectRelease();
}

- (BOOL)isDate:(id)a3 equalToDate:(id)a4 toUnitGranularity:(unint64_t)a5
{
  uint64_t v7;
  _NSSwiftCalendar *v8;
  Foundation::Date v9;
  Foundation::Date v10;
  Swift::Bool v11;
  uint64_t v13;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v13 = v7;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v8 = self;
  v11 = _NSSwiftCalendar.isDate(_:equalTo:toUnitGranularity:)(v9, v10, (NSCalendarUnit)&v13);

  return v11;
}

- (BOOL)isDate:(id)a3 inSameDayAsDate:(id)a4
{
  _NSSwiftCalendar *v6;
  Foundation::Date v7;
  Foundation::Date v8;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v6 = self;
  LOBYTE(a4) = _NSSwiftCalendar.isDate(_:inSameDayAs:)(v7, v8);

  return a4 & 1;
}

- (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularity:(unint64_t)a5
{
  uint64_t v7;
  _NSSwiftCalendar *v8;
  Foundation::Date v9;
  Foundation::Date v10;
  NSComparisonResult v11;
  uint64_t v13;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v13 = v7;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v8 = self;
  v11 = _NSSwiftCalendar.compare(_:to:toUnitGranularity:)(v9, v10, (NSCalendarUnit)&v13);

  return v11;
}

- (id)startOfDayForDate:(id)a3
{
  uint64_t v4;
  _NSSwiftCalendar *v5;
  Foundation::Date v6;
  uint64_t v8;
  double v9;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v8 = v4;
  v5 = self;
  _NSSwiftCalendar.startOfDay(for:)(v6);

  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v9, v8);
}

- (NSLocale)locale
{
  uint64_t v2;
  _OWORD *v3;
  os_unfair_lock_s *v4;
  _NSSwiftCalendar *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void *v8;
  __int128 v10;
  _QWORD v11[2];

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftCalendar__lock);
  v3 = (_OWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 32);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in _NSSwiftCalendar.calendar.getter(v3, &v10);
  os_unfair_lock_unlock(v4);
  Calendar.locale.getter(v11);

  swift_unknownObjectRelease();
  if (!v11[0])
    return (NSLocale *)0;
  v6 = v11[1];
  ObjectType = swift_getObjectType();
  v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 496))(ObjectType, v6);
  swift_unknownObjectRelease();
  return (NSLocale *)v8;
}

- (BOOL)isDateInYesterday:(id)a3
{
  return @objc _NSSwiftCalendar.isDateInYesterday(_:)(self, (int)a2, a3, (uint64_t (*)(uint64_t *))Calendar.isDateInYesterday(_:));
}

- (BOOL)isDateInToday:(id)a3
{
  return @objc _NSSwiftCalendar.isDateInYesterday(_:)(self, (int)a2, a3, (uint64_t (*)(uint64_t *))Calendar.isDateInToday(_:));
}

- (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  _NSSwiftCalendar *v8;
  Foundation::Date v9;
  __C::_NSRange v10;
  Swift::Int location;
  Swift::Int length;
  _NSRange result;

  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  v8 = self;
  v10 = _NSSwiftCalendar.range(of:in:for:)(a3, a4, v9);

  location = v10.location;
  length = v10.length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)dateBySettingHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5 ofDate:(id)a6 options:(unint64_t)a7
{
  uint64_t v11;
  _NSSwiftCalendar *v12;
  Foundation::Date v13;
  id v14;
  _QWORD v16[2];
  char v17;

  objc_msgSend(a6, sel_timeIntervalSinceReferenceDate);
  v16[0] = v11;
  v12 = self;
  _NSSwiftCalendar.date(bySettingHour:minute:second:of:options:)(a3, a4, a5, v13, (NSCalendarOptions)v16);

  if ((v17 & 1) != 0)
    v14 = 0;
  else
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, *(double *)&v16[1]);
  return v14;
}

- (_NSRange)maximumRangeOfUnit:(unint64_t)a3
{
  _NSSwiftCalendar *v4;
  __C::_NSRange v5;
  Swift::Int location;
  Swift::Int length;
  _NSRange result;

  v4 = self;
  v5 = _NSSwiftCalendar.maximumRange(of:)(a3);

  location = v5.location;
  length = v5.length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)nextDateAfterDate:(id)a3 matchingUnit:(unint64_t)a4 value:(int64_t)a5 options:(unint64_t)a6
{
  uint64_t v9;
  _NSSwiftCalendar *v10;
  Foundation::Date v11;
  id v12;
  _QWORD v14[2];
  char v15;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v14[0] = v9;
  v10 = self;
  _NSSwiftCalendar.nextDate(after:matching:value:options:)(v11, (NSCalendarUnit)v14, a4, a5);

  if ((v15 & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, *(double *)&v14[1]);
  return v12;
}

- (id)nextDateAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5
{
  __int16 v5;
  uint64_t v8;
  _NSSwiftCalendar *v9;
  id v10;
  _BYTE __dst[288];
  uint64_t v13;
  double v14;
  char v15;
  _BYTE __src[288];

  v5 = a5;
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v13 = v8;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  v9 = self;
  _NSSwiftCalendar.nextDate(after:matching:options:)(&v13, __dst, v5, (uint64_t)&v14);

  outlined release of DateComponents((uint64_t)__src);
  if ((v15 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v14);
  return v10;
}

- (BOOL)isDateInWeekend:(id)a3
{
  _NSSwiftCalendar *v4;
  Foundation::Date v5;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v4 = self;
  LOBYTE(self) = _NSSwiftCalendar.isDateInWeekend(_:)(v5);

  return self & 1;
}

- (int64_t)ordinalityOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  _NSSwiftCalendar *v8;
  Foundation::Date v9;
  Swift::Int v10;

  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  v8 = self;
  v10 = _NSSwiftCalendar.ordinality(of:in:for:)(a3, a4, v9);

  return v10;
}

- (id)components:(unint64_t)a3 fromDateComponents:(id)a4 toDateComponents:(id)a5 options:(unint64_t)a6
{
  int v7;
  _NSSwiftCalendar *v9;
  Class isa;
  _BYTE v12[288];
  _BYTE v13[288];
  _BYTE __src[288];
  _BYTE v15[288];
  _BYTE __dst[288];

  v7 = a3;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a5, v15);
  memcpy(v12, v15, 0x11AuLL);
  v9 = self;
  _NSSwiftCalendar.components(_:from:to:options:)(v7, __dst, v12, v13);

  outlined release of DateComponents((uint64_t)v15);
  outlined release of DateComponents((uint64_t)__src);
  memcpy(__dst, v13, 0x11AuLL);
  memcpy(v12, v13, 0x11AuLL);
  isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__dst);
  return isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)debugDescription
{
  _NSSwiftCalendar *v2;
  void *v3;

  v2 = self;
  _NSSwiftCalendar.debugDescription.getter();

  v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_NSRange)minimumRangeOfUnit:(unint64_t)a3
{
  _NSSwiftCalendar *v4;
  __C::_NSRange v5;
  Swift::Int location;
  Swift::Int length;
  _NSRange result;

  v4 = self;
  v5 = _NSSwiftCalendar.minimumRange(of:)(a3);

  location = v5.location;
  length = v5.length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _NSSwiftCalendar *v12;
  Class isa;
  __int128 __dst[18];
  uint64_t v16;
  uint64_t __src[36];

  type metadata accessor for _NSSwiftTimeZone();
  v7 = swift_dynamicCastClass();
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + OBJC_IVAR____NSSwiftTimeZone_timeZone);
    v9 = *(_QWORD *)(v7 + OBJC_IVAR____NSSwiftTimeZone_timeZone + 8);
    swift_unknownObjectRetain();
  }
  else
  {
    type metadata accessor for _TimeZoneBridged();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a3;
    v9 = lazy protocol witness table accessor for type CFDictionaryRef and conformance CFDictionaryRef(&lazy protocol witness table cache variable for type _TimeZoneBridged and conformance _TimeZoneBridged, (uint64_t (*)(uint64_t))type metadata accessor for _TimeZoneBridged, (uint64_t)&protocol conformance descriptor for _TimeZoneBridged);
    v10 = a3;
  }
  *(_QWORD *)&__dst[0] = v8;
  *((_QWORD *)&__dst[0] + 1) = v9;
  objc_msgSend(a4, sel_timeIntervalSinceReferenceDate);
  v16 = v11;
  v12 = self;
  _NSSwiftCalendar._components(in:from:)(__dst, &v16, __src);
  swift_unknownObjectRelease();

  memcpy(__dst, __src, 0x11AuLL);
  isa = DateComponents._bridgeToObjectiveC()().super.isa;
  outlined release of DateComponents((uint64_t)__src);
  return isa;
}

- (BOOL)nextWeekendStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6
{
  uint64_t v10;
  _NSSwiftCalendar *v11;
  uint64_t v13;

  objc_msgSend(a6, sel_timeIntervalSinceReferenceDate);
  v13 = v10;
  v11 = self;
  LOBYTE(a5) = _NSSwiftCalendar.nextWeekendStart(_:interval:options:after:)(a3, a4, a5, &v13);

  return a5 & 1;
}

- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  __int16 v6;
  void *v10;
  uint64_t v11;
  _NSSwiftCalendar *v12;
  _BYTE __dst[288];
  uint64_t v14;
  _BYTE __src[288];

  v6 = a5;
  v10 = _Block_copy(a6);
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v14 = v11;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  _Block_copy(v10);
  v12 = self;
  specialized _NSSwiftCalendar._enumerateDatesStarting(after:matching:options:using:)((double *)&v14, __dst, v6, (uint64_t)v12, v10);
  _Block_release(v10);

  outlined release of DateComponents((uint64_t)__src);
  _Block_release(v10);
}

- (BOOL)date:(id)a3 matchesComponents:(id)a4
{
  uint64_t v6;
  _NSSwiftCalendar *v7;
  _BYTE __dst[288];
  uint64_t v10;
  _BYTE __src[288];

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v10 = v6;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(a4, __src);
  memcpy(__dst, __src, 0x11AuLL);
  v7 = self;
  LOBYTE(a4) = _NSSwiftCalendar.date(_:matchesComponents:)((double *)&v10, __dst);

  outlined release of DateComponents((uint64_t)__src);
  return a4 & 1;
}

- (void)getEra:(int64_t *)a3 year:(int64_t *)a4 month:(int64_t *)a5 day:(int64_t *)a6 fromDate:(id)a7
{
  @objc _NSSwiftCalendar.getEra(_:year:month:day:from:)(self, (int)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))_NSSwiftCalendar.getEra(_:year:month:day:from:));
}

- (void)getEra:(int64_t *)a3 yearForWeekOfYear:(int64_t *)a4 weekOfYear:(int64_t *)a5 weekday:(int64_t *)a6 fromDate:(id)a7
{
  @objc _NSSwiftCalendar.getEra(_:year:month:day:from:)(self, (int)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))_NSSwiftCalendar.getEra(_:yearForWeekOfYear:weekOfYear:weekday:from:));
}

- (BOOL)rangeOfWeekendStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5
{
  uint64_t v8;
  _NSSwiftCalendar *v9;
  uint64_t v11;

  objc_msgSend(a5, sel_timeIntervalSinceReferenceDate);
  v11 = v8;
  v9 = self;
  LOBYTE(a4) = _NSSwiftCalendar.range(ofWeekendStart:interval:containing:)(a3, (uint64_t *)a4, (double *)&v11);

  return a4 & 1;
}

- (id)nextDateAfterDate:(id)a3 matchingHour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 options:(unint64_t)a7
{
  uint64_t v11;
  _NSSwiftCalendar *v12;
  Foundation::Date v13;
  id v14;
  _QWORD v16[2];
  char v17;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v16[0] = v11;
  v12 = self;
  _NSSwiftCalendar.nextDate(after:matchingHour:minute:second:options:)(v13, (Swift::Int)v16, a4, a5, a6);

  if ((v17 & 1) != 0)
    v14 = 0;
  else
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, *(double *)&v16[1]);
  return v14;
}

- (id)dateBySettingUnit:(unint64_t)a3 value:(int64_t)a4 ofDate:(id)a5 options:(unint64_t)a6
{
  return @objc _NSSwiftCalendar.date(byAdding:value:to:options:)(self, (int)a2, a3, a4, a5, a6, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t *, uint64_t))_NSSwiftCalendar.date(bySettingUnit:value:of:options:));
}

- (id)dateWithEra:(int64_t)a3 year:(int64_t)a4 month:(int64_t)a5 day:(int64_t)a6 hour:(int64_t)a7 minute:(int64_t)a8 second:(int64_t)a9 nanosecond:(int64_t)a10
{
  return @objc _NSSwiftCalendar.date(era:year:month:day:hour:minute:second:nanosecond:)(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_NSSwiftCalendar.date(era:year:month:day:hour:minute:second:nanosecond:));
}

- (id)dateWithEra:(int64_t)a3 yearForWeekOfYear:(int64_t)a4 weekOfYear:(int64_t)a5 weekday:(int64_t)a6 hour:(int64_t)a7 minute:(int64_t)a8 second:(int64_t)a9 nanosecond:(int64_t)a10
{
  return @objc _NSSwiftCalendar.date(era:year:month:day:hour:minute:second:nanosecond:)(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(double *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_NSSwiftCalendar.date(era:yearForWeekOfYear:weekOfYear:weekday:hour:minute:second:nanosecond:));
}

- (BOOL)isDateInTomorrow:(id)a3
{
  return @objc _NSSwiftCalendar.isDateInYesterday(_:)(self, (int)a2, a3, (uint64_t (*)(uint64_t *))Calendar.isDateInTomorrow(_:));
}

@end
