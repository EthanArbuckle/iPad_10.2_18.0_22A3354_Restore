id sub_100003688()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory(3);
  qword_100008608 = (uint64_t)result;
  return result;
}

id sub_100003744(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  id v4;
  NSNumber v5;
  uint64_t v6;

  v3 = *(_QWORD *)&v2[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder];
  if (v3)
  {
    objc_msgSend((id)swift_unknownObjectRetain(*(_QWORD *)&v2[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder], a2), "unpairSessionAccessoryOnTestCompletion");
    v4 = objc_msgSend(v2, "result");
    v5.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v4, "setStatusCode:", v5.super.super.isa);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    v6 = static os_log_type_t.error.getter();
    if (qword_100008600 != -1)
      swift_once(&qword_100008600, sub_100003688);
    os_log(_:dso:log:_:_:)(v6, &_mh_execute_header, qword_100008608, "Host app responder does not support the accessory responder", 59, 2, &_swiftEmptyArrayStorage);
    v4 = objc_msgSend(v2, "result");
    v5.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v4, "setStatusCode:", v5.super.super.isa);
  }

  return objc_msgSend(v2, "setFinished:", 1);
}

id sub_100003900()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnpairSessionAccessoryController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for UnpairSessionAccessoryController()
{
  return objc_opt_self(UnpairSessionAccessoryController);
}
