@implementation CUIKLocationDescriptionGenerator

+ (id)locationStringForEvent:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "locationStringForEvent:options:incomplete:leadingImageName:", a3, a4, 0, 0);
}

+ (id)locationStringForEvent:(id)a3 options:(unint64_t)a4 incomplete:(BOOL *)a5 leadingImageName:(id *)a6
{
  return +[LocationDescriptionGenerator locationStringFor:options:incomplete:leadingImageName:](_TtC13CalendarUIKit28LocationDescriptionGenerator, "locationStringFor:options:incomplete:leadingImageName:", a3, a4, a5, a6);
}

+ (id)locationStringForEvent:(id)a3
{
  return (id)objc_msgSend(a1, "locationStringForEvent:options:incomplete:leadingImageName:", a3, 96, 0, 0);
}

+ (id)locationStringForLocation:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7 options:(unint64_t)a8
{
  return +[LocationDescriptionGenerator locationStringFor:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:incomplete:leadingImageName:](_TtC13CalendarUIKit28LocationDescriptionGenerator, "locationStringFor:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:incomplete:leadingImageName:", a3, a4, a5, a6, a7, a8, 0, 0);
}

+ (id)locationStringForLocation:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7
{
  return +[LocationDescriptionGenerator locationStringFor:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:incomplete:leadingImageName:](_TtC13CalendarUIKit28LocationDescriptionGenerator, "locationStringFor:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:incomplete:leadingImageName:", a3, a4, a5, a6, a7, 96, 0, 0);
}

+ (id)labelForLocation:(id)a3
{
  return +[LocationDescriptionGenerator labelFor:](_TtC13CalendarUIKit28LocationDescriptionGenerator, "labelFor:", a3);
}

+ (id)conferenceStringForURL:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5
{
  return +[LocationDescriptionGenerator conferenceStringFor:conferenceURLIsBroadcast:options:outImageName:incomplete:](_TtC13CalendarUIKit28LocationDescriptionGenerator, "conferenceStringFor:conferenceURLIsBroadcast:options:outImageName:incomplete:", a3, a4, a5, 0, 0);
}

+ (id)conferenceStringForURL:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5 incomplete:(BOOL *)a6 leadingImageName:(id *)a7
{
  return +[LocationDescriptionGenerator conferenceStringFor:conferenceURLIsBroadcast:options:outImageName:incomplete:](_TtC13CalendarUIKit28LocationDescriptionGenerator, "conferenceStringFor:conferenceURLIsBroadcast:options:outImageName:incomplete:", a3, a4, a5, a7, a6);
}

@end
