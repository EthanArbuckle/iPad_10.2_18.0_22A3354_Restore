@implementation ICCalculateScrubberController.HoverController

- (void)showScrubber
{
  uint64_t v3;
  uint64_t v4;
  _TtCE7NotesUICSo29ICCalculateScrubberController15HoverController *v5;
  id v6;

  v3 = MEMORY[0x1AF446658]((char *)self + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_scrubberController, a2);
  if (v3)
  {
    v4 = *(uint64_t *)((char *)&self->super.isa
                    + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral);
    v6 = (id)v3;
    v5 = self;
    objc_msgSend(v6, sel_showScrubberForNumberLiteral_isCompact_, v4, 1);

  }
}

- (_TtCE7NotesUICSo29ICCalculateScrubberController15HoverController)init
{
  _TtCE7NotesUICSo29ICCalculateScrubberController15HoverController *result;

  result = (_TtCE7NotesUICSo29ICCalculateScrubberController15HoverController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController____lazy_storage___showScrubberDelayer));
}

@end
