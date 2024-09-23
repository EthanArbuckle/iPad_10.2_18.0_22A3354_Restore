@implementation DOCSplitViewState

- (BOOL)isCollapsed
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2)
    __break(1u);
  else
    LOBYTE(self) = v2 & 1;
  return (char)self;
}

- (BOOL)isSidebarShownInOverlay
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2)
    __break(1u);
  else
    LOBYTE(self) = (v2 & 1) == 0 && *(_QWORD *)&self->_impl[OBJC_IVAR___DOCSplitViewState__impl] == 3;
  return (char)self;
}

- (BOOL)isSidebarShownInline
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2)
    __break(1u);
  else
    LOBYTE(self) = (v2 & 1) == 0 && *(_QWORD *)&self->_impl[OBJC_IVAR___DOCSplitViewState__impl] == 2;
  return (char)self;
}

- (BOOL)isSidebarShown
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2)
    __break(1u);
  else
    LOBYTE(self) = (v2 & 1) == 0
                && (*(_QWORD *)&self->_impl[OBJC_IVAR___DOCSplitViewState__impl] & 0xFFFFFFFFFFFFFFFELL) == 2;
  return (char)self;
}

- (int64_t)displayMode
{
  if (*(_BYTE *)(self + OBJC_IVAR___DOCSplitViewState__impl) != 2)
    return *(_QWORD *)(self + OBJC_IVAR___DOCSplitViewState__impl + 8);
  __break(1u);
  return self;
}

- (id)withIsCollapsed:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  char *v9;

  if (*((_BYTE *)self + OBJC_IVAR___DOCSplitViewState__impl) == 2)
  {
    __break(1u);
  }
  else
  {
    v3 = a3;
    v4 = self;
    v5 = *(_QWORD *)((char *)self + OBJC_IVAR___DOCSplitViewState__impl + 8);
    v6 = objc_allocWithZone((Class)DOCSplitViewState);
    v7 = v4;
    v8 = (char *)objc_msgSend(v6, sel_init);
    v9 = &v8[OBJC_IVAR___DOCSplitViewState__impl];
    *(_QWORD *)v9 = v3;
    *((_QWORD *)v9 + 1) = v5;

    return v8;
  }
  return self;
}

- (id)withDisplayMode:(int64_t)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  char *v10;

  v3 = *((unsigned __int8 *)self + OBJC_IVAR___DOCSplitViewState__impl);
  if (v3 == 2)
  {
    __break(1u);
  }
  else
  {
    v5 = self;
    v6 = v3 & 1;
    v7 = objc_allocWithZone((Class)DOCSplitViewState);
    v8 = v5;
    v9 = (char *)objc_msgSend(v7, sel_init);
    v10 = &v9[OBJC_IVAR___DOCSplitViewState__impl];
    *(_QWORD *)v10 = v6;
    *((_QWORD *)v10 + 1) = a3;

    return v9;
  }
  return self;
}

+ (BOOL)isHideOverlayTransitionFromState:(id)a3 toState:(id)a4
{
  return sub_21EA874D4((uint64_t)a3, (uint64_t)a4) & 1;
}

+ (BOOL)isShowOverlayTransitionFromState:(id)a3 toState:(id)a4
{
  return sub_21EA87530((_BOOL8)a3, (uint64_t)a4);
}

- (DOCSplitViewState)init
{
  objc_super v3;

  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl) = xmmword_21EB093C0;
  v3.receiver = self;
  v3.super_class = (Class)DOCSplitViewState;
  return -[DOCSplitViewState init](&v3, sel_init);
}

- (NSString)description
{
  void *v2;

  if (*((_BYTE *)self + OBJC_IVAR___DOCSplitViewState__impl) == 2)
  {
    __break(1u);
  }
  else
  {
    _s26DocumentManagerExecutables17DOCSplitViewStateV11descriptionSSvg_0();
    v2 = (void *)sub_21EB02B58();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  return self;
}

@end
