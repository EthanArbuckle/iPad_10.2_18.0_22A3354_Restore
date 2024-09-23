@implementation BRLTJBrailleStateManagerInternal

- (BRLTJBrailleStateManagerInternal)init
{
  return (BRLTJBrailleStateManagerInternal *)sub_2114DBE60();
}

+ (BRLTJBrailleStateManagerInternal)manager
{
  BRLTJBrailleStateManagerInternal *result;
  id v3;
  void *v4;

  result = (BRLTJBrailleStateManagerInternal *)qword_254AB3AC0;
  if (qword_254AB3AC0)
    return result;
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleStateManager()), sel_init);
  v4 = (void *)qword_254AB3AC0;
  qword_254AB3AC0 = (uint64_t)v3;

  result = (BRLTJBrailleStateManagerInternal *)qword_254AB3AC0;
  if (qword_254AB3AC0)
    return result;
  __break(1u);
  return result;
}

- (BOOL)isEditing
{
  BRLTJBrailleStateManagerInternal *v2;
  char v3;

  v2 = self;
  v3 = sub_2114DC250();

  return v3 & 1;
}

- (void)setScript:(id)a3
{
  id v4;
  BRLTJBrailleStateManagerInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2114DC30C(v4);

}

- (void)insertBrailleChar:(int64_t)a3
{
  BRLTJBrailleStateManagerInternal *v4;

  v4 = self;
  sub_2114DC76C(a3);

}

- (BOOL)delete
{
  BRLTJBrailleStateManagerInternal *v2;
  char v3;

  v2 = self;
  v3 = sub_2114DD37C();

  return v3 & 1;
}

- (BOOL)forwardDelete
{
  BRLTJBrailleStateManagerInternal *v2;
  char v3;

  v2 = self;
  v3 = sub_2114DD97C();

  return v3 & 1;
}

- (void)escapeCommand
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114DDCE4();

}

- (BOOL)returnCommand
{
  BRLTJBrailleStateManagerInternal *v2;
  char v3;

  v2 = self;
  v3 = sub_2114DDDDC();

  return v3 & 1;
}

- (void)wordDescriptionCommand
{
  _QWORD *v2;
  void (*v3)(void);
  uint64_t v4;
  BRLTJBrailleStateManagerInternal *v5;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x1E8);
  v5 = self;
  v3();
  if (v4)
  {
    swift_bridgeObjectRelease();
    if (((*(uint64_t (**)(void))((*v2 & (uint64_t)v5->super.isa) + 0x2F0))() & 1) != 0)
      sub_2114E13E0();
    else
      sub_2114E0F04();
  }

}

- (void)setBrailleSelection:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v5;
  BRLTJBrailleStateManagerInternal *v6;

  length = a3.length;
  location = a3.location;
  v6 = self;
  v5 = sub_2114DA4F8(location, length);
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v6->super.isa) + 0x1D0))(v5);

}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  BRLTJBrailleStateManagerInternal *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_2114DE964(a3);

  return v5;
}

- (BOOL)isCandidateSelectionActive
{
  void (*v2)(_QWORD *__return_ptr);
  BRLTJBrailleStateManagerInternal *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x208);
  v3 = self;
  v2(v8);
  v4 = v9;
  v5 = v10;
  __swift_project_boxed_opaque_existential_0(v8, v9);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v6 & 1;
}

- (void)startCandidateSelection
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114DEFAC();

}

- (void)showNextCandidate
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114DF364();

}

- (void)showPreviousCandidate
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114DF4A0();

}

- (void)selectCandidate
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114DF5DC();

}

- (BOOL)isShowingAlert
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingAlert:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert;
  swift_beginAccess();
  *v4 = a3;
}

- (BRLTJEditableStringInternal)displayedScript
{
  BRLTJBrailleStateManagerInternal *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_2114E0AB4();

  return (BRLTJEditableStringInternal *)v3;
}

- (BRLTJBrailleStringInternal)displayedBraille
{
  BRLTJBrailleStateManagerInternal *v2;
  id v3;

  v2 = self;
  v3 = sub_2114E0B88();

  return (BRLTJBrailleStringInternal *)v3;
}

- (BOOL)isWordDescriptionActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWordDescriptionActive:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive;
  swift_beginAccess();
  *v4 = a3;
}

- (void)showNextWordDescription
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114E1230();

}

- (void)showPreviousWordDescription
{
  BRLTJBrailleStateManagerInternal *v2;

  v2 = self;
  sub_2114E1308();

}

- (BOOL)isShowingTerminalOutput
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingTerminalOutput:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput;
  swift_beginAccess();
  *v4 = a3;
}

- (void).cxx_destruct
{

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager);

  swift_release();
}

- (void)setDelegate:(id)a3
{
  BRLTJBrailleStateManagerInternal *v5;

  type metadata accessor for BRLTJStateNotifier();
  swift_unknownObjectRetain_n();
  v5 = self;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier) = (Class)sub_2114E282C((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)setTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5 candidateSelectionLanguage:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BRLTJBrailleStateManagerInternal *v13;

  v10 = sub_2114E4F5C();
  v12 = v11;
  swift_unknownObjectRetain();
  v13 = self;
  BRLTJBrailleStateManager.setTranslationDelegate(_:outputMode:inputMode:candidateSelectionLanguage:)((uint64_t)a3, a4, a5, v10, v12);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
