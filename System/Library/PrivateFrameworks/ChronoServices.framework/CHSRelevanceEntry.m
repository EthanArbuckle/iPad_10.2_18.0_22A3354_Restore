@implementation CHSRelevanceEntry

- (CHSRelevanceEntry)initWithTimelineEntryRelevance:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHSRelevanceEntry;
  return -[CHSTimelineEntryRelevance initWithTimelineEntryRelevance:](&v4, sel_initWithTimelineEntryRelevance_, a3);
}

@end
