@implementation ATXSpotlightSuggestions

- (NSArray)scores
{
  return (NSArray *)sub_2384CD7A0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___ATXSpotlightSuggestions_scores, &qword_256912C78);
}

- (NSArray)topics
{
  return (NSArray *)sub_2384CD7A0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___ATXSpotlightSuggestions_topics, &qword_256912C70);
}

- (NSArray)sections
{
  return (NSArray *)sub_2384CD7A0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___ATXSpotlightSuggestions_sections, &qword_256912C68);
}

- (id)createSectionsFromServerResults:(id)a3
{
  sub_2384B97C8(0, &qword_256912C68);
  return (id)sub_2384DFA84();
}

- (ATXSpotlightSuggestions)init
{
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXSpotlightSuggestions_scores) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXSpotlightSuggestions_topics) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXSpotlightSuggestions_sections) = v2;
  v4.receiver = self;
  v4.super_class = (Class)ATXSpotlightSuggestions;
  return -[ATXSpotlightSuggestions init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
