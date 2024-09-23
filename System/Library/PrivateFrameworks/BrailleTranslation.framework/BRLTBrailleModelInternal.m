@implementation BRLTBrailleModelInternal

- (BRLTBrailleModelDelegate)delegate
{
  swift_beginAccess();
  return (BRLTBrailleModelDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)backTranslateByCell
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell;
  swift_beginAccess();
  return *v2;
}

- (void)setBackTranslateByCell:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)technicalMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode;
  swift_beginAccess();
  return *v2;
}

- (void)setTechnicalMode:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)editable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_editable;
  swift_beginAccess();
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_editable;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)brailleStringDirty
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  return *v2;
}

- (void)setBrailleStringDirty:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setOutputTableIdentifier:(id)a3 manager:(id)a4
{
  sub_2114CEE78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_2114CEB84);
}

- (void)setInputTableIdentifier:(id)a3 manager:(id)a4
{
  sub_2114CEE78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_2114CECFC);
}

- (BOOL)isCandidateSelectionActive
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  BRLTBrailleModelInternal *v4;
  uint64_t v5;
  char v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v2)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 136);
    v4 = self;
    v5 = swift_retain();
    v6 = v3(v5);

    swift_release();
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (BRLTEditStringInternal)displayedScript
{
  uint64_t *v2;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert))
    v2 = &OBJC_IVAR___BRLTBrailleModelInternal_alertScript;
  else
    v2 = &OBJC_IVAR___BRLTBrailleModelInternal_script;
  return (BRLTEditStringInternal *)*(id *)((char *)&self->super.isa + *v2);
}

- (BRLTEditStringInternal)displayedBraille
{
  BRLTBrailleModelInternal *v2;
  _QWORD *v3;

  v2 = self;
  v3 = sub_2114CF0E0();

  return (BRLTEditStringInternal *)v3;
}

- (NSString)bufferBrailleString
{
  BRLTBrailleModelInternal *v2;
  void *v3;

  v2 = self;
  sub_2114CF1CC();

  v3 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  BRLTBrailleModelInternal *v4;
  int64_t v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v7 = *(_OWORD *)&self->inputTranslator[OBJC_IVAR___BRLTBrailleModelInternal_translationResult];
  v8 = *(_QWORD *)&self->candidateManager[OBJC_IVAR___BRLTBrailleModelInternal_translationResult];
  v9 = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  v10 = v7;
  v11 = v8;
  v4 = self;
  sub_2114D299C((uint64_t)&v9);
  sub_2114D299C((uint64_t)&v10);
  sub_2114CBC2C((uint64_t)&v11);
  v5 = sub_2114CB214(a3);
  sub_2114D29C4((uint64_t)&v9);
  sub_2114D29C4((uint64_t)&v10);
  sub_2114CBC54((uint64_t)&v11);

  return v5;
}

+ (BRLTBrailleModelInternal)shared
{
  if (qword_254AB3A70 != -1)
    swift_once();
  return (BRLTBrailleModelInternal *)(id)qword_254AB3A78;
}

- (BRLTBrailleModelInternal)init
{
  return (BRLTBrailleModelInternal *)sub_2114CF504();
}

- (void)setScript:(id)a3
{
  id v4;
  BRLTBrailleModelInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2114CF7D8(v4);

}

- (void)setAlert:(id)a3
{
  id v4;
  BRLTBrailleModelInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2114CFBF8(v4);

}

- (void)setTerminalOutput:(id)a3
{
  void *v4;
  id v5;
  BRLTBrailleModelInternal *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_script);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_script) = (Class)a3;
  v5 = a3;
  v6 = self;

  *((_BYTE *)&v6->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 1;
  sub_2114D1FE0();
  sub_2114D46A8();

}

- (void)forceTranslate
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114CFDF0();

}

- (void)handleBrailleDotPress:(id)a3
{
  id v4;
  BRLTBrailleModelInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2114CFEE0(v4);

}

- (BOOL)handleDeleteWithSilently:(BOOL)a3
{
  BRLTBrailleModelInternal *v4;
  char v5;

  v4 = self;
  v5 = sub_2114D05D8(0, a3);

  return v5 & 1;
}

- (BOOL)handleBrailleSelectionWithNSSelection:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  BRLTBrailleModelInternal *v5;
  uint64_t v6;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = sub_2114DA4F8(location, length);
  LOBYTE(length) = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v5->super.isa) + 0x458))(v6);

  return length & 1;
}

- (BOOL)handleEscape
{
  BRLTBrailleModelInternal *v2;
  char v3;

  v2 = self;
  v3 = sub_2114D22F0();

  return v3 & 1;
}

- (BOOL)handleReturn
{
  BRLTBrailleModelInternal *v2;
  char v3;

  v2 = self;
  v3 = sub_2114D2494();

  return v3 & 1;
}

- (void)handleWordDescriptionCommand
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114D2634();

}

- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAt:(int64_t)a3
{
  BRLTBrailleModelInternal *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = self;
  v5 = sub_2114D2760(a3);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)showNextCandidate
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114D2D40();

}

- (void)showPreviousCandidate
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114D2E10();

}

- (void)selectCandidate
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114D2EE0();

}

- (BOOL)isWordDescriptionActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWordDescriptionActive:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive;
  swift_beginAccess();
  *v4 = a3;
}

- (void)showNextWordDescription
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114D3E20();

}

- (void)showPreviousWordDescription
{
  BRLTBrailleModelInternal *v2;

  v2 = self;
  sub_2114D3EF8();

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end
